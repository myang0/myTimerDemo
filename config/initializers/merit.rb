# Use this hook to configure merit parameters
Merit.setup do |config|
  # Check rules on each request or in background
  # config.checks_on_each_request = true

  # Define ORM. Could be :active_record (default) and :mongoid
  config.orm = :active_record

  # Add application observers to get notifications when reputation changes.
  # config.add_observer 'MyObserverClassName'

  # Define :user_model_name. This model will be used to grand badge if no
  config.user_model_name = "User"
  # `:to` option is given. Default is 'User'.
  # config.user_model_name = 'User'

  # Define :current_user_method. Similar to previous option. It will be used
  # to retrieve :user_model_name object if no `:to` option is given. Default
  # is "current_#{user_model_name.downcase}".
  # config.current_user_method = 'current_user'
end

# Create application badges (uses https://github.com/norman/ambry)
# badge_id = 0
# [{
#   id: (badge_id = badge_id+1),
#   name: 'just-registered'
# }, {
#   id: (badge_id = badge_id+1),
#   name: 'best-unicorn',
#   custom_fields: { category: 'fantasy' }
# }].each do |attrs|
#   Merit::Badge.create! attrs
# end

Merit::Badge.create!(
  id: 1,
  name: "Rookie!",
  description: "Complete your 1st session as a user.  Keep it up!",
  custom_fields: {image_path: "/images/bronze_medal.png", hint: "complete sessions"}
)

Merit::Badge.create!(
  id: 2,
  name: "Intermediate!",
  description: "Complete your 10th session as a user.  Great improvement!",
  custom_fields: {image_path: "/images/silver_medal.png", hint: "complete more sessions"}
)

Merit::Badge.create!(
  id: 3,
  name: "Veteran!",
  description: "Complete your 50th session as a user.  Nice work!",
  custom_fields: {image_path: "/images/gold_medal.png" , hint: "complete even more sessions"}
)

Merit::Badge.create!(
  id: 4,
  name: "Pro!",
  description: "Complete your 250th session as a user.  You're a champion!",
  custom_fields: {image_path: "/images/trophy.png", hint: "complete yet even more sessions"}
)

Merit::Badge.create!(
  id: 5,
  name: "Focused!",
  description: "Complete a session that is an hour long.",
  custom_fields: {image_path: "/images/focused.png", hint: "???"}
)

Merit::Badge.create!(
  id: 6,
  name: "...That's it?",
  description: "Complete a session that is just a minute long.",
  custom_fields: {image_path: "/images/underachiever.png", hint: "???"}
)

Merit::Badge.create!(
  id: 7,
  name: "Hot Streak!",
  description: "Complete 5 sessions in a row.",
  custom_fields: {image_path: "/images/flame1.png", hint: "complete sessions without failing"}
)

Merit::Badge.create!(
  id: 8,
  name: "Hotter Streak!",
  description: "Complete 10 sessions in a row.",
  custom_fields: {image_path: "/images/flame2.png", hint: "complete more sessions without failing"}
)

Merit::Badge.create!(
  id: 9,
  name: "Hottest Streak!",
  description: "Complete 25 sessions in a row.",
  custom_fields: {image_path: "/images/flame3.png", hint: "complete even more sessions without failing"}
)