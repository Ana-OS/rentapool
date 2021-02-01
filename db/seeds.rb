# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"

Booking.destroy_all
Pool.destroy_all
User.destroy_all

puts "users destroyed"

user = User.create!(first_name: "John", last_name: "Smith", email: "john@email.com", password: "123456")
user1 = User.create!(first_name: "Ana", last_name: "Smith", email: "ana@email.com", password: "123456")
user2 = User.create!(first_name: "Steve", last_name: "Smith", email: "Steve@email.com", password: "123456")
user3 = User.create!(first_name: "Chloé", last_name: "Smith", email: "chloe@email.com", password: "123456")
user4 = User.create!(first_name: "Louis", last_name: "Smith", email: "louis@email.com", password: "123456")


puts "users created"

pool = Pool.create!(name: "Backyard Pool", description: "Nam id sollicitudin mi. Nulla dictum tristique commodo. In hac habitasse platea dictumst.", address: "Rua do Ouro, Lisboa", rating: 4, price_hour: 10, user: user)
pool1 = Pool.create!(name: "Infinity Pool", description: "Nam id sollicitudin mi. Nulla dictum tristique commodo. In hac habitasse platea dictumst.", address: "Avenida dos Aliados, Porto", rating: 5, price_hour: 15, user: user1)
pool2 = Pool.create!(name: "Natural Pool", description: "Nam id sollicitudin mi. Nulla dictum tristique commodo. In hac habitasse platea dictumst.",  address: "Wyndham Road, London", rating: 3, price_hour: 20, user: user2)
pool3 = Pool.create!(name: "Indoor Pool", description: "Nam id sollicitudin mi. Nulla dictum tristique commodo. In hac habitasse platea dictumst.",  address: "Boulevard St. Germain, Paris", rating: 4, price_hour: 25, user: user3)
pool4 = Pool.create!(name: "Transparent Pool", description: "Nam id sollicitudin mi. Nulla dictum tristique commodo. In hac habitasse platea dictumst.", address: "Tenessee Avenue, Los Angeles", rating: 5, price_hour: 30, user: user4, photo: "https://res.cloudinary.com/dhjbcdzxb/image/upload/v1611666638/Pool2_pravkf.jpg'")

puts "pools created"

puts "adding photos"

# file1 = File.open() - use for local file

file = URI.open('https://res.cloudinary.com/dhjbcdzxb/image/upload/v1611666638/Pool2_pravkf.jpg')
pool.photo.attach(io: file, filename: 'filename.png', content_type: 'image/png')

file = URI.open('https://res.cloudinary.com/dhjbcdzxb/image/upload/v1611666531/infinitypool_uowfhx.jpg')
pool1.photo.attach(io: file, filename: 'filename.png', content_type: 'image/png')

file = URI.open('https://res.cloudinary.com/dhjbcdzxb/image/upload/v1611666504/naturalpool_so6rsf.jpg')
pool2.photo.attach(io: file, filename: 'filename.png', content_type: 'image/png')

file = URI.open('https://res.cloudinary.com/dhjbcdzxb/image/upload/v1611666477/indoorpool_bwpody.jpg')
pool3.photo.attach(io: file, filename: 'filename.png', content_type: 'image/png')

file = URI.open('https://res.cloudinary.com/dhjbcdzxb/image/upload/v1611666468/transparentpool_oltcqc.jpg')
pool4.photo.attach(io: file, filename: 'filename.png', content_type: 'image/png')






