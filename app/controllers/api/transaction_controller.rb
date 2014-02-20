class Api::TransactionController < ApplicationController
  
  def index
  end

  def show
  end

  def create
    #raise params.inspect
    @transaction = Transaction.create(transaction_params)
    
    params[:debtors].each do |debtor|
      debt_user = User.find_by_facebook_id( debtor[:facebook_id] )
      
      if !debt_user
        debt_user = User.create( :name => debtor[:name], :facebook_id => debtor[:facebook_id] )
      end
      
      Debt.create( :amount => debtor[:amount], :debtor => debtor[:facebook_id], :creditor => params[:creditor], :transaction_id => @transaction.id )  
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