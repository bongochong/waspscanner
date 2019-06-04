#!/bin/bash
echo "cleaning up from last scan..."
rm ~/WaspScan1.txt ~/WaspScan2.txt ~/WaspScanPrePre.txt ~/WaspScanPre.txt ~/WaspScanSort.txt ~/WaspScan.sh
echo "finished cleaning. now scanning..."
find / -iname "*ld-*.so" | sed "/gz$/d" | sed "/debug/d" > ~/WaspScan1.txt
find / -iname "ld-*.so.*" | sed "/gz$/d" | sed "/debug/d" > ~/WaspScan2.txt
cat ~/WaspScan1.txt ~/WaspScan2.txt > ~/WaspScanPrePre.txt
sort ~/WaspScanPrePre.txt > ~/WaspScanPre.txt
uniq ~/WaspScanPre.txt > ~/WaspScanSort.txt
perl -ne 'for$i(0..1){print}' ~/WaspScanSort.txt > WaspScan.sh
sed -i "1~2s/^/echo 'scanning /" ~/WaspScan.sh
sed -i "1~2s/$/...'/" ~/WaspScan.sh
sed -i "2~2s/^/readelf -p .rodata /" ~/WaspScan.sh
sed -i '2~2s/$/ \| grep -q "\/etc\/ld\\.so\\.preload" \&\& \/bin\/echo -e "\\\e[32mnot vulnerable\\\e[0m" \|\| \/bin\/echo -e "\\\e[31mpotentially vulnerable\\\e[0m"/' ~/WaspScan.sh
sudo sh ~/WaspScan.sh
echo "done. please inspect your terminal for potential vulnerabilities, though do disregard ones related to a missing file. this is normal."

