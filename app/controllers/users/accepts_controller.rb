class Users::AcceptsController < ApplicationController

  def new
    @proposal = Proposal.find(params[:proposal_id])
    @accept = Accept.new
  end

  def create
    accept = Accept.new(accept_params)
    accept.save!
    redirect_to thanks_path
  end

  def index
    @accepts = current_user.accepts
  end

  def show
    @accept = Accept.find(params[:id])
  end

  private

    def accept_params
      params.require(:accept).permit(:user_id, :order_work_id, :proposal_id, :payment_method)
    end
end
