#!/usr/bin/env ruby
require 'set'
require_relative './parse_options'

options = {}
savedKeys = Set.new
ParseOptions options
puts options.inspect

fread = File.open(options[:inputFile], 'rb')
binaryBuffer = fread.read
fread.close

fwrite = File.open(options[:outputFile], 'w')
count=0
binaryBuffer.unpack('C*').map{ |b| "%02x" % b }.each_slice(64) do |slice|
  slice.each_slice(16) do |slice2|
  	  count += 1
	  if count % 4 == 0 then
		keyA = slice2[0..5].join
		keyB = slice2[10..15].join
		if not savedKeys.include? keyA then
			fwrite.puts keyA
			savedKeys.add(keyA)
		end
		if not savedKeys.include? keyB then
			fwrite.puts keyB
			savedKeys.add(keyB)
		end
	  end
  end
end
fwrite.close
