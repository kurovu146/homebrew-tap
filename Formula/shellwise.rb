class Shellwise < Formula
  desc "Smart command history with inline auto-suggest and fuzzy search for your terminal"
  homepage "https://github.com/kurovu146/shellwise"
  version "0.1.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kurovu146/shellwise/releases/download/v0.1.3/shellwise-darwin-arm64.tar.gz"
      sha256 "14d8e276104e274678bc90c2444c6285e48cd04144969a460a5173e1a86efbed"

      def install
        bin.install "sw-darwin-arm64" => "sw"
      end
    else
      url "https://github.com/kurovu146/shellwise/releases/download/v0.1.3/shellwise-darwin-x64.tar.gz"
      sha256 "4ecf0c6ad2447f4e09cca0e9c801ebdf1aca48559b83347f2659f84ff5cb33f1"

      def install
        bin.install "sw-darwin-x64" => "sw"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kurovu146/shellwise/releases/download/v0.1.3/shellwise-linux-arm64.tar.gz"
      sha256 "00c6368b669d7b3d37a104410ebf37f60fc51f175b1417ef8a0d0453e144ec3a"

      def install
        bin.install "sw-linux-arm64" => "sw"
      end
    else
      url "https://github.com/kurovu146/shellwise/releases/download/v0.1.3/shellwise-linux-x64.tar.gz"
      sha256 "2c1f64e4d611af68f5abaef66f207c6beebc21d7d6cd15e509addbf1be6129d2"

      def install
        bin.install "sw-linux-x64" => "sw"
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
