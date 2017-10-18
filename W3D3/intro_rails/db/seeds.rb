# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


houses = House.create([{ address: '325 Union' }, { address: '11790 highway 17'}])

people = Person.create([{ name: 'Josh', house_id: '325 Union'.id }, { name: 'Lizzy', house_id: '325 Union'.id }, { name: 'Pat', house_id: '11790 highway 17'.id }, { name: 'Michelle', house_id: '11790 highway 17'.id }])
