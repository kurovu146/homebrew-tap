class Shellwise < Formula
  desc "Smart command history with inline auto-suggest and fuzzy search for your terminal"
  homepage "https://github.com/kurovu146/shellwise"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kurovu146/shellwise/releases/download/v0.1.1/shellwise-darwin-arm64.tar.gz"
      sha256 "78e9fe4d29ca57c6cc3d1051959eb4701b8de37ee95a4942c209114f461b0e4b"

      def install
        bin.install "sw-darwin-arm64" => "sw"
      end
    else
      url "https://github.com/kurovu146/shellwise/releases/download/v0.1.1/shellwise-darwin-x64.tar.gz"
      sha256 "a09e4912bcfa76f8926e7f9bbf7b389554ce7ad705ffa46f5aa4e8eb095c3b45"

      def install
        bin.install "sw-darwin-x64" => "sw"
      end
    end
  end

  def caveats
    <<~EOS
      Add shell integration to your config:

        # Zsh (~/.zshrc)
        eval "$(sw init zsh)"

        # Bash (~/.bashrc)
        eval "$(sw init bash)"

      Then restart your terminal or run: source ~/.zshrc
    EOS
  end

  test do
    assert_match "shellwise", shell_output("#{bin}/sw --help")
  end
end
