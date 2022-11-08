puts 'Removing the restaurants...'
Restaurant.destroy_all

chefs = ['Joyce', 'Ayhem', 'Kaho', 'Clement', 'Christopher', 'Tashika', 'Fred', 'Sho', 'Will', 'Sammy', 'Yumi', 'Sunny', 'Patrik', 'Yulia', 'Tom', 'Hafid', 'Mo', 'Patrick', 'Soren', 'Erika', 'Alex', 'Mattias', 'Savi', 'Keita']

puts "Creating #{chefs.count} Restaurants..."
chefs.shuffle.each do |name|
  Restaurant.create!(
    name: "#{name}'s #{Faker::Restaurant.name}",
    address: Faker::Address.street_address,
    rating: rand(1..5),
    category: Faker::Restaurant.type.split.first
  )
end
puts "...created #{Restaurant.count} restaurants"
