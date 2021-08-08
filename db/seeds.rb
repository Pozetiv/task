# frozen_string_literal: true

15.times do
  user = User.create(login: Faker::Name.unique.name)

  post = Post.create(content: Faker::Lorem.paragraph,
                     title: Faker::Lorem.word,
                     user: user)

  Mark.create(post: post, author_id: Faker::Internet.uuid, grade: rand(1..5)) if (post.id % 2).zero?
end
