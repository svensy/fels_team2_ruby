class LessonsController < ApplicationController
  def index
    @lessons = Lesson.where(user_id: params[:user_id])
    respond_to do |format|
        format.html {render "index"}
        format.json {render json: @lessons.to_json, status: :ok}
    end
  end

  def show
    @lesson = Lesson.find(params[:id])

    respond_to do |format|
      format.html {render "show"}
      format.json {render json: @lesson.to_json(:include => {:words => {:include => :word_answers}}), status: :ok}
    end
  end

  def update
    @lesson = Lesson.find(params[:id])
    @lesson.update_attributes(lesson_params)

    result = 0
    @lesson.lesson_words.each do |lw|
      if !lw.word_answer.nil? && lw.word_answer.correct == true
        result = result + 1 

      end
    end
    
    @lesson.update_attribute(:result, result)


    respond_to do |format|
      format.html { render "edit"}
      format.json { render json: {message: "Successful",
                                  result: result}}
    end
  end

  def new
    @lesson = Lesson.new
  end

  def create
    @lesson = Lesson.new(lesson_params)
    @lesson.words = @lesson.category.words.sample(5) 

    respond_to do |format|
        @lesson.save
        format.html do

          redirect_to user_lesson_url(params[:user_id], @lesson)
        end
        format.json{render json: @lesson.to_json(:include => {:words => {:include => :word_answers}}), status: :ok}
    end
  end
    
  private
  def lesson_params
    params.require(:lesson).permit(:category_id, :user_id, lesson_words_attributes: [:id, :word_answer_id])
  end
end