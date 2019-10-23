#!/usr/bin/env ruby
require 'pry'

class WordFrequency
  # method to return 100 most common word triplets.
  def self.top_word_triplets(*files)

    # identify if arguments are present from command line or via test/other invocation.
    @hasArguments = !ARGV.empty? || files.length > 0
    @files
    # set files variable to an array of files or to a given standard input.
    if @hasArguments
      files.length > 0 ? @files = files : @files = ARGV
    elsif ARGF.filename != "-" or (not STDIN.tty? and not STDIN.closed?)
      @files = ARGF
    else 
      return puts "No file found."
    end
    @words = String.new
    @three_word_frequency_hash = Hash.new(0)
    # common unix and dos delimiters.
    @delimiters = [/\s/, " ", "\n", '\n', "\r\n", '\r\n']
 
    # create a string of words from the files.
    @files.each do |file| 
      if @hasArguments && file
        File.readlines(file).each { |line| 
          if line 
            @words += line.to_s 
          end
        }
      else 
        @words += file.to_s
      end
    end

    # split and format words based on requirements, respecting new lines and stripping punctuation.
    # create three word triplets and add to the three_word_frequency_hash, counting frequencies.
    @current_three_words = Array.new
    @words.split(Regexp.union(@delimiters)).each do |word|
      formatted_word = format_word(word)
      if formatted_word.length == 0
        next
      end
      @current_three_words.push formatted_word
      if @current_three_words.length > 3
        @current_three_words.shift
      elsif @current_three_words.length < 3
        next
      end
      # map to new array in order to prevent keys from being referenced to mutating array.
      @three_words = @current_three_words.map{|w| w}
      @three_word_frequency_hash[@three_words] += 1
    end

    @top_hundred_word_triplets = @three_word_frequency_hash.sort_by {|k,v| v}.reverse.first(100)

    # format result.
    @result = String.new
    @top_hundred_word_triplets.each do |key,value|
      @word_triplet = key.join(' ')
      @result += "#{value} - #{@word_triplet}, "
    end
    # print to terminal.
    print @result
    # return @result for testing, other uses.
    @result
  end

  # helper funciton to remove punctuation.
  def self.format_word(word)
    word.downcase.gsub(/[^a-z0-9\s]?/i, "")
  end
end

# execute class method when file is ran.
WordFrequency.top_word_triplets
