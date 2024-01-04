[![hire-badge](https://img.shields.io/badge/Consult%20/%20Hire%20Theophile-Click%20to%20Contact-brightgreen)](mailto:fadhili.kango@gmail.com ) [![Twitter Follow](https://img.shields.io/twitter/follow/Theophadh?label=Follow%20Theophile%20on%20Twitter&style=social)](https://twitter.com/Theophadh)

# REALTIME SEARCH

> A realtime search box, where users search articles, and then have analytics that display what they were searching for.

## LIVE DEMO
[Real Search](https://realtime-search.onrender.com/)

## Screenshot

<img width="1364" alt="Screenshot 2024-01-04 at 16 44 24" src="https://github.com/Theophile-Kango/realtime_search/assets/49276315/207791f3-7140-4bfd-9f8a-7e7682de214e">


## Built With

- Ruby 2.7.6p219 
- Ruby on rails 7.0.8
- Postgresql database
- Sidekiq

## Prerequisites

- Get ruby 2.7.6p219 installed
- Get ruby on rails 7.0.8
- Get postgresql installed
- Sidekiq <br />

### Setup

- Clone the repository on your local machine
- cd into the folder
- Create a .env file at the root of the project with variables. fill the varialbe `API_KEY={api_key}` with a key from <a href="https://newsapi.org/account" target="_blank">News API</a>
- run bundle install
- run rails db:create<br />
  The command will create the development database as well as the test database
- run rails db:migrate
- run rails server
- If everything is correct, the server will run on port 3000

## About the project

When a user types into the search input, the entered data will be saved. To enhance scalability, a background job will be triggered after a user stops typing for 3 seconds. This approach optimizes the application's performance by offloading the saving process to a background task, ensuring a smoother user experience.



