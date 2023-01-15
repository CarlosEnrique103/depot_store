# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Product.delete_all

Product.create!(
  title: "Camisa Kenneth Stevens",
  description: "Camisa para hombre Edinto",
  image_url: "product_1.jpg",
  price: 20.00
)

Product.create!(
  title: "Camisa Kenneth Stevens",
  description: "Camisa para hombre Ehan",
  image_url: "product_2.jpg",
  price: 20.00
)

Product.create!(
  title: "Camisa Kenneth Stevens",
  description: "Camisa manga corta para hombre Ehan",
  image_url: "product_3.jpg",
  price: 20.00
)

Product.create!(
  title: "Polo Kenneth Stevens",
  description: "Polo Kenneth Stevens para hombre Monet La Point",
  image_url: "product_4.jpg",
  price: 20.00
)






