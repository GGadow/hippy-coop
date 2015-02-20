class MembersController < ApplicationController
  before_action :set_member, only: [:show, :edit, :update, :destroy]

  def index
    @member = Member.all
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

    respond_to do |format|
      if @member.save
        format.html {redirect_to members_path, notice: 'Member has been saved.'}
        format.json {render :show, status: :created, location: @member}
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
      params.require(:member).permit(:fname, :lname)
    end
end
