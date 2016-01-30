export   VAGRANT_DEFAULT_PROVIDER=lxc
vagrant up
vagrant ssh -c "sudo apt-get upgrade -yf"
vagrant package