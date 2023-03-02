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

echo 'Checking for CVEs'
nuclei -l UniqueLiveDomains.txt -t ~/nuclei-templates/cves/ -o NucleiOutput.txt -rate-limit 50
echo ''

echo 'Finished'
