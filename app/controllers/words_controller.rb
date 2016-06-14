class WordsController < ApplicationController
  def create
    Words::Create.run(wordset: params[:wordset]).result
    redirect_to admin_words_path
  end

  def update
    # Words::Update.run(wordset: params[:wordset]).result
    redirect_to admin_words_path
  end

  def learn
    @word = Dictionary.where(status: 'learned').sample
    @language = params[:language]
  end

  def check_word
    @language = params[:language]
    @words = Dictionary.where("#{@language} = ?", Dictionary.find(params[:id]).send(@language))
    puts @words
  end

  def show
    @phrase = Phrase.where(lesson_identifier: params[:lesson_identifier]).sample
    redirect_to root_path if @phrase.blank?
  end

  def check
    @phrase = Phrase.find(params[:phrase_id])
  end
end
