require_relative 'crypto_algorithm'

class Xor < CryptoAlgorithm
    def self.decode(str, key)
        self.base(str, key)
    end

    def self.encode(str)
        self.base(str)
    end

    private

    def self.base(str, key=nil)
        key ||= self.random_key(str.size)
        result = ''
        str.size.times do |i|
            index = str[i].ord
            key_index = key[i].ord

            new_index = index ^ key_index
            result_char = new_index.chr(Encoding::UTF_8)
            result << result_char
        end

        {
            str: str,
            result: result,
            key: key
        }
    end

    def self.random_key(len)
        ascii_len = 55296
        key = ''
        i = 0
        while true
            char_number = rand(ascii_len)
            begin
                key << char_number.chr(Encoding::UTF_8)
            rescue
                next
            end
            i += 1
            break if i == len
        end

        key
    end
end