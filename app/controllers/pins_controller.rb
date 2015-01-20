class PinsController < ApplicationController
    before_action :set_pin, only: [:show, :edit, :update, :destroy]
    #before_action :correct_user, only: [:edit, :update, :destroy]
    before_action :authenticate_user!, except: [:index, :show]

    def index
       @pins = Pin.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 8)
    end

    def show
      @channel = Channel.find(params[:channel_id])
    end

    def new
        @channel = Channel.find(params[:channel_id])
        @pin = @channel.pins.new
        @pin.user = current_user
    end

    def edit
      @channel = Channel.find(params[:channel_id])
    end

    def create
        @channel = Channel.find(params[:channel_id])
        @pin = @channel.pins.new(pin_params)
        @pin.user = current_user
        if @pin.save
          redirect_to channel_pin_path(@channel, @pin), notice: 'Pin was successfully created.'
        else
          render action: 'new'
        end
    end

    def update
      puts '========================='
        puts params
        if @pin.update_attributes(pin_params)
            redirect_to channel_pin_path(@pin.channel, @pin), notice: 'Pin was successfully updated.'
        else
           render action: 'edit'
        end
    end

    def destroy
        @channel = Channel.find(params[:channel_id])
        if @pin.destroy
          redirect_to channel_path(@channel)
        end
    end

    private
        # Use callbacks to share common setup or constraints between actions.
    def set_pin
        @pin = Pin.find(params[:id])
    end

    def correct_user
        @pin = current_user.pins.find_by(id: params[:id])
        redirect_to channel_pin_path(@pin.channel), notice: "Not authorized to edit this pin" if @pin.nil?
    end

    def pin_params
      params.require(:pin).permit(:description, :image, :image_url)
    end
end