FILE="solar-eclipse-8.5.1-beta-static-linux.zip"

wget -nv "https://www.nitrc.org/frs/download.php/11937/$FILE"
unzip $FILE
rm $FILE

cd solar851
chmod +x install_solar
./install_solar /opt/appl/solr/8.5.1 /usr/local/bin solar
