# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(name: 'Boring', email: 'boring25@company.com', password: 'boringcompany', gender: 'Female', date_of_birth: '1996-02-09 06:15:20')
User.create(name: 'Elon', email: 'elon@musk.com', password: 'teslaislife', gender: 'Male', date_of_birth: '1980-02-09 12:50:20')
User.create(name: 'Solarcity', email: 'solar@city.com', password: 'solarisfuture', gender: 'Female', date_of_birth: '2008-02-09 08:05:20')
User.create(name: 'Starman', email: 'starman@spacex.com', password: 'roadsterisawesome', gender: 'Male', date_of_birth: '2018-02-05 01:15:20')

