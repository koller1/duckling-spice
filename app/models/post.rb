class Post < ActiveRecord::Base
	before_validation :add_tags, on: :create

  belongs_to :user
  validates :user_id, presence: true

	acts_as_votable #Gem for voting on posts
	acts_as_taggable # Alias for acts_as_taggable_on :tags

	private
		def add_tags
			self.text.split.each do |word|
				self.tag_list << word if word.first == '#'
			end
		end
end
