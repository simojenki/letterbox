require 'rbconfig'

class PublisherFactory
    
  def self.create_publishers
    publishers = []
    os = Config::CONFIG['target_os'].downcase
    publishers << Publisher::Growl.new if os =~ /(.*)darwin(.*)/
    publishers << Publisher::Snarl.new if os =~ /(.*)mswin(.*)/
    publishers << Publisher::Snarl.new if os =~ /(.*)cygwin(.*)/ 
    publishers << Publisher::Mumbles.new if os =~ /(.*)linux(.*)/
    publishers
  end
end
