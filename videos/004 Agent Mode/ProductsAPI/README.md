# Products API

A RESTful Web API built with ASP.NET Core that provides CRUD operations for managing products using Entity Framework Core with In-Memory database.

## Solution Structure

This application is organized as a Visual Studio solution with the following structure:
- **ProductsAPI.sln** - Main solution file (located in the parent directory)
- **ProductsAPI/** - Main API project directory containing all source code

## Features

- **Create** new products
- **Read** all products or get a specific product by ID
- **Update** existing products
- **Delete** products
- Filter products by category
- In-Memory database for easy testing
- Data validation and error handling
- Structured DTOs for API contracts
- Comprehensive logging

## Technologies Used

- ASP.NET Core 9.0
- Entity Framework Core 9.0 (In-Memory Provider)
- C# 12

## API Endpoints

### Products

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/api/products` | Get all products |
| GET | `/api/products/{id}` | Get a specific product by ID |
| GET | `/api/products/category/{category}` | Get products by category |
| POST | `/api/products` | Create a new product |
| PUT | `/api/products/{id}` | Update an existing product |
| DELETE | `/api/products/{id}` | Delete a product |

## Data Model

### Product
```json
{
  "id": 1,
  "name": "Product Name",
  "description": "Product Description",
  "price": 99.99,
  "stockQuantity": 50,
  "category": "Electronics",
  "createdAt": "2025-08-10T10:00:00Z",
  "updatedAt": "2025-08-10T10:00:00Z"
}
```

## Getting Started

### Prerequisites

- .NET 9.0 SDK or later

### Running the Application

#### Option 1: Using the Solution File (Recommended)

1. Navigate to the solution directory:
   ```bash
   cd "004 Agent Mode"
   ```

2. Restore dependencies:
   ```bash
   dotnet restore ProductsAPI.sln
   ```

3. Build the solution:
   ```bash
   dotnet build ProductsAPI.sln
   ```

4. Run the application:
   ```bash
   dotnet run --project ProductsAPI
   ```

#### Option 2: Using the Project Directly

1. Navigate to the project directory:
   ```bash
   cd ProductsAPI
   ```

2. Restore dependencies:
   ```bash
   dotnet restore
   ```

3. Run the application:
   ```bash
   dotnet run
   ```

4. The API will be available at:
   - HTTPS: `https://localhost:7xxx`
   - HTTP: `http://localhost:5xxx`

5. Access the OpenAPI documentation at:
   - `https://localhost:7xxx/openapi/v1.json`

## Sample Data

The application comes with pre-seeded sample data:

1. **Laptop** - High-performance laptop ($999.99, Electronics)
2. **Smartphone** - Latest smartphone ($699.99, Electronics)  
3. **Coffee Mug** - Ceramic coffee mug ($12.99, Kitchen)

## Usage Examples

### Create a Product
```bash
curl -X POST "https://localhost:7xxx/api/products" \
     -H "Content-Type: application/json" \
     -d '{
       "name": "Wireless Headphones",
       "description": "Noise-cancelling wireless headphones",
       "price": 199.99,
       "stockQuantity": 25,
       "category": "Electronics"
     }'
```

### Get All Products
```bash
curl -X GET "https://localhost:7xxx/api/products"
```

### Get Product by ID
```bash
curl -X GET "https://localhost:7xxx/api/products/1"
```

### Update a Product
```bash
curl -X PUT "https://localhost:7xxx/api/products/1" \
     -H "Content-Type: application/json" \
     -d '{
       "name": "Gaming Laptop",
       "description": "High-performance gaming laptop with RTX graphics",
       "price": 1299.99,
       "stockQuantity": 30,
       "category": "Electronics"
     }'
```

### Delete a Product
```bash
curl -X DELETE "https://localhost:7xxx/api/products/1"
```

### Get Products by Category
```bash
curl -X GET "https://localhost:7xxx/api/products/category/Electronics"
```

## Project Structure

```
ProductsAPI/
├── Controllers/
│   └── ProductsController.cs     # API endpoints
├── Data/
│   └── ProductsDbContext.cs      # Entity Framework DbContext
├── DTOs/
│   └── ProductDtos.cs            # Data Transfer Objects
├── Models/
│   └── Product.cs                # Product entity model
├── Services/
│   ├── IProductService.cs        # Service interface
│   └── ProductService.cs         # Service implementation
├── Program.cs                    # Application entry point
└── ProductsAPI.csproj           # Project file
```

## Error Handling

The API includes comprehensive error handling:

- **400 Bad Request**: Invalid input data or validation errors
- **404 Not Found**: Product not found
- **500 Internal Server Error**: Unexpected server errors

All errors return structured JSON responses with meaningful error messages.

## Validation

Input validation is implemented using Data Annotations:

- Product name is required (max 100 characters)
- Price must be greater than 0
- Stock quantity cannot be negative
- Description is optional (max 500 characters)
- Category is optional (max 50 characters)

## In-Memory Database

This application uses Entity Framework Core's In-Memory database provider, which means:

- Data is stored in memory and is lost when the application stops
- Perfect for development, testing, and demonstrations
- No external database setup required
- Automatic database creation and seeding on startup

## Contributing

Feel free to submit issues and enhancement requests!
