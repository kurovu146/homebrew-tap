class Shellwise < Formula
  desc "Smart command history with inline auto-suggest and fuzzy search for your terminal"
  homepage "https://github.com/kurovu146/shellwise"
  version "0.2.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kurovu146/shellwise/releases/download/v0.2.2/shellwise-darwin-arm64.tar.gz"
      sha256 "d308d82efc40b0da212ffb01474bbd5b22ec7c1018612e9b3dac02fba0faecfc"

      def install
        bin.install "shellwise-darwin-arm64" => "shellwise"
      end
    else
      url "https://github.com/kurovu146/shellwise/releases/download/v0.2.2/shellwise-darwin-x64.tar.gz"
      sha256 "a64befd1cf96e9063b612dabbb8216c191c87f6dafcd7f7dd0f6514223ed3984"

      def install
        bin.install "shellwise-darwin-x64" => "shellwise"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kurovu146/shellwise/releases/download/v0.2.2/shellwise-linux-arm64.tar.gz"
      sha256 "5f5aa4d43e6e206a0af318ced2be4f12e49387a351fb2c91dc1370e43ae3d4c6"

      def install
        bin.install "shellwise-linux-arm64" => "shellwise"
      end
    else
      url "https://github.com/kurovu146/shellwise/releases/download/v0.2.2/shellwise-linux-x64.tar.gz"
      sha256 "506f2a984f055c42d6d4d2ecc455b08508cbe4458f7e1d4585013db8cc9a0f69"

      def install
        bin.install "shellwise-linux-x64" => "shellwise"
      end
    end
  end

  def caveats
    <<~EOS
      Add shell integration to your config:

        # Zsh (~/.zshrc)
        eval "$(shellwise init zsh)"

        # Bash (~/.bashrc)
        eval "$(shellwise init bash)"

      Then restart your terminal or run: source ~/.zshrc
    EOS
  end

  test do
    assert_match "shellwise", shell_output("#{bin}/shellwise --help")
  end
end
