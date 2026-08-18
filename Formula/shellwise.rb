class Shellwise < Formula
  desc "Smart command history with inline auto-suggest and fuzzy search for your terminal"
  homepage "https://github.com/kurovu146/shellwise"
  version "0.4.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kurovu146/shellwise/releases/download/v0.4.1/shellwise-darwin-arm64.tar.gz"
      sha256 "3d3bcf72037d6ae7c21fec08fc6800b84e461f05c97d0e5c5684daec04b930a7"

      def install
        bin.install "shellwise-darwin-arm64" => "shellwise"
        bin.install_symlink "shellwise" => "sw"
      end
    else
      url "https://github.com/kurovu146/shellwise/releases/download/v0.4.1/shellwise-darwin-x64.tar.gz"
      sha256 "64adb8d3033959e716d4282c941168b8fdcceeacdeac93baa60b397453d25ebe"

      def install
        bin.install "shellwise-darwin-x64" => "shellwise"
        bin.install_symlink "shellwise" => "sw"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kurovu146/shellwise/releases/download/v0.4.1/shellwise-linux-arm64.tar.gz"
      sha256 "33caa19650b5729eb941f0bdec652ee1ac357788be4036820662838c78d3bebb"

      def install
        bin.install "shellwise-linux-arm64" => "shellwise"
        bin.install_symlink "shellwise" => "sw"
      end
    else
      url "https://github.com/kurovu146/shellwise/releases/download/v0.4.1/shellwise-linux-x64.tar.gz"
      sha256 "747ed93bff3629a8f92cd5971975ce8cef1f1edad15482c59ed7070aaf44194a"

      def install
        bin.install "shellwise-linux-x64" => "shellwise"
        bin.install_symlink "shellwise" => "sw"
      end
    end
  end

  def caveats
    <<~EOS
      Add shell integration to your config:

        # Zsh (~/.zshrc)
        eval "\$(shellwise init zsh)"

        # Bash (~/.bashrc)
        eval "\$(shellwise init bash)"

      Then restart your terminal or run: source ~/.zshrc
    EOS
  end

  test do
    assert_match "shellwise", shell_output("#{bin}/shellwise --help")
  end
end
