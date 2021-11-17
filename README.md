# waspscanner
<p align="left">
  <img src="https://i.imgur.com/tmiMGph.png">
  <img src="https://i.imgur.com/yZ6NnIW.png">
</p>

A Basic Scanner for Vulnerabilities Related to HiddenWasp Malware on GNU/Linux. Download *WaspScannerUtil.sh* and run from anywhere.

Dependencies: `perl`

Usage: `./WaspScannerUtil.sh`

That's it. It will output the results, and you will see them. This script simply creates a list of the files on your system that could be affected by HiddenWasp, then generates another script around that list which scans said files using the `readelf` tool to detect missing strings that would indicate **potential** vulnerability to, or manipulation by, HiddenWasp.

![Image](https://raw.githubusercontent.com/bongochong/waspscanner/master/newscreen.png)

**Notes**: The [standard tool](https://raw.githubusercontent.com/bongochong/waspscanner/master/WaspScannerUtil.sh) now utilizes the *locate* command to gather files. This is very fast, and not subject to the limitations of *find*. I have retained the old version which uses the *find* command instead ([located here](https://raw.githubusercontent.com/bongochong/waspscanner/master/old-version/old-WaspScannerUtil.sh)), for those who prefer it or do not utilize *locate*. If using said version, due to the nature of the *find* command, it may take a while to gather results the first time, and quite long if you have huge external drives connected before running. Subsequent runs will only take one or two seconds, but to speed up scan time on a first run, one can temporarily unmount or disconnect external drives. Enjoy.

On some systems there is a caveat when using *find* instead of *locate* as well: If a *.so* file turns out to be a symbolic link, then the *readelf* command will not be able to scan it, saying that there is *no such file* instead. This is nothing to worry about, and the *.so* file any symbolic link points to will still be scanned by this script. Most users will not encounter this issue, and you should be using the main / standard version of my tool anyway, which uses *locate*.

**Inspired by the intelligence gathered about it so far**:
- https://news.ycombinator.com/item?id=20057612
- https://www.intezer.com/blog-hiddenwasp-malware-targeting-linux-systems/

*This bash script-based scanner is dedicated to my dear and dead friend [Jaime Cochran](https://chronicle.su/news/jaime-cochran-lived/), who motivated me to get back into GNU/Linux many years ago while talking after a Phish show. I don't think I'll ever have the chops she had, but I do enjoy writing useful scripts, so there.*
