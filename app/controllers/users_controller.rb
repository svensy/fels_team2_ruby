class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @users = User.all
    respond_to do |format|
      format.json {render json: {users: @users.as_json}, status: :ok}
    end
  end

  def show
    @user = User.find(params[:id])
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
          flash[:success] = "Welcome to the Sample App!"
          redirect_to @user
        end
        format.json{render json: @user.to_json, status: :ok}
      else
        format.html{render 'new'}
        format.json{render json: @user.errors.full_messages, status: 401}
      end
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
end