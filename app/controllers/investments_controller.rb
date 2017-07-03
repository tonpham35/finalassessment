class InvestmentsController < ApplicationController
  before_action :set_investment, only: [:show, :edit, :update, :destroy]
  include UsersHelper

  # GET /investments/1
  # GET /investments/1.json
  def show
      if current_user != @investment.user
        redirect_to users_index_path
      end
  end

  # POST /investments
  # POST /investments.json
  def create
<<<<<<< HEAD
    @investment = current_user.investments.new(investment_params)
    
    if @investment.save
      @investments = Investment.where(user_id: current_user.id)
      respond_to do |format|
        format.html { redirect_to users_index_path, notice: 'Investment was successfully created.' }
        format.js
=======
    if signed_in?
      @investment = current_user.investments.new(investment_params)

      if @investment.save
        @investments = Investment.where(user_id: current_user.id)
        respond_to do |format|
          format.html { redirect_to users_index_path, notice: 'Investment was successfully created.' }
          format.js
        end
      else
        users_index_path
>>>>>>> 2ee5f0dda38d36c60eaeb2397a95f1ebcc38cd6c
      end
    else
      redirect_to root_path
    end
  end


  # DELETE /investments/1
  # DELETE /investments/1.json
  def destroy
    if @investment.user.id == current_user.id
      @investment.destroy
      respond_to do |format|
        format.html { redirect_to users_index_path, notice: 'Investment was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      redirect_to root_path
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_investment
      @investment = Investment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def investment_params
      params.require(:investment).permit(:symbol, :quantity, :cost, :selldate, :status, :purchasedate)
    end
end
