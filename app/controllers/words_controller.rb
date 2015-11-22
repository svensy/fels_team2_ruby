class WordsController < ApplicationController

  def index 

    @categories = Category.all
    params[:category_id] = 1 if !params[:category_id]
    @words = Category.find(params[:category_id]).words


    if params[:learn] 
      @lessons = Lesson.where("user_id = ? AND category_id = ?", params[:user_id], params[:category_id])

      @words_not_learned = []
      @words.each do |word|
        @lessons.each do |lesson|
          word_in_lessons = false
          lesson.lesson_words.each do |lesson_word|
            word_in_lessons = true if word == lesson_word
          end
          @words_not_learned << word if !word_in_lessons
        end
      end
      @lessons.each do |lesson|
        lesson.lesson_words.each do |lesson_word| 
          word = lesson_word.word
          @words_not_learned << word if (!@words_not_learned.include?(word) || lesson_word.word_answer.nil? || !lesson_word.word_answer.correct)
        end
      end  

      @words_learned = []
      @words.each do |word|
        learned = true
        @words_not_learned.each do |word_not_learn|
          learned = false if word == word_not_learn
        end
        @words_learned << word if learned
      end
       debugger

      @words = @words_learned if params[:learn] == 'learned'
      @words = @words_not_learned if params[:learn] == 'not learned'
     
    end

     
	
  	respond_to do |format|
  		format.html {render 'index'}
  		format.json {render json: @words.to_json, status: :ok}
  	end
  end

end
