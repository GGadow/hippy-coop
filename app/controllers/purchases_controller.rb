class PurchasesController < ApplicationController
  before_action :set_purchase, only: [:show, :edit, :update, :destroy]

  def index
    @purchase = Purchase.all
  end

  def show
  end

  def new
    @purchase = Purchase.new
  end

  def edit
  end

  def create
    @purchase = Purchase.new(purchase_params)

    respond_to do |format|
      if @purchase.save
        format.html {redirect_to members_path, notice: 'Purchase has been recorded.'}
        format.json {render :show, status: :created, location: @purchase}
      else
        format.html {render :new}
        format.json {render json: @purchase.errors, status: :unprocessable_entity}
      end
    end
  end

  def update
  end

  def destroy
  end

  private
 
    def set_purchase
      @purchase = Purchase.find(params[:id])
    end

    def purchase_params
      params.require(:purchase).permit(:member_id, :purchase_date, :description, :amount)
    end
end
