<% local view, viewlibrary, page_info, session = ... %>
<% htmlviewfunctions = require("htmlviewfunctions") %>

<% local header_level = htmlviewfunctions.displaysectionstart(cfe({label="Alpine Configuration Framework"}), page_info) %>
<p>Welcome.</p>


	<iframe id="inlineFrameExample"
    title="Inline Frame Example"
    src="http://192.168.1.200:7681/">
</iframe>

<% --[[
	io.write(htmlviewfunctions.cfe_unpack(view))
	io.write(htmlviewfunctions.cfe_unpack(FORM))
	io.write(htmlviewfunctions.cfe_unpack(ENV))
--]] %>
<% htmlviewfunctions.displaysectionend(header_level) %>
