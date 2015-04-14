class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:destroy]

  # GET /users/dan
  def show
    @user = User.find_by(id: params[:id])
    @channels = @user.channels.order("created_at DESC")
	end

	def block_user_new
		@block = Block.new
	end

	def block_user_create
		@block = Block.new
		@block.user_id = params[:block][:user_id]
		@block.blocked_user_id = params[:block][:blocked_user_id]
		if @block.save
			redirect_to channels_path, notice: 'This User has been blocked'
		else
			redirect_to :back, notice: "You have already blocked this User."
		end	
	end

end