FactoryGirl.define do
	factory :user do
		name     "Alex Koller"
		email    "example@live.com"
		password "foobar"
		password_confirmation "foobar"

		factor :admin do
			admin true
		end
	end
end
