#!/usr/bin/env ruby
require 'optparse'

def ParseOptions options
  option_parser = OptionParser.new do |opts|
    opts.banner = 'Here is help messages of the command line tool.
    AppName -i inputFile -o outputFile'
  
    opts.on('-i InputFile', '--inputFile InputFile', 'Input filename') do |value|
      options[:inputFile] = value
    end
    
    opts.on('-o OutputFile', '--outputFile OutputFile', 'Output filename') do |value|
      options[:outputFile] = value
    end

    # opts.on('-t InputFormat', '--inputFormat InputFormat', 'Input format') do |value|
      # options[:inputFormat] = value
    # end
     
    # opts.on('-f OutputFormat', '--outputFormat OutputFormat', 'Output format') do |value|
      # options[:OutputFormat] = value
    # end
  end.parse!
end