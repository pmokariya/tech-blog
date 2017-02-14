# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
@user = User.create!(username:"pooja",firstname:"pooja",lastname:"mokariya",email:'pooja@gmail.com', password: 'password', password_confirmation: 'password')
5.times do
	@post = Post.create!(title:"Ruby on rails" ,description:"Ruby on railsRuby on railsRuby on railsRuby on railsRuby on railsRuby on railsRuby on railsRuby on railsRuby on railsRuby on railsRuby on railsRuby on railsRuby on railsRuby on railsRuby on railsRuby on railsRuby on railsRuby on railsRuby on railsRuby on railsRuby on railsRuby on railsRuby on railsRuby on railsRuby on railsRuby on railsRuby on railsRuby on railsRuby on railsRuby on railsRuby on railsRuby on railsRuby on railsRuby on railsRuby on railsRuby on railsRuby on railsRuby on railsRuby on railsRuby on railsRuby on railsRuby on railsRuby on railsRuby on railsRuby on railsRuby on railsRuby on railsRuby on railsRuby on railsRuby on railsRuby on railsRuby on railsRuby on railsRuby on railsRuby on railsRuby on railsRuby on railsRuby on railsRuby on railsRuby on railsRuby on railsRuby on railsRuby on railsRuby on railsRuby on railsRuby on railsRuby on railsRuby on railsRuby on railsRuby on rails",user_id:@user.id)
	Comment.create!(text: "Nice i like it..!!",post_id:@post.id)
	Comment.create!(text: "Nice i like it..!!",post_id:@post.id)
end

