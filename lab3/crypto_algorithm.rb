require 'byebug'
require 'colorize'
require_relative 'helpers'

class CryptoAlgorithm
    def self.encode(str)
        raise "#{__method__} not implemented!"
    end

    def self.decode(str, key)
        raise "#{__method__} not implemented!"
    end

    def self.type?(key)
        key ? :decode : :encode
    end
end
