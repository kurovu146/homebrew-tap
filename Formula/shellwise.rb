class Shellwise < Formula
  desc "Smart command history with inline auto-suggest and fuzzy search for your terminal"
  homepage "https://github.com/kurovu146/shellwise"
  version "0.2.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kurovu146/shellwise/releases/download/v0.2.6/shellwise-darwin-arm64.tar.gz"
      sha256 "94e1c0d2b448a6a7fcc104cb4b148d5e35f83114e12654b77b33bbd4a333a402"

      def install
        bin.install "shellwise-darwin-arm64" => "shellwise"
      end
    else
      url "https://github.com/kurovu146/shellwise/releases/download/v0.2.6/shellwise-darwin-x64.tar.gz"
      sha256 "c4107b1ea06e56d222d29e39372d8b827482ca5bbde908b889dac6a2161c1b69"

      def install
        bin.install "shellwise-darwin-x64" => "shellwise"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kurovu146/shellwise/releases/download/v0.2.6/shellwise-linux-arm64.tar.gz"
      sha256 "232bdf11a1af85845ec8ad9894a2bbf72ddece9ae86fb9c62417f5473227b052"

      def install
        bin.install "shellwise-linux-arm64" => "shellwise"
      end
    else
      url "https://github.com/kurovu146/shellwise/releases/download/v0.2.6/shellwise-linux-x64.tar.gz"
      sha256 "2a6cb77267b20f660da73f20cf0ff274e94fcbed8dfabf58fc266028f362ea74"

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
