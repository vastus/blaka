class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to root_url
    else
      flash.now.alert = 
        I18n.t('login.incorrect_login.flash', default: 'Wrong email or password.')
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end

