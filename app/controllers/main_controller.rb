class MainController < ApplicationController
  def index
    @words = Word.all
  end
end
