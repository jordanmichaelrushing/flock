# README

## Setting up

 * git clone git@github.com:rushingfitness/flock.git
 * Make sure PG is started
 * rake db:create
 * rake db:migrate
 * rake db:seed
 * rails s
 * Create & update to your hearts content



## Addl Features (To be written in the future)

  * Have stock quotes only be able to be created via the API & only by certain users
    * Implement CanCanCan for this ability
    * User association is currently commented out, didn't have enough time to finish it up

  * Use built-in WebSockets to update the latest stock quote when it's updated in the DB

  * On the front end, only allow certain users (specifically user roles) to be able to edit or create stocks, exchanges
    * Right now it is available to anyone to update or create which in a prod env would make the system meaningless.

  * Make the front end look much cleaner

  * Finish the API
    * Finish the sessions controller to be able to sign in and sign out
    * Use ACLs from above
    * Add tests for the sessions & resource controllers

  * Current tests are minimal, mainly because the code is minimal. As the controller & model logic gets more complex, the tests should reflect these changes. Model tests are testing defined Rails functionality currently and are neccessarily needed, but time constraints & the need for some tests dictate what must be done.


## Problem Set

  ### Problem #1

    * StockMarket Exchange
      - [X] Exchange (NASDAQ, NYSE, etc)
      - [X] Stock
      - [X] StockQuote
      - [X] Transaction (Originally had this as a separate model, but it was too similar to StockQuote so just merged it in)


  ### Problem #2 

    * Build an HTML and Json Stock Item CRUD endpoint. At the end of it, another rails savvy developer should be able to clone the repo, follow instructions in the README, and use the application to CRUD Stocks.


  ### Problem #3

    * Choose 5-7 specs to implement in both the models and controller
