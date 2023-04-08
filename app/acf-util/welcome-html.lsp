<% local view, viewlibrary, page_info, session = ... %>
<% htmlviewfunctions = require("htmlviewfunctions") %>
<%# local header_level = htmlviewfunctions.displaysectionstart(cfe({label="POCKET MAINFRAME"}), page_info) %>
<% local header_level = htmlviewfunctions.displaysectionstart(cfe({label="ALPINE CONFIGURATION FRAMEWORK"}), page_info) %>
<%
local hostname = ""
if session.userinfo and session.userinfo.userid and viewlibrary and viewlibrary.dispatch_component then
	local result = viewlibrary.dispatch_component("alpine-baselayout/hostname/read", nil, true)
	if result and result.value then
		hostname = result.value
	end
end
%>

<div class="welcome-block col-lg-12">
<!--- ADD ROOT SPEC ICON & COLOR */ -->
<% if session.userinfo.userid == "root" then %>
	<h4 class="welcome-title-user welcome-title-root">Welcome <span class="welcome-root"><%= html.html_escape(session.userinfo.userid) %></span></h4>
<% else %>
	<h4 class="welcome-title-user">Welcome <span class="welcome-user"><%= html.html_escape(session.userinfo.userid) %></span></h4>
<% end %>
		<div class="desc-block">
			<p class=welcome-desc>
				To native Alpine Linux Admin Panel on <span id="hostname" class="welcome-hostname"><%= html.html_escape(hostname) %></span> host.
				<br>
				Monitoring and configure all acf installed packages after get them, eg : 'apk add acf-ssh'
				<br>
				As usual, Alpine ACF comes with only necessary pkg to run admin panel.
				<br>
				Make your own config.
				<br>
			</p>
		<hr>
		</div>
		<div class="link-block">
			<p class="welcome-pkg-list">
				Get acf packages list <a href="https://gitlab.alpinelinux.org/acf" target="_blank">HERE</a><br>
			</p>
			<p class="welcome-about">
				Get <a href="https://wiki.alpinelinux.org/wiki/Alpine_Configuration_Framework_Design" target="_blank">HELP</a><br>
			</p>
		</div>
</div>

<% --[[
	io.write(htmlviewfunctions.cfe_unpack(view))
	io.write(htmlviewfunctions.cfe_unpack(FORM))
	io.write(htmlviewfunctions.cfe_unpack(ENV))
--]] %>
<% htmlviewfunctions.displaysectionend(header_level) %>
