# Maintainer: Alberto G. Jácome (agjacome) <agjacome@gmail.com>
pkgname=dmenu-agjacome
pkgver=r578.404ebc6
pkgrel=1
pkgdesc="Patched and customized build of dmenu to suit my own needs"
arch=(x86_64 i686)
url="https://github.com/agjacome/dmenu"
license=('MIT')
groups=()
depends=(libx11 libxinerama libxft freetype2)
makedepends=()
checkdepends=()
optdepends=()
provides=(dmenu)
conflicts=(dmenu)
replaces=()
backup=()
options=()
source=("git+$url.git")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
    cd "$srcdir/${pkgname%-agjacome}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/${pkgname%-agjacome}"
    make
}

package() {
   cd "$srcdir/${pkgname%-agjacome}"

   make DESTDIR="${pkgdir}/" install
   install -Dm644 doc/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
