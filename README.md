<p align="right">
<img src="https://user-images.githubusercontent.com/45216746/226208297-32a0371b-83db-4a0e-ae33-70e74ca2b2e5.png" width="1.75%" >
</p>
<br>
<p align="center">
 <img src="https://user-images.githubusercontent.com/45216746/221048916-d990ce07-dc89-4f1c-9e76-aeea75a173a0.png">
<p>
<br>
<hr/>

  ![](https://img.shields.io/github/stars/trinity-labs/trinity-skin.svg)
  [![Views](https://img.shields.io/endpoint?url=https%3A%2F%2Fhits.dwyl.com%2Ftrinity-labs%2Ftrinity-skin.json%3Fcolor%3Dpurple)](https://github.com/trinity-labs/trinity-skin)
  ![contributions welcome](https://img.shields.io/badge/contributions-welcome-ff69b4.svg?style=flat)
  ![](https://img.shields.io/github/issues/trinity-labs/trinity-skin.svg)
<!--- ![](https://img.shields.io/github/tag/trinity-labs/trinity-skin.svg) 
![](https://img.shields.io/github/v/release/trinity-labs/trinity-skin.svg) --->
 
<br>

It's a modern skin for Linux `Alpine Configuration Framework` commonly called [ACF](https://wiki.alpinelinux.org/wiki/Alpine_Configuration_Framework_Design)

A French Project where **`И`** of `TRIИITY` means : **Nginx prefered solution as default front server for our personal mainframe**

[Alpine](https://alpinelinux.org/about/) Linux became popular since `Docker` image size and efficiency are essestial.  
Minimalist & Secure Linux Distro, `Alpine` is perfect for low powered and/or low performances systems. 

**The perfect solution for reduce waste of system ressources and downsizing energy consumption.  
Even in a large scale architecture**  

Alpine is quite secure :

> *"Alpine Linux was designed with security in mind. All userland binaries are compiled as Position Independent Executables (PIE) with stack smashing protection. These proactive security features prevent exploitation of entire classes of zero-day and other vulnerabilities."  
<sub>[Alpine Linux - Website](https://alpinelinux.org/about/)</sub>*

<br>

```diff
! !!! WARNING !!! - Project in constant dev and with lots of things to verify, custom and modify ! 
```

```diff
@@ Please, report us any bugs and feel free to collaborate - Thanks a lot ! @@ 
 ```
 
 ```diff
+ Commited, Maintained and Constantly Update 
```
<br>

<h4 align="center">TRIИITY Skin - Alpine ACF</h4>

<h2>Setup</h2>

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

<h2>Install</h2>

`Alpine Configuration Framework` - [ACF](https://wiki.alpinelinux.org/wiki/Alpine_Configuration_Framework_Design) had it's own MVC app design from CGI Scripts

- **HTML Files** are include in `Lua` language (small & fast framework mostly design for embedded device)
- **Framework Files** are include in skin folder (so be carreful of security permission and code remaining) skin files override core template 
- **Views** are served by `mini_httpd` server (fast and secure way to split `local` network server and `nginx public` reverse proxy) so completly separate all this two configs
- **CSS Files** are store in easy way to `css` folder

All files and folders are store on local system in ` /usr/share/acf/www/skins/trinity `

<ins>**Get ACF First**</ins> :
  
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
wwwdir=/usr/share/acf/www/
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
  
  <ins>**Get TRIИITY skin**</ins> :
  
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
  
 <h2>Tips</h2>
 
 Move `favicon.ico` to `/usr/share/acf/www` root folder
<br>

<h2>Screenshots</h2>

**` TRIИITY Skin - Logon `**

<p align="center">
<img src="https://user-images.githubusercontent.com/45216746/226210970-0af281af-40c9-4256-9333-e33d193d509f.png" width="80%" >
</p>
<br>

**` TRIИITY Skin - System `**

<p align="center">
<img src="https://user-images.githubusercontent.com/45216746/226996976-62ddc907-dce3-4456-8db7-7774af9c6d48.png" width="80%" >
</p>
<br>

**` TRIИITY Skin - Networking `**

<p align="center">
<img src="https://user-images.githubusercontent.com/45216746/226997194-33bc7001-0c44-44b6-b368-cde89b6c7fd4.png" width="80%" >
</p>

**` TRIИITY Skin - Applications `**

<p align="center">
<img src="https://user-images.githubusercontent.com/45216746/226997512-bdce4cba-7172-4f1a-97b0-054f9899e521.png" width="80%" >
</p>
<br>

<h2>Todo List</h2>

```diff
+ Create TRIИITY Wiki to handle Alpine Linux system and common hardware (TRIИITY Personal Mainframe - Work in progress)
+ Try to get a Shell in an elegant way with Lua (Work in progress - Help Appreciate)
+ Mobile Design (Done - Minor Bugs)
```
<br>


<h2>Credits</h2>

Alpine Linux - https://alpinelinux.org/about/
<br>
Alpine ACF &nbsp; - https://wiki.alpinelinux.org/wiki/Alpine_Configuration_Framework_Design
<br>

<p align="center">
Enjoy, Love an Hack It 💜 - Regards from &nbsp;<img src="https://user-images.githubusercontent.com/45216746/226208297-32a0371b-83db-4a0e-ae33-70e74ca2b2e5.png" width="1.75%" >
</p>