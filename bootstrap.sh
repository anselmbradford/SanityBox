# Utility method to suppress noisy installation progress output.
function install {
    echo Installing $1
    shift
    apt-get -y install "$@" >/dev/null 2>&1
}

echo 'Updating package information...'
apt-get -y update >/dev/null 2>&1

install cURL curl
install Git git
install 'nodeJS' nodejs
install 'npm' npm

echo 'Preparing to install Selenium...'
install 'Default Java Runtime Environment' default-jre
echo 'Installing Selenium standalone server'
curl --silent -O http://selenium-release.storage.googleapis.com/2.45/selenium-server-standalone-2.45.0.jar

echo 'WebdriverCSS dependencies...'
install GraphicsMagick graphicsmagick
install Cairo libcairo2-dev
npm install webdriverio

echo 'Installing WebdriverCSS...'
npm install webdrivercss

echo 'Installing JS-YAML...'
npm install js-yaml

install 'PhantomJS dependencies' bzip2 libfontconfig1
curl --silent -L https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-1.9.8-linux-i686.tar.bz2 \
  --output /opt/phantomjs.tar.bz2 \
  && mkdir /opt/phantomjs \
  && tar --extract --file=/opt/phantomjs.tar.bz2 --strip-components=1 \
  --directory=/opt/phantomjs
sudo ln -s /opt/phantomjs/bin/phantomjs /usr/local/bin/phantomjs

echo 'Adding bash aliases'
touch ~/.bash_aliases
printf '# Start Selenium standalone server.' >> ~/.bash_aliases
printf "\nalias selenium_start='java -jar ~/selenium-server-standalone-2.45.0.jar'" >> ~/.bash_aliases
printf "\nalias selenium_stop='curl http://localhost:4444/selenium-server/driver/?cmd=shutDownSeleniumServer'" >> ~/.bash_aliases

# Load bash aliases.
source ~/.bash_aliases

echo 'All done, carry on!'
