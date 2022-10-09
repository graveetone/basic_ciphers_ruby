def decorated_decoded(obj)
    str, decoded, key = destructure_hash(obj, [:str, :result, :key])

    "Successfully decoded sequence:\n#{str.red}\nwith key:\n#{key.to_s.yellow}\nDecoded:\n#{decoded.green}"
end

def decorated_encoded(obj)
    str, encoded, key = destructure_hash(obj, [:str, :result, :key])

    "Sequence:\n#{str.green}\nEncoded sequence:\n#{encoded.red}\nSave this key to be able to perform encoding:\n#{key.yellow}"
end

def destructure_hash(hash, params)
    (hash.slice(*params).values)
end

def alphabet
    [*alphabet_lower, *alphabet_upper, *special]
end

def alphabet_lower
    %w[a b c d e f g h i j k l m n o p q r s t u v w x y z]
end

def special
    [' ', '!']
end

def alphabet_upper
    alphabet_lower.map { |l| l.upcase }
end

def get_char_index(char)
    alphabet.index(char)
end

def readable_key2(key)
    key.is_a?(Array) ? key.map { |k| alphabet[k] }.join : key
end

def readable_key(key)
    key.map { |k| alphabet[k] }.join
end
