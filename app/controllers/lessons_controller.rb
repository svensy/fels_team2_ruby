class LessonsController < ApplicationController
  def index
    @lessons = Lesson.all
  end

  def show
    @lesson = Lesson.find(params[:id])
  end

  def new
    @lesson = Lesson.new
  end

  def create
    
    @lesson = Lesson.new(lesson_params)
    @lesson.words = @lesson.category.words.sample(20) 

    respond_to do |format|
        @lesson.save
        format.html do
          flash[:success] = "Successful!"
          redirect_to user_lesson_url(params[:user_id], @lesson)
        end
        format.json{render json: @lesson.to_json, status: :ok}

    end
    debugger
  end
  
  private
  def lesson_params
    params.permit(:category_id, :user_id)
  end
end