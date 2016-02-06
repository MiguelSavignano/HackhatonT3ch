# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
cities = City.create([{ name: 'Madrid' }, { name: 'Leganés' }, {name: 'La Pueblanueva'}, {name: 'Getafe'}, {name: 'Toledo'}, {name: 'Valencia'}, {name: 'Sevilla'}, {name: 'Narnia'}])
User.create(email:"test@test.com",password:"12345678")
#   Mayor.create(name: 'Emanuel', city: cities.first)
City.first.cities << Notice.new(title:"Hola",description:"desctipcion larga")
