class Shellwise < Formula
  desc "Smart command history with inline auto-suggest and fuzzy search for your terminal"
  homepage "https://github.com/kurovu146/shellwise"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kurovu146/shellwise/releases/download/v0.1.0/shellwise-darwin-arm64.tar.gz"
      sha256 "f9e7aa13cc69d08904cd8cd0f219c371f3321dfe0113b191ba35cd6c2f136e76"

      def install
        bin.install "sw-darwin-arm64" => "sw"
      end
    else
      url "https://github.com/kurovu146/shellwise/releases/download/v0.1.0/shellwise-darwin-x64.tar.gz"
      sha256 "129bb3418aa3fe363fa3704c6e1aa0941654dac34eaabe0b339e3ca88ec22965"

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
