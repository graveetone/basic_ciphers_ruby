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
        type = self.type?(key)
        key ||= self.random_key(str.size)
        result = ''
        key.chars.each { |char| char.to_s } if type == :decode

        str.size.times do |i|
            char = str[i]
            if alphabet.include?(char)
                index = get_char_index(char)
                key_index = type == :encode ? key[i] : get_char_index(key[i])

                new_index = type == :encode ? index + key_index : index - key_index + alphabet.size                      
                result_char = alphabet[new_index % alphabet.size]
                result << result_char
            else
                result << str[i]
            end
        end

        {
            str: str,
            result: result,
            key: type == :encode ? readable_key(key) : key
        }
    end

    def self.random_key(len)
        len.times.map { rand(alphabet.size) }
    end 
end