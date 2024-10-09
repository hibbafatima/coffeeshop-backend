### Backend README (Rails)

# Coffee Shop Backend

This is the backend API for the Coffee Shop project built with Ruby on Rails. It provides the API for managing coffee shop items and user orders.

## Features
- Create, read, update, and delete coffee items.
- Manage user orders and associated items.
- Eager load associations to optimize API performance.

## Technologies Used
- Ruby on Rails

## Getting Started

### Prerequisites

- Ruby (version 3.2.2 or later)
- Rails (latest version)

### Installation

1. Clone the repository:
   git clone https://github.com/yourusername/coffeeshop-backend.git
   cd coffeeshop-backend

2.Install the dependencies:
  bundle install

3.Setup the database:
  rails db:create
  rails db:migrate
  rails db:seed

4.Start the Rails server:
  rails server

The API will be running at http://localhost:3000.

API Endpoints

Users
POST /users - Create a new user (new user registration)
GET /users/new - Show the form for creating a new user

Orders
GET /users/:user_id/orders - List all orders for a specific user
GET /users/:user_id/orders/:id - Show details of a specific order
GET /users/:user_id/orders/new - Show the form for creating a new order
POST /users/:user_id/orders - Create a new order for a specific user

Items
GET /items - List all available items

Locations
GET /locations - List all available locations
