json.extract! investment, :id, :users, :symbol, :quantity, :cost, :purchasedate, :selldate, :status, :created_at, :updated_at
json.url investment_url(investment, format: :json)
