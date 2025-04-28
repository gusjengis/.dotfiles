{ config, inputs, pkgs, ... }:

{
  boot.initrd.kernelModules = [ "virtio_gpu" ];
  services.xserver.videoDrivers = [ "modesetting" ];
}
