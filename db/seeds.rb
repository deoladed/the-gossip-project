puts 'Initialisation..'
puts 'Cleaning the database..'
City.destroy_all
puts 'Cities destroyed'
User.destroy_all
puts 'Users destroyed'
Potin.destroy_all
puts 'Gossips destroyed'
Comment.destroy_all
puts 'Comments destroyed'
Tag.destroy_all
puts 'Tags destroyed'
Like.destroy_all
puts 'Likes destroyed'
PrivateMessage.destroy_all
puts 'PM destroyed'
puts 'Database cleaned'

puts 'Starting to seed..'
10.times do
	City.create(name: Faker::GameOfThrones.city, zip: Faker::Address.zip_code)
end
puts '10 cities created'
 
10.times do
	User.create(first_name: Faker::GameOfThrones.character, last_name: Faker::StarWars.character, description: Faker::Lorem.paragraphs, age: rand(20..40), email: Faker::Internet.free_email, city: City.all.sample)
end
puts '10 users created'
 
20.times do
	Potin.create(title: Faker::NewGirl.quote, content: Faker::Lorem.paragraphs(4), date: Faker::Date.backward(15), user: User.all.sample)
end
puts '20 gossips created'
 
10.times do
	Tag.create(title: Faker::Hacker.adjective)
end
puts '10 #tags created'
 
# Au moins un tag par potin
Potin.all.each do |potin|
	rand(1..3).times do
		potin.tags << Tag.all.sample
	end
end

## Quelques comment de potins
20.times do 
	Comment.create(content: Faker::Lorem.paragraphs, user: User.all.sample, commenteable: Potin.all.sample)
end
puts '20 comments created'
 
## Puis quelques comment de comment, des bebes comment quoi
20.times do 
	Comment.create(content: Faker::Lorem.paragraphs, user: User.all.sample, commenteable: Comment.all.sample)
end
puts '20 baby comments created'
 
# Des likes polymorphics, comme ca on peut liker un article OU un comment, mais forcement un des deux.
20.times do
	Like.create(user: User.all.sample, likeable: [Potin.all, Comment.all][rand(0..1)][rand(1..20)])
end
puts '20 likes created'
 
# Et un petit MP, dans une boucle times pour en creer plus si besoin
1.times do
 pm = PrivateMessage.new
 pm.sender = User.all.sample
 pm.recipients << User.all.sample
 pm.recipients << User.all.sample
 pm.recipients << User.all.sample
 pm.save
end
puts "1fuckin' PM created"
puts 'Seeding over, enjoy your new database'
