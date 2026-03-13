class Shellwise < Formula
  desc "Smart command history with inline auto-suggest and fuzzy search for your terminal"
  homepage "https://github.com/kurovu146/shellwise"
  version "0.2.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kurovu146/shellwise/releases/download/v0.2.7/shellwise-darwin-arm64.tar.gz"
      sha256 "dcd37cbd5b8b89e3b05d6d1f1687ee1b8fd815c62650f297da0f0f351bf83733"

      def install
        bin.install "shellwise-darwin-arm64" => "shellwise"
      end
    else
      url "https://github.com/kurovu146/shellwise/releases/download/v0.2.7/shellwise-darwin-x64.tar.gz"
      sha256 "4f4ba0830b7131ed0c177b23d12a6a2149f705dc309f5ae87431f44d52722dd7"

      def install
        bin.install "shellwise-darwin-x64" => "shellwise"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kurovu146/shellwise/releases/download/v0.2.7/shellwise-linux-arm64.tar.gz"
      sha256 "a54e9b0a55823d44da3b72f85125dfb2733071193a7ce939c4824d0c876a775b"

      def install
        bin.install "shellwise-linux-arm64" => "shellwise"
      end
    else
      url "https://github.com/kurovu146/shellwise/releases/download/v0.2.7/shellwise-linux-x64.tar.gz"
      sha256 "5ce9e0e13b95fa5882a2a14f999d7e8dc4cfc59d1c846c119266d9dbd1e3613e"

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
