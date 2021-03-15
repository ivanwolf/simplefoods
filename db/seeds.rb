# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


user = User.create(email: "admin@sfood.cl")
user.password = "123456"
user.save!

workdays = [
  { work_date: Date.today.yesterday },
  { work_date: Date.today },
  { work_date: Date.today.tomorrow }
].map { |value| value.merge(created_at: Time.zone.now, updated_at: Time.zone.now)}

Workday.insert_all(workdays)

products = [
  { name: "Porotos", price: 4000 },
  { name: "Ceviche", price: 5000 },
  { name: "Humitas", price: 1500 },
  { name: "Empanadas", price: 1700}
].map { |value| value.merge(created_at: Time.zone.now, updated_at: Time.zone.now)}

Product.insert_all(products)

Product.all.each do |product|
  filename = "#{product.name.downcase}.jpg"
  product.cover_photo.attach(
    io: File.open(Rails.root.join('test/fixtures/files', filename)),
    filename: filename
  )
end