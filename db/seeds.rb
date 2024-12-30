User.create!(email: 'jorgecoutinho2013@outlook.com', password: '123456', password_confirmation: '123456', nickname: Randamu::Account.username)
User.create!(email: 'jorginhoffc@hotmail.com', password: '123456', password_confirmation: '123456', nickname: Randamu::Account.username)

user1 = User.first
user2 = User.last
users = [ user1, user2 ]


tags =  [ 'Ruby', 'Rails', 'JavaScript', 'React', 'Vue', 'Angular', 'Python', 'Django' ]
8.times do |i|
  Tag.create!(name: tags[i])
end

5.times do
  Post.create!(title: Randamu::Text.title, body: Randamu::Text.text, user: users.sample, tags: Tag.all.sample(2))
end

8.times do
  Comment.create!(body: Randamu::Text.phrase, post: Post.all.sample, user: users.sample)
end
