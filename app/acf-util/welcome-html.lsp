<% local view, viewlibrary, page_info, session = ... %>
<% htmlviewfunctions = require("htmlviewfunctions") %>

<% local header_level = htmlviewfunctions.displaysectionstart(cfe({label="Alpine Configuration Framework"}), page_info) %>
<div class="welcome-block col-lg-12">
<p></p>
</div>

 <div id="terminal"></div>
     <script type="application/javascript">
	const 	t = new Terminal(),
	 	f = new FitAddon.FitAddon();
	t.loadAddon(f);
	t.open(document.getElementById('terminal'));
	t.write('Hello from \x1B[1;3;31mxterm.js\x1B[0m $ ')
</script> 

<% --[[
	io.write(htmlviewfunctions.cfe_unpack(view))
	io.write(htmlviewfunctions.cfe_unpack(FORM))
	io.write(htmlviewfunctions.cfe_unpack(ENV))
--]] %>
<% htmlviewfunctions.displaysectionend(header_level) %>
