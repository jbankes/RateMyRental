# Rate My Rental
Rate My Rental is an apartment rating web application

# Technologies
* Ruby
* Rails

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
 * `sudo apt-get install node.js`
 * `rails -v` We want version 4.2.6

# Usage
* `rails s -b 0.0.0.0` while in the project directory will run the application on http://localhost:3000

