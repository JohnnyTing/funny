require 'funny/version'

module Funny
  class Error < StandardError; end

  class Hola
    def self.hi
      puts 'Hello world!'
    end
  end
end
