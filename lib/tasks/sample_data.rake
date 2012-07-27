require 'faker'

namespace :db do
  desc  "Fill database with sample database"
  task populate: :environment do
    # Story.create!(url: "URl",
    #             title: "Title")

    # User.create!(twitter_handle: "Example User")

    99.times do |n|
      url = "www.#{n}-example.com"
      title = Faker::Company.catch_phrase

      Story.create!(url: url,
                  title: title,
                  user_id: (rand(20) + 1))

      twitter_handle  = Faker::Name.name
      User.create!(twitter_handle: twitter_handle)
    end
  end
end