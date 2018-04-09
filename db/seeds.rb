# frozen_string_literal: true

# This file should contain all the record creation
# needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command
# (or created alongside the database with db:setup).
#
# Examples:
#
#  movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#  Character.create(name: 'Luke', movie: movies.first)
TRANSACTION_TYPES = %w[Referral Like Unlocked].freeze
wallet = Wallet.create(points: 0)
15.times do
  wallet.wallet_histories.create do |record|
    record.wallet_id = wallet.id
    record.recepient_name = Faker::Name.name
    random = wallet.points < 10 ? rand(2) : rand(3)
    record.transaction_type = TRANSACTION_TYPES[random]
    record.points = [10, 5, -10][random]
    wallet.points += record.points
  end
  wallet.update points: wallet.points
end
