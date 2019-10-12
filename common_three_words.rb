files = !ARGV.empty? ? ARGV : ARGF
for file in files
  words = ""
  !ARGV.empty? ? File.open(file).each { |line| words += line } : words = file
  words = words.split(' ')
  words.each do |word|
    formatted_word = word.downcase.gsub(/[^a-z0-9\s]/i, "")
    puts formatted_word + " " 
  end  
end
