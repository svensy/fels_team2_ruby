class WordsController < ApplicationController

  def index 

    @categories = Category.all
    params[:category_id] = 1 if !params[:category_id]
    @words = Category.find_by(params[:category_id]).words


    if params[:learn] 
      @words = []
      @lessons = Lesson.where("user_id = ? AND category_id = ?", params[:user_id], params[:category_id])
      if params[:learn] == 'all'
        @lessons.each do |lesson|
          lesson.words.each do |lesson_word|
            @words << lesson_word unless @words.include?(lesson_word)
          end 
        end
      elsif params[:learn] == 'learned'
        @lessons.each do |lesson|
          lesson.lesson_words.each do |lesson_word| 
            word = lesson_word.word
            @words << word if (!@words.include?(word) && (!lesson_word.word_answer.nil? && lesson_word.word_answer.correct ==true))
          end
        end
      elsif params[:learn] == 'not learned'
        @lessons.each do |lesson|
          lesson.lesson_words.each do |lesson_word| 
            word = lesson_word.word
            @words << word if (!@words.include?(word) && ( lesson_word.word_answer.nil? || lesson_word.word_answer.correct ==false))
          end
        end
      end
    end
	
  	respond_to do |format|
  		format.html {render 'index'}
  		format.json {render json: @words.to_json, status: :ok}
  	end
  end

end
