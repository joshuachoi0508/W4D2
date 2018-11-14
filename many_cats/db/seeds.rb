# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Cat.create(name: 'Josh', birth_date: '5/8/1995', color: 'white', sex: 'M', description: 'Korean cat')
Cat.create(name: 'Josph', birth_date: '5/8/1995', color: 'orange', sex: 'M', description: 'Chinese cat')
Cat.create(name: 'Kat', birth_date: '3/4/1995', color: 'black', sex: 'F', description: 'Small cat')
Cat.create(name: 'Chase', birth_date: '1/10/1995', color: 'black', sex: 'M', description: 'Very loud cat with glasses and a nice smile')

CatRentalRequest.create(cat_id: 1, start_date: '13/11/2018', end_date: '20/11/2018')
CatRentalRequest.create(cat_id: 1, start_date: '12/11/2018', end_date: '13/11/2018')
CatRentalRequest.create(cat_id: 1, start_date: '20/11/2018', end_date: '25/11/2018')
CatRentalRequest.create(cat_id: 1, start_date: '12/10/2018', end_date: '13/10/2018')

# Table name: cat_rental_requests
#
#  id         :bigint(8)        not null, primary key
#  cat_id     :integer          not null
#  start_date :date             not null
#  end_date   :date             not null
#  status     :string           default("PENDING"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
