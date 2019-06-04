# waspscanner
A Basic Scanner for Vulnerabilities Related to HiddenWasp Malware on LiGnux. Must be run with sudo / as super user. Download *WaspScannerUtil.sh* and run from anywhere **with sudo**.

Dependencies: `perl`

Usage: `sudo sh WaspScannerUtil.sh`

That's it. It will output the results, and you will see them. This script simply creates a list of the files on your system that are potentially vulnerable to HiddenWasp, scans them to see if they are affected, then tells you whether or not they are. Only caveat is if a *.so* file turns out to be a symbolic link, then the *readelf* command will not be able to scan it, saying that the file is missing instead. This is normal. Also note that due to the nature of the *find* command, it may take 30 or so seconds to gather results the first time. Subsequent runs will only take one or two seconds. To speed up scan time on a first run, one can temporarily unmount or disconnect external drives. Enjoy.

![Image](https://raw.githubusercontent.com/bongochong/waspscanner/master/Screenshot.png)

Inspired by the intelligence gathered about it so far:
- https://news.ycombinator.com/item?id=20057612
- https://www.intezer.com/blog-hiddenwasp-malware-targeting-linux-systems/

Also also improved with some suggestions from other free software lunatics on [an infamous mongolian basket-weaving forum](https://boards.4channel.org/g/thread/71259718). Another fine /g/entooman proposed a minified version. It doesn't seem to work, but I appreciate the idea.

*This little bash script is dedicated to my dear and dead friend [Jaime Cochran](https://chronicle.su/news/jaime-cochran-lived/), who motivated me to get back into GNU / Linux many years ago while talking after a Phish show. I don't think I'll ever have the chops she had, but I do enjoy writing useful scripts, so there.*
