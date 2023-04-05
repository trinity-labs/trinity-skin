<div align="right">
<img src="https://user-images.githubusercontent.com/45216746/226208297-32a0371b-83db-4a0e-ae33-70e74ca2b2e5.png" width="1.75%" >
</div>
<br>
<div align="center">
 <img src="https://user-images.githubusercontent.com/45216746/221048916-d990ce07-dc89-4f1c-9e76-aeea75a173a0.png">
</div>
<br>
<hr/>

  ![](https://img.shields.io/github/stars/trinity-labs/trinity-skin.svg)
  ![Views](https://img.shields.io/endpoint?url=https%3A%2F%2Fhits.dwyl.com%2Ftrinity-labs%2Ftrinity-skin.json%3Fcolor%3Dpurple)
  ![contributions welcome](https://img.shields.io/badge/contributions-welcome-ff69b4.svg?style=flat)
  ![](https://img.shields.io/github/issues/trinity-labs/trinity-skin.svg)
<!--- ![](https://img.shields.io/github/tag/trinity-labs/trinity-skin.svg) 
![](https://img.shields.io/github/v/release/trinity-labs/trinity-skin.svg) --->
 
<br>

It's a modern skin for Linux `Alpine Configuration Framework` commonly called [ACF](https://wiki.alpinelinux.org/wiki/Alpine_Configuration_Framework_Design)

A French Project where **`И`** of `TRIИITY` means : **Nginx prefered solution as default front end server, for our pocket mainframe**

[Alpine](https://alpinelinux.org/about/) Linux became popular since `Docker` image size and efficiency are essestial. Minimalist & Secure Linux Distro, `Alpine` is perfect for low powered and/or low performances systems. 

**The perfect solution for reduce waste of system ressources and downsizing energy consumption.  
Even in a large scale architecture**  

Alpine is quite secure :

> *"Alpine Linux was designed with security in mind. All userland binaries are compiled as Position Independent Executables (PIE) with stack smashing protection. These proactive security features prevent exploitation of entire classes of zero-day and other vulnerabilities."  
<sub>[Alpine Linux - Website](https://alpinelinux.org/about/)</sub>*

<br>

⚠️ **!! WARNING !! - Project in constant `dev` and with lots of things to verify, custom and modify !** 
<br>


<h2>⚙️ Setup</h2>

<ins>**Requirement**</ins> **:**

Alpine Linux Extended edition prefered or Standard with `cat` `sed` and `awk` apk packages installed on

From any fresh install on : `system` `container` `image` or `VM` !

  ```css
  $: setup-alpine
  ``` 
  
It's an Alpine native & build-in `script` to setup entire system, this include :

- Keyboard Keys LANG
- User
- Password
- <ins>**Networking**</ins>
- Hostname

**!** <ins>**Important**</ins> **: We need networking for acces to ACF from local network**
<br>
<br>
<h2>🧪 Install</h2>

`Alpine Configuration Framework` - [ACF](https://wiki.alpinelinux.org/wiki/Alpine_Configuration_Framework_Design) had it's own MVC app design to handle CGI Scripts

- **HTML Files** are include in `Lua` language (small & fast framework mostly design for embedded device)
- **Framework Files** are include in skin folder (so be carreful of security permission and code remaining) skin files override core template 
- **Views** are served by `mini_httpd` server (fast and secure way to split `local` network server and `nginx public` reverse proxy) so completly separate all this two configs
- **CSS Files** are store in easy way to `css` folder

All files and folders are store on local system in ` /usr/share/acf/www/skins/trinity `

<br>

 **1 -** <ins>**Get ACF First**</ins> :
  
  ```css
  $: setup-acf
  ```
  
 Edit [ACF](https://wiki.alpinelinux.org/wiki/Alpine_Configuration_Framework_Design#ACF_Layout) core config file `/etc/acf/acf.conf` and replace following lines for overriding core template
 
  ```css
 ...
 # Directories where the application resides
 ...
appdir=/usr/share/acf/www/skins/trinity/app/,/usr/share/acf/app/
libdir=/usr/share/acf/www/skins/trinity/lib/,/usr/share/acf/lib/
wwwdir=/usr/share/acf/www/skins/trinity/www/,/usr/share/acf/www/
staticdir=/skins/static/
skindir=/skins/,/userskins/
...
  ```
  
   ```css
 ...
# ACF is skinnable - this specifies the active skin
#  will attempt to load skin/basename(skin).css
skin=/skins/trinity
...
  ```
  <br>
  
  **2 -** <ins>**Get TRIИITY skin**</ins> :
  
  <h3>Web GUI Method</h3>
  
  Download GitHub ZIP archive and extract **content** of  ` trinity-skin-main ` in  ` /usr/share/acf/www/skins/trinity `
  
  https://github.com/trinity-labs/trinity-skin/archive/refs/heads/main.zip
  
  Open your favorite browser and go to :
  
  https://192.168.X.XXX/cgi-bin/acf/acf-util/skins/update (after login with system credential) 
  
  Select `/skins/trinity`  
  
  **Apply and 💜**
  
  <h3>Git Method</h3>
  
  ```css
  $: apk update && apk add git
  ```
  
  ```css
  $: cd /usr/share/acf/www/skins && git clone https://github.com/trinity-labs/trinity-skin.git trinity
  ```
  
   <h3>Wget Method</h3>
  
  ```css
  $: apk update && apk add wget zip
  ```
  
  ```css
  $: cd /usr/share/acf/www/skins && wget https://github.com/trinity-labs/trinity-skin/archive/refs/heads/main.zip -O trinity-labs-trinity-skin.zip && unzip ./trinity-labs-trinity-skin.zip -d trinity && rm -rvf ./trinity-labs-trinity-skin.zip && mv -f trinity/trinity-skin-main/* trinity && rm -rvf trinity/trinity-skin-main
  ```
  <br>
 <h2>💊 Tips</h2>
 
  ~~Move **favicon.ico** to **/usr/share/acf/www root folder**~~ : **Unnecessary since we had inclued all folder structure off the native ACF app**
<br>
<br>
<br>
<h2>📸 Screenshots</h2>

**` TRIИITY Skin - Logon `**

<div align="center">
<img src="https://user-images.githubusercontent.com/45216746/230196172-8af5bff5-5835-42f7-aac3-bc04cc6a7174.png" width="80%" >
</div>
<br>

**` TRIИITY Skin - System `**

<div align="center">
<img src="https://user-images.githubusercontent.com/45216746/230196368-85acf80e-9f6b-4001-b53e-f05b218a290f.png" width="80%" >
</div>
<br>

**` TRIИITY Skin - Networking `**

<div align="center">
<img src="https://user-images.githubusercontent.com/45216746/230199782-641a7619-5c9a-43c1-a779-4d6d2d78ffaa.png" width="80%" >
</div>

**` TRIИITY Skin - Applications `**

<div align="center">
<img src="https://user-images.githubusercontent.com/45216746/230196951-0b5bdf08-28e4-4977-83d9-0750cb471687.png" width="80%" >
</div>
<br>

<h2>📆 Todo List</h2>

```diff
+ Create TRIИITY Wiki to handle Alpine Linux system and common hardware (TRIИITY Pocket Mainframe - Work in progress)
+ Try to get a Shell in an elegant way, in Lua & Haserl  (Work in progress - Help Appreciate)

+ Mobile Design (Done - Minor Bugs)
```
<br>


<h2>🤝 Credits</h2>

**Alpine Linux** - https://alpinelinux.org/about/
<br>
**Alpine ACF** - https://wiki.alpinelinux.org/wiki/Alpine_Configuration_Framework_Design
<br>
**Fontawesome** - https://fontawesome.com/ - Free features
<br>
<br>
<hr>

<div align="center">
Enjoy, Love an Hack It 💜 From &nbsp;<img src="https://user-images.githubusercontent.com/45216746/226208297-32a0371b-83db-4a0e-ae33-70e74ca2b2e5.png" width="1.75%" >
</div>