class Investment < ApplicationRecord
	include UsersHelper
	belongs_to :user


	def self.search(symbol, cost_min, user)
		@investment = Investment.where(user_id: user.id)
			
		@investment = @investment.where("symbol ILIKE ?", "#{symbol}") if symbol.present?	
		@investment = @investment.where("cost >= ?", cost_min) if cost_min.present?

		return @investment
	end

end