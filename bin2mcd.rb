#!/usr/bin/env ruby
require_relative './parse_options'

options = {}
ParseOptions options
puts options.inspect

fread = File.open(options[:inputFile], 'rb')
binaryBuffer = fread.read
fread.close

fwrite = File.open(options[:outputFile], 'w')
count=0
binaryBuffer.unpack('C*').map{ |b| "%02x" % b }.each_slice(64) do |slice|
  fwrite.puts "+Sector: #{count}"
  count += 1
  slice.each_slice(16) do |slice2|
	  fwrite.puts slice2.join
  end
end
fwrite.close
