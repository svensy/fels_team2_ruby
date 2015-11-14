class WordsController < ApplicationController

  def index 
    @words = Word.all
    if params[:commit] 
      if params[:commit] == "Filter" 
        @words = Word.where(learned: true) if params[:learn] == "learned" 
        @words = Word.where(learned: false) if params[:learn] == "not learned"
      end
    end
  end

end
