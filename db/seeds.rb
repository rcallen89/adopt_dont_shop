# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

mike = Shelter.create(name: "Mike's Shelter",
               address: "1331 17th Street",
               city: 'Denver',
               state: 'CO',
               zip: '80202')

meg = Shelter.create(name: "Meg's Shelter",
               address: "150 Main Street",
               city: 'Hershey',
               state: 'PA',
               zip: '17033')

Pet.create(name: "Athena",
           age: "1",
           sex: "F",
           description: 'Butthead',
           image: 'https://image.shutterstock.com/image-photo/beagle-running-over-green-meadow-600w-1563583912.jpg',
           status: "Adoptable",
           shelter_id: mike.id)

Pet.create(name: "Odell",
           age: "4",
           sex: "M",
           description: 'good dog',
           image: 'https://image.shutterstock.com/image-photo/beagle-running-over-green-meadow-600w-1563583912.jpg',
           status: "Adoptable",
           shelter_id: meg.id)