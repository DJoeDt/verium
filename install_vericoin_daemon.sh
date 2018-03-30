echo -e "\e[94mVeriCoin Guide 1/10: \e[93mUpdate & Upgrade System\e[39m"
sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get dist-upgrade -f -y
echo -e "\e[94mVeriCoin Guide 2/10: \e[93mInstall dependencies\e[39m"
sudo apt-get install libminizip-dev libcurl4-openssl-dev unzip build-essential libboost-dev libboost-system-dev libboost-filesystem-dev libboost-program-options-dev libboost-thread-dev libssl-dev libdb++-dev libminiupnpc-dev libboost-all-dev libqrencode-dev freeglut3-dev git build-essential automake autoconf pkg-config libcurl4-openssl-dev libjansson-dev libssl-dev libgmp-dev -y
echo -e "\e[94mVeriCoin Guide 3/10: \e[93mCreating vericoin directory\e[39m"
mkdir ~/vericoin
echo -e "\e[94mVeriCoin Guide 3/10: \e[93mClone wallet source code into ~/vericoin\e[39m"
git clone https://github.com/vericoin/vericoin.git 
cd ~/vericoin/src
echo -e "\e[94mVeriCoin Guide 4/10: \e[93mCompile the wallet using make\e[39m"
make -f makefile.unix
echo -e "\e[94mVeriCoin Guide 5/10: \e[93mDownload nodes and write configuration file, edit by nano ~/vericoin/vericoin.conf\e[39m"
wget https://www.vericoin.info/downloads/vericoin.conf 
echo " " >> ~/vericoin/src/vericoin.conf
echo "server=1" >> ~/vericoin/src/vericoin.conf
echo "listen=1" >> ~/vericoin/src/vericoin.conf
echo "daemon=1" >> ~/vericoin/src/vericoin.conf
echo "rpcuser=YourName" >> ~/vericoin/src/vericoin.conf
echo "rpcpassword=YourPassword" >> ~/vericoin/src/vericoin.conf
./vericoind
echo -e "\e[94mVeriCoin Guide 5/10: \e[93mGenerating Wallet. Wait 2 min\e[39m"
sleep 120
echo -e "\e[94mVeriCoin Guide 6/10: \e[93mDirectly download the Blockchain for speed up...\e[39m"
./vericoind bootstrap false
echo -e "\e[94mVeriCoin Guide 7/10: \e[93mBlockchain update complete, restarting wallet, wait 2 min\e[39m"
./vericoind
sleep 120
echo -e "\e[94mVeriCoin Guide 8/10: \e[93mto get info use ~/vericoin/src/vericoind getinfo\e[39m" 
./vericoind getinfo
echo -e "\e[94mVeriCoin Guide 9/10: \e[93mYour wallets address is:\e[39m"
./vericoind getaddressesbyaccount ""
echo -e "\e[94mVeriCoin Guide 10/10: \e[93mWelcome to:"
echo -e "\e[94m      "
echo " __        __ "
echo " \ \      / / "
echo "  \ \    / / "
echo "   \ \  / / "
echo "    \ \/ / "
echo "     \  / "
echo "      \/ "
echo -e "\e[94mV E R I C O I N"
echo -e "\e[39m"
echo "PS.: In case you see ERRORS like -No such file... - it actually helps to run the script again since probably the installation of the dependencies failed"
