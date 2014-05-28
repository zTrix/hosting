require 'formula'

# reference "https://github.com/Homebrew/homebrew/commit/77d0b18eff2fd2d790de91c81f521b3856a9c957"
# put this file into /usr/local/Library/Formula and $ brew install dsniff-devel

class DsniffDevel < Formula
  url 'http://monkey.org/~dugsong/dsniff/beta/dsniff-2.4b1.tar.gz'
  homepage 'http://monkey.org/~dugsong/dsniff/'
  sha1 '25cfea26e9bbe016451180758a49d4d5bc9317d3'

  def patches
      { :p0 => ["http://cdn.ztx.io/dsniff/patch-arpspoof.c.diff",
      "http://cdn.ztx.io/dsniff/patch-dnsspoof.c.diff",
      "http://cdn.ztx.io/dsniff/patch-filesnarf.c.diff",
      "http://cdn.ztx.io/dsniff/patch-macof.c.diff",
      "http://cdn.ztx.io/dsniff/patch-pcaputil.c",
      "http://cdn.ztx.io/dsniff/patch-record.c.diff",
      "http://cdn.ztx.io/dsniff/patch-sshcrypto.c",
      "http://cdn.ztx.io/dsniff/patch-sshmitm.c.diff",
      "http://cdn.ztx.io/dsniff/patch-sshow.c.diff",
      "http://cdn.ztx.io/dsniff/patch-tcp_raw.c.diff",
      "http://cdn.ztx.io/dsniff/patch-tcp_raw.h.diff",
      "http://cdn.ztx.io/dsniff/patch-tcpkill.c.diff",
      "http://cdn.ztx.io/dsniff/patch-tcpnice.c.diff",
      "http://cdn.ztx.io/dsniff/patch-trigger.c.diff",
      "http://cdn.ztx.io/dsniff/patch-trigger.h.diff",
      "http://cdn.ztx.io/dsniff/patch-urlsnarf.c.diff",
      "http://cdn.ztx.io/dsniff/patch-webmitm.c.diff",
      "http://cdn.ztx.io/dsniff/patch-webspy.c.diff"]}
  end

  depends_on 'libnet'
  depends_on 'libnids'
  depends_on 'berkeley-db'

  def install
    ENV.append 'CFLAGS', "-DBIND_8_COMPAT"
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}", "--with-libnet=#{Formula["libnet"].opt_prefix}", "--with-libnids=#{Formula["libnids"].opt_prefix}", "--with-db=#{Formula["berkeley-db"].opt_prefix}", "--mandir=#{man}"
    system "make"
    system "make install"
  end
end
