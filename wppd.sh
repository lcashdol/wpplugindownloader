#!/bin/bash
#Wordpress Plugin Downloader
#Larry W. Cashdollar @_larry0
#Usage ./wppd.sh pagenumber searchstring
# for x in `seq 1 1400`; do ./wppd.sh $x file; done

USERAGENT="\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.101 Safari/537.36\""

for x in `curl -sk -A $USERAGENT "https://wordpress.org/plugins/search.php?page=$1&q=$2" | egrep "href=\"https\:\/\/wordpress.org\/plugins\/[a-z]*|-\""`;do
    Y=`        echo $x|grep href|grep -v tags`;
if [ $Y ]; then
    Z=`echo $Y | sed -e 's/\"/ /g' | awk '{print $2}'`;
  echo $Z;
	curl -sk -A $USERAGENT "$Z" |grep downloadUrl | awk -F\' '{print $4}' | xargs wget -nc
        mv *.zip plugins
fi;
done
