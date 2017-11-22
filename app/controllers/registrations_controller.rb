class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit(:email, :roles_id, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:email, :roles_id, :password, :password_confirmation)
  end
end