require_relative 'crypto_algorithm'

class Ceasar < CryptoAlgorithm
    def self.decode(str, key)
        self.base(str, key)
    end

    def self.encode(str)
        self.base(str)
    end

    private

    def self.base(str, key=nil)
        type = key ? :decode : :encode
        key ||= self.random_key
        result = str.chars.map do |char|
            char_ = char.downcase
            if self.alphabet.include?(char_)
                index = self.get_char_index(char_)
                new_index = type == :encode ? index + key : index - key
                result_char = self.alphabet[new_index % self.alphabet.size]
                char == char_ ? result_char : result_char.upcase
            else
                char
            end
        end

        {
            str: str,
            result: result.join,
            key: key
        }
    end

    def self.random_key
        rand(self.alphabet.size)
    end 
end