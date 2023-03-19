<br>
<p align="center">
 <img src="https://user-images.githubusercontent.com/45216746/221048916-d990ce07-dc89-4f1c-9e76-aeea75a173a0.png">
<p>
<hr/>
<br>

  ![](https://img.shields.io/github/stars/trinity-labs/trinity-skin.svg)
  ![](https://img.shields.io/github/forks/trinity-labs/trinity-skin.svg)
  [![Views](https://img.shields.io/endpoint?url=https%3A%2F%2Fhits.dwyl.com%2Ftrinity-labs%2Ftrinity-skin.json%3Fcolor%3Dpurple)](https://img.shields.io/endpoint?url=https%3A%2F%2Fhits.dwyl.com%2Ftrinity-labs%2Ftrinity-skin.json%3Fcolor%3Dpurple)
  ![](https://img.shields.io/github/issues/trinity-labs/trinity-skin.svg)
<!--- ![](https://img.shields.io/github/tag/trinity-labs/trinity-skin.svg) 
![](https://img.shields.io/github/v/release/trinity-labs/trinity-skin.svg) --->

<br>
It's a modern skin for Linux `Alpine Configuration Framework` commonly called [ACF](https://wiki.alpinelinux.org/wiki/Alpine_Configuration_Framework_Design)

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
  

<h2>Screenshots</h2>

**` TRIИITY Skin - Logon `**

<p align="center">
<img src="https://user-images.githubusercontent.com/45216746/226126111-6cdfce1e-ec6c-4a02-b0c5-228c5cce108b.png" width="80%" >
</p>

**` TRIИITY Skin - System `**

<p align="center">
<img src="https://user-images.githubusercontent.com/45216746/226128994-bec1f16d-dc41-4bd0-b7f7-09cfcb029955.png" width="80%" >
</p>

**` TRIИITY Skin - Applications `**

<p align="center">
<img src="https://user-images.githubusercontent.com/45216746/226138946-704dfa2e-1eea-4115-ba67-67a01fc3b56b.png" width="80%" >
</p>

**` TRIИITY Skin - Networking `**



<p align="center">
<img src="https://user-images.githubusercontent.com/45216746/226140190-a911cf6f-a957-40ed-b84f-bf957e5315c8.png" width="80%" >
</p>


<h2>Todo List</h2>

```diff
+ Deal with ShellInABox CGI Scripts
+ Mobile Design
```