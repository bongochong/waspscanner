# waspscanner
A Basic Scanner for Vulnerabilities Related to HiddenWasp Malware on LiGnux. Must be run with sudo / as super user.

Usage: `sudo sh WaspScannerUtil.sh`

That's it. It will output the results, and you will see them. This script simply creates a list of the files on your system that are potentially vulnerable to HiddenWasp, scans them to see if they are affected, then tells you whether or not they are. Only caveat is if a .so file turns out to be a symbolic link, then the readelf command will not be able to scan it, saying that the file is missing instead. This is normal. Enjoy.
