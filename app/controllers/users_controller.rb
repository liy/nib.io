class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])

    # render text: @user.writings[0].to_yaml
  end
end
