class WordsController < ApplicationController

  def index 
    @words = Word.all
    @categories = Category.all
    @words = Word.where(category_id: params[:category]) if params[:category]

  end

end
