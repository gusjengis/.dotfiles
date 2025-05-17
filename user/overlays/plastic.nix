self: super: {
  plasticscm-gui = super.stdenv.mkDerivation rec {
    pname = "plasticscm-gui";
    version = "11.0.16.9411";

    src = super.fetchurl {
      url = "https://www.plasticscm.com/plasticrepo/stable/ubuntu/pool/main/p/plasticscm-client-gui/plasticscm-client-gui_${version}_amd64.deb";
      sha256 = "sha256-…";   # fill with nix-hash
    };

    nativeBuildInputs = [ super.dpkg ];
    installPhase = ''
      mkdir -p $out
      dpkg -x $src $out
      mv $out/usr/bin $out/
      mv $out/usr/lib $out/
      # fix RPATH if needed …
    '';
  };
}
