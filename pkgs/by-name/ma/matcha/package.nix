{
  lib,
  stdenv,
  fetchgit,
  meson,
  ninja,
  wayland-scanner,
  pkg-config,
  wayland,
  wayland-protocols,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "matcha";
  version = "2.1.0";

  src = fetchgit {
    url = "https://codeberg.org/QuincePie/matcha.git";
    rev = "${finalAttrs.version}";
    hash = "sha256-ARBFpi7jAsRUvY+c/diTgV05FBbc2CWPPjr6ww34CaQ=";
  };

  nativeBuildInputs = [
    meson
    ninja
    wayland-scanner
    pkg-config
  ];

  buildInputs = [
    wayland
    wayland-protocols
  ];

  passthru.updateScript = nix-update-script { };

  meta = {
    homepage = "https://codeberg.org/QuincePie/matcha";
    description = "An Idle Inhibitor for Wayland";
    license = lib.licenses.mit;
    mainProgram = "matcha";
    maintainers = with lib.maintainers; [ ben9986 ];
    platforms = lib.platforms.linux;
  };
})
