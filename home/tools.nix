{pkgs, ... }: {
    
  home.packages = with pkgs; [
  #Rust 
  rust-script
  protoc-gen-doc
  protoc-gen-rust
  yarn
  rustup
  quick-lint-js
  ];

}
