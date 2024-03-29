#!/usr/bin/env ruby

gem 'test-unit'
require 'test/unit'
require 'test/unit/ui/console/testrunner'
require './common_three_words'

# Tests
class CommonThreeWordsTest < Test::Unit::TestCase
  
  def test_common_three_words
    # open txt files for use as arguments.
    @test_file_one = File.open('./example1.txt')
    @test_file_two = File.open('./example2.txt')
    @origin_of_species = File.open('./origin-of-species.txt')

    # tests it's working as expected with single file.
    assert_equal(WordFrequency.top_word_triplets(@test_file_one), 
      "6 - one two three, 5 - three one two, 5 - two three one, 3 - four five six, 2 - six four five, 2 - five six four, 2 - bla bla bla, 1 - are my wayward, 1 - we are my, 1 - here we are, 1 - so here we, 1 - document so here, 1 - a document so, 1 - in a document, 1 - words in a, 1 - some words in, 1 - need some words, 1 - just need some, 1 - i just need, 1 - because i just, 1 - here because i, 1 - type here because, 1 - i type here, 1 - what i type, 1 - matter what i, 1 - really matter what, 1 - doesnt really matter, 1 - bla doesnt really, 1 - bla bla doesnt, 1 - hello darkness my, 1 - five six bla, 1 - three four five, 1 - two three four, 1 - son one two, 1 - wayward son one, 1 - my wayward son, 1 - again bla bla, 1 - see again bla, 1 - and see again, 1 - here and see, 1 - you here and, 1 - see you here, 1 - friend see you, 1 - old friend see, 1 - my old friend, 1 - darkness my old, 1 - six bla bla, ")
    
    # tests variety of different line-breaks.
    assert_equal(WordFrequency.top_word_triplets(@test_file_two),
      "3 - i love sandwiches, 2 - sandwiches i love, 2 - love sandwiches i, 1 - brightness my old, 1 - ha i love, 1 - yo ha i, 1 - line yo ha, 1 - another line yo, 1 - its another line, 1 - friend its another, 1 - old friend its, 1 - my old friend, 1 - love sandwiches ok, ")
    
    # tests it works with multiple files passed as arguments.
    assert_equal(WordFrequency.top_word_triplets(@test_file_one, @test_file_two),
      "6 - one two three, 5 - three one two, 5 - two three one, 3 - four five six, 3 - i love sandwiches, 2 - bla bla bla, 2 - six four five, 2 - five six four, 2 - sandwiches i love, 2 - love sandwiches i, 2 - my old friend, 1 - six bla bla, 1 - five six bla, 1 - three four five, 1 - two three four, 1 - son one two, 1 - wayward son one, 1 - my wayward son, 1 - are my wayward, 1 - we are my, 1 - here we are, 1 - so here we, 1 - document so here, 1 - a document so, 1 - in a document, 1 - words in a, 1 - some words in, 1 - need some words, 1 - just need some, 1 - i just need, 1 - because i just, 1 - here because i, 1 - type here because, 1 - i type here, 1 - what i type, 1 - matter what i, 1 - really matter what, 1 - doesnt really matter, 1 - bla doesnt really, 1 - bla bla doesnt, 1 - again bla bla, 1 - see again bla, 1 - and see again, 1 - here and see, 1 - you here and, 1 - see you here, 1 - friend see you, 1 - old friend see, 1 - hello darkness my, 1 - ha i love, 1 - yo ha i, 1 - line yo ha, 1 - another line yo, 1 - its another line, 1 - friend its another, 1 - old friend its, 1 - brightness my old, 1 - bla brightness my, 1 - bla bla brightness, 1 - darkness my old, 1 - love sandwiches ok, ")
    
    # tests it works well with larger text file.
    assert_equal(WordFrequency.top_word_triplets(@origin_of_species),
      "320 - of the same, 126 - the same species, 125 - conditions of life, 116 - in the same, 107 - of natural selection, 103 - from each other, 98 - species of the, 89 - on the other, 81 - the other hand, 78 - the case of, 75 - the theory of, 73 - some of the, 72 - parts of the, 72 - of the world, 70 - through natural selection, 69 - with respect to, 67 - in the case, 65 - it may be, 65 - the species of, 65 - the inhabitants of, 64 - of the species, 62 - that of the, 61 - the same genus, 61 - forms of life, 60 - individuals of the, 58 - as far as, 56 - the number of, 55 - part of the, 55 - those of the, 53 - the principle of, 52 - the nature of, 52 - to each other, 51 - in this case, 51 - on the same, 50 - more or less, 50 - at the same, 50 - to the same, 50 - nature of the, 49 - in regard to, 49 - as in the, 47 - nearly the same, 47 - and in the, 47 - one of the, 47 - it has been, 47 - the individuals of, 47 - a state of, 47 - in which the, 46 - we can understand, 46 - inhabitants of the, 46 - each other in, 46 - state of nature, 46 - the amount of, 45 - from a common, 45 - are descended from, 44 - will have been, 44 - might have been, 43 - the conditions of, 43 - by natural selection, 42 - which have been, 42 - animals and plants, 42 - in a state, 42 - to believe that, 42 - and on the, 42 - and of the, 42 - to have been, 42 - the same manner, 41 - would have been, 41 - respect to the, 41 - the same time, 41 - we have seen, 40 - members of the, 40 - as well as, 40 - the united states, 40 - there is no, 40 - varieties of the, 40 - on the theory, 40 - it would be, 40 - in some degree, 39 - belonging to the, 39 - each other and, 39 - of the most, 38 - it is that, 38 - could be given, 38 - that it is, 37 - theory of natural, 37 - in order to, 36 - the present day, 36 - the process of, 36 - the sterility of, 36 - of life and, 36 - species belonging to, 36 - it is not, 35 - reason to believe, 35 - the power of, 34 - in relation to, 33 - believe that the, 33 - from the same, 33 - and this is, 33 - habits of life, 33 - of the sea, ")
  
    # close txt files for cleanup.
    @test_file_one.close
    @test_file_two.close
    @origin_of_species.close
  end

  # same tests as above but instead of arguments, files are passed in via standard input.
  def test_standard_input
    $stdout.puts result_one = `cat example1.txt | ./common_three_words.rb`
    assert_equal(result_one, 
      "6 - one two three, 5 - three one two, 5 - two three one, 3 - four five six, 2 - six four five, 2 - five six four, 2 - bla bla bla, 1 - are my wayward, 1 - we are my, 1 - here we are, 1 - so here we, 1 - document so here, 1 - a document so, 1 - in a document, 1 - words in a, 1 - some words in, 1 - need some words, 1 - just need some, 1 - i just need, 1 - because i just, 1 - here because i, 1 - type here because, 1 - i type here, 1 - what i type, 1 - matter what i, 1 - really matter what, 1 - doesnt really matter, 1 - bla doesnt really, 1 - bla bla doesnt, 1 - hello darkness my, 1 - five six bla, 1 - three four five, 1 - two three four, 1 - son one two, 1 - wayward son one, 1 - my wayward son, 1 - again bla bla, 1 - see again bla, 1 - and see again, 1 - here and see, 1 - you here and, 1 - see you here, 1 - friend see you, 1 - old friend see, 1 - my old friend, 1 - darkness my old, 1 - six bla bla, ")
 
    $stdout.puts result_two = `cat example2.txt | ./common_three_words.rb`
    assert_equal(result_two, 
      "3 - i love sandwiches, 2 - sandwiches i love, 2 - love sandwiches i, 1 - brightness my old, 1 - ha i love, 1 - yo ha i, 1 - line yo ha, 1 - another line yo, 1 - its another line, 1 - friend its another, 1 - old friend its, 1 - my old friend, 1 - love sandwiches ok, ")

    $stdout.puts result_three = `cat example1.txt example2.txt | ./common_three_words.rb`     
    assert_equal(result_three,
      "6 - one two three, 5 - three one two, 5 - two three one, 3 - four five six, 3 - i love sandwiches, 2 - bla bla bla, 2 - six four five, 2 - five six four, 2 - sandwiches i love, 2 - love sandwiches i, 2 - my old friend, 1 - six bla bla, 1 - five six bla, 1 - three four five, 1 - two three four, 1 - son one two, 1 - wayward son one, 1 - my wayward son, 1 - are my wayward, 1 - we are my, 1 - here we are, 1 - so here we, 1 - document so here, 1 - a document so, 1 - in a document, 1 - words in a, 1 - some words in, 1 - need some words, 1 - just need some, 1 - i just need, 1 - because i just, 1 - here because i, 1 - type here because, 1 - i type here, 1 - what i type, 1 - matter what i, 1 - really matter what, 1 - doesnt really matter, 1 - bla doesnt really, 1 - bla bla doesnt, 1 - again bla bla, 1 - see again bla, 1 - and see again, 1 - here and see, 1 - you here and, 1 - see you here, 1 - friend see you, 1 - old friend see, 1 - hello darkness my, 1 - ha i love, 1 - yo ha i, 1 - line yo ha, 1 - another line yo, 1 - its another line, 1 - friend its another, 1 - old friend its, 1 - brightness my old, 1 - bla brightness my, 1 - bla bla brightness, 1 - darkness my old, 1 - love sandwiches ok, ")

    $stdout.puts result_four = `cat origin-of-species.txt | ./common_three_words.rb`     
    assert_equal(result_four,
      "320 - of the same, 126 - the same species, 125 - conditions of life, 116 - in the same, 107 - of natural selection, 103 - from each other, 98 - species of the, 89 - on the other, 81 - the other hand, 78 - the case of, 75 - the theory of, 73 - some of the, 72 - parts of the, 72 - of the world, 70 - through natural selection, 69 - with respect to, 67 - in the case, 65 - it may be, 65 - the species of, 65 - the inhabitants of, 64 - of the species, 62 - that of the, 61 - the same genus, 61 - forms of life, 60 - individuals of the, 58 - as far as, 56 - the number of, 55 - part of the, 55 - those of the, 53 - the principle of, 52 - the nature of, 52 - to each other, 51 - in this case, 51 - on the same, 50 - more or less, 50 - at the same, 50 - to the same, 50 - nature of the, 49 - in regard to, 49 - as in the, 47 - nearly the same, 47 - and in the, 47 - one of the, 47 - it has been, 47 - the individuals of, 47 - a state of, 47 - in which the, 46 - we can understand, 46 - inhabitants of the, 46 - each other in, 46 - state of nature, 46 - the amount of, 45 - from a common, 45 - are descended from, 44 - will have been, 44 - might have been, 43 - the conditions of, 43 - by natural selection, 42 - which have been, 42 - animals and plants, 42 - in a state, 42 - to believe that, 42 - and on the, 42 - and of the, 42 - to have been, 42 - the same manner, 41 - would have been, 41 - respect to the, 41 - the same time, 41 - we have seen, 40 - members of the, 40 - as well as, 40 - the united states, 40 - there is no, 40 - varieties of the, 40 - on the theory, 40 - it would be, 40 - in some degree, 39 - belonging to the, 39 - each other and, 39 - of the most, 38 - it is that, 38 - could be given, 38 - that it is, 37 - theory of natural, 37 - in order to, 36 - the present day, 36 - the process of, 36 - the sterility of, 36 - of life and, 36 - species belonging to, 36 - it is not, 35 - reason to believe, 35 - the power of, 34 - in relation to, 33 - believe that the, 33 - from the same, 33 - and this is, 33 - habits of life, 33 - of the sea, ")
  end
end
