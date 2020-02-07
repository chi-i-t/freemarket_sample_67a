class SignupController < ApplicationController

  def top
  end

  def step1
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    
    # (
    #   nickname: session[:nickname],
    #   email: session[:email],
    #   password: session[:password],
    #   password_confirmation: session[:password_confirmation],
    #   family_name: session[:family_name],
    #   first_name: session[:first_name],
    #   family_name_kana: session[:family_name_kana],
    #   first_name_kana: session[:first_name_kana],
    #   birthday: session[:birthday],
    #   phone_number: session[:phone_number],
    # )
    if @user.save
      # session[:id] = @user.id
      redirect_to done_signup_index_path
    else
      render '/signup/step1'
    end
  end
  
  def done
    # sign_in User.find(user:id) unless user_signed_in?
  end
  
  private
   # 許可するキーを設定
    def user_params
      params.require(:user).permit(
        :nickname,
        :email,
        :password,
        :password_confirmation,
        :family_name,
        :first_name,
        :family_name_kana,
        :first_name_kana,
        :birthday,
        :phone_number,
      )
    end


end
