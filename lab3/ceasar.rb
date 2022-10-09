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
        type = self.type?(key)
        key ||= self.random_key
        key = key.to_i
        result = str.chars.map do |char|
            if alphabet.include?(char)
                index = get_char_index(char)
                new_index = type == :encode ? index + key : index - key
                result_char = alphabet[new_index % alphabet.size]
            else
                char
            end
        end

        {
            str: str,
            result: result.join,
            key: key.to_s
        }
    end

    def self.random_key
        rand(alphabet.size)
    end 
end