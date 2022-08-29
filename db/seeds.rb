# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

users = User.all 
users.each do |u|
  [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].each_with_index do |e, i|
    Post.create(title: "Title #{i}", body: "Body #{i}", user_id: u.id)

  end
end
  
