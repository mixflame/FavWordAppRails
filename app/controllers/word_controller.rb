class WordController < ApplicationController


  def favorite_word
    word = Word.new
    word.word = params[:word]
    word.save
    redirect_to :action => :random_word
  end

  def random_word
    word = Word.order("RANDOM()").first
    render :json => word.to_json
  end

  def vote_up
    word = Word.find_by_word(params[:word])
    word.up_votes ||= 0
    word.up_votes = word.up_votes + 1
    word.save
    redirect_to :action => :random_word
  end

  def vote_down
    word = Word.find_by_word(params[:word])
    word.up_votes ||= 0
    word.up_votes = word.up_votes - 1
    word.save
    redirect_to :action => :random_word
  end

  def word_of_the_day
    word = Word.order('up_votes DESC').first
    render :json => word.to_json
  end

end
