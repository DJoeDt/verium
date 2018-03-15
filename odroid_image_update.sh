echo -e "\e[92mVerium Guide 1/6: \e[93mClone new miner source code into ~/verium/fireworm\e[39m"
git clone https://github.com/fireworm71/veriumMiner.git ~/verium/fireworm
echo -e "\e[92mVerium Guide 2/6: \e[93mConfigure NEON usage for ARMv7\e[39m"
sed -i -e 's/-DUSE_ASM -pg/-DUSE_ASM -mfpu=neon -pg/g' ~/verium/fireworm/build.sh
echo -e "\e[92mVerium Guide 3/6: \e[93mCompile the miner using build\e[39m"
cd verium/fireworm
./build.sh
echo -e "\e[92mVerium Guide 4/6: \e[93mMiner built.\e[39m"
sed -i -e 's/"1way Miner: -----------------------------"//g' ~/vrmcheck.sh
sed -i -e 's/tail verium\/nwayminer\/1waymine.log//g' ~/vrmcheck.sh
sed -i -e 's/nwayminer/fireworm/g' ~/vrmcheck.sh
echo -e "\e[92mVerium Guide 5/6: \e[93mAdding One-Miner configuration to Autostart\e[39m"
sed -i -e 's/exit 0//g' /etc/rc.local
echo "# New One-Miner configuration:" >> /etc/rc.local
echo "nice --10 /root/verium/fireworm/cpuminer \ " >> /etc/rc.local
echo "-o stratum+tcp://vrm.n3rd3d.com:3402 -u joe_rondx.a -p joe \ " >> /etc/rc.local
echo "-1 5 -t 3 --cpu-affinity-stride 1 --cpu-affinity-default-index 5 --cpu-affinity-oneway-index 0 \ " >> /etc/rc.local
echo "--cpu-priority 2 \ " >> /etc/rc.local
echo "--api-bind 0.0.0.0:4048 --no-color >> /root/verium/fireworm/3waymine.log &" >> /etc/rc.local
echo "" >> /etc/rc.local
echo "exit 0" >> /etc/rc.local
echo "" >> /etc/rc.local
echo -e "\e[92mVerium Guide 666: \e[93mTesting the miner with a little joke... ;) \e[39m"
echo -e "\e[91mALL YOUR HASHES ARE BELONG TO US!!11 ;)\e[39m"
echo "Well, you may keep this running for a while as donation. Thanks! <3"
echo -e "\e[92mThen get \e[91myour wallets address \e[93mhit Ctrl+C and mine for yourself!\n\e[39m"
./cpuminer -o stratum+tcp://pool-eu.bloxstor.com:3003 -u VEXMki29ycW5vSt3MmdM5iwHqsHux91EMr.OdroidUpdate -p joe -1 5 -t 3 --cpu-affinity-stride 1 --cpu-affinity-default-index 5 --cpu-affinity-oneway-index 0 
echo -e "\e[92mHappy Reconfigure Autostart: \e[35m nano /etc/rc.local"
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
echo -e "wiki.vericoin.info"
echo -e "\e[39m"
