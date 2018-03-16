set -x

mysql -uroot -pPass1234! -f -h127.0.0.1 -P3306 PRINTER < ./input/product_settings_ng_1.sql > ./csv/product_settings_ng_1.csv
mysql -uroot -pPass1234! -f -h127.0.0.1 -P3306 PRINTER < ./input/product_settings_ng_2.sql > ./csv/product_settings_ng_2.csv
mysql -uroot -pPass1234! -f -h127.0.0.1 -P3306 PRINTER < ./input/product_settings_g_1.sql > ./csv/product_settings_g_1.csv

sed '1d' ./csv/product_settings_ng_1.csv > ./csv/product_settings.csv
sed '1d' ./csv/product_settings_ng_2.csv >> ./csv/product_settings.csv
sed '1d' ./csv/product_settings_g_1.csv >> ./csv/product_settings.csv


cat ./input/clean.sql > ./out/product_settings_insert.sql
awk -f ./awk/product_settings.awk ./csv/product_settings.csv >> ./out/product_settings_insert.sql



a='-i'

if [ "$1" == $a ]; then
   echo "inserting data into table product_settings"
   mysql -uroot -pPass1234! -f -h127.0.0.1 -P3306 PRINTER < ./out/product_settings_insert.sql > ./log/product_settings.log 2>&1
fi
