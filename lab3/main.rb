files = %w[helpers caesar]

files.each { |file| require_relative file }

test_string = "Fucking encoding!"

ca = Ceasar.encode(test_string)
puts decorated_encoded(ca)

puts

dca = Ceasar.decode(ca[:result], ca[:key])
puts decorated_decoded(dca)
