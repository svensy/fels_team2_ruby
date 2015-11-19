class UsersController < ApplicationController

  before_action :logged_in_user, only: [:index, :edit, :update]
  before_action :correct_user,   only: [:edit, :update]

  def index
    @users = User.paginate(page: params[:page])
    respond_to do |format|
      format.html {render 'index'}
      format.json {render json: @users.to_json, status: :ok}
    end
  end

  def show
    @user = User.find(params[:id])
    respond_to do |format|
      format.html {render 'show'}
      format.json {render json: @user.to_json, status: :ok}
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html do
          log_in @user
          flash[:success] = "Welcome to the LearnJapanese2 App!"
          redirect_to @user
        end
        format.json{render json: @user.to_json, status: :ok}
      else
        format.html{render 'new'}
        format.json{render json: @user.errors.full_messages, status: 401}
      end
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      # Handle a successful update.
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
     # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
end