if Post.destroy_all && Comment.destroy_all && User.destroy_all

	user1 = User.create({name: "Julie", email: "julie@email.com", password: "juliebee", password_confirmation: "juliebee"})
	user2 = User.create({name: "Bob", email: "bob@email.com", password: "bobby", password_confirmation: "bobby"})
	post1 = Post.create({title: "First Post", content:"This is the content of my first post", user_id: 1})
	post2 = Post.create({title: "Second Post", content:"This is the content of my second post", user_id: 1})
	comment1 = Comment.create({user_id: 1, post_id:1, body: "my sexy body" })
	comment2 = Comment.create({user_id: 2, post_id:1, body: "your sexy body" })
end

