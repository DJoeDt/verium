echo -e "\e[92mVerium Guide 1/6: \e[93mUpdate & Upgrade System\e[39m"
sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get dist-upgrade -f -y
echo -e "\e[92mVerium Guide 2/6: \e[93mInstall dependencies\e[39m"
sudo apt-get install git automake autoconf pkg-config libcurl4-openssl-dev libjansson-dev libssl-dev libgmp-dev -y
echo -e "\e[92mVerium Guide 3/6: \e[93mCreating verium directory\e[39m"
mkdir ~/verium
echo -e "\e[92mVerium Guide 3/6: \e[93mClone miner source code into ~/verium/3wayminer\e[39m"
git clone https://github.com/effectsToCause/veriumMiner ~/verium/3wayminer
echo -e "\e[92mVerium Guide 4/6: \e[93mConfigure 3way Algorithm neon\e[39m"
sed -i -e 's/-DUSE_ASM -pg/-DUSE_ASM -mfpu=neon -pg/g' ~/verium/3wayminer/build.sh
echo -e "\e[92mVerium Guide 4/6: \e[93mCompile the miner using build\e[39m"
cd verium/3wayminer
./build.sh
echo -e "\e[92mVerium Guide 5/6: \e[93mMiner built.\e[39m"
echo -e "\e[92mVerium Guide 6/6: \e[93mTesting the miner with a little joke... ;) \e[39m"
echo -e "\e[91mALL YOUR HASHES ARE BELONG TO US!!11 ;)\e[39m"
echo -e "\e[92mNow get \e[91myour wallets address \e[93mhit Ctrl+Cand mine for yourself!\n\e[39m"
./cpuminer -o stratum+tcp://pool-eu.bloxstor.com:3003 -u VEXMki29ycW5vSt3MmdM5iwHqsHux91EMr.Guide -p GuidePwd -t 3 --cpu-priority 4 --cpu-affinity 0x00FF
echo -e "\e[92mHappy Verium Mining! \e[35m :)"
echo -e "\e[34m      __"
echo -e "  _  /  \  _"
echo -e ' /| (    ) |\ '
echo -e "( (  \  /  ) )"
echo -e " \ \  \/  / /"
echo -e "  \ \    / /"
echo -e "   \ \  / /"
echo -e "    \ -- /"
echo -e "     \  /"
echo -e "      --"
echo -e "  V E R I U M"
# XU4 Specials
echo -e "\e[92mXU4 Guide 1/ : \e[93m Downclocking (yes, down!) the XU4 CPU Install utility  \e[39m"
echo "sudo apt-get install cpufrequtils"
sudo apt-get install cpufrequtils
echo -e "\e[92mXU4 Guide 1/ : \e[93m Downclock to 1.9GHz "
echo "$: sudo cpufreq-set -c 7 -u 1.9GHz -r"
sudo cpufreq-set -c 7 -u 1.9GHz -r
sudo echo 'ENABLE="true"' > /etc/default/cpufrequtils
sudo echo 'GOVERNOR="performance"' >> /etc/default/cpufrequtils
sudo echo 'MAX_SPEED=1900000' >> /etc/default/cpufrequtils
sudo echo 'MIN_SPEED=1900000' >> /etc/default/cpufrequtils
echo -e "\e[92mXU4 Guide 2/ : \e[93m Downclocking the XU4 GPU"
echo "$: sudo apt-get install sysfsutils"
sudo apt-get install sysfsutilssudo apt-get install sysfsutils
echo -e "\e[92mXU4 Guide 2/ : \e[93mConfigure sysfs.conf to powersave"
echo "# Put GPU into powersave mode (= Downclocking it)"  >>  /etc/sysfs.conf
echo "devices/platform/11800000.mali\:/devfreq/11800000.mali\:/governor = powersave" >>  /etc/sysfs.conf
echo -e "\e[92mXU4 Guide 2/ : \e[93mStarting the service" 
echo "$: service sysfsutils start"
service sysfsutils start
mkdir ~/tmpmnt
sudo mount /dev/disk/by-label/boot ~/tmpmnt
# TODO: add setenv ddr_freq 933
echo "edit ~/tmpmnt/boot.ini"
sudo umount ~/tmpmnt
rmdir ~/tmpmnt
echo -e "\e[39m"
