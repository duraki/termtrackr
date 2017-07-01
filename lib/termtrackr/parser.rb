require 'worldize'

module Termtrackr

  class Parser

    attr_accessor :response

    def parse(message)

    end

    def draw(country)
        worldize = Worldize::Countries.new
        img = worldize.draw
        img.write('shots/blank.png')
    end


  end

end

