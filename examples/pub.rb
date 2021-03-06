#!/usr/bin/env ruby

require 'rubygems'
require 'nats/client'
  
def usage
  puts "Usage: ruby pub.rb <subject> <msg>"; exit
end

subject, msg = ARGV
usage unless subject
msg ||= 'Hello World'

NATS.on_error { |err| puts "Server Error: #{err}"; exit! }

NATS.start do
  NATS.publish(subject, msg) { NATS.stop }
end

puts "Published [#{subject}] : '#{msg}'"
