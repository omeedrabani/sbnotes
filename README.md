README FILE

SBNotes for CS32

Instructor: Mike Costanzo  
Authors: Andrew Tran, Ishi Von Meier, Nicholas Poon, Omeed Rabani, Yamen Alghrer  
Date: May 15 2015




### Setting up development environment for SBNotes on Ubuntu###




CONTENTS
I.		SETTING UP GIT  
II.		INSTALLING RUBY USING RVM  
III.	INSTALLING RAILS  
IV.		POSTGRESQL  
V.		FINISHING TOUCHES  





I.	SETTING UP GIT

Install Git and cloning repository to system:
	
	$ sudo apt-get install git
	$ git clone https://github.com/omeedrabani/sbnotes.git

Or instead move the files from the USB into the folder you will be working in.



II.	INSTALLING RUBY USING RVM

Update package manager

	$ sudo apt-get update


Install Curl and gpg2

	$ sudo apt-get install Curl
	$ sudo apt-get install gnupg2


Install mpapis public key to allow access to RVM database

	$ gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3


Install and update RVM (Ruby Version Manager)

	$ \curl -L https://get.rvm.io | bash -s stable --ruby
	$ source /home/MYUSERNAME/.rvm/scripts/rvm
	$ rvm get stable --autolibs=enable


Install Ruby 2.2.2

	$ rvm install ruby
	*** If you encountered the message "RVM is not a function..." 	 ***
	***	Use the command "bash --login" to run console as login shell ***
	$ rvm --default use ruby-2.2.2


Install Node.js (for JavaScript runtime)

	$ sudo apt-get install nodejs


Update Gem Manager

	$ gem update --system


Update Gems

	$ gem update


Install Bundler for managing Gems

	$ gem install bundler


Install Nokogiri 

	$ gem instasll nokogiri





III. INSTALLING RAILS

Optional for installing Rails into project-specific gemset

	$ rvm use ruby-2.2.2@rails4.2 --create

Install Rails

	$ gem install rails
	$ rails -v # To verify if rails is properly installed.  





IV.	POSTGRESQL

Install PostgreSQL and PostGIS

	$ sudo apt-get install postgresql-9.3-postgis-2.1 pgadmin3

Creating user role in PostgreSQL

	$ sudo su - postgres
	$ createuser -s --username=postgres MYUSERNAME
	$ exit





V.	FINISHING TOUCHES

Change directory into root of SBNotes

	$ cd SBNotes **or your preferred directory**

Install all the remaining Gems listed in the Gemfile

	$ bundle install

	*** If the message "You need to install postgresql-server-dev ... or libpq-dev" shows ***
	*** libpq-dev needs to be installed													  ***

			$ sudo apt-get install libpq-dev

			$ rake -T 

	**If everything is properly installed, a list of tasks will be shown

Starting up the server

	$ rake db:setup
	$ rails server




YOU HAVE SUCCESSFULLY SET UP SBNOTES LOCALLY. TO ACCESS THE WEBPAGE 
ENTER YOUR PREFERRED WEB BROWSER AND NAVIGATE TO "localhost:3000" 