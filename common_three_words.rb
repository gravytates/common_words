def format_word(word)
  word.downcase.gsub(/[^a-z0-9\s+]?/i, "")
end

areArgumentsPresent = !ARGV.empty?
files = areArgumentsPresent ? ARGV : ARGF
three_word_frequency_hash = Hash.new(0)
for file in files
  words = ""
  areArgumentsPresent ? File.open(file).each { |line| words += line } : words = file
  words = words.split(' ') 
  words.each_with_index do |word, index|
    if words[index+2].nil?
     next 
    end
    first = format_word(word)
    second = format_word(words[index+1])
    third = format_word(words[index+2])
    three_words = [first, second, third]
    three_word_frequency_hash[three_words] += 1
  end  
end

top_hundred_word_triplets = three_word_frequency_hash.sort_by {|k,v| v}.reverse.first(100)

top_hundred_word_triplets.each do |key,value|
  words = key.join(' ')
  puts "#{value} - #{words},"
end