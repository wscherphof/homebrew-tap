require 'formula'

class Leo < Formula
  homepage 'http://leoeditor.com/'
  url 'http://sourceforge.net/projects/leo/files/Leo/4.11-final/Leo-4.11-final.zip'
  sha1 '648fa7e7d3660d1a358d6d6dc45af16ebea6c109'

  depends_on 'pyqt'
  depends_on 'enchant' => :recommended

  def install
    # Obtain information on Python installation
    python_xy = "python" + %x(python -c 'import sys;print(sys.version[:3])').chomp
    python_site_packages = lib + "#{python_xy}/site-packages"
    python_site_packages.install 'leo'
    bin.install ['launchLeo.py', 'profileLeo.py']
    ln_s "#{bin}/launchLeo.py", "#{bin}/leo"
  end

  test do
    if system "python -c 'import leo'" then
      onoe 'Leo FAILED'
    else
      ohai 'Leo OK'
    end
  end
end
