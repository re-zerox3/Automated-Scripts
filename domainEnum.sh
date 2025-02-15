url = $1

if [! -d "$url"];then    //!=does not, -d=folder or directory--> if directory does not exists then--> 
  mkdir $url
fi
if [! -d "$url/recon"];then
  mkdir $url/recon
fi
echo "[+] Harvesting subdomains wth Assetfinder..."
assetfinder $url >> $url/recon/tmp_assets.txt
cat $url/recon/tmp_assets.txt | grep $1 >> $url/recon/assetfinder.txt
rm $url/recon/tmp_assets.txt

#echo "[+] Harvesting subdomains with Amass..."
#amass enum -d $url >> $url/recon/tmp_assets.txt
#sort -u $url/recon/tmp_assets.txt >> $url/recon/amass_assets.txt
#rm $url/recon/tmp_assets.txt


