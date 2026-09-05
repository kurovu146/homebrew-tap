class Shellwise < Formula
  desc "Smart command history with inline auto-suggest and fuzzy search for your terminal"
  homepage "https://github.com/kurovu146/shellwise"
  version "0.4.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kurovu146/shellwise/releases/download/v0.4.2/shellwise-darwin-arm64.tar.gz"
      sha256 "37ae59c2f9cc10b448e52831cf71e365e91d5f8fb51c15b6f5ebc4ef9132c77b"

      def install
        bin.install "shellwise-darwin-arm64" => "shellwise"
        bin.install_symlink "shellwise" => "sw"
      end
    else
      url "https://github.com/kurovu146/shellwise/releases/download/v0.4.2/shellwise-darwin-x64.tar.gz"
      sha256 "bcac03c87e16c21ab929200a4f24ab592cfede8a53bb6b50fc52368384fdd001"

      def install
        bin.install "shellwise-darwin-x64" => "shellwise"
        bin.install_symlink "shellwise" => "sw"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kurovu146/shellwise/releases/download/v0.4.2/shellwise-linux-arm64.tar.gz"
      sha256 "2ddef554bdc77b10bdf15c624e2e864ada15950e77362ccf716991cd712c13bd"

      def install
        bin.install "shellwise-linux-arm64" => "shellwise"
        bin.install_symlink "shellwise" => "sw"
      end
    else
      url "https://github.com/kurovu146/shellwise/releases/download/v0.4.2/shellwise-linux-x64.tar.gz"
      sha256 "e7595a0d38b6683edd77ce55c42a47b74119c014e52a0683d40514ffb28b0fae"

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
