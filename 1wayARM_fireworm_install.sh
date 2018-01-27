echo "\e[92mVerium Guide 1/6: \e[93mUpdate & Upgrade System\e[39m"
sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get dist-upgrade -f -y
echo -e "\e[92mVerium Guide 2/6: \e[93mInstall dependencies\e[39m"
sudo apt-get install git automake autoconf pkg-config libcurl4-openssl-dev libjansson-dev libssl-dev libgmp-dev -y
echo -e "\e[92mVerium Guide 3/6: \e[93mCreating verium directory\e[39m"
mkdir ~/verium
echo -e "\e[92mVerium Guide 3/6: \e[93mClone miner source code into ~/verium/fireworm\e[39m"
git clone https://github.com/fireworm71/veriumMiner.git ~/verium/fireworm
echo -e "\e[92mVerium Guide 4/6: \e[93mCompile the miner using build\e[39m"
cd verium/fireworm
./build.sh
echo -e "\e[92mVerium Guide 5/6: \e[93mMiner built.\e[39m"
echo "/opt/vc/bin/vcgencmd measure_temp >> ~/verium/cpu_temp.log" > ~/verium/templog.sh
chmod +x ~/verium/templog.sh
echo "*/10 * *   *   *  /home/pi/verium/templog.sh"
sleep 10
crontab -e
echo -e "\e[92mVerium Guide 6/6: \e[93mTesting the miner with a little joke... ;) \e[39m"
echo -e "\e[91mALL YOUR HASHES ARE BELONG TO US!!11 ;)\e[39m"
echo -e "\e[92mNow Ctrl+C, get \e[91myour wallets address \e[93mand mine for yourself!\n\e[39m"
./cpuminer -o stratum+tcp://pool-eu.bloxstor.com:3003 -u VEXMki29ycW5vSt3MmdM5iwHqsHux91EMr.Guide -p GuidePwd
echo "For overclocking you might want to try:"
echo "sudo nano /boot/config.txt"
echo "arm_freq=1350
over_voltage=5
gpu_freq=550

# sdram overclock
sdram_freq=550
sdram_schmoo=0x02000020
over_voltage_sdram_p=6
over_voltage_sdram_i=4
over_voltage_sdram_c=4"
echo "Autostart config:"
echo "sudo nano /etc/rc.local"
echo "/home/pi/verium/fireworm/cpuminer -o stratum+tcp://eu.vrm.mining-pool.ovh:3032 -u joe_rondx.RPi3 -p joe -1 4 --api-bind 0.0.0.0:4048 --no-color >> /home/pi/verium/fireworm/mine.log &"
echo "before exit 0"
echo -e "\e[92mHappy Verium Mining! \e[35m joe_rondx :)"
echo -e "      \e[94m_\e[34m_"
echo -e "  \e[37m_  \e[94m/  \e[34m\  \e[90m_"
echo -e ' \e[37m/| \e[94m(    \e[34m) \e[90m|\ '
echo -e "\e[37m( (  \e[94m\  \e[34m/  \e[90m) )"
echo -en "\e[37m \ \ \e[94m"
echo -n ' \'
echo -e "\e[34m/  \e[90m/ /"
echo -e "  \e[37m\ \    \e[90m/ /"
echo -e "   \e[37m\ \  \e[90m/ /"
echo -e "    \e[37m\ -\e[90m- /"
echo -e "     \e[37m\  \e[90m/"
echo -e "      \e[37m-\e[90m-"
echo -e "\e[90m  V E R I U M"
echo -e "\e[39m"
