#!/bin/sh

BASE_DIR=docsify
DOC_DIR=/usr/local/nginx/html/doc/

# 二重起動チェック
shell_name=`basename $0`
count=`ps -ef|grep $shell_name|grep -v grep|wc -l`
if [ $count -gt 2 ]; then
  echo -e "ium deploy process is running. please try again later!"
  echo "running process:"
  ps -ef|grep $shell_name|grep -v grep|grep -v $$
  exit 1
fi

#if [ ! -d "/usr/local/nginx/html/doc/" ];then
#    sudo mkdir -p /usr/local/nginx/html/doc/
#fi

rm -rf ${BASE_DIR}
git clone https://github.com/hsh86/docsify.git -b main ${BASE_DIR}
if [ $? -ne 0 ]; then
    echo -e "fail to get git source"
    exit 1
fi

# ソースを移動
cd ${BASE_DIR}
\cp -r src/* ${DOC_DIR}
#if [ -d "CarInfo_Backend/IUM/script" ]; then
#    \cp -r CarInfo_Backend/IUM/script/*.groovy ${GROOVY_DIR}
#fi

echo -e "docsify deploy completed."
rm -rf ${BASE_DIR}

exit 0
