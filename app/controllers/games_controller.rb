require "open-uri"

class GamesController < ApplicationController
  def new
    @letters = ('a'..'z').to_a.sample(5)
    @letters += ['a', 'e' , 'i', 'o', 'u', 'a', 'e' , 'i', 'o', 'u'].sample(5)
    @letters.shuffle!
  end

  def score
    @word = params[:word]
    @english_word = english_word?(@word)
  end

def english_word?(word)
  response = URI.open("https://wagon-dictionary.herokuapp.com/#{word}")
  json = JSON.parse(response.read)
  json['found']
end
end
