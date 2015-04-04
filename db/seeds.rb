# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
	collection = Collection.create({name: "cool first collection of monuments"})
	monuments = Monument.create([{name: 'First Name', description: 'First description'},{name: 'Second Name', description: 'Second description'},{name: 'Third Name', description: 'Third description'}])
