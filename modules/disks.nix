{ ... }:
{
<<<<<<< HEAD
  #fileSystems."/media/disk" = {
    #device = "/dev/nvme1n1p1";
    #fsType = "ext4";
  #};
=======
  fileSystems."/media/disk" = {
    device = "/dev/nvme0n1p1";
    fsType = "ext4";
  };
>>>>>>> 107c091 (added all the goodies)
}
