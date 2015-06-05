#SBNotes for CS48

**Instructor:** Mike Costanzo

**Authors:** Andrew Tran, Ishi Von Meier, Nicholas Poon, Omeed Rabani, Yamen Alghrer

**Date:** May 15 2015

**URL:** www.sbnotes.me





###Directory Structure Main Files 
######(Description of most important files/folders)

	app/ : Application components
		-controllers/: Contains controller classes which handle web requests from the user.
		-helpers/: Holds any helper classes used to assist the model, view, and controller classes.
		-models/: These are our own created classes.  
		-views/: These are html templates that are used when browsing the site and are filled in with data.  
	


	bin/ : Contains executables
		-bundle/
		-rails/
		-rake/

	ckeditor/ : Directory for CKEDITOR, a text editor incorporated with Note feature.

			*** SOURCE: http://ckeditor.com/
			*** GITHUB: https://github.com/ckeditor/ckeditor-dev
			*** DOCUMENTATION: http://docs.cksource.com/
	
		-adapters/: Contains jQuery Adapter which provides intergration of jQuery and CKEditor.  Allows using native features of jQuery when using CK Editor.
		-lang/: Stores language-related functions. 
		-plugins/: Manages plugins registration and loading.
		-samples/: Collection of samples to verify if installation was successful.
		-skins/: Stores sprites and scripts for skin.

		-ckeditor.js: This is the API entry point. The entire CKEditor code runs under this object.
		-build-config,js: Stores default configuration settings. Changes to this object are reflected in all editor instances, if not specified otherwise for a particular      
		                  instance.  

		                  *** Resource for setting configuration: http://docs.ckeditor.com/#!/guide/dev_configuration



	config/ 
		-routes.rb: This file organizes the routing of the site. It organizes which paths are associated with what variables. This is used when redirecting the user from page to page.  

	
	
	db/
		-migrate/: These are scripts that make changes to the format of the database.  

	

	log/ : Contains error logs
		-development.log: Error log for Rails development environment.



	public/ : Directory for web files (HTML files, stylesheets, graphics, Javascript files)
		-assets/: Contains directories bootstrap/ and ckeditor/

	
	
	test/ : Testing will be organized throughout this folder  
		-fixtures/: These are generic placeholders for when doing testing.  



	tmp/ : Contains emporary files for intermediate processing.



	 vendor/ : Libraries provided by third-party vendors




###Setting up development environment for SBNotes on Linux OS


#####Contents

1.		Setting Up Git 
2.		Installing Ruby Using RVM  
3.	Installing Rails  
4.		POSTGRESQL  
5.		Finishing 





#####1.	Setting up Git

Install Git and cloning repository to system:
	
	$ sudo apt-get install git
	$ git clone https://github.com/omeedrabani/sbnotes.git

Or instead move the files from the USB into the folder you will be working in.



#####2.	INSTALLING RUBY USING RVM

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





#####3. INSTALLING RAILS

Optional for installing Rails into project-specific gemset

	$ rvm use ruby-2.2.2@rails4.2 --create

Install Rails

	$ gem install rails
	$ rails -v # To verify if rails is properly installed.  





#####4.	POSTGRESQL

Install PostgreSQL and PostGIS

	$ sudo apt-get install postgresql-9.3-postgis-2.1 pgadmin3

Creating user role in PostgreSQL

	$ sudo su - postgres
	$ createuser -s --username=postgres MYUSERNAME
	$ exit





#####5.	FINISHING 

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
	$ rake db:migrate
	$ rails server

In order to run the unit tests  

	$ bundle exec rake test




YOU HAVE SUCCESSFULLY SET UP SBNOTES LOCALLY. TO ACCESS THE WEBPAGE 
ENTER YOUR PREFERRED WEB BROWSER AND NAVIGATE TO "localhost:3000" 

If there are any difficulties setting up, you can also visit  http://www.sbnotes.me  to the site in its native form.