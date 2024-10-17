# RoadMaster API

This API allows users to manage and interact with the inventory of a car dealership. The API provides endpoints for managing car brands, models, individual vehicles, and other related resources. It supports operations like adding, updating, and retrieving information on vehicles, models, and brands.

## Features

- Manage Manufacturers: Add, update, and delete car manufacturers.
- Manage Brands: Add, update, and delete car brands.
- Manage Models: Add, update, and delete car models. Models contain detailed specifications such as engine type, transmission, fuel type, and more.
- Manage Vehicles: Add, update, and delete individual vehicles. Vehicles are unique instances of a model with attributes like VIN, mileage, condition, and price.
- Query vehicles based on specific attributes like model, brand, or condition.
- Pagination support for retrieving lists of vehicles and models.

## Technologies

- Framework: Rails
- Database: PostgreSQL
- Authentication: Devise (for Rails) or other authentication mechanisms
- Authorization: Pundit (for Rails) for managing user permissions
- Testing: RSpec

## Installation

### Requirements

- Ruby 3.x
- PostgreSQL

### Steps

1. Clone the Repository

```
git clone https://github.com/solobarine/roadmaster
cd roadmaster/backend
```

2. Install Dependencies

```
bundle install
```

3. Setup the Database

```
rails db:create db:migrate
```

4. Run the Rails Server

```
rails server
```

### Testing

I used RSPec for testing. To run the tests:

1. Run the test suite

```
rspec
```

## API Endpoints

### Manufacturers

- GET /api/manufacturer: Retrieve a list of all manufacturer.
- GET /api/manufacturer/:id: Retrieve details of a specific manufacturer.
- POST /api/manufacturer: Create a newmanufacturer.
- PUT /api/manufacturer/:id: Update an existing manufacturer.
- DELETE /api/manufacturer/:id: Delete a manufacturer

### Brands

- GET /api/brands: Retrieve a list of all brands.
- GET /api/brands/:id: Retrieve details of a specific brand.
- POST /api/brands: Create a new brand.
- PUT /api/brands/:id: Update an existing brand.
- DELETE /api/brands/:id: Delete a brand

## Authentication

- The API uses JWT (JSON Web Tokens) for authentication.
- Include the JWT token in the Authorization header of all protected requests

```
Authorization: Bearer your_jwt_token
```

### Example Login

- POST /api/login: Logs in a user and returns a JWT token

```
{
  user: {
          email: "example@gmail.com",
          password: "password"
        }
}
```

## Authors

### Solomon Akpuru

- **Role:** Software Engineer
- **Email:** solobarine@gmail.com
- **GitHub:** [https://github.com/solobarine](https://github.com/barine)
- **LinkedIn:** [https://www.linkedin.com/in/solomon-akpuru](https://www.linkedin.com/in/solomon-akpuru)

## License

This project is licensed under the MIT License – see the [LICENSE file](./LICENSE) for details.
