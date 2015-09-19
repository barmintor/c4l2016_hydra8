module Util
  class DirectoryLoader
    attr_reader :rubydora, :directory
    def initialize(dir = nil)
      self.directory = dir if dir
    end
    def connection
      # no need to go through AF for this except laziness re: finding the YAML
      @connection ||= (ActiveFedora::Base.fedora_connection[0] ||= ActiveFedora::RubydoraConnection.new(ActiveFedora.config.credentials)).connection
    end
    def directory=(dir)
      @directory = (dir.is_a? Dir) ? dir : Dir.new(dir)
    end
    def load
      each_file do |pid, io|
        load_content(pid, io)
      end
    end
    def reload
      each_file do |pid, io|
        purge(pid)
        load_content(pid, io)
      end
    end
    def each_file
      directory.each do |fname|
        if fname =~ /\.xml$/
          path = File.join(directory,fname)
          File.open(path, 'rb') do |io|
            yield File.basename(path, ".xml").sub('_',':'), io
          end
        end
      end
    end
    def load_content(pid,content,error=true)
      content = StringIO.new(content) if content.is_a? String
      begin
        connection.ingest(:file=>content, :pid=>pid)
      rescue Exception => e
        puts "possible problem with ingest of #{pid}: #{e.message}"
        raise e if error
      end
    end
    def purge(pid,error=false)
      begin
        connection.purge_object :pid=>pid
      rescue Exception => e
        puts "possible problem with purge of #{pid}: #{e.message}"
        raise e if error
      end
    end
  end
end