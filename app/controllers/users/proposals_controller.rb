class Users::ProposalsController < ApplicationController

  def index
    @proposals = current_user.proposals
  end

  def order_proposal
    @order_work = OrderWork.find(params[:order_work_id])
    @proposals = Proposal.where(order_work_id: @order_work.id)
  end

  def new
    @proposal = Proposal.new
    @order_work = OrderWork.find(params[:order_work_id])
  end

  def create
    order_work = OrderWork.find(params[:order_work_id])
    proposal = Proposal.new(proposal_params)
    proposal.save!
    redirect_to mypage_path(current_user)
  end

  def show
  end

  def destroy
    Proposal.find_by(id: params[:id], order_work_id: params[:order_work_id]).destroy
    redirect_to order_work_path(params[:order_work_id])
  end

  private

    def proposal_params
      order_work_id = params[:order_work_id]
      order_work_id = order_work_id.to_i
      params.require(:proposal).permit(:statement, :term, :price, :payment_mathod).merge(order_work_id: order_work_id, user_id: current_user.id)
    end
end
