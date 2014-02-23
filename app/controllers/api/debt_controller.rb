class Api::DebtController < ApplicationController
  before_action :authenticate
  
  def create
    @debt = Debt.create(debt_params)
  end
  
  def index
    debts = Debt.where(debtor: @current_user.facebook_id)
    credits = Debt.where(creditor: @current_user.facebook_id)
    
    list = debts + credits
    respond_to do |format|
      format.json{render :json => list}
    end
  end
  
  def debt_params
    params.require(:debt).permit(:creditor, :debtor, :amount, :transaction_id)
  end
end
