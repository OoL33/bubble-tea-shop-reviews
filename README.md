# README
This app allows users to see and review bubble tea shops around Boston, MA.

This app is built using React on Rails and Postgres.

### Contributors

Alana Lee, Karen Wong, Kathleen Foley, Taylor Le 

### Ruby Version

- Ruby 2.7.3

### System Dependencies

- Rails 7.0.4
- PostgreSQL 14.5


### Instructions to Run Application Locally

I. Set up the project 
1. `git clone https://github.com/OoL33/bubble-tea-shop-reviews.git`
2. `bundle install` (To install gem dependencies)

II. Create and Seed Database
1. `bundle exec rake db:create`
1. `bundle exec rake db:migrate`
2. `bundle exec rake db:seed`

III. In a separate terminal window, 
1. `run bundle exec rails s`
2. navigate to [localhost/3000](http://localhost:3000/)


