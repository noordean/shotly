# Shotly
An API that shortens long and ugly URLs. 

## Development
This app was developed using ruby on rails with postgres database.

## Technologies Used
* [Ruby:](https://www.ruby-lang.org/en/) Ruby is a dynamic, open source programming language with a focus on simplicity and productivity. It has an elegant syntax that is natural to read and easy to write.
* [Rails:](https://http://rubyonrails.org/) Ruby on Rails, or Rails, is a server-side web application framework written in Ruby under the MIT License. Rails is a model–view–controller framework, providing default structures for a database, a web service, and web pages
* [PostgreSQL:](https://www.postgresql.org/) PostgreSQL is a powerful, open source object-relational database system (ORDBMS) that offers modern database features such as complex queries, foreign keys, etc.

## Available Endpoints
1. <b>POST:</b> /users <br>
   <b>Payloads:</b>
      - username(string)
      - password(string)
      - email(string)

2. <b>POST:</b> /login <br>
   <b>Payloads:</b>
      - username(string)
      - password(string)

3. <b>GET:</b> /user/total <br>
   <b>Payloads:</b>
      - No payload

4. <b>GET:</b> /url/total <br>
   <b>Payloads:</b>
      - No payload

5. <b>POST:</b> /urls <br>
   <b>Payloads:</b>
      - original_string(string)
   <b>Headers:</b>
      - token(string) optional

6. <b>GET:</b> /user/urls <br>
   <b>Headers:</b>
      - token(string)

7. <b>GET:</b> /url/:id/locations <br>
   <b>Headers:</b>
      - token(string)

## Installation
- Clone this repository to have the app on your machine with ```git clone https://github.com/noordean/shotly.git```
- Change directory to the app's root with ```cd shotly```
- Pull the develop branch with ```git pull origin develop```
- Then run ```bundle install```  to install the dependencies
- Start the server with ```rails s```
- Then using postman, you can consume `an_endpoint` with ```http://localhost:3000/an_endpoint```

## How to Contribute
- Fork this repository.
- Clone it.
- Create your feature branch on your local machine with ```git checkout -b your-feature-branch```
- Push your changes to your remote branch with ```git push origin your-feature-branch```
- Open a pull request against the develop branch, and describe how your feature works

### Author
Nurudeen Ibrahim
