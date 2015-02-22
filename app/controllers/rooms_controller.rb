class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :edit, :update, :destroy]

  def index
    @rooms = Room.all
  end

  def show
  end

  def new
    @room = Room.new
  end

  def edit
  end

  def create
    @room = Room.new(room_params)

    respond_to do |format|
      if @room.save
        format.html {redirect_to members_path, notice: 'Room has been saved.'}
        format.json {render :show, status: :created, location: @room}
      else
        format.html {render :new}
        format.json {render json: @room.errors, status: :unprocessable_entity}
      end
    end
  end

  def update
  end

  def destroy
  end

  private
 
    def set_room
      @room = Room.find(params[:id])
    end

    def room_params
      params.require(:room).permit(:room_number, :rent, :member_id)
    end
end
