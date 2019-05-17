# NEF Scanning App

NEF Scanning App is a Web Application that offers people an easy way to organise and manage a conference. This application has been developed with the following purposes in mind:
-   **Ease of use** - To make the use of the system robust and simple to use. Every function that the system provides is easy to understand and perform.
    
-   **Functionality** - The tasks that were set at the beginning have been achieved and implemented in a robust and useful manner. The application allows for a conference to be fully organised and managed without any delays or errors.
    
-   **Performance** - Since a conference can potentially quite large, performance is quite important. Thankfully to the simplicity of the system, a large number of participants in a conference should not impose a thread.


# Prerequisites

These have been known to work:
1.  Compatible Browser: IE => 11.2, Mozilla, Chrome..
    
2.  [Ruby](https://www.ruby-lang.org/en/): Version 2.4.4
    
3.  RubyGems: Version 2.6.14
    
4.  [Ruby on Rails:](https://guides.rubyonrails.org/index.html)  Version 5.2.1
    
5.  [Bundler](https://bundler.io/): Version 1.16.5
    
6.  Linux OS: Ubuntu 18.04

## Installation

Provided you have access to the files and permission to download and install the gems from the Gemfile, there are two steps to do before being able to run the application:

1.  Create a database.yml file. This should be located in the ‘/config’ folder:
```yml
development: &defaults  
adapter: postgresql  
min_messages: warning  
host: hostname  
username: username  
password: 'example_password'  
database: db_name  
  
test:  
<<:  *defaults  
database: db_test_name
```
2.  Run the following commands in consecutive order:
```bash
bundle exec rails db:migrate  
bundle exec rails db:seed  
bundle exec rails s
```
Following that, you should see and see the app on [http://localhost:3000](http://localhost:3000) :
```bash
Listening on localhost:3000, CTRL+C to stop
```

## System Functionality

The application mainly allows for a conference organiser to scan a user’s QR code and thus allow access to the conference. Further than that, both types of users are given different functionalities based on their role. All of these functionalities can be seen on the User Manual Document in depth. Basically these functions are:

* From **Delegate** Side:
	-   See own badge
	-   See timetable of conference
	-   See a map of the conference
	-   Go to a feedback form
	-   Change account information
	-   See notifications about the conference
* From **Organiser** side:
	-   See own badge    
	-   Scan QR codes
	-   Add users
	-   Manage Notifications
	-   Manage Timetables
	-   Manage Participants
	-   Manage Conferences
	-   Manage Bookings

## Maintenance

### Users:

After seeding the database, two users will be created:
-   Delegate
	-   **Username**: delegate
	    
	-   **Password**: password
-   Admin
	-   **Username**: admin
	    
	-   **Password**: password

### QR Scanning:

For the QR scanning, we decided to use [Instascan](https://github.com/schmich/instascan) - a Javascript library. It provides an extensive API support. However, we have encountered some issues with the library, it being a bit unreliable due to some issues with the javascript code. Due to that, we have provided the instascan minified javascript file.

**Important**: Chrome browser sometimes won’t load the camera scanner. If that happens, Mozilla has been tested and known to work.

  

### Timetable:

Admin users can upload images to the database, which uses the ‘carrierwave’ gem.

## Deployment

In order to deploy to a website there are a few steps that need to be taken in order for the deployment to work:

1. **Preparing the Project**

Change the following files:

-   **config/deploy.rb**
```ruby
set :repo_url, 'yourrepo@yoururl.git'  
set :application, 'applicationname
```

 -  **config/deploy/demo.rb**

```ruby
## Application deployment configuration  
set :server, 'server.example.com'  
set :user, 'user.example'  
set :deploy_to, -> { "/srv/services/#{fetch(:user)}" }  
set :log_level, :debug  
  
## Server configuration  
server fetch(:server), user: fetch(:user), roles:  %w{web app db}  
  
## Additional tasks  
namespace :deploy  do  
  task :seed  do  
    on primary :db  do within current_path do with rails_env: fetch(:stage) do  
  execute :rake, 'db:seed'  
end  end  end  
end  
end
```

2. **Configure Errors**

We used a gem called Airbrake to track errors that are happening in the deployed application. You must configure that in:

  

- **config/initializers/errbit.rb**

  
```ruby
Airbrake.configure do  |config|  
  config.api_key = 'REPLACE_ME'  
  config.host = 'host.example'  
  config.port = 443  
  config.secure = config.port == 443  
end
```
3. Commit Changes

```bash
# Add any untracked files to the next commit  
git add -A  
  
# Commit to your repository, replacing {message} with a relevant commit message  
git commit . -m "{message}"  
  
# Push your changes to your team repository  
git push -u origin master
```
4. Deployment

Run the following command to deploy to the website:

```bash
# Tag a release and deploy to the demo site  
bundle exec epi_deploy release -d demo
```
  
**Important**: If you are using macOS, you will need to add your SSH key to the Keychain by running ssh-add -K ~/.ssh/id_rsa before deploying.

5. Seeding the Database

In order to seed information to the database you will need to run the following command:

```bash
bundle exec  cap demo deploy:seed
```


 

