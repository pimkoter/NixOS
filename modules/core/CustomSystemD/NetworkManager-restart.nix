# Just a simple service to restart NetworkManager-dispatcher.service if it dies.
{
  systemd.services.NetworkManager = {
    serviceConfig = {
      Restart = "on-failure";
      RestartSec = 5;
    };
  };
}
