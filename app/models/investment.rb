class Investment < ApplicationRecord
	include UsersHelper
	belongs_to :user


	def self.search(symbol, cost_min, cost_max, user)
		@investment = Investment.where(user_id: user.id)
			
		@investment = @investment.where("symbol ILIKE ?", "#{symbol}") if symbol.present?	
		@investment = @investment.where("cost >= ?", cost_min) if cost_min.present?
		@investment = @investment.where("cost <= ?", cost_max) if cost_max.present?

		return @investment
	end

end