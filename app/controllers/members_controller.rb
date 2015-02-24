class MembersController < ApplicationController
  before_action :set_member, only: [:show, :edit, :update, :destroy]

  def index
    @members_all = Member.all
    @members_active = Member.joins(:room).where("members.id == rooms.member_id")
    @members_inactive = Member.joins("LEFT OUTER JOIN rooms ON rooms.member_id == members.id").where("rooms.member_id IS NULL")
  end

  def show
  end

  def new
    @member = Member.new
  end

  def edit
  end

  def create
    @member = Member.new(member_params)
    @room_num = params[:room][:room_number]

    respond_to do |format|
      if @member.save
        if Room.update(@room_num, @member.id) 
          format.html {redirect_to members_path, notice: 'Member has been saved.'}
          format.json {render :show, status: :created, location: @member}
        else
          format.html {render :new}
          format.json {render json: @member.errors, status: :unprocessable_entity}
        end
      else
        format.html {render :new}
        format.json {render json: @member.errors, status: :unprocessable_entity}
      end
    end
  end

  def update
  end

  def destroy
  end

  private
 
    def set_member
      @member = Member.find(params[:id])
    end

    def member_params
      params.require(:member).permit(:fname, :lname, :room_attributes => [:room_number])
    end
end
