{ lib, fetchFromGitHub, rustPlatform }:

rustPlatform.buildRustPackage rec {
  pname = "asi-rs";
  version = "f9eebcd";

  src = fetchFromGitHub {
    owner = "devDucks";
    repo = pname;
    rev = version;
    hash = "sha256-+s5RBC3XSgb8omTbUNLywZnP6jSxZBKSS1BmXOjRF8M=";
  };

  cargoHash = "sha256-jtBw4ahSl88L0iuCXxQgZVm1EcboWRJMNtjxLVTtzts=";

  meta = with lib; {
    description = "ZWO ASI multiplatform drivers written in Rust";
    homepage = "https://github.com/devDucks/asi-rs";
    # license = licenses.unlicense;
    # maintainers = [ maintainers.tailhook ];
  };
}
