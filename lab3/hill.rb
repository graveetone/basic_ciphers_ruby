require_relative 'crypto_algorithm'
require 'matrix'

class Hill < CryptoAlgorithm
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

        if type == :encode
            result = (key * self.str_to_vector(str)).to_a.flatten.map { |r| r % alphabet.size }
            key    = readable_key(key.to_a.flatten)
        else
            key_matrix     = self.to_matrix(key, str.size)
            det_mod        = key_matrix.det % alphabet.size
            adj            = self.matrix_mod(key_matrix.adjugate, alphabet.size)
            res            = self.find_x(det_mod) * adj
            reverse_matrix = self.matrix_mod(res, alphabet.size)

            result         = reverse_matrix * self.str_to_vector(str)
            result         =  self.matrix_mod(result, alphabet.size).to_a.flatten
        end

        {
            str: str,
            result: readable_key(result),
            key: key
        }
    end

    def self.random_key(len)
        while true 
            key = Matrix.build(len) { rand(alphabet.size) }
            break if self.decodable?(key)
        end
        
        key
    end

    def self.decodable?(k)
        self.find_x(k.det % alphabet.size) != alphabet.size
    end
    
    def self.str_to_vector(str)
        indexes = str.chars.map { |char| get_char_index(char)}

        Matrix.column_vector(indexes)
    end
    
    def self.invert(matrix)
        det = matrix.det
        matrix.inv.map { |e| (e * det).to_i % alphabet.size }
    end

    def self.to_matrix(key, len)
        key_divided = key.scan(/.{#{len}}/)
        key_transformed = key_divided.map { |r| r.split('').map { |char| get_char_index(char) } }
        Matrix[*key_transformed]
    end

    def self.matrix_mod(matrix, mod)
        matrix.map { |e| e % mod }
    end
    
    def self.find_x(det_mod)
        alphabet.size.times do |i|  
            return i if (det_mod * i) % alphabet.size == 1
        end
    end
end
