require 'byebug'
require 'colorize'

class CryptoAlgorithm
    def self.encode(str)
        raise "#{__method__} not implemented!"
    end

    def self.decode(str, key)
        raise "#{__method__} not implemented!"
    end
end