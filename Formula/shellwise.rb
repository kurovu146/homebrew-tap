class Shellwise < Formula
  desc "Smart command history with inline auto-suggest and fuzzy search for your terminal"
  homepage "https://github.com/kurovu146/shellwise"
  version "0.2.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kurovu146/shellwise/releases/download/v0.2.5/shellwise-darwin-arm64.tar.gz"
      sha256 "c11418de3a2a9d1768738d9c4eec78183fb3274d47618569f99c20452f60bea6"

      def install
        bin.install "shellwise-darwin-arm64" => "shellwise"
      end
    else
      url "https://github.com/kurovu146/shellwise/releases/download/v0.2.5/shellwise-darwin-x64.tar.gz"
      sha256 "523a124f995408b5228b33d64102ce282c5ca78dee6801ad07a0cb8c0a7f220b"

      def install
        bin.install "shellwise-darwin-x64" => "shellwise"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kurovu146/shellwise/releases/download/v0.2.5/shellwise-linux-arm64.tar.gz"
      sha256 "4d026643e05c5abf5843f2ff50e84827a50e49a9eceffe52e03e71873bcb75a2"

      def install
        bin.install "shellwise-linux-arm64" => "shellwise"
      end
    else
      url "https://github.com/kurovu146/shellwise/releases/download/v0.2.5/shellwise-linux-x64.tar.gz"
      sha256 "361c7c4bc7c7ed42839ba394d4fda5bf113ea4c2f1114b667ff834ebd26d4935"

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
