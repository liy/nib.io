#coding: utf-8
class SessionsController < ApplicationController
  def new
  end

  # authenticate process
  def create
    user = User.find_by_email(params[:email])

    # make sure user exist
    if user && user.authenticate(params[:password]) # && verify_recaptcha
      auth_success user
    else
      auth_invalid user
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, :flash => {:info => 'account.signout'}
  end

  private
  def auth_success(user)
    session[:user_id] = user.id
    redirect_to user_path(current_user), :flash => {:success => 'account.signin'}
  end

  def auth_invalid(user)
    flash.now[:error] = 'account.errors.auth_failed'
    render 'new'
  end

end