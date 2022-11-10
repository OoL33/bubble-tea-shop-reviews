# Bubble Tea Devotees

With this app, users are able to see shops and reviews for bubble tea shops around Boston, MA. Signed in users can create reviews, and admin roles can create shops.

This app is built using React on Rails and Postgres.

## Contributors

Alana Lee, Karen Wong, Kathleen Foley, Taylor Le 

## Ruby Version

- Ruby 2.7.3

## System Dependencies

- Rails 7.0.4
- PostgreSQL 14.5
- Devise gem for Authentication


## Instructions to Run Application Locally

I. Set up the project 
1. `git clone https://github.com/OoL33/bubble-tea-shop-reviews.git`
2. `bundle install` (To install gem dependencies)
3. `yarn install` (To install package manager)

II. Create and Seed Database
1. `bundle exec rake db:create`
1. `bundle exec rake db:migrate`
2. `bundle exec rake db:seed` (Seeded database will include a list of shops, group of users, and reviews. Reviews are populated only for Gong Cha and OneZo.)

III. In a separate terminal window, 
1. `run bundle exec rails s`
2. navigate to [localhost/3000](http://localhost:3000/)


