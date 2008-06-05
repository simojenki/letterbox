require 'rubygems'

$:.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

Dir.glob(File.join(File.dirname(__FILE__), '..', 'lib', '**', '*.rb')).each do |rb|
  puts "requiring #{rb}"
  require rb
end


