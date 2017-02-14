class Post < ActiveRecord::Base
	has_many :comments, dependent: :destroy
	has_many :pictures, as: :imageable
	belongs_to :user

	acts_as_votable
end
