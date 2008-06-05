require 'rumbster'

class Letterbox
  
  attr_reader :rumbster
  
  def initialize port=21
    @rumbster = Rumbster.new(port)
    publishers = PublisherFactory.create_publishers
    @rumbster.add_observer(Publisher::PublisherAdapter.new(*publishers))
  end
end
