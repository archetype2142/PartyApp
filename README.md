# PartyApp

Let users create a party from scratch without contacting multiple people. Service Providers can advertise services ranging from places for rent through DJs, Catering services etc. 

Current Market - None
Potential Market - School/College students, Weddings, Corporate Parties, Birthday Parties, Special events.

Running Rails v4.2.6
The app requires Devise for user authentication to work.

Using Puma webserver for development and production version. Uses MYSQL3 in development. Postgres in production on heroku.

Port to amazon aws on 3rd June.

DataBase has 2 tables

## User Table

Intended for the regular user all default constraints created by devise generator 

## ServiceProvider Table

Intended for the service providers and uses same constraints and columns as User table

Both tables have separate models with same names. Need to add additional forms and routs to service providers to add details.

# Required Pages
    
    Home
    Type of user
    Search Catalog
    Login, Registration, Password Reset
    About Provider
    About
    Terms Agreement

# Update 

2 Using Puma, removed WEBrick

1 Home page design v 1.0
	- Title
	- Jumbotron
	- How it works
	- Graphic models
	- Contact 
	- Footer

0 Home page design v 0.1
	- Full page image
	- TypedJs
	- Register redirect