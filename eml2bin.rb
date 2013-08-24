#!/usr/bin/env ruby
require_relative './parse_options'

options = {}
ParseOptions options
puts options.inspect

fread = File.open(options[:inputFile], 'rb')
emlBuffer = fread.read
fread.close

binaryBuffer = [emlBuffer].pack('H*')

outputBuffer = ''
binaryBuffer.bytes.each_slice(17) do |slice|
  slice.delete_at(16)
  outputBuffer += slice.pack('C*')
end

fwrite = File.open(options[:outputFile], 'w')
fwrite.write outputBuffer
fwrite.close
