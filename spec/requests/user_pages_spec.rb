require 'spec_helper'

describe "User pages" do

	subject { page }

	describe "Sign Up page" do
		before { visit signup_path }
		let(:submit) { "Create my account" }
		it { should have_content('Sign Up') }
	end

	describe "Invalid Information" do
		it "should not create users" do
			expect { click_button :submit }.not_to change(User, :count)
		end
	end

	describe "Valid information" do
		before do
			fill_in "Name",          with: "Example Person"
			fill_in "Email",         with: "example3@gmail.com"
			fill_in "Password",      with: "foobar"
			fill_in "Confirmation",  with: "foobar"
		end
	
		it "should create a user" do
			expect { click_button "Create my account" }.to change(User, :count).by(1)
		end
	end

	describe "profile page" do
		let(:user) { FactoryGirl.create(:user) }
		before { visit user_path(user) }

		it { should have_content(user.name) }
		it { should have_content(user.email) }
	end

end
