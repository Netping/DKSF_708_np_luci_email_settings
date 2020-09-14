module("luci.controller.myapp.new_tab", package.seeall)

function index()
	entry({"admin", "tab_from_cbi"}, cbi("myapp-mymodule/cbi_tab"), "Настройки SMTP (Model)", 70).dependent=false
end
