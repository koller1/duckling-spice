class Post < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true

	acts_as_votable #Gem for voting on posts
end
