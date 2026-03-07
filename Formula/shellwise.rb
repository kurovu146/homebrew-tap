class Shellwise < Formula
  desc "Smart command history with inline auto-suggest and fuzzy search for your terminal"
  homepage "https://github.com/kurovu146/shellwise"
  version "0.1.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kurovu146/shellwise/releases/download/v0.1.2/shellwise-darwin-arm64.tar.gz"
      sha256 "14d8e276104e274678bc90c2444c6285e48cd04144969a460a5173e1a86efbed"

      def install
        bin.install "sw-darwin-arm64" => "sw"
      end
    else
      url "https://github.com/kurovu146/shellwise/releases/download/v0.1.2/shellwise-darwin-x64.tar.gz"
      sha256 "4ecf0c6ad2447f4e09cca0e9c801ebdf1aca48559b83347f2659f84ff5cb33f1"

      def install
        bin.install "sw-darwin-x64" => "sw"
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
    assert_match "shellwise", shell_output("#{bin}/sw --help")
  end
end
