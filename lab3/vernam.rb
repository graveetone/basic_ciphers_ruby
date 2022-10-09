require_relative 'crypto_algorithm'

class Vernam < CryptoAlgorithm
    def self.decode(str, key)
        self.base(str, key)
    end

    def self.encode(str)
        self.base(str)
    end

    private

    def self.base(str, key=nil)
        type = key ? :decode : :encode
        key ||= self.random_key(str.size)
        result = ''
        str.size.times do |i|
            char_ = str[i].downcase
            if alphabet.include?(char_)
                index = get_char_index(char_)
                key_index = key[i]
                new_index = type == :encode ? index + key_index : index - key_index + alphabet.size                      
                result_char = alphabet[new_index % alphabet.size]
                result << str[i] == char_ ? result_char : result_char.upcase
            else
                result << str[i]
            end
        end

        {
            str: str,
            result: result,
            key: key
        }
    end

    def self.random_key(len)
        len.times.map { rand(alphabet.size) }
    end 
end