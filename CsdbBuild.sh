#/bin/bash
export GTAGSFORCECPP=1
rm GPATH GRTAGS GTAGS 
#rm tags
#ctags -R --c++-kinds=+px --fields=+iaS --extra=+q .
gtags 
path=`pwd`
syspath="/usr/include"
find ${path} -name "*.h*"  | xargs dirname  | grep -v include   |sed -e 's/^/-I/' | sort | uniq > .clang_complete
echo "-I/data1/home/summerxwu/bustub/src/include" >> .clang_complete
#find ${syspath} -name "*.h"  | xargs dirname  |sed -e 's/^/-I/' | sort | uniq >> .clang_complete
