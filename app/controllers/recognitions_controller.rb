class RecognitionsController < ApplicationController
  skip_before_action :authentication_check, except: :destroy
  before_action :restrict_action_in_logged, only: [:new, :create]
  
  def new
  end

  def create
    user = User.find_by(e_mail: params[:authentication][:e_mail].downcase)
    if user && user.authenticate(params[:authentication][:password])
      session[:user_id] = user.id
      if user.type == "Customer"
        redirect_to customer_path(user), notice: "ログインできました"
      else
        redirect_to staff_path(user), notice: "ログインできました"
      end
    else
      flash[:notice] = "認証できません"
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to new_recognitions_path
  end
end
