require 'rails_helper'

	describe User, "#create" do
		it "return me an instance of user" do
			@user = User.new(full_name: "My Name", email: "example@email.com", password: "123456")
			expect(@user).to be_an_instance_of(User)
		end

		it "return me an error, password length must be >= 6" do
			@user = User.new(full_name: "My Name", email: "example@email.com", password: "123")
			@user.save
			expect(@user.errors.messages[:password]).to eq(["Password must be at least 6 characters"])
		end

		it "return me an error, password must be present & minimum 6 characters" do
			@user = User.new(full_name: "My Name", email: "example@email.com")
			@user.save
			expect(@user.errors.messages[:password]).to eq(["can't be blank", "Please fill-in all fields", "Password must be at least 6 characters"])
		end

		it "return me an error, email must be present & minimum 6 characters" do
			@user = User.new(full_name: "My Name", password: "123456")
			@user.save
			expect(@user.errors.messages[:email]).to eq(["Please fill-in all fields", "Invalid email address"])
		end

		it "return me an error, email must be unique" do
			User.create!(full_name: "My Name", email: "example@email.com", password: "123456")
			@user = User.create(full_name: "My Name", email: "example@email.com", password: "123456")
			expect(@user.errors.messages[:email]).to eq(["must be new"])
		end

		it "return me an error, email bad format, missing @" do
			@user = User.new(full_name: "My Name", email: "exampleemail.com", password: "123456")
			@user.save
			expect(@user.errors.messages[:email]).to eq(["Invalid email address"])
		end

		it "return me an error, email bad format, missing a .com || .edu || etc." do
			@user = User.new(full_name: "My Name", email: "example@email", password: "123456")
			@user.save
			expect(@user.errors.messages[:email]).to eq(["Invalid email address"])
		end

	end


