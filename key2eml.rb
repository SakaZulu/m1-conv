#!/usr/bin/env ruby
require_relative './parse_options'

options = {}
ParseOptions options
puts options.inspect

fread = File.open(options[:inputFile], 'rb')
binaryBuffer = fread.read
fread.close

outputBuffer = ''
keyArray = []
index = 0
binaryBuffer.bytes.each_slice(6) do |slice|
  if index < 16
    keyArray[index] = slice.map{ |b| "%02x" % b }.join
  else
    bIndex = index-16
    keyArray[bIndex] += 'ff078069'
    keyArray[bIndex] += slice.map{ |b| "%02x" % b }.join
    3.times do
      16.times do
        outputBuffer += '00'
      end
      outputBuffer += "\r\n"
    end
    outputBuffer += keyArray[bIndex] += "\r\n"
  end
  index+=1
end

fwrite = File.open(options[:outputFile], 'w')
fwrite.write outputBuffer
fwrite.close
