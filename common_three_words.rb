#!/usr/bin/env ruby

class WordFrequency
  def self.top_word_triplets
    areArgumentsPresent = !ARGV.empty?
    files = areArgumentsPresent ? ARGV : ARGF
    words = ""
    three_word_frequency_hash = Hash.new(0)
    delimiters = [/\s/, "\n", '\n']
 
    files.each do |file| 
      if areArgumentsPresent 
        File.readlines(file).each { |line| words += line }
      else 
        words += file
      end
    end

    formatted_words = words.split(Regexp.union(delimiters))
      .map {|w| format_word(w)}
      .delete_if {|w| w.length == 0}

    formatted_words.each_with_index do |word, index|
      if formatted_words[index+2].nil?
        next 
      end
      three_words = [word, formatted_words[index+1], formatted_words[index+2]]
      three_word_frequency_hash[three_words] += 1
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
