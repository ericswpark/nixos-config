{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    nanum
    nanum-gothic-coding
  ];
}
