## ubuntu

    sudo apt-get install git devscripts equivs
    git clone https://github.com/mpv-player/mpv-build.git
    cd mpv-build
    ./update -j4
    mk-build-deps -s sudo -i
    dpkg-buildpackage -uc -us -b -j4
    sudo dpkg -i ../mpv*.deb

## os x

    sudo easy_install docutils
    export LC_ALL=en_US.UTF-8
    export LANG=en_US.UTF-8
    brew install python3
    pip3 install --upgrade pip setuptools
    brew install --HEAD --with-bundle --with-bluray-support --with-libdvdread --with-little-cms2 --with-lua --with-bundle mpv
    brew linkapps mpv
