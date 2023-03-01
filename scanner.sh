"# scanner" 
#!/bin/bash

logo(){
echo    '                                                                                                            ';
echo -e '\e[38;5;208m______    _______  _______   _______   ___     ___       __     ___________  ________          ';
echo -e '\e[38;5;208m(  ___ \  |(  ____ \(  ___\  |  ___  | | |     | |      /  \   |____   ____| |( _____)         ';
echo -e '\e[38;5;215m | (   ) )| (    \/| (    \/ | )   ( | | |\\    | |     / /\ \       | |      | (    \|         ';
echo -e '\e[38;5;215m | (__/ / | (__    | (       | |   | | | | \\   | |    / /__\ \      | |      | (__             ';
echo -e '\e[38;5;215m |  __ (  |  __)   | (       | |   | | | |  \\  | |   / /____\ \     | |      |  __)            ';
echo -e '\e[38;5;208m | (  \ \ | (      | (       | |   | | | |   \\ | |  / /      \ \    | |      | (               ';
echo -e '\e[38;5;208m | )   \ )| (____/\| (____/\ | )___( | | |    \\| | / /        \ \   | |      | (____/\         ';
echo -e '\e[38;5;208m |/     \ |(_______/(______| |_______/ |_|     |_|/_/          \_\  |_|      |(_______)        ';
echo -e '\e[38;5;208m                                                                                                 ';

echo -e '\e[38;5;208mAutomated with <3 by Anirudh Makkar (@AnirudhMakkar)\e[0m';
}


logo



# echo 'Run this in Domain Name Directory'

echo ''
echo 'Started assetfinder'
cat scope.txt | assetfinder --subs-only | sort -u | tee -a 1DomainsfromAF.txt
echo ''
echo 'Completed assetfinder'
echo ''

echo 'Started subfinder'
subfinder -dL scope.txt | sort -u | tee -a 2DomainsfromSubfinder.txt
echo ''
echo 'Completed subfinder'
echo ''

echo 'Sorting, Merging and Probing Live Domains'
sort 1DomainsfromAF.txt 2DomainsfromSubfinder.txt -u | httpx -silent | tee -a UniqueLiveDomains.txt
echo ''
echo 'Completed'
echo ''

echo 'Taking screenshots'
eyewitness -f UniqueLiveDomains.txt
# cat UniqueLiveDomains.txt | aquatone
echo ''
echo 'Completed'
echo ''

echo 'Checking for Exposed Git Repo'
python3 $HOME/Desktop/dirsearch/dirsearch.py -l UniqueLiveDomains.txt -w $HOME/Desktop/dirsearch/db/git_files.txt
echo ''
echo 'Completed'
echo ''

cp UniqueLiveDomains.txt UniqueLiveDomainsForNmap.txt

sed -i -e 's%https://%%g' UniqueLiveDomainsForNmap.txt
sed -i -e 's%http://%%g' UniqueLiveDomainsForNmap.txt
sed -i -e 's%www.%%g' UniqueLiveDomainsForNmap.txt


echo 'Checking for Open Ports'
nmap -p- -iL UniqueLiveDomainsForNmap.txt -o PortStatus.txt
echo ''
echo 'Completed'
echo ''

echo 'Checking for CVEs'
nuclei -l UniqueLiveDomains.txt -t ~/nuclei-templates/cves/ -o NucleiOutput.txt -rate-limit 50
echo ''

echo 'Github Recon'
python3 $HOME/Desktop/GitDorker/GitDorker.py -tf $HOME/Desktop/GitDorker/tf/TOKENSFILE -qf scope.txt -d $HOME/Desktop/GitDorker/Dorks/medium_dorks.txt -o dorks -p -pf -lb
echo ''
echo 'Completed'
echo ''

echo 'Checking for possible takeovers'
subzy -targets UniqueLiveDomains.txt > subzyresults.txt
echo ''

echo 'Check your slack for takeover results (only if found)'
python3 $HOME/Desktop/subHijack/subHijack.py
echo ''
echo 'Finished'
