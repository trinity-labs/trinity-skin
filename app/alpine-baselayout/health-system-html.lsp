<% local view, viewlibrary, page_info, session = ... %>
<% htmlviewfunctions = require("htmlviewfunctions") %>
<% html = require("acf.html") %>

<%
local header_level = htmlviewfunctions.displaysectionstart(view, page_info)
local header_level2 = htmlviewfunctions.incrementheader(header_level)
%>

<% htmlviewfunctions.displaysectionstart(cfe({label="Versions and names"}), page_info, header_level2) %>
<pre><%= html.html_escape(view.value.version.value) %></pre>
<pre><code><%= html.html_escape(view.value.uname.value) %></code></pre>
<% htmlviewfunctions.displaysectionend(header_level2) %>

<% htmlviewfunctions.displaysectionstart(cfe({label="Uptime"}), page_info, header_level2) %>
<pre><%= html.html_escape(view.value.uptime.value) %></pre>
<% htmlviewfunctions.displaysectionend(header_level2) %>

<% htmlviewfunctions.displaysectionstart(cfe({label="Time/TimeZone"}), page_info, header_level2) %>
<pre><%= html.html_escape(view.value.date.value) %></pre>
<pre><%= html.html_escape(view.value.timezone.value) %></pre>
<% htmlviewfunctions.displaysectionend(header_level2) %>

<% htmlviewfunctions.displaysectionstart(cfe({label="Memory"}), page_info, header_level2) %>
<pre><%= html.html_escape(view.value.memory.value) %></pre>

<%
local function print_percent(val)
	if (tonumber(val) > 10) then
		io.write(html.html_escape(val) .. "%")
	end
end
%>

<table style="margin:0px;padding:0px;border:0px">
	<tr>
		<td>0%</td>
		<td width="<%= html.html_escape(view.value.memory.used) %>%"
		    style="background:red;border:2px solid black;border-right:none;">
			<center><b><% print_percent(view.value.memory.used) %></b></center>
		</td>
		<td width="<%= html.html_escape(view.value.memory.buffers) %>%"
		    style="background:yellow;border:2px solid black;">
			<center><b><% print_percent(view.value.memory.buffers) %></b></center>
		</td>
		<td width="<%= tonumber(view.value.memory.free) %>%"
		    style="background:#0c0;border:2px solid black;border-left:none;">
			<center><b><% print_percent(view.value.memory.free) %></b></center>
		</td>
		<td>100%</td>
	</tr>
</table>

<table style="margin:0px;padding:0px;border:0px;margin-top:5px;">
	<tr>
		<td width="100px"><b>Legend:</b></td>
		<td style="background:red;;border:2px solid black;" width="20px"></td>
		<td width="70px"><b>=Used</b></td>
		<td style="background:yellow;;border:2px solid black;" width="20px"></td>
		<td width="70px"><b>=buffers / Cached</b></td>
		<td style="background:#0c0;border:2px solid black;" width="20px"></td>
		<td><b>=Free</b></td>
	</tr>
</table>

<% htmlviewfunctions.displaysectionend(header_level2) %>

<% htmlviewfunctions.displaysectionend(header_level) %>
