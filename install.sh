 #!/bin/sh

sudo apt-get install python3;
sudo apt-get install python3-pip;
sudo apt-get install ruby;
sudo apt-get install screen;
sudo apt-get install git;
mkdir ~/.gf
mkdir ~/Tools;
mkdir ~/Recon;
dir=~/Tools;
go get -u github.com/tomnomnom/gf;
go get github.com/tomnomnom/hacks/waybackurls;
go get -u -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei;
git clone https://github.com/projectdiscovery/nuclei-templates $dir/nuclei-templates;
go get -u -v github.com/hahwul/dalfox;
go get -u -v github.com/lc/gau;
go get -u -v github.com/projectdiscovery/httpx/cmd/httpx;
git clone https://github.com/GerbenJavado/LinkFinder $dir/LinkFinder;
git clone https://github.com/m4ll0k/SecretFinder $dir/SecretFinder;
git clone https://github.com/devanshbatham/ParamSpider $dir/ParamSpider;
git clone https://github.com/maurosoria/dirsearch $dir/dirsearch;
git clone https://github.com/1ndianl33t/Gf-Patterns $dir/Gf-Patterns;
pip3 install -r ~/Tools/*/requirements.txt;
mv $dir/Gf-Patterns/*.json /root/.gf/;
rm -r $dir/Gf-Patterns;
git clone https://github.com/KathanP19/JSFScan.sh $dir/JSFScan.sh;
mv arsenal ~/arsenal;
cd ~/arsenal;
chmod +x *.sh;
cd ~/.gf; wget https://raw.githubusercontent.com/devanshbatham/ParamSpider/master/gf_profiles/potential.json;
