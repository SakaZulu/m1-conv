#!/usr/bin/env ruby
require_relative './parse_options'

options = {}
ParseOptions options
puts options.inspect

fread = File.open(options[:inputFile], 'rb')
binaryBuffer = fread.read
fread.close

fwrite = File.open(options[:outputFile], 'w')
binaryBuffer.unpack('C*').map{ |b| "%02x" % b }.each_slice(16) do |slice|
  fwrite.puts slice.join
  #puts slice.join
end
fwrite.close
