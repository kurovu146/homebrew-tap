class Shellwise < Formula
  desc "Smart command history with inline auto-suggest and fuzzy search for your terminal"
  homepage "https://github.com/kurovu146/shellwise"
  version "0.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kurovu146/shellwise/releases/download/v0.4.0/shellwise-darwin-arm64.tar.gz"
      sha256 "4b0e6748465c1a3ce1cf7ad0250d405368b345bc29de05d0a3b362fd25cb61f9"

      def install
        bin.install "shellwise-darwin-arm64" => "shellwise"
        bin.install_symlink "shellwise" => "sw"
      end
    else
      url "https://github.com/kurovu146/shellwise/releases/download/v0.4.0/shellwise-darwin-x64.tar.gz"
      sha256 "30fd24b68ed1349f936b52310ba63abf92ace94a6ebf3e6c75412e1a90f191d7"

      def install
        bin.install "shellwise-darwin-x64" => "shellwise"
        bin.install_symlink "shellwise" => "sw"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kurovu146/shellwise/releases/download/v0.4.0/shellwise-linux-arm64.tar.gz"
      sha256 "d671b82565e2a3fcf744bc84c1d6b53f97b03825341c2a83bdb4e4aedb652c6c"

      def install
        bin.install "shellwise-linux-arm64" => "shellwise"
        bin.install_symlink "shellwise" => "sw"
      end
    else
      url "https://github.com/kurovu146/shellwise/releases/download/v0.4.0/shellwise-linux-x64.tar.gz"
      sha256 "1d58272c6eb3f4e2399f9b932ef94fca155d89fdfc0ce63e18a87ec3e3fc2c57"

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
