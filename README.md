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

- **HTML Files** are include in `Lua` language, and `Haserl` for `mini_httpd` (small & fast framework mostly design for embedded device)
- **Framework Files** are include in skins folder. Skin files override core template (so be carreful of security permission and code remaining) 
- **Views** are served by `mini_httpd` server (fast and secure way to split `local` network server and `nginx public` reverse proxy) so completly separate all this two configs
- **CSS Files** are store in easy way in `css` folder (includes located in root `trinity.css` file)

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

  - **1 -**  ~~Move **favicon.ico** to **/usr/share/acf/www root folder**~~ : **Unnecessary since we had inclued all folder structure off the native ACF app**
<br>

  - **2 - Add `placeholder` to all input text and a special one for logon : add to ` /usr/share/lua/5.2 or /5.3 or /5.4/html ` line 113:**

```css
-- ADD placholder TO ALL INPUT WITHOUT SUBMIT -- 20230304 -- TRIИITY 
	local str = string.format ( '<input class="%s %s" type="%s" placeholder="'..mymodule.html_escape(v.label)..'"', mymodule.html_escape(v.class), mymodule.html_escape(field_type), mymodule.html_escape(field_type) )
-- ADD placholder ICON TO LOGON -- 20230304 -- TRIИITY
		if v.name == "userid" then
			str = string.format ( '<input class="%s" type="user" placeholder="🔒 '..mymodule.html_escape(v.label)..'" autocomplete="off"', mymodule.html_escape(v.class), mymodule.html_escape(field_type), mymodule.html_escape(field_type) )
		elseif v.name == "password" then
		str = string.format ( '<input class="%s" type="password" placeholder="🔑 '..mymodule.html_escape(v.label)..'" autocomplete="off"', mymodule.html_escape(v.class), mymodule.html_escape(field_type), mymodule.html_escape(field_type) )
		end
  ```
  And remove CSS in ` /usr/share/acf/www/skins/trinity/css/trinity-main/logon.css ` line 74 : Remove comment for display:none
  
  ```css
  /*#logon .left {
    display: none !important;
} REMOVE ME ! ------------------- REMOVE LEFT CONTENT FOR PLACEHOLDER - GO TO readme.md for activate it in /usr/share/lua/5.4/html - Depend of your lua version acf install 20230407*/
  ```
 <br>

  - **3 - Compatibility of Lua 5.3 and 5.4 for Alpine Linux ACF already in TRIИITY Skin and work with 5.2 :**

`lib/session.lua` line 154 :

 ```css
154:	s = load(cached_content)() -- Replace 'loadstring' to 'load' for Lua >= 5.3 compat
 ```
    
`app/alpine-baselayout/syslog-model.lua` line 62 :

 ```css
62:  descr = "1=Quiet, ... , " .. #getloglevels() .. "=Debug", -- Make Lua >=5.3 compat 20230406 - TRIИITY
 ```

<br>
<br>
<h2>📸 Screenshots</h2>

**` TRIИITY Skin - Logon `**

<div align="center">
<img src="https://user-images.githubusercontent.com/45216746/230657645-de5f8911-5016-468c-9a81-c8a98ed31610.png" width="80%" >
</div>
<br>

**` TRIИITY Skin - Networking `**

<div align="center">
<img src="https://user-images.githubusercontent.com/45216746/230676455-6cc29159-2a4d-4b04-9437-edeea3185d31.png" width="80%" >
</div>

**` TRIИITY Skin - Applications `**

<div align="center">
<img src="https://user-images.githubusercontent.com/45216746/230676635-8db71a02-981a-4f85-b8ab-d08396288f46.png" width="80%" >
</div>
<br>

**` TRIИITY Skin - System `**

<div align="center">
<img src="https://user-images.githubusercontent.com/45216746/230675601-f625d118-fdd8-49ce-aa9b-2d1aeb2bbfdb.png" width="80%" >
</div>
<br>

<h2>📆 Todo List</h2>

```diff
+ Create TRIИITY Wiki to handle Alpine Linux system and common hardware (TRIИITY Pocket Mainframe - Work in progress)
+ Get Temp °C and F° selected option from CPU and mainboard
+ Try to get a Shell in an elegant way, in Lua & Haserl (Work in progress - Help Appreciate)
+ Try to include BootStrap in a smart way with Lua & Haserl (Work in progress)
+ Mobile Design (Done - Minor Bugs)

```
**Optionnal if project continue to growth & help is according :**

```diff
+ Get a VERY SECURE way to access from Internets (user - expert - admin modes) duo-linux Openssh 2FA awall fail2ban
+ acf-nginx && acf-apache simpe module to build
+ Virtualize KVM QEMU Libvirt in a web browser
+ Cast VLC on connected screens from file or URL (media center or CCTV)
+ Get really nice NAS interface with all conf avaible and Rclone for cloud apps
```

<br>


<h2>🤝 Credits</h2>

**Alpine Linux** - https://alpinelinux.org/about/
<br>
**Alpine ACF** - https://wiki.alpinelinux.org/wiki/Alpine_Configuration_Framework_Design
<br>
**Fontawesome** - https://fontawesome.com/ - *Free features - Web access needed or import*
<br>
**Natanael Copa** - https://github.com/ncopa
<br>
<br>
<hr>

<div align="center">
Enjoy and Like It 💜
</div>