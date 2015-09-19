APP_ROOT = File.expand_path("#{File.dirname(__FILE__)}/../../") unless defined?(APP_ROOT)

require 'jettywrapper'
JETTY_ZIP_BASENAME = 'fedora-3.8.1-with-risearch'
Jettywrapper.url = "https://github.com/cul/hydra-jetty/archive/#{JETTY_ZIP_BASENAME}.zip"

require 'util/directory_loader'

namespace :hyconn do
  task load_demo: :environment do
    method = (ENV['reload'].to_s =~ /true/i) ? :reload : :load
    loader = Util::DirectoryLoader.new
    loader.directory = Dir.new(File.join(APP_ROOT, 'fixtures','foxml','cmodels'))
    loader.send method
    loader.directory = Dir.new(File.join(APP_ROOT, 'fixtures','foxml','objects'))
    loader.send method
  end
end