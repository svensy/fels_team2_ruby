class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def new
  end

  def create
      user = User.find_by(email: params[:session][:email].downcase)
      respond_to do |format|
        if user && user.authenticate(params[:session][:password])
          format.html do
            log_in user
            params[:session][:remember_me] == '1' ? remember(user) : forget(user)
            redirect_to user
          end
          format.json {render json: user.to_json, status: :ok}
        else
          format.html do
            flash.now[:danger] = 'Invalid email/password combination'
            render 'new'
          end
          format.json {render json: {message: "not found user"}, status: 401}
        end
      end
  end

  def destroy
        log_out if logged_in?
        redirect_to root_url
  end
end