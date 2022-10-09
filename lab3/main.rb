require 'optparse'
require 'clipboard'

files = %w[helpers ceasar vernam hill xor]

files.each { |file| require_relative file }

options = {}
OptionParser.new do |opt|
  opt.on('--operation OPR', String) { |o| options[:operation] = o.to_sym if o}
  opt.on('--algorithm ALG', String) { |o| options[:algorithm] = o.to_sym if o }
  opt.on('--phrase PHRASE', String)    { |o| options[:phrase] = o }
  opt.on('--key KEY', String)       { |o| options[:key] = o }
end.parse!

phrase    = options[:phrase]    || "This is test string"
operation = options[:operation]      || :encode
key       = options[:key]
algorithm = options[:algorithm] || :ceasar

if !key && operation == :decode
    raise "Specify key to decode your phrase!"
else
    available_algorithms = {
        ceasar: Ceasar,
        vernam: Vernam,
        hill:   Hill,
        xor:    Xor
    }

    params = [phrase]
    params << key if key && operation != :encode

    result = available_algorithms[algorithm].send(operation, *params)
    if operation == :encode
        puts decorated_encoded(result)
        Clipboard.copy(result[:key])
        puts "Key was copied to clipboard!".blue    
    else
        puts decorated_decoded(result)    
    end
end
