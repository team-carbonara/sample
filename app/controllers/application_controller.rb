class ApplicationController < ActionController::Base
  include RecognitionsHelper
  before_action :authentication_check

  private
  def authentication_check
    unless current_user.present?
      redirect_to new_recognitions_path
    end
  end

  def restrict_action_in_logged
    if current_user.present?
      redirect_to current_user
    end
  end
end
