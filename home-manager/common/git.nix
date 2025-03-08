{ ... }:
{
  programs.git = {
    enable = true;
    userName = "Eric Park";
    userEmail = "me@ericswpark.com";
    extraConfig = {
      commit.gpgsign = true;
      user.signingKey = "D5DCDB0D";
    };
  };
}
