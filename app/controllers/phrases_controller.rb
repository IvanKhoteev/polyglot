class PhrasesController < ApplicationController
  def destroy
    Phrase.find(params[:id]).destroy
    redirect_to controller: :words, action: :show, lesson_identifier: params[:lesson_identifier]
  end
end
