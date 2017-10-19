echo -e "\e[92mVerium Guide 1/10: \e[93mUpdate & Upgrade System\e[39m"
sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get dist-upgrade -f -y
echo -e "\e[92mVerium Guide 2/10: \e[93mInstall dependencies\e[39m"
sudo apt-get install unzip build-essential libboost-dev libboost-system-dev libboost-filesystem-dev libboost-program-options-dev libboost-thread-dev libssl-dev libdb++-dev libminiupnpc-dev libboost-all-dev libqrencode-dev freeglut3-dev git build-essential automake autoconf pkg-config libcurl4-openssl-dev libjansson-dev libssl-dev libgmp-dev -y
echo -e "\e[92mVerium Guide 3/10: \e[93mCreating verium directory\e[39m"
mkdir ~/verium
echo -e "\e[92mVerium Guide 3/10: \e[93mClone wallet source code into ~/verium/wallet\e[39m"
git clone https://github.com/VeriumReserve/verium ~/verium/wallet
cd ~/verium/wallet/src
echo -e "\e[92mVerium Guide 4/10: \e[93mCompile the wallet using make\e[39m"
make -f makefile.unix
echo -e "\e[92mVerium Guide 5/10: \e[93mDownload nodes and write configuration file, edit by nano ~/verium/wallet/src/verium.conf\e[39m"
wget https://www.vericoin.info/downloads/verium.conf
echo " " >> ~/verium/wallet/src/verium.conf
echo "server=1" >> ~/verium/wallet/src/verium.conf
echo "listen=1" >> ~/verium/wallet/src/verium.conf
echo "daemon=1" >> ~/verium/wallet/src/verium.conf
echo "rpcuser=YourSoloMiningName" >> ~/verium/wallet/src/verium.conf
echo "rpcpassword=YourSoloMiningPassword" >> ~/verium/wallet/src/verium.conf
echo "rpcallowip=localhost" >> ~/verium/wallet/src/verium.conf
~/verium/wallet/src/veriumd
echo -e "\e[92mVerium Guide 5/10: \e[93mGenerating Wallet. Wait 1 min\e[39m"
sleep 60
echo -e "\e[92mVerium Guide 6/10: \e[93mWallet generated, stopping it for now...\e[39m"
~/verium/wallet/src/veriumd stop
sleep 10
echo -e "\e[92mVerium Guide 7/10: \e[93mDirectly download the Blockchain for speed up...\e[39m"
wget -O ~/verium/bootstrap_VRM.zip http://www.vericoin.info/downloads/bootstrap_VRM.zip
cd ~/verium
echo -e "\e[92mVerium Guide 8/10: \e[93munzip and install the Blockchain...\e[39m"
unzip bootstrap_VRM.zip
rm -rf ~/.verium/txleveldb
rm -rf ~/.verium/blk0001.dat
mv ~/verium/bootstrap/blk0001.dat ~/.verium/blk0001.dat
mv ~/verium/bootstrap/txleveldb ~/.verium/txleveldb
sleep 5
echo -e "\e[92mVerium Guide 9/10: \e[93mBlockchain update complete, restarting wallet, wait 2 min\e[39m"
~/verium/wallet/src/veriumd
sleep 120
echo -e "\e[92mVerium Guide 10/10: \e[93mto get info use ~/verium/wallet/src/veriumd getinfo\e[39m" 
~/verium/wallet/src/veriumd getinfo
echo -e "\e[92mVerium Guide 10/10: \e[93mYour wallets address is:\e[39m"
~/verium/wallet/src/veriumd getaddressesbyaccount ""
echo -e "\e[92mVerium Guide 10/10: \e[93mCopy it for your miners to use\n"
echo -e "\e[92mWelcome to Verium! \e[35m :)"
echo -e "\e[34m      __"
echo "  _  /  \  _"
echo " /| (    ) |\ "
echo "( (  \  /  ) )"
echo " \ \  \/  / /"
echo "  \ \    / /"
echo "   \ \  / /"
echo "    \ -- /"
echo "     \  /"
echo "      --"
echo "  V E R I U M"
echo -e "\e[39m"
echo "PS.: In case you see ERRORS like -No such file... - it actually helps to run the script again since probably the installation of the dependencies failed"

