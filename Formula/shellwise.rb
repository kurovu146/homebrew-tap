class Shellwise < Formula
  desc "Smart command history with inline auto-suggest and fuzzy search for your terminal"
  homepage "https://github.com/kurovu146/shellwise"
  version "0.2.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kurovu146/shellwise/releases/download/v0.2.4/shellwise-darwin-arm64.tar.gz"
      sha256 "5baf137eed04a645016d0a79d88c83b3c2313fac0abadae811203d263652e3e4"

      def install
        bin.install "shellwise-darwin-arm64" => "shellwise"
      end
    else
      url "https://github.com/kurovu146/shellwise/releases/download/v0.2.4/shellwise-darwin-x64.tar.gz"
      sha256 "41cd5fb9867d145a8a7528884c1da381b8a956bb8a2ef095ea6cb6437b268be5"

      def install
        bin.install "shellwise-darwin-x64" => "shellwise"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kurovu146/shellwise/releases/download/v0.2.4/shellwise-linux-arm64.tar.gz"
      sha256 "e17373765e1b810d368b9f02b109e9fdb818b4348c6dc1f3d124683dbd0a5c9a"

      def install
        bin.install "shellwise-linux-arm64" => "shellwise"
      end
    else
      url "https://github.com/kurovu146/shellwise/releases/download/v0.2.4/shellwise-linux-x64.tar.gz"
      sha256 "909e3708ccb13a2c3bd77409951470904ec2c082e4c0c1e63a812e3b3d7c55f7"

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
