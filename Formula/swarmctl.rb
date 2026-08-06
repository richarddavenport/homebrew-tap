# Prebuilt binaries, not a source build: swarmctl's source repository is private,
# and a formula can only fetch what needs no credential. The binaries live in the
# public swarmctl-dist repository for exactly that reason.
class Swarmctl < Formula
  desc "Terminal UI for browsing and deploying to Docker Swarm environments"
  homepage "https://github.com/richarddavenport/swarmctl-dist"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/richarddavenport/swarmctl-dist/releases/download/v0.10.0/swarmctl_darwin_arm64"
      sha256 "21cb6d12576624399fb2bf9dd493646694f62e6e0fcb7f76219a1f59773e42e9"
    end
    on_intel do
      url "https://github.com/richarddavenport/swarmctl-dist/releases/download/v0.10.0/swarmctl_darwin_amd64"
      sha256 "03c7a620acc371d70f16aad65c98861e9fd2cbd7e9993caca586cfbd676f297c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/richarddavenport/swarmctl-dist/releases/download/v0.10.0/swarmctl_linux_arm64"
      sha256 "41d3682dd54f2f8182d92cdc65e07ed71725036abb6ee84a2a7d8bfdd69fbe53"
    end
    on_intel do
      url "https://github.com/richarddavenport/swarmctl-dist/releases/download/v0.10.0/swarmctl_linux_amd64"
      sha256 "8ce10fe18b7ba7938f29750c42820f192b10799852dbd3cdd452bd6209b8ea42"
    end
  end

  def install
    # The asset is the bare executable, named per platform.
    bin.install Dir["swarmctl_*"].first => "swarmctl"
  end

  test do
    assert_match "swarmctl", shell_output("#{bin}/swarmctl version")
  end
end
