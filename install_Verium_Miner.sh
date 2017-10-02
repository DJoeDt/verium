echo -e "\e[92mVerium Guide 1/10: \e[93mUpdate & Upgrade System\e[39m"
sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get dist-upgrade -f -y
echo -e "\e[92mVerium Guide 2/10: \e[93mInstall dependencies\e[39m"
sudo apt-get install git automake autoconf pkg-config libcurl4-openssl-dev libjansson-dev libssl-dev libgmp-dev
echo -e "\e[92mVerium Guide 3/10: \e[93mCreating verium directory\e[39m"
mkdir ~/verium
echo -e "\e[92mVerium Guide 3/10: \e[93mClone miner source code into ~/verium/miner\e[39m"
git clone https://github.com/effectsToCause/veriumMiner ~/verium/miner
echo -e "\e[92mVerium Guide 4/10: \e[93mConfigure Algorithm\e[39m"
sed -i -e 's/#define SCRYPT_MAX_WAYS 3/#define SCRYPT_MAX_WAYS 1/g' ~/verium/miner/algo/scrypt.c
sed -i -e 's/#define HAVE_SCRYPT_3WAY 1/\/\/#define SCRYPT_MAX_WAYS 1/g' ~/verium/miner/algo/scrypt.c
sed -i -e 's/#define scrypt_best_throughput\(\) 3/#define scrypt_best_throughput\(\) 1/g' ~/verium/miner/algo/scrypt.c
sed -i -e 's/void scrypt_core_3way\(uint32_t \*X, uint32_t \*V, int N\);/void scrypt_core \(uint32_t \*X, uint32_t \*V, int N\);/g' ~/verium/miner/algo/scrypt.c
sed -i -e 's/-DUSE_ASM -pg/-DUSE_ASM -mfpu=neon -pg/g' ~/verium/miner/build.sh
echo -e "\e[92mVerium Guide 4/10: \e[93mCompile the miner using build\e[39m"
cd veriumMiner
./build.sh
echo -e "\e[92mVerium Guide 6/10: \e[93mMiner built.\e[39m"
echo -e "\e[92mVerium Guide 6/10: \e[93mMiner built.\e[39m"

echo -e "\e[92mHappy Verium Mining! \e[35m :)"

echo -e "\e[39m"
