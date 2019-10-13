#!/usr/bin/env ruby

class WordFrequency
  def self.top_word_triplets
    areArgumentsPresent = !ARGV.empty?
    files = areArgumentsPresent ? ARGV : ARGF
    three_word_frequency_hash = Hash.new(0)

    for file in files
      words = ""
      areArgumentsPresent ? File.open(file).each { |line| words += line } : words = file
      delimiters = [/\s/, "\n", '\n']
      words = words.split(Regexp.union(delimiters))
        .map {|w| format_word(w)}
        .delete_if {|w| w.length == 0}
      words.each_with_index do |word, index|
        if words[index+2].nil?
        next 
        end
        three_words = [word, words[index+1], words[index+2]]
        three_word_frequency_hash[three_words] += 1
      end
    end

    top_hundred_word_triplets = three_word_frequency_hash.sort_by {|k,v| v}.reverse.first(100)

    top_hundred_word_triplets.each do |key,value|
      words = key.join(' ')
      puts "#{value} - #{words},"
    end
  end

  private
    def self.format_word(word)
      word.downcase.gsub(/[^a-z0-9\s]?/i, "")
    end
end

WordFrequency.top_word_triplets
