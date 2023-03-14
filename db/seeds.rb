# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Calendar.destroy_all

HabitSlot.destroy_all
Habit.destroy_all
User.destroy_all
puts "Cleaning database..."

puts "Creating Users and Habits"
count = 0

# user = User.create(email: "test@test.com", password: "123456")

2.times do
  
  user = User.create(email: Faker::Internet.email, password: "123456")


  3.times do
    Habit.create(
      title: Faker::Hobby.activity,
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
      favourite: [true, false].sample,
      start_date: Date.today,
      end_date: Faker::Date.forward(days: 100),
      user_id: user.id,
      repeat: [true, false].sample,
      everyday: :repeat ? true : false,
      monday: :everyday ? true : [true, false].sample,
      tuesday: :everyday ? true : [true, false].sample,
      friday: :everyday ? true : [true, false].sample,
      saturday: :everyday ? true : [true, false].sample,
      sunday: :everyday ? true : [true, false].sample
    )

    Habit.all.last.habit_slots.each do |habit_slot|
      habit_slot.completed = [true, false].sample
      habit_slot.save!
    end
  end

  count += 1
  puts "#{count} set(s) done."
end
