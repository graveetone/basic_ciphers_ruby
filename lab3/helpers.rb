def decorated_decoded(obj)
    str, decoded, key = destructure_hash(obj, [:str, :result, :key])

    "Successfully decoded sequence: #{str.red} with key: #{key.to_s.yellow}\nDecoded: #{decoded.green}"
end

def decorated_encoded(obj)
    str, encoded, key = destructure_hash(obj, [:str, :result, :key])

    "Sequence: #{str.green}\nEncoded sequence: #{encoded.red}\nSave this key to be able to perform encoding: #{key.to_s.yellow}"
end

def destructure_hash(hash, params)
    (hash.slice(*params).values)
end