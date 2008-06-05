require File.join(File.dirname(__FILE__), 'spec_helper')

describe Letterbox, 'initialisation' do
  
  before :each do
    @rumbster = mock('rumbster', :add_observer => nil)
    Rumbster.stub!(:new).and_return(@rumbster)
    @publishers = Array.new(3) {|i| mock("publisher #{i}") }
    PublisherFactory.stub!(:create_publishers).and_return(@publishers)
  end
  
  it "should initialise an ftp server using specified port" do
    Rumbster.should_receive(:new).with(255).and_return(@rumbster)
    letterbox = Letterbox.new(255)
    letterbox.rumbster.should be(@rumbster)
  end
  
  it 'should initialise an fpt server using default port of 21' do
    Rumbster.should_receive(:new).with(21).and_return(@rumbster)
    letterbox = Letterbox.new
    letterbox.rumbster.should be(@rumbster)
  end
  
  it 'should get publishers from publisher factory' do
    PublisherFactory.should_receive(:create_publishers).and_return(@publishers)
    letterbox = Letterbox.new
  end
  
  it 'should create a publisher decorator for the publishers' do
    publisher_decorater = mock('publisher_decorater')
    Publisher::PublisherAdapter.should_receive(:new).with(*@publishers).and_return(publisher_decorater)
    @rumbster.should_receive(:add_observer).with publisher_decorater
    letterbox = Letterbox.new
  end
  
end

