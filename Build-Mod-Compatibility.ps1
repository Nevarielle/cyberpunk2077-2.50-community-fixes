[CmdletBinding()]
param(
    [Parameter(Mandatory=$true)][ValidateSet('QuickhackHotkeys','EquipmentEX')][string]$Mod,
    [Parameter(Mandatory=$true)][string]$OriginalArchive,
    [Parameter(Mandatory=$true)][string]$OutputArchive
)
$ErrorActionPreference = 'Stop'
Add-Type -AssemblyName System.IO.Compression
Add-Type -AssemblyName System.IO.Compression.FileSystem
$specifications = Get-Content -LiteralPath (Join-Path $PSScriptRoot 'patch-specs.json') -Raw | ConvertFrom-Json
$specification = $specifications.$Mod
if (-not $specification) { throw 'Patch specification not found.' }
$inputPath = (Resolve-Path -LiteralPath $OriginalArchive).Path
$outputPath = [IO.Path]::GetFullPath($OutputArchive)
if (Test-Path -LiteralPath $outputPath) { throw 'The output file already exists. Choose a new output filename.' }
if ([IO.Path]::GetExtension($outputPath) -ine '.zip') { throw 'Output must be a ZIP file.' }
if (-not [IO.Directory]::Exists([IO.Path]::GetDirectoryName($outputPath))) { throw 'Output directory does not exist.' }

function Get-BytesSHA256([byte[]]$Bytes) {
    $algorithm = [Security.Cryptography.SHA256]::Create()
    try { return ([BitConverter]::ToString($algorithm.ComputeHash($Bytes))).Replace('-','').ToLowerInvariant() }
    finally { $algorithm.Dispose() }
}

# Read only the known mod files. No entry paths from the source ZIP are extracted.
$files = @{}
$sourceZip = [IO.Compression.ZipFile]::OpenRead($inputPath)
try {
    foreach ($property in $specification.files.PSObject.Properties) {
        $relative = $property.Name
        $matchesForFile = @($sourceZip.Entries | Where-Object {
            $normalizedName = $_.FullName.Replace('\','/')
            $normalizedName -ieq $relative -or $normalizedName.EndsWith('/' + $relative, [StringComparison]::OrdinalIgnoreCase)
        })
        if ($matchesForFile.Count -ne 1) { throw "Expected exactly one '$relative' in the original archive." }
        $entry = $matchesForFile[0]
        if ($entry.Length -gt 16777216) { throw "Unexpected file size: $relative" }
        $stream = $entry.Open()
        $memory = New-Object IO.MemoryStream
        try { $stream.CopyTo($memory); $bytes = $memory.ToArray() }
        finally { $stream.Dispose(); $memory.Dispose() }
        if ((Get-BytesSHA256 $bytes) -ne $property.Value) { throw "This is not the supported original $($specification.version) file: $relative. Nothing was changed." }
        $files[$relative] = $bytes
    }
} finally { $sourceZip.Dispose() }

$encoding = New-Object Text.UTF8Encoding($false)
$target = $specification.target
$text = $encoding.GetString($files[$target]).Replace("`r`n","`n")
if ($Mod -eq 'QuickhackHotkeys') {
    $startMarker = "@replaceMethod(QuickhacksListGameController)`nprivate final func SetVisibility"
    $endMarker = "@wrapMethod(QuickhacksListGameController)`nprotected cb func OnAction"
    $start = $text.IndexOf($startMarker, [StringComparison]::Ordinal)
    $end = $text.IndexOf($endMarker, $start + 1, [StringComparison]::Ordinal)
    if ($start -lt 0 -or $end -le $start) { throw 'Expected menu hook was not found.' }
    $replacement = [IO.File]::ReadAllText((Join-Path $PSScriptRoot 'patch-code/quickhack-menu-hook.reds')).Replace("`r`n","`n")
    $text = $text.Substring(0,$start) + $replacement + $text.Substring($end)
    $actionHeader = "protected cb func OnAction(action: ListenerAction, consumer: ListenerActionConsumer) -> Bool {`n"
    $guard = "  if !this.m_active || !IsDefined(this.m_playerObject) || !IsDefined(this.GetPlayerControlledObject()) {`n    return false;`n  };`n"
    $text = $text.Replace($actionHeader, $actionHeader + $guard)
} else {
    $oldExpression = 'this.m_filtersRadioGroup.SetData(this.m_filterManager.GetIntFiltersList());'
    $newExpression = "let personalFilterList = this.m_filterManager.GetIntFiltersList();`n        this.m_filtersRadioGroup.SetData(personalFilterList);"
    $text = $text.Replace($oldExpression,$newExpression)
}
$files[$target] = $encoding.GetBytes($text.Replace("`n","`r`n"))
if ((Get-BytesSHA256 $files[$target]) -ne $specification.patched_sha256) { throw 'Patched output did not match the tested version. Nothing was written.' }

$outputStream = $null
$outputZip = $null
$created = $false
try {
    $outputStream = [IO.File]::Open($outputPath,[IO.FileMode]::CreateNew,[IO.FileAccess]::ReadWrite)
    $created = $true
    $outputZip = New-Object IO.Compression.ZipArchive($outputStream,[IO.Compression.ZipArchiveMode]::Create,$true)
    foreach ($relative in ($files.Keys | Sort-Object)) {
        $entry = $outputZip.CreateEntry($relative,[IO.Compression.CompressionLevel]::Optimal)
        $destination = $entry.Open()
        try { $bytes = $files[$relative]; $destination.Write($bytes,0,$bytes.Length) }
        finally { $destination.Dispose() }
    }
    $outputZip.Dispose(); $outputZip = $null
    $outputStream.Dispose(); $outputStream = $null
} catch {
    if ($outputZip) { $outputZip.Dispose(); $outputZip = $null }
    if ($outputStream) { $outputStream.Dispose(); $outputStream = $null }
    if ($created -and [IO.File]::Exists($outputPath)) { [IO.File]::Delete($outputPath) }
    throw
} finally {
    if ($outputZip) { $outputZip.Dispose() }
    if ($outputStream) { $outputStream.Dispose() }
}
Write-Output "Created $outputPath"
Write-Output 'Install the new ZIP in Vortex as a replacement for the original mod. The original ZIP and installed game were not changed.'
