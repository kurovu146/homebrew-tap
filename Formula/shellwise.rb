class Shellwise < Formula
  desc "Smart command history with inline auto-suggest and fuzzy search for your terminal"
  homepage "https://github.com/kurovu146/shellwise"
  version "0.3.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kurovu146/shellwise/releases/download/v0.3.2/shellwise-darwin-arm64.tar.gz"
      sha256 "a818934248557e526ce11b09ea6c3e82a26717c56285966268e0618be32427d5"

      def install
        bin.install "shellwise-darwin-arm64" => "shellwise"
        bin.install_symlink "shellwise" => "sw"
      end
    else
      url "https://github.com/kurovu146/shellwise/releases/download/v0.3.2/shellwise-darwin-x64.tar.gz"
      sha256 "5462e0033326ac7028ccd8178bd76fae1cab8df7cd56f297f6033e0df71297ad"

      def install
        bin.install "shellwise-darwin-x64" => "shellwise"
        bin.install_symlink "shellwise" => "sw"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kurovu146/shellwise/releases/download/v0.3.2/shellwise-linux-arm64.tar.gz"
      sha256 "1e9e787b67755a6d524766471e0f7a631a0c963253396be7cf8503eb811857ca"

      def install
        bin.install "shellwise-linux-arm64" => "shellwise"
        bin.install_symlink "shellwise" => "sw"
      end
    else
      url "https://github.com/kurovu146/shellwise/releases/download/v0.3.2/shellwise-linux-x64.tar.gz"
      sha256 "c73b45d5dd0a9c20482d3a36826a91ac0fad5d167063987874a4e1aadc8e8f0c"

      def install
        bin.install "shellwise-linux-x64" => "shellwise"
        bin.install_symlink "shellwise" => "sw"
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
