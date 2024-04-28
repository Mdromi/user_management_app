class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    sign_out :user
    redirect_to users_path
  end

  def block
    selected_user_ids = params[:selected_users].first.split(',').map(&:to_i)
    if selected_user_ids.present?
      User.where(id: selected_user_ids).update_all(status: 'blocked')
      flash[:success] = "Selected users blocked successfully."
    else
      flash[:error] = "No users selected to block."
    end
    redirect_to users_path
  end
  

  def unblock
    selected_user_ids = params[:selected_users].first.split(',').map(&:to_i)
    puts "selected_user_ids_1 #{selected_user_ids}"

    if selected_user_ids.present?
      User.where(id: selected_user_ids).update_all(status: 'active')
      flash[:success] = "Selected users unblocked successfully."
    else
      flash[:error] = "No users selected to unblock."
    end
    redirect_to users_path
  end

  def delete
    selected_user_ids = params[:selected_users].first.split(',').map(&:to_i)
    if selected_user_ids.present?
      User.where(id: selected_user_ids).destroy_all
      flash[:success] = "Selected users deleted successfully."
    else
      flash[:error] = "No users selected to delete."
    end
    redirect_to users_path
  end
end
