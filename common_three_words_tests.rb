#!/usr/bin/env ruby

gem 'test-unit'
require 'test/unit'
require 'test/unit/ui/console/testrunner'
require './common_three_words'


# Tests
class CommonThreeWordsTest < Test::Unit::TestCase
  def test_common_three_words()
    @test_file_one = File.open('./example1.txt')
    @test_file_two = File.open('./example2.txt')
    @origin_of_species = File.open('./origin-of-species.txt')
    assert_equal(WordFrequency.top_word_triplets(@test_file_one), 
      "6 - one two three, \n" +
      "5 - three one two, \n" +
      "5 - two three one, \n" +
      "3 - four five six, \n" +
      "2 - six four five, \n" +
      "2 - five six four, \n" +
      "2 - bla bla bla, \n" +
      "1 - are my wayward, \n" +
      "1 - we are my, \n" +
      "1 - here we are, \n" +
      "1 - so here we, \n" +
      "1 - document so here, \n" +
      "1 - a document so, \n" +
      "1 - in a document, \n" +
      "1 - words in a, \n" +
      "1 - some words in, \n" +
      "1 - need some words, \n" +
      "1 - just need some, \n" +
      "1 - i just need, \n" +
      "1 - because i just, \n" +
      "1 - here because i, \n" +
      "1 - type here because, \n" +
      "1 - i type here, \n" +
      "1 - what i type, \n" +
      "1 - matter what i, \n" +
      "1 - really matter what, \n" +
      "1 - doesnt really matter, \n" +
      "1 - bla doesnt really, \n" +
      "1 - bla bla doesnt, \n" +
      "1 - hello darkness my, \n" +
      "1 - five six bla, \n" +
      "1 - three four five, \n" +
      "1 - two three four, \n" +
      "1 - son one two, \n" +
      "1 - wayward son one, \n" +
      "1 - my wayward son, \n" +
      "1 - again bla bla, \n" +
      "1 - see again bla, \n" +
      "1 - and see again, \n" +
      "1 - here and see, \n" +
      "1 - you here and, \n" +
      "1 - see you here, \n" +
      "1 - friend see you, \n" +
      "1 - old friend see, \n" +
      "1 - my old friend, \n" +
      "1 - darkness my old, \n" +
      "1 - six bla bla, \n")
    @test_file_one.close
    @test_file_two.close
    @origin_of_species.close
  end
end

