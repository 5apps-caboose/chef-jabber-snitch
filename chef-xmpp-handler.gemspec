$:.push File.expand_path("../lib", __FILE__)
require 'chef-xmpp-handler/version'

Gem::Specification.new do |s|
  s.name        = "chef-xmpp-handler"
  s.version     = ChefXmppHandler::VERSION
  s.authors     = ["5apps"]
  s.email       = ["greg@5apps.com"]
  s.homepage    = "https://github.com/5apps-caboose/chef-xmpp-handler"
  s.summary     = %q{An XMPP MUC exception handler for Chef runs}
  s.description = %q{An XMPP MUC exception handler for Chef runs}
  s.has_rdoc    = false
  s.license     = "MIT"

  s.add_dependency('chef')
  s.add_dependency('xmpp4r')

  s.files         = `git ls-files`.split("\n")
  s.require_paths = ["lib"]
end
