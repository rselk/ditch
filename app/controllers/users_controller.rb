class UsersController < Devise::RegistrationsController
  def index
  end

  def show
  end

  private

      def sign_up_params
         params.require(:user).permit(:timezone, :email, :password,
:password_confirmation)
      end

      def account_update_params
         params.require(:user).permit(:timezone, :email, :password,
:password_confirmation, :current_password)
      end

end
