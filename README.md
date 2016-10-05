# Rate My Rental
Rate My Rental is an apartment rating web application

# Technologies
* Ruby
* Rails
* Foundation
* SQLite 3
# Installation
* Installing Ruby
 * `sudo apt-get update`
 * `sudo apt-get install curl`
 * `gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3`
 * `\curl -L https://get.rvm.io | bash -s stable --ruby`
 * `ruby -v`  We want version 2.3.0
    - `rvm install ruby 2.3.0` to install correct verson if not right
    - `rvm --default use 2.3.0` 
* Installing Rails
 * `gem install --no-rdoc --no-ri rails` installs with out documentation to speed up instaliation
 * `rails -v` We want version 4.2.6
* Foundation
 * `bundle install
 * `rails g foundation:install
# Usage
* `rails s -b 0.0.0.0` while in the project directory will run the application on http://localhost:3000
* How to seed database
  - `rake db:drop`   drop current database
  - `rake db:migrate` 
  - `rake db:seed`   seed the database with the current seeds file

* If you change routes
  - `rake routes` to update the routes

