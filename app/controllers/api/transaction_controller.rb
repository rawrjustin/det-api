class Api::TransactionController < ApplicationController
  before_action :authenticate
  
  def index
  end

  def show
  end

  def create
    #raise params.inspect
    @transaction = Transaction.create(transaction_params)
    @debts = Array.new()
    
    params[:debtors].each do |debtor|
      debt_user = User.find_by_facebook_id( debtor[:facebook_id] )
      
      if !debt_user
        debt_user = User.create( :name => debtor[:name], :facebook_id => debtor[:facebook_id] )
      end
      
      debt = Debt.create( :amount => debtor[:amount], :debtor => debtor[:facebook_id], :creditor => @current_user.facebook_id, :transaction_id => @transaction.id )  
      @debts << debt
    end
    
    respond_to do |format|
      format.json{render :json => { "transaction" => @transaction, "debts" => @debts }}
    end
    
  end
  
  private
    def transaction_params
      params.require(:transaction).permit(:description)
    end
end

# 
# { "debtors": [ 
#     { "name" : "allen"
#       "fbID" : "571815533"
#       "amount" : "9282"
#     },
#     { "name" : "brian"
#       "fbID" : "100000189248862"
#       "amount" : "130"
#     }],
#   "transaction" : { "description" : "OMG RAILS API BITCHES"}
#   "creditor": "1141801215"
# }