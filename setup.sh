apt-get update
apt-get install -y \
  build-essential \
  git \
  libssl-dev \
  openssl \
  sudo \
  tzdata \
  libpoco-dev \
  libpococrypto46 \
  libpocodata46 \
  libpocofoundation46 \
  libpoconet46 \
  libpoconetssl46 \
  libpocoutil46 \
  wget

cd /tmp
git clone https://github.com/Creepsky/creepMiner.git creepMiner-src
cd creepMiner-src
git checkout 2.5.2

# Still missing Poco::JSON
wget $(grep -o 'http.*pocoproject.*$' install-poco.sh)
tar -xzvf poco-*-all.tar.gz
cd poco-*-all
./configure
for comp in JSON; do
  make ${comp}-libexec
  cp -Rf ${comp}/include/* /usr/include/
done
find lib -name 'libPoco*' -type f -exec cp -f {} /usr/lib \;
find lib -name 'libPoco*' -type l -exec cp -Rf {} /usr/lib \;
cd ..

make
mkdir /creepMiner
mv bin/creepMiner bin/public /creepMiner/

export SUDO_FORCE_REMOVE=yes
apt-get remove -y build-essential git sudo wget
apt autoremove -y
apt-get clean
