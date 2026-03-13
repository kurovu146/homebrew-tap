class Shellwise < Formula
  desc "Smart command history with inline auto-suggest and fuzzy search for your terminal"
  homepage "https://github.com/kurovu146/shellwise"
  version "0.2.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kurovu146/shellwise/releases/download/v0.2.8/shellwise-darwin-arm64.tar.gz"
      sha256 "fef7fe9b790b3488080b3533563746196c1343654c5f6ad3cc6121946a0b01f3"

      def install
        bin.install "shellwise-darwin-arm64" => "shellwise"
      end
    else
      url "https://github.com/kurovu146/shellwise/releases/download/v0.2.8/shellwise-darwin-x64.tar.gz"
      sha256 "c3cda93ea4f6b471f33d313b95999113c2d6a03ae9e1196cd036e8417e4c6a5c"

      def install
        bin.install "shellwise-darwin-x64" => "shellwise"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kurovu146/shellwise/releases/download/v0.2.8/shellwise-linux-arm64.tar.gz"
      sha256 "5c54c52469eadd50ccc4c752e5ba5712168b4f68d696a051bfecbe46c96871b0"

      def install
        bin.install "shellwise-linux-arm64" => "shellwise"
      end
    else
      url "https://github.com/kurovu146/shellwise/releases/download/v0.2.8/shellwise-linux-x64.tar.gz"
      sha256 "0d958da87fdecf88a85dff13a9da87c8875f23f69e4410be2e78fa00fe76907d"

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
