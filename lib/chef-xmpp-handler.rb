require 'rubygems'
require 'chef'
require 'chef/handler'
require 'xmpp4r'
require 'xmpp4r/muc/helper/simplemucclient'

class ChefXmppHandler < Chef::Handler
  def initialize(xmpp_user, xmpp_password, xmpp_room, xmpp_server, xmpp_port = 5222)
    @xmpp_user = xmpp_user
    @xmpp_password = xmpp_password
    @xmpp_room = xmpp_room
    @xmpp_server = xmpp_server
    @xmpp_port = xmpp_port
    @timestamp = Time.now.getutc
  end

  def report
    Chef::Log.error("Chef run failed @ #{@timestamp}, snitchin' to chefs via Jabber")

    begin
      Timeout.timeout(10) do
        client = ::Jabber::Client.new(@xmpp_user)
        client.connect(host = @xmpp_server, port = @xmpp_port)
        client.auth(@xmpp_password)

        conference = ::Jabber::MUC::SimpleMUCClient.new(client)
        conference.join("#{@xmpp_room}/Chef")
        message = "Chef run failed on #{node.name}. Error: #{run_status.formatted_exception}"
        conference.say(message)

        Chef::Log.info("Informed chefs via XMPP '#{message}'")
      end
    rescue Timeout::Error
      Chef::Log.error("Timed out while attempting to message Chefs via XMPP")
    end
  end

end
