{ lib, fetchFromGitHub, rustPlatform }:

rustPlatform.buildRustPackage rec {
  pname = "asi-rs";
  version = "f9eebcd";

  src = fetchFromGitHub {
    owner = "devDucks";
    repo = pname;
    rev = version;
    hash = "sha256-Wu3IwSz/gJWK+2s+4WeGvLq/6G925jqBDPgj/TDr6oc=";
  };

  cargoHash = lib.fakeHash;

  meta = with lib; {
    description = "ZWO ASI multiplatform drivers written in Rust";
    homepage = "https://github.com/devDucks/asi-rs";
    # license = licenses.unlicense;
    # maintainers = [ maintainers.tailhook ];
  };
}
