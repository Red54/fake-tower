Member.destroy_all
Project.destroy_all
Team.destroy_all
Message.destroy_all

m = Member.new(
	email: "jaxihe@gmail.com",
	username: 'jaxi',
	password: 'fifaengine')

m.save!

p = Project.new name: "hello"
p.save!


p.members << m

p.messages.create!(
	title: 'Title 1',
	content: 'Hello world 1'
	)

p.messages.create!(
	title: 'Title 2',
	content: 'Hello world 2'
	)

message = p.messages.first

message.comments.create!(
	content: 'hello',
	author_id: m._id,
	author_name: m.username
	)

message.comments.create!(
	content: 'world',
	author_id: m._id,
	author_name: m.username
	)