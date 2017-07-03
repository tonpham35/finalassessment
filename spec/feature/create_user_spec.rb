require "rails_helper"

feature "Create a user" do
	scenario "successfully create a user" do

		visit root_path
		click_on "Sign Up"
		fill_in "fullname", with: "User Name"
		fill_in "email", with: "example@email.com"
		fill_in "password", with: "123456"
		click_on "Submit"

		expect(page).to have_content('Welcome User Name')
	end

end

feature "Logout user" do
	scenario "successfully create a user and log out" do

		visit root_path
		click_on "Sign Up"
		fill_in "fullname", with: "User Name"
		fill_in "email", with: "example@email.com"
		fill_in "password", with: "123456"
		click_on "Submit"

		click_on "Logout"

		expect(page).to have_content('Please Sign In')
	end

end

feature "Login user" do
	scenario "successfully create a user and log out" do

		visit root_path
		click_on "Sign Up"
		fill_in "fullname", with: "User Name"
		fill_in "email", with: "example@email.com"
		fill_in "password", with: "123456"
		click_on "Submit"

		click_on "Logout"

		fill_in "email", with: "example@email.com"
		fill_in "password", with: "123456"
		click_on "Sign in"

		expect(page).to have_content('Welcome User Name')
	end

end

# feature "Create an Investment" do
# 	scenario "successfully create a user and log out" do

# 		visit root_path
# 		click_on "Sign Up"
# 		fill_in "fullname", with: "User Name"
# 		fill_in "email", with: "example@email.com"
# 		fill_in "password", with: "123456"
# 		click_on "Submit"

# 		fill_in "investment_symbol", with: "GOOG"
# 		fill_in "investment_quantity", with: "10"
# 		fill_in "investment_cost", with: "9000"
		
# 		page.execute_script("$('#datepicker').val('05-05-2017')")

# 		click_on "Save Investment"

# 		expect(page).to have_content('GOOG')
# 	end

# end
