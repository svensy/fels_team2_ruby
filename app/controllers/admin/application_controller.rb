# All Administrate controllers inherit from this `Admin::ApplicationController`,
# making it the ideal place to put authentication logic or other
# before_filters.
#
# If you want to add pagination or other controller-level concerns,
# you're free to overwrite the RESTful controller actions.
class Admin::ApplicationController < Administrate::ApplicationController
  include SessionsHelper

  before_filter :authenticate_admin
  before_filter :admin_list,only: [:authenticate_admin]

  def authenticate_admin
    admin = current_user;
    if admin.nil? || !admin_list.include?(admin.email)
      flash[:danger] = "You dont have permission to go this page. Please login as admin!";
      redirect_to login_url
    end
  end

  def admin_list
    list = ['ngotungson0602@gmail.com', 'caominhson58@gmail.com'] 
  end

  # Override this value to specify the number of elements to display at a time
  # on index pages. Defaults to 20.
  # def records_per_page
  #   params[:per_page] || 20
  # end
end
