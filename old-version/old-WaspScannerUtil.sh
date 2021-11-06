#!/bin/bash
echo "Cleaning up from last scan..."
echo "---"
rm ~/WaspScanPre.txt ~/WaspScanSort.txt ~/WaspScan.sh
echo "Finished cleaning. Now scanning..."
find / -iname "*ld-*.so" | sed "/.gz$/d" | sed "\/usr\/lib\/debug/d" > ~/WaspScanPre.txt
find / -iname "ld-*.so.*" | sed "/.gz$/d" | sed "\/usr\/lib\/debug/d" >> ~/WaspScanPre.txt
sort -u ~/WaspScanPre.txt > ~/WaspScanSort.txt
perl -ne 'for$i(0..1){print}' ~/WaspScanSort.txt > ~/WaspScan.sh
sed -i "1~2s/^/echo 'scanning /" ~/WaspScan.sh
sed -i "1~2s/$/...'/" ~/WaspScan.sh
sed -i "2~2s/^/readelf -p .rodata /" ~/WaspScan.sh
sed -i '2~2s/$/ \| grep -q "\/etc\/ld\\.so\\.preload" \&\& \/bin\/echo -e "\\\e[32mnot vulnerable\\\e[0m" \|\| \/bin\/echo -e "\\\e[31mpotentially vulnerable\\\e[0m"/' ~/WaspScan.sh
if [[ $(id -u) -ne 0 ]]
  then
	sudo sh ~/WaspScan.sh
  else
	sh ~/WaspScan.sh
fi
echo "Done. Please inspect your terminal for potential vulnerabilities, though do disregard ones related to a missing file. This is normal."
echo "---"
exit
