Member.destroy_all
Project.destroy_all
Team.destroy_all
Message.destroy_all
TaskList.destroy_all
Todo.destroy_all

m = Member.new(
	email: "jaxihe@gmail.com",
	username: 'jaxi',
	password: '12345678')

m.save!

m2 = m = Member.new(
	email: "he.jingkai@163.com",
	username: 'jaxi',
	password: '12345678')

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

p.task_lists.create! name: "Task 1"
p.task_lists.create! name: "Task 2"

task = p.task_lists.first

task.todos.create content: "Todo 1", owner: m
task.todos.create content: "Todo 2", owner: m
