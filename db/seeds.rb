# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
if Post.destroy_all && Comment.destroy_all && User.destroy_all
# post1 = Post.create({title: "First Post", content:"This is the content of my first post"})
# post2 = Post.create({title: "Second Post", content:"This is the content of my second post"})
# comment1 = Comment.create!({name: "Julie", email: "julie@email.com", user_id: 1})
# comment2 = Comment.create!({name: "Bob", email: "bob@email.com", user_id: 2})
user1 = User.create!({name: "Julie", email: "julie@email.com", password: "juliebee", password_confirmation: "juliebee"})
user2 = User.create!({name: "Bob", email: "bob@email.com", password: "bobby", password_confirmation: "bobby"})
end

