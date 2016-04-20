class WordsController < ApplicationController
  def create
    Words::Create.run(wordset: params[:wordset]).result
    redirect_to admin_words_path
  end
end
