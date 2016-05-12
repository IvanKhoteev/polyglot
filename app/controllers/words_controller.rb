class WordsController < ApplicationController
  def create
    Words::Create.run(wordset: params[:wordset]).result
    redirect_to admin_words_path
  end

  def update
    # Words::Update.run(wordset: params[:wordset]).result
    redirect_to admin_words_path
  end

  def show
    @phrase = Phrase.all.sample
  end

  def check
    @phrase = Phrase.find(params[:phrase_id])
  end
end
