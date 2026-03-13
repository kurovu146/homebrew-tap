class Shellwise < Formula
  desc "Smart command history with inline auto-suggest and fuzzy search for your terminal"
  homepage "https://github.com/kurovu146/shellwise"
  version "0.2.9"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kurovu146/shellwise/releases/download/v0.2.9/shellwise-darwin-arm64.tar.gz"
      sha256 "90e572dc10cf2abeb9c35fa8999b8309f982d5db45f542696ce6daa2842ddf97"

      def install
        bin.install "shellwise-darwin-arm64" => "shellwise"
      end
    else
      url "https://github.com/kurovu146/shellwise/releases/download/v0.2.9/shellwise-darwin-x64.tar.gz"
      sha256 "c8e92b3c9d72bd51c04aa5c7da7351f06483f939111a87e485a2d7c486f7319e"

      def install
        bin.install "shellwise-darwin-x64" => "shellwise"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kurovu146/shellwise/releases/download/v0.2.9/shellwise-linux-arm64.tar.gz"
      sha256 "10b05f78dc1e69396e2709a0cfeaa4ffa0b783218774a9efb1c405bf83feabf1"

      def install
        bin.install "shellwise-linux-arm64" => "shellwise"
      end
    else
      url "https://github.com/kurovu146/shellwise/releases/download/v0.2.9/shellwise-linux-x64.tar.gz"
      sha256 "15fd558ec43eeebdc5a8989f279aceaaad590c2e51a24a7422f9fa0f7814845d"

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
