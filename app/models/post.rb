class Post < ActiveRecord::Base
	has_many :comments, dependent: :destroy
	acts_as_votable
end
