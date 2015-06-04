#!/bin/bash
#Wordpress Plugin Downloader
#Larry W. Cashdollar @_larry0
#Usage ./wppd.sh pagenumber searchstring
# for x in `seq 1 1400`; do ./wppd.sh $x file; done
USERAGENT="\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.101 Safari/537.36\""
echo "[+] Scraping Page: https://wordpress.org/plugins/search.php?page=$1&type=term&q=$2";
for x in `curl -sk -A $USERAGENT "https://wordpress.org/plugins/search.php?page=$1&type=term&q=$2" | egrep "href=\"https\:\/\/wordpress.org\/plugins\/[a-z]*|-\""  | awk -F = '{print $2}'  | sed -e 's/"/ /g' | awk '{print $1}' | sort -u |grep -v plugin-install`;do
#    echo $x;
if [ $x ]; then
        echo "+= Pulling down plugin: "
	curl -sk -A $USERAGENT "$x" |grep downloadUrl | awk -F\' '{print $4}'  | xargs wget -nc
fi;
done
