class MembersController < ApplicationController
  before_action :set_member, only: [:edit, :update, :destroy]

  def index
    init
  end

  def show
  end

  def new
    @member = Member.new
  end

  def edit
  end

  def create
    init
    @member = Member.new(member_params)
    @room_num = params[:room][:room_number]

    respond_to do |format|
      if @member.save
        Room.update(@room_num, @member.id) 
        format.html {render :index}
        format.json {render :show, status: :created, location: @member}
      else
puts "Member not saved."
        format.html {render :new}
        format.json {render json: @member.errors, status: :unprocessable_entity}
      end
    end
  end

  def update
  end

  def destroy
  end

  def change_room
    init
    @member = Member.new
#    data = ActiveSupport::JSON.decode(request.body.to_json)
#    puts data
  end

  private
 
    def set_member
      @member = Member.find(params[:id])
    end

    def member_params
      params.require(:member).permit(:fname, :lname, :room_attributes => [:room_number])
    end

    def init
      @members_all = Member.all
      @members_active = Member.joins(:room).where("members.id == rooms.member_id")
      @members_inactive = Member.joins("LEFT OUTER JOIN rooms ON rooms.member_id == members.id").where("rooms.member_id IS NULL")
    end
end
