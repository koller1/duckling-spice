require 'spec_helper'

describe "Initial Pages" do
	
	subject { page }

	describe "Home page" do
		before { visit root_path }

		it { should have_content('Home Page') }
	end

	describe "Help page" do
		before { visit help_path }

		it { should have_content('Help') }
	end

	describe "About page" do
		before { visit about_path }

		it { should have_content('About') }
	end

end
