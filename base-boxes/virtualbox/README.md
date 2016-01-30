
# For virtualbox

* install packer.io
* export virtualbox OVF from your base boxes (ubuntu/trusty or liip/jessie64)
* put them in the ova/ directory
* export ATLAS_TOKEN=yourtoken
* adjust packer.json with a new version number
* ubuntu trusty: `packer build -var ova_image=ova/trusty64.ova packer.json`
* debian jessie: `packer build -var atlas_name=liip-jessie64 -var ova_image=ova/liip-jessie64.ova packer.json`