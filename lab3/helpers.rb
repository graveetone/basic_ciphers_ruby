def decorated_decoded(obj)
    str, decoded, key = destructure_hash(obj, [:str, :result, :key])
    key = readble_key(key)

    "Successfully decoded sequence: #{str.red} with key: #{key.to_s.yellow}\nDecoded: #{decoded.green}"
end

def decorated_encoded(obj)
    str, encoded, key = destructure_hash(obj, [:str, :result, :key])
    key = readble_key(key)

    "Sequence: #{str.green}\nEncoded sequence: #{encoded.red}\nSave this key to be able to perform encoding: #{key.to_s.yellow}"
end

def destructure_hash(hash, params)
    (hash.slice(*params).values)
end

def alphabet
    %w[a b c d e f g h i j k l m n o p q r s t u v w x y z]
end

def get_char_index(char)
    alphabet.index(char)
end

def readble_key(key)
    key.is_a?(Array) ? key.map { |k| alphabet[k] }.join : key
end