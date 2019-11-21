# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

minDate = Time.now - 30.day
maxDate = Time.now

r1 = Record.create(uname: 'komi', duration: 10, success: true)
r1.created_at = rand(minDate..maxDate)
r1.save

r2 = Record.create(uname: 'komi', duration: 12, success: true)
r2.created_at = rand(minDate..maxDate)
r2.save

r3 = Record.create(uname: 'komi', duration: 34, success: true)
r3.created_at = rand(minDate..maxDate)
r3.save

r4 = Record.create(uname: 'komi', duration: 12, success: true)
r4.created_at = rand(minDate..maxDate)
r4.save

r5 = Record.create(uname: 'komi', duration: 5, success: true)
r5.created_at = rand(minDate..maxDate)
r5.save

r6 = Record.create(uname: 'komi', duration: 6, success: true)
r6.created_at = rand(minDate..maxDate)
r6.save

r7 = Record.create(uname: 'komi', duration: 12, success: true)
r7.created_at = rand(minDate..maxDate)
r7.save

r8 = Record.create(uname: 'komi', duration: 56, success: true)
r8.created_at = rand(minDate..maxDate)
r8.save

r9 = Record.create(uname: 'komi', duration: 34, success: false)
r9.created_at = rand(minDate..maxDate)
r9.save

r10 = Record.create(uname: 'komi', duration: 34, success: false)
r10.created_at = rand(minDate..maxDate)
r10.save

r11 = Record.create(uname: 'bouncy', duration: 10, success: true)
r11.created_at = rand(minDate..maxDate)
r11.save

r12 = Record.create(uname: 'bouncy', duration: 14, success: true)
r12.created_at = rand(minDate..maxDate)
r12.save
