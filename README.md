Just use svn co https://plugins.svn.wordpress.org/

wpplugindownloader
==================

Downloads Wordpress plugins for vulnerability research.
Usage :./download-p.sh <pagenumber> <searchstring>

So ./download-p.sh 1 file
will download all plugins from page 1 from of the search using keyword file.  I'll improve on this once I get more time.

Do a for x in `seq 1 1000 or how many total pages are returned from the search`; do ./download-p.sh $x file ; done

