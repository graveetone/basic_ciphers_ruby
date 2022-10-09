files = %w[helpers ceasar vernam hill xor]

files.each { |file| require_relative file }

test_string = "Fucking encoding!"

ca = Ceasar.encode(test_string)
puts decorated_encoded(ca)

puts

dca = Ceasar.decode(ca[:result], ca[:key])
puts decorated_decoded(dca)

va = Vernam.encode(test_string)
puts decorated_encoded(va)

puts

dva = Vernam.decode(va[:result], va[:key])
puts decorated_decoded(dva)

ha = Hill.encode(test_string)
puts decorated_encoded(ha)

puts

dha = Hill.decode(ha[:result], ha[:key])
puts decorated_decoded(dha)

xora = Xor.encode(test_string)
puts decorated_encoded(xora)

puts

xorda = Xor.decode(xora[:result], xora[:key])
puts decorated_decoded(xorda)
