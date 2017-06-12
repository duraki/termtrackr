require 'termtrackr/common'
require 'faye/websocket'

module Termtrackr

  class Client

    attr_accessor :client

    def initialize 
      @client = Faye::WebSocket::Client.new(Termtrackr::MT_API)
    end

  end

end
