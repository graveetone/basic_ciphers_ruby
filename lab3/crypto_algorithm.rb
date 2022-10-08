require 'byebug'
require 'colorize'

class CryptoAlgorithm
    def self.encode(str)
        raise "#{__method__} not implemented!"
    end

    def self.decode(str, key)
        raise "#{__method__} not implemented!"
    end

    protected

    def self.alphabet
        %w[a b c d e f g h i j k l m n o p q r s t u v w x y z]
    end

    def self.get_char_index(char)
        self.alphabet.index(char)
    end
end