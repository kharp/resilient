class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:destroy]

  # GET /users/dan
  def show
    @user = User.find_by(id: params[:id])
    @channels = @user.channels.order("created_at DESC")

  end

end