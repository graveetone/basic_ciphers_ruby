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
            if alphabet.include?(char_)
                index = get_char_index(char_)
                new_index = type == :encode ? index + key : index - key
                result_char = alphabet[new_index % alphabet.size]
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
        rand(alphabet.size)
    end 
end