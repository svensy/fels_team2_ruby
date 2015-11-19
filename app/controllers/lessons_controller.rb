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
      format.json {render json: @lesson.to_json, status: :ok}
    end
  end

  def new
    @lesson = Lesson.new
  end

  def create
    @lesson = Lesson.new(lesson_params)
    @lesson.words = @lesson.category.words.where(params[:learn] == 'not learned').sample(5) 

    respond_to do |format|
        @lesson.save
        format.html do
          flash[:success] = "Successful!"
          redirect_to user_lesson_url(params[:user_id], @lesson)
        end
        format.json{render json: @lesson.to_json, status: :ok}
    end
  end
  
  private
  def lesson_params
    params.require(:lesson).permit(:category_id, :user_id)
  end
end