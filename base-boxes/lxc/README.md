# building new bases boxes for lxc

you need to be on linux and have the lxc tools installed (and vagrant)


* adjust `virtualization/parameters.yml` to use the correct base box 
* eventually adjust `virtualization/playbook.yml`, depending on what you want to have included
* `bash build.sh`
* adjust `upload.sh` (mainly version and name)
* `bash upload.sh`