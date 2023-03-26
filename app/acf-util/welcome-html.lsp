<% local view, viewlibrary, page_info, session = ... %>
<% htmlviewfunctions = require("htmlviewfunctions") %>

<% local header_level = htmlviewfunctions.displaysectionstart(cfe({label="TRIИITY MAINFRAME CENTER"}), page_info) %>
<div class="welcome-block col-lg-12">
<div class="temp-block col-lg-6">
</div>
<p></p>
</div>

<% --[[
	io.write(htmlviewfunctions.cfe_unpack(view))
	io.write(htmlviewfunctions.cfe_unpack(FORM))
	io.write(htmlviewfunctions.cfe_unpack(ENV))
--]] %>
<% htmlviewfunctions.displaysectionend(header_level) %>
