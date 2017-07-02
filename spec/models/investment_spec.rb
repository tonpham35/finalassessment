require 'rails_helper'

	describe Investment, "#create" do

		it "return me an instance of Investment" do
			@investment = Investment.new(user_id: 1, symbol: 'F', cost: 1000, quantity: 100, purchasedate: '05/06/2017')
			@investment.save
			expect(@investment).to be_an_instance_of(Investment)
		end

		it "return me an error, symbol must be present" do
			@investment = Investment.new(user_id: 1, cost: 1000, quantity: 100, purchasedate: '05/06/2017')
			@investment.save
			expect(@investment.errors.messages[:symbol]).to eq(["Please fill-in all fields"])
		end

		it "return me an error, cost must be present" do
			@investment = Investment.new(user_id: 1, symbol: 'F', quantity: 100, purchasedate: '05/06/2017')
			@investment.save
			expect(@investment.errors.messages[:cost]).to eq(["Please fill-in all fields", "Must be Positive"])
		end

		it "return me an error, cost must be positive" do
			@investment = Investment.new(user_id: 1, symbol: 'F', cost: -1000, quantity: 100, purchasedate: '05/06/2017')
			@investment.save
			expect(@investment.errors.messages[:cost]).to eq(["Must be Positive"])
		end

		it "return me an error, quantity must be present" do
			@investment = Investment.new(user_id: 1, symbol: 'F', cost: 1000, purchasedate: '05/06/2017')
			@investment.save
			expect(@investment.errors.messages[:quantity]).to eq(["Please fill-in all fields", "Must be Positive"])
		end

		it "return me an error, quantity must be present" do
			@investment = Investment.new(user_id: 1, symbol: 'F', cost: 1000, quantity: -100, purchasedate: '05/06/2017')
			@investment.save
			expect(@investment.errors.messages[:quantity]).to eq(["Must be Positive"])
		end

		it "return me an error, purchasedate must be present" do
			@investment = Investment.new(user_id: 1, symbol: 'F', cost: 1000, quantity: 100)
			@investment.save
			expect(@investment.errors.messages[:purchasedate]).to eq(["Please fill-in all fields"])
		end

		it "return me an error, purchasedate must be in past" do
			@investment = Investment.new(user_id: 1, symbol: 'F', cost: 1000, quantity: 100, purchasedate: '05/06/2018')
			@investment.save
			expect(@investment.errors.messages[:purchasedate]).to eq([])
		end

	end
