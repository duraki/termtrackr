require "termtrackr/version"
require "termtrackr/client"
require "termtrackr/parser"
require "termtrackr/models/message"

require "eventmachine"
require "json"

module Termtrackr

  class Kernel 
    
    def initialize
      parser = Termtrackr::Parser.new

      EM.run {
        
        @socket = Termtrackr::Client.new.client

        @socket.on :open do |event|
          # Send ping
          p [:open]
          @socket.send('duraki/termtrackr')
        end

        @socket.on :message do |event|
          # Get message
          @set = Termtrackr::Model::Message.new
          info_data = JSON.parse(event.data)
          @set.flag = info_data["s"]
          @set.lat = info_data["la"]
          @set.lon = info_data["lo"]
          @set.country = info_data["c"]
          @set.family = info_data["b"]
          @set.color = info_data["co"]

          parser.parse(@set)
          parser.draw(@set.country)

          p [:message, event.data]
        end

        @socket.on :close do |event|
          p [:close, event.code, event.reason]
          @socket = nil
        end

      }
    end

  end

end
