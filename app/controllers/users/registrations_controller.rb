class Users::RegistrationsController < Devise::RegistrationsController
  before_action :user_params, only: [:create, :update]

  private
  def user_params
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:email, :password, :password_confirmation,
                                  :name, :birthday, :sex, :school)
    end
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:email, :password, :password_confirmation, :current_password,
                                  :name, :birthday, :sex, :school)
    end
  end
end
