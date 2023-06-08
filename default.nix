{ lib, fetchFromGitHub, rustPlatform, pkgs, llvmPackages }:

let cargoToml = (builtins.fromTOML (builtins.readFile ./Cargo.toml));
in rustPlatform.buildRustPackage rec {
  pname = cargoToml.package.name;
  version = cargoToml.package.version;

  src = ./.;

  nativeBuildInputs = with pkgs; [
    cmake
    protobuf
    pkg-config
    rustPlatform.bindgenHook
  ];

  buildInputs = with pkgs; [
    systemd # for libudev
    libusb
  ];

  cargoLock = {
    lockFile = ./Cargo.lock;
    outputHashes = {
      "rfitsio-0.2.0" = "sha256-1O1Tnz3zo+/bQNqSZOVQEBWCOTLvRqU89Ms3NOWh6Fk=";
    };
  };

  meta = with lib; {
    description = "ZWO ASI multiplatform drivers written in Rust";
    homepage = "https://github.com/devDucks/asi-rs";
    # license = licenses.unlicense;
    # maintainers = [ maintainers.tailhook ];
  };
}
