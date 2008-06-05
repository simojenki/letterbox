require 'rubygems'

$:.unshift(File.dirname(__FILE__))
$:.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

Dir.glob(File.join(File.dirname(__FILE__), '..', 'lib', '**', '*.rb')).each do |rb|
  require rb
end


