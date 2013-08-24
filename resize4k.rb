#!/usr/bin/env ruby
require_relative './parse_options'

options = {}
ParseOptions options
puts options.inspect

fread = File.open(options[:inputFile], 'rb')
binaryBuffer = fread.read
fread.close

48.times do
  3.times do
    16.times do
      binaryBuffer += "\x0"
    end
  end
  binaryBuffer += "\xff\xff\xff\xff\xff\xff\xff\x07\x80\x69\xff\xff\xff\xff\xff\xff"
end

fwrite = File.open(options[:outputFile], 'w')
fwrite.write binaryBuffer
fwrite.close
