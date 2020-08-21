class Users::ProposalsController < ApplicationController

  def index
    @proposals = current_user.proposals.all
  end

  def new
    @proposal = Proposal.new
  end

  def create
    order_work = OrderWork.find(params[:order_work_id])
    proposal = current_user.proposals.new(proposal_params)
    proposal.order_work_id = proposal.id
    proposal.save
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
      params.require(:proposal).permit(:statement, :term, :price)
    end
end
