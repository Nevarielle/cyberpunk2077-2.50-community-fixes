// Personal compatibility patch for Cyberpunk 2077 2.50.
// Keep the game's own menu lifecycle and add only the hotkey listeners.
@wrapMethod(QuickhacksListGameController)
private final func SetVisibility(value: Bool) -> Void {
  let wasActive: Bool = this.m_active;
  wrappedMethod(value);
  if value && this.m_active && !wasActive && IsDefined(this.m_playerObject) {
    this.m_playerObject.RegisterInputListener(this, n"SelectHack1");
    this.m_playerObject.RegisterInputListener(this, n"SelectHack2");
    this.m_playerObject.RegisterInputListener(this, n"SelectHack3");
    this.m_playerObject.RegisterInputListener(this, n"SelectHack4");
    this.m_playerObject.RegisterInputListener(this, n"SelectHack5");
    this.m_playerObject.RegisterInputListener(this, n"SelectHack6");
    this.m_playerObject.RegisterInputListener(this, n"SelectHack7");
    this.m_playerObject.RegisterInputListener(this, n"SelectHack8");
  };
}

