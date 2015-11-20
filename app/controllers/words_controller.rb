class WordsController < ApplicationController

  def index 
    @words = Word.all
    @categories = Category.all

    params[:category] = 1 if !params[:category]
    @words_category = Word.where(category_id: params[:category]) if params[:category]
    
    lessons_user = User.find_by(id: params[:user_id]) .lessons
    @words_user =  []
   	lessons_user.each do |lesson|
   		lesson.words.each do |word|
   			@words_user << word
   		end
   	end

   	if params[:learn] 
   		@words = []
   		if params[:learn] == 'learned'
		   	@words_user.each do |wu|
		   		@words_category.each do |wc|
		   			@words << wu if wu == wc
		   		end
		   	end
		  elsif params[:learn] == 'not learned'
  			@words_category.each do |wc|
  				gg = false
  				@words_user.each do |wu| 
  					if wu == wc 
  						gg = true
  						break
  					end
  				end
  				@words << wc if !gg
  			end
      elsif params[:learn] == 'all'
        @words = @words_category
      end
		else
			@words = @words_category
		end
	
	respond_to do |format|
		format.html {render 'index'}
		format.json {render json: @words.to_json, status: :ok}
	end
  end

end
