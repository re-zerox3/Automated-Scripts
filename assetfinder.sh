url = $1

if [! -d "$url"];then    //!=does not, -d=folder or directory--> if directory does not exists then--> 
  mkdir $url
fi
if [! -d "$url/recon"];then
  mkdir $url/recon
fi
echo "[+] Harvesting subdomains wiht assetfinder"
assetfinder $url >> $url/recon/assets.txt
cat $url/recon/assets.txt | grep $1 >> $url/recon/final.txt
rm $url/recon/assets.txt
