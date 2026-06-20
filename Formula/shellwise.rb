class Shellwise < Formula
  desc "Smart command history with inline auto-suggest and fuzzy search for your terminal"
  homepage "https://github.com/kurovu146/shellwise"
  version "0.3.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kurovu146/shellwise/releases/download/v0.3.1/shellwise-darwin-arm64.tar.gz"
      sha256 "5be3446d99bf01c9314482e9d34f1360c471e5b0590798eb392c49e2e8972bbf"

      def install
        bin.install "shellwise-darwin-arm64" => "shellwise"
      end
    else
      url "https://github.com/kurovu146/shellwise/releases/download/v0.3.1/shellwise-darwin-x64.tar.gz"
      sha256 "b41d6ea602fa2b97ec8c1d36513668caffeca952fdf3c10d5cbfada2dd74cd65"

      def install
        bin.install "shellwise-darwin-x64" => "shellwise"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kurovu146/shellwise/releases/download/v0.3.1/shellwise-linux-arm64.tar.gz"
      sha256 "fa44f736904e161fac478f91f3ff4b130fed05c062b55972c7464b0f6b2701bf"

      def install
        bin.install "shellwise-linux-arm64" => "shellwise"
      end
    else
      url "https://github.com/kurovu146/shellwise/releases/download/v0.3.1/shellwise-linux-x64.tar.gz"
      sha256 "90540607f5a73310bda57e0ac87979984cc18106dd0b61df7b33ec8836edf99b"

      def install
        bin.install "shellwise-linux-x64" => "shellwise"
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
