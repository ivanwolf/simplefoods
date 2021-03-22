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


manomorena = Store.create(
  name: "Mano Morena",
  slug: "manomorena",
  email: "contacto@manomorena.cl",
  phone_number_attributes: { country_code: 56, number: 948454110 }
)

patagonia_sabores = Store.create(
  name: "Patagonia Sabores",
  slug: "patagoniasabores",
  email: "contacto@patagoniasabores.cl",
  phone_number_attributes: { country_code: 56, number: 948454110 }
)

user = User.create(email: "admin@manomorena.cl", store_id: manomorena.id)
user.password = "123456"
user.save!

user = User.create(email: "admin@patagonia.cl", store_id: patagonia_sabores.id)
user.password = "123456"
user.save!


ActsAsTenant.with_tenant(manomorena) do


  timestamps = { created_at: Time.zone.now, updated_at: Time.zone.now, store_id: manomorena.id }

  workdays = [
    { work_date: Date.today.yesterday },
    { work_date: Date.today },
    { work_date: Date.today.tomorrow }
  ].map { |value| value.merge(timestamps)}

  Workday.insert_all(workdays)

  products = [
    { name: "Porotos", price: 4000 },
    { name: "Ceviche", price: 5000 },
    { name: "Humitas", price: 1500 },
    { name: "Empanadas", price: 1700}
  ].map { |value| value.merge(timestamps)}

  Product.insert_all(products)

  Product.all.each do |product|
    filename = "#{product.name.downcase}.jpg"
    product.cover_photo.attach(
      io: File.open(Rails.root.join('test/fixtures/files', filename)),
      filename: filename
    )
  end

  customers = [
    { name: "Iván", last_name: "Wolf Olivares", phone_number: "948454110", address: "Porcuro 2623", apartment: 701 },
    { name: "Natalia", last_name: "Valenzuela Lepio", phone_number: "941640026", address: "Simón Bolivar 5020", apartment: 24 },
    { name: "Oscar", last_name: "Carrasco", phone_number: "962058917", address: "Carlos Antúnez 650", apartment: 1212 },
    { name: "Valentina", last_name: "Wolf Olivares", phone_number: "978873819", address: "Vivar 124", apartment: 121 }
  ].map { |value| value.merge(timestamps)}

  Customer.insert_all(customers)

  Workday.all.each do |workday|

    stocks = [10, 20, 30]
    delivery_time = Date.today.midday + 1.hour

    products = Product.all.sample(3)

    products.each do |product|
      WorkdayProduct.create(workday_id: workday.id, product_id: product.id, stock: stocks.sample, delivery_time: delivery_time)
    end

    quantities = [1, 3, 5]

    Customer.all.sample(3).each do |customer|
      order = Order.create(customer: customer, workday: workday)

      workday.workday_products.sample(2).each do |workday_product|
        order.order_products << OrderProduct.create(workday_product: workday_product, quantity: quantities.sample)
      end

      order.save
    end
  end
end
