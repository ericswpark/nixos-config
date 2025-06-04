{
  pkgs,
  config,
  system,
  ...
}:
let 
  g14_patches = fetchGit {
    url = "https://aur.archlinux.org/linux-g14.git/";
    rev = "b0d9b3bb76006960293f7c6978f68b7b8656bd55";
  };

  # Last kernel version patches support is 6.14.7, pin
  pinnedNixpkgsSrc = pkgs.fetchFromGitHub {
    owner = "nixos";
    repo = "nixpkgs";
    rev = "2795c506fe8fb7b03c36ccb51f75b6df0ab2553f";
    sha256 = "sha256-W7lqHp0qZiENCDwUZ5EX/lNhxjMdNapFnbErcbnP11Q=";
  };
  pinnedNixpkgs = import pinnedNixpkgsSrc {
    inherit system;
    config = config.nixpkgs.config;
  };
in 
{
  boot.initrd.availableKernelModules = [
    "nvme"
    "xhci_pci"
    "thunderbolt"
    "usb_storage"
    "usbhid"
    "sd_mod"
    "sdhci_pci"
  ];
  boot.initrd.kernelModules = [ "amdgpu" ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  boot.kernelPackages = pinnedNixpkgs.linuxKernel.packages.linux_6_14;
  
  # Asus g14 patches
  boot.kernelPatches = [
    {
      name = "asus-patch-series";
      patch = "${g14_patches}/asus-patch-series.patch";
    }
    {
      name = "0001-acpi-proc-idle-skip-dummy-wait";
      patch = "${g14_patches}/0001-acpi-proc-idle-skip-dummy-wait.patch";
    }
    {
      name = "0004-ACPI-resource-Skip-IRQ-override-on-ASUS-TUF-Gaming-A";
      patch = "${g14_patches}/0004-ACPI-resource-Skip-IRQ-override-on-ASUS-TUF-Gaming-A.patch";
    }
    {
      name = "0005-ACPI-resource-Skip-IRQ-override-on-ASUS-TUF-Gaming-A";
      patch = "${g14_patches}/0005-ACPI-resource-Skip-IRQ-override-on-ASUS-TUF-Gaming-A.patch";
    }
    {
      name = "0007-workaround_hardware_decoding_amdgpu";
      patch = "${g14_patches}/0007-workaround_hardware_decoding_amdgpu.patch";
    }
    {
      name = "0008-amd-tablet-sfh";
      patch = "${g14_patches}/0008-amd-tablet-sfh.patch";
    }
    {
      name = "0009-asus-nb-wmi-Add-tablet_mode_sw-lid-flip";
      patch = "${g14_patches}/0009-asus-nb-wmi-Add-tablet_mode_sw-lid-flip.patch";
    }
    {
      name = "0010-asus-nb-wmi-fix-tablet_mode_sw_int";
      patch = "${g14_patches}/0010-asus-nb-wmi-fix-tablet_mode_sw_int.patch";
    }
    {
      name = "0011-amdgpu-adjust_plane_init_off_by_one";
      patch = "${g14_patches}/0011-amdgpu-adjust_plane_init_off_by_one.patch";
    }
  ];
}