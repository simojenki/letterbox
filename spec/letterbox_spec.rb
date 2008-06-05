require File.join(File.dirname(__FILE__), 'spec_helper')

describe Letterbox, 'initialisation' do
  
  it "should initialise a Rumbster server using specified port" do
    rumbster = stub('rumbster')
    Rumbster.should_receive(:new).with(255).and_return(rumbster)
    letterbox = Letterbox.new(255)
    letterbox.rumbster.should eql? rumbster
  end
end

