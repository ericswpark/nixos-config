{ ... }:
{
  # Include locally installed Rust programs
  home.sessionPath = [
    "$HOME/.cargo/bin"
  ];
}