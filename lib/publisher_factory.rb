require 'rbconfig'

module Letterbox
  class PublisherFactory
    
    attr_reader :publishers
    
    def initialize
      @publishers = []
      os = Config::CONFIG['target_os'].downcase
      @publishers << Notifier::GrowlNotifier.new if os =~ /(.*)darwin(.*)/
      @publishers << Notifier::SnarlNotifier.new if os =~ /(.*)windows(.*)/
      @publishers << Notifier::SnarlNotifier.new if os =~ /(.*)cygwin(.*)/
      @publishers << Notifier::MumblesNotifier.new if os =~ /(.*)linux(.*)/
    end
  end
end
