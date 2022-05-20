# Installing Tor Service with aaPanel

This bash script is only **compatible only with Ubuntu 20.04 LTS** for now.

This script will update Ubuntu sources.list, update all repositories and install Tor service in its latest available version as per Tor Source at: https://www.torproject.org/download/tor/

After the Tor service is installed, it will generate a .onion V3 domain and enable the Tor service on the server.

Finally it will install aaPanel, at the end of the installation it will show the aaPanel login data and the .onion domain configured on the server.

To finish the installation, go to aaPanel, choose your web server between Apache or Nginx, PHP Version and Database type, Tor service is compatible with all services except email services.

After completing the installation of your web server, access the "Website" tab and add your .onion domain generated at the end of the installation. Ready! You can access your domain using the Tor browser.

You can easily create FTP users and database using aaPanel, you can manage everything with phpMyAdmin.

You can also create a mirror of your .onion domain on common domains like .com or others. Create a second site within the "Website" tab of aaPanel, and in the "Website Path" option, set the same directory as your .onion domain. Ready! You can now access your surfaceweb and .onion domains showing the same content.

Need help, visit our website https://impreza.host/ and chat with us or open a ticket and we'll be happy to help.

Script maintained and updated by Murilo / Impreza Host

# How to use:
```
git clone https://github.com/imprezahost/aapanel-tor-network.git

bash tor.sh
```
After completion, you will see aaPanel login data and generated .onion domain, please keep this information safe.

Now you have a complete control panel to manage your Tor server :)

Note that you need to have git installed on your server, if not, run it before starting the Tor installation:
```
sudo apt install git
```

