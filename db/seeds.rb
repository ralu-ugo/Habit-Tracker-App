# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Habit.destroy_all
User.destroy_all
Calendar.destroy_all
puts "Cleaning database..."

puts "Creating Users and Habits"
count = 0

15.times do
  user = User.create(email: Faker::Internet.email, password: "123456")

  3.times do
    Habit.create(
      title: Faker::Hobby.activity,
      description: Faker::Hobby.activity,
      favourite: false,
      start_date: Date.today,
      end_date: Faker::Date.forward(days: 100),
      user_id: user.id,
      repeat: [true, false].sample,
      monday: :repeat ? true : [true, false].sample,
      tuesday: :repeat ? true : [true, false].sample,
      friday: :repeat ? true : [true, false].sample,
      saturday: :repeat ? true : [true, false].sample,
      sunday: :repeat ? true : [true, false].sample
    )
  end
  count += 1
  puts "#{count} set done."
end

user = User.create(email: Faker::Internet.email, password: "123456")
Calendar.create(calendar_start_date: Date.today, calendar_end_date: Faker::Date.forward(days: 100), calendar_type: "month", user_id: user.id)
