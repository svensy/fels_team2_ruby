class CategoriesController < ApplicationController

  def index
  	@categories = Category.all 
  	respond_to do |format|
		format.html { render "index"}
		format.json { render json: @categories.to_json, status: :ok}
    end

  end

end
