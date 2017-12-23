echo -e "\e[92mVerium Guide 1/6: \e[93mUpdate & Upgrade System\e[39m"
sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get dist-upgrade -f -y
echo -e "\e[92mVerium Guide 2/6: \e[93mInstall dependencies\e[39m"
sudo apt-get install cpufrequtils git automake autoconf pkg-config libcurl4-openssl-dev libjansson-dev libssl-dev libgmp-dev -y
# echo -e "\e[92mVerium Guide 3/6: \e[93mCreating verium directory\e[39m"
# mkdir ~/verium
echo -e "\e[92mVerium Guide 3/6: \e[93mClone miner source code into ~/verium/nwayminer\e[39m"
git clone https://github.com/fireworm71/veriumMiner.git ~/verium/nwayminer
echo -e "\e[92mVerium Guide 4/6: \e[93mConfigure NEON usage for ARMv7\e[39m"
sed -i -e 's/-DUSE_ASM -pg/-DUSE_ASM -mfpu=neon -pg/g' ~/verium/nwayminer/build.sh
echo -e "\e[92mVerium Guide 4/6: \e[93mCompile the miner using build\e[39m"
cd verium/nwayminer
./build.sh
echo -e "\e[92mVerium Specials 5/6: \e[93mMiner built.\e[39m"
# Odroid Specials
echo -e "\e[92mOdroid Specials 1/4 : \e[93m Downclocking (yes, down!) to 1.9GHz \e[39m"
echo "$: sudo cpufreq-set -c 7 -u 1.9GHz -r"
sudo cpufreq-set -c 7 -u 1.9GHz -r
sudo echo 'ENABLE="true"' > /etc/default/cpufrequtils
sudo echo 'GOVERNOR="performance"' >> /etc/default/cpufrequtils
sudo echo 'MAX_SPEED=1900000' >> /etc/default/cpufrequtils
sudo echo 'MIN_SPEED=1900000' >> /etc/default/cpufrequtils
echo -e "\e[92mOdroid Guide 2/4 : \e[93mCreating swap file\e[39m" 
sudo fallocate -l 256M /var/swapfile
sudo chmod 600 /var/swapfile
sudo mkswap /var/swapfile
sudo swapon /var/swapfile
sudo echo "/var/swapfile    none    swap    sw    0    0" >> /etc/fstab
echo -e "\e[92mOdroid Specials 2/4 : \e[93mOvreclock RAM by setenv ddr_freq 933 in /media/boot/boot.ini\e[39m"
sed -i -e 's/setenv ddr_freq 825/setenv ddr_freq 933/g' /media/boot/boot.ini
echo -e "\e[92mOdroid Specials 3/4 : \e[93mConfigure CPU temperature logging.\e[39m"
echo "cat /sys/devices/virtual/thermal/thermal_zone0/temp >> ~/verium/cpu_temp.log" > ~/verium/templog.sh
chmod +x ~/verium/templog.sh
echo -e "\e[91mCOPY the next line and paste it at the end of the crontab file.\e[39m"
echo "*/10 * *   *   *  /root/verium/templog.sh"
sleep 10
crontab -e
echo -e "\e[92mVerium Guide 6/6 : \e[93mConfigure Autostart\e[39m"
sed -i -e 's/exit 0//g' /etc/rc.local
echo "nice --15 /root/verium/nwayminer/cpuminer \ " >> /etc/rc.local
echo "-o stratum+tcp://pool-eu.bloxstor.com:3003 -u VEXMki29ycW5vSt3MmdM5iwHqsHux91EMr.OdroidImg -p joe_rondx \ " >> /etc/rc.local
echo "-t 3 -1 1 --cpu-affinity 0x00F0 --cpu-priority 4 --api-bind 0.0.0.0:4048 --no-color >> /root/verium/nwayminer/3waymine.log &" >> /etc/rc.local
echo "" >> /etc/rc.local
echo "exit 0" >> /etc/rc.local
echo "" >> /etc/rc.local
echo -e "\e[92mVerium Guide 7/6: \e[93mTesting the miner with a little joke... ;) \e[39m"
echo -e "\e[91mALL YOUR HASHES ARE BELONG TO US!!11 ;)\e[39m"
echo -e "\e[92mNow get \e[91myour wallets address \e[93mhit Ctrl+C and mine for yourself!\n\e[39m"
./cpuminer -o stratum+tcp://pool-eu.bloxstor.com:3003 -u VEXMki29ycW5vSt3MmdM5iwHqsHux91EMr.Guide -p GuidePwd -t 2 -1 6 
echo -e "\e[92mHappy Verium Mining! \e[35m :)"
echo -e "      \e[94m_\e[34m_"
echo -e "  \e[37m_  \e[94m/  \e[34m\  \e[90m_"
echo -e ' \e[37m/| \e[94m(    \e[34m) \e[90m|\ '
echo -e "\e[37m( (  \e[94m\  \e[34m/  \e[90m) )"
echo -e " \e[37m\ \  \e[94m\\e[34m/  \e[90m/ /"
echo -e "  \e[37m\ \    \e[90m/ /"
echo -e "   \e[37m\ \  \e[90m/ /"
echo -e "    \e[37m\ -\e[90m- /"
echo -e "     \e[37m\  \e[90m/"
echo -e "      \e[37m-\e[90m-"
echo -e "\e[90m  V E R I U M"
echo -e "\e[39m"
