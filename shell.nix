{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    zola
    git
  ];

  shellHook = ''
    echo "Zola Blog Development Environment"
    echo "Zola version: $(zola --version)"
    echo ""
    echo "Commands:"
    echo "  zola serve  - Start development server (auto-reload)"
    echo "  zola build  - Build static site"
    echo "  zola check  - Check site for errors"
    echo ""
    echo "Visit http://127.0.0.1:1111 after starting the server"
  '';
}
