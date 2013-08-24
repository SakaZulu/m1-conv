#!/usr/bin/env ruby
require_relative './parse_options'

options = {}
ParseOptions options
puts options.inspect

fread = File.open(options[:inputFile], 'rb')
binaryBuffer = fread.read
fread.close

binaryBuffer = binaryBuffer[0..1023]

fwrite = File.open(options[:outputFile], 'w')
fwrite.write binaryBuffer
fwrite.close
