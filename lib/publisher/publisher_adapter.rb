require 'tmail'

module Publisher
  class PublisherAdapter
    
    attr_reader :publishers
    
    def initialize *publishers
      @publishers = publishers
    end
    
    def update message
      mail = TMail::Mail.parse(message)
      @publishers.each { |p| p.publish(mail) }
    end
  end
end
