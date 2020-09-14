m = Map('smtp_settings', translate('Настройки SMTP сервера для Email уведомлений'), translate('На данной странице настраивается какой SMTP сервер использовать для отправки устройством Email уведомлений.'))
d = m:section(TypedSection, 'info', '')

value_smtp_server_ip_or_url = d:option(Value, 'smtp_server_ip_or_url', translate('Адрес SMTP сервера'))
value_smtp_server_ip_or_url.datatype = 'host'
value_smtp_server_ip_or_url.optional = false
value_smtp_server_ip_or_url.rmempty = false

value_smtp_server_encryption_enabled = d:option(Flag, 'smtp_server_encryption_enabled', translate('Использовать шифрование'))
value_smtp_server_encryption_enabled.enabled = '1'
value_smtp_server_encryption_enabled.disabled = '0'
value_smtp_server_encryption_enabled.optional = false
value_smtp_server_encryption_enabled.rmempty = false
value_smtp_server_encryption_enabled.template = 'cbi/flag_encryption_enabled'

value_smtp_server_port = d:option(Value, 'smtp_server_port', translate('Порт SMTP сервер'))
value_smtp_server_port.datatype = 'port'
value_smtp_server_port.optional = false
value_smtp_server_port.rmempty = false

value_smtp_server_authentication_enabled = d:option(Flag, 'smtp_server_authentication_enabled', translate('Аутентификация'))
value_smtp_server_authentication_enabled.default = value_smtp_server_authentication_enabled.disabled
value_smtp_server_authentication_enabled.enabled = '1'
value_smtp_server_authentication_enabled.disabled = '0'
value_smtp_server_authentication_enabled.optional = false
value_smtp_server_authentication_enabled.rmempty = false

value_smtp_server_login = d:option(Value, 'smtp_server_login', translate('Логин'))
value_smtp_server_login:depends('smtp_server_authentication_enabled', '1')
value_smtp_server_login.datatype = 'string'
value_smtp_server_login.optional = false
value_smtp_server_login.rmempty = true

value_smtp_server_password = d:option(Value, 'smtp_server_password', translate('Пароль'))
value_smtp_server_password:depends('smtp_server_authentication_enabled', '1')
value_smtp_server_password.datatype = 'string'
value_smtp_server_password.password = true
value_smtp_server_password.optional = false
value_smtp_server_password.rmempty = true

value_smtp_server_mail_from = d:option(Value, 'smtp_server_mail_from', translate('От кого'))
value_smtp_server_mail_from.default = ''
value_smtp_server_mail_from.optional = false
value_smtp_server_mail_from.rmempty = false

function value_smtp_server_mail_from:validate(value)
	if (value ~= nil) and (string.len(value) > 0) then
		return value:match("[A-Za-z0-9%.%%%+%-]+@[A-Za-z0-9%.%%%+%-]+%.%w%w%w?%w?")
	end
	return nil
end

value_smtp_server_mail_signature = d:option(TextValue, 'smtp_server_mail_signature', translate('Подпись в письме'))
value_smtp_server_mail_signature.default = ''
value_smtp_server_mail_signature.optional = false
value_smtp_server_mail_signature.rmempty = true

button_test = d:option(Button,'button_test',translate('Тест'))
button_test.inputstyle = 'apply'
button_test.rmempty = true

return m
