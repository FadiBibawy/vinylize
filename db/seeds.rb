# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'open-uri'
require 'faker'


img_urls = [
  "https://images.unsplash.com/photo-1502471074209-74d89da65ef2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
  "https://images.unsplash.com/photo-1526394931762-90052e97b376?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
  "https://images.unsplash.com/photo-1535992165812-68d1861aa71e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=390&q=80",
  "https://images.unsplash.com/photo-1452639479057-3f773899ab7d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
  "https://images.unsplash.com/photo-1619983081563-430f63602796?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
  "https://images.unsplash.com/photo-1492284163710-4eef97892705?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=388&q=80",
  "https://images.unsplash.com/photo-1491421722235-b556e8f64dab?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
  "https://images.unsplash.com/photo-1514846160150-2cfb150b48ea?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=393&q=80",
  "https://images.unsplash.com/photo-1496293455970-f8581aae0e3b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=813&q=80"
]

quality = ["good", "very good", "fair", "not bad"]

Vinyl.destroy_all
puts "Starting the seed!"
img_urls.each_with_index do |img_url, index|
  file = URI.open(img_url)
  vinyl = Vinyl.new(artist: Faker::Music::Hiphop.artist, release_year: rand(1950..2010), genre: Faker::Music.genre, quality: quality.sample,
                    record_title: Faker::Music::Opera.mozart, price_per_day: rand(8.5..32.25).round(2))
  vinyl.photo.attach(io: file, filename: "#{rand(1.5..3.0)}image.png", content_type: "image/png")
  vinyl.user = User.all.sample
  vinyl.save
  puts "#{vinyl.record_title.capitalize} created successfully!"
end
puts "All Vinyls created!"
