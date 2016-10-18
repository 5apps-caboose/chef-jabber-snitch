# Install

```
gem install chef-xmpp-handler
```

# Usage

## Configure Chef to Use The Handler

Append the following to your Chef client configs, usually at `/etc/chef/client.rb`

```
[...]

# Notify admins via IRC when a Chef run fails
require 'chef-xmpp-handler'

xmpp_user = "alice@gmail.com"
xmpp_password = "password"
xmpp_room = "bob@example.com"
xmpp_server = "muc.example.com"
xmpp_port = 5222

xmpp_handler = ChefXmppHandler.new(xmpp_user, xmpp_password, xmpp_room, xmpp_server, xmpp_port)
exception_handlers << xmpp_handler
```

* License

  Chef-Jabber-Snitch is released under the [MIT license](MIT-LICENSE.txt).
