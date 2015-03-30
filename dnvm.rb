require "formula"

class Kvm < Formula
  homepage "https://www.github.com/aspnet/Home"
  version "1.0.0-beta3"
  url "https://github.com/aspnet/Home.git", :tag => 'v1.0.0-beta3'

  head "https://github.com/aspnet/Home.git", :branch => 'dev'

  depends_on "mono" => :recommended

  def install
    libexec.install "dnvm.sh"
    (libexec + "dnvm.sh").chmod 0755
    (libexec + "mono").make_symlink Formula["mono"].opt_bin/"mono"
    system "bash -c 'source #{libexec}/dnvm.sh; dnvm upgrade'"
    bin.install_symlink "#{libexec}/dnvm.sh"
#    bin.install_symlink "#{libexec}/current/dnx"
#    bin.install_symlink "#{libexec}/current/dnu"
  end

  def caveats; <<-EOS.undent
    Add the following to the ~/.bash_profile, ~/.bashrc or ~/.zshrc file:

      source kvm.sh

    EOS
  end

end
