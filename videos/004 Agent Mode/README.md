# ProductsAPI Solution

A complete ASP.NET Core Web API solution demonstrating CRUD operations with Entity Framework Core In-Memory database.

## 📁 Solution Structure

```
ProductsAPI.sln                  # Visual Studio Solution file
└── ProductsAPI/                 # Main Web API project
    ├── Controllers/             # API controllers
    ├── Data/                    # Entity Framework DbContext
    ├── DTOs/                    # Data Transfer Objects
    ├── Models/                  # Entity models
    ├── Services/                # Business logic layer
    ├── test-api.ps1            # PowerShell API test script
    ├── test-page.html          # HTML test interface
    └── README.md               # Detailed project documentation
```

## 🚀 Quick Start

### Using Visual Studio

1. Open `ProductsAPI.sln` in Visual Studio
2. Set `ProductsAPI` as the startup project
3. Press F5 to run

### Using Command Line

```bash
# Clone or navigate to the solution directory
cd "004 Agent Mode"

# Restore packages
dotnet restore ProductsAPI.sln

# Build the solution
dotnet build ProductsAPI.sln

# Run the application
dotnet run --project ProductsAPI
```

## 🎯 What You'll Get

- **RESTful API** with full CRUD operations for products
- **In-Memory Database** - no setup required
- **Sample Data** - pre-loaded with test products
- **API Testing Tools** - both PowerShell script and HTML interface
- **OpenAPI Documentation** - automatic Swagger-style docs
- **Clean Architecture** - properly layered with separation of concerns

## 📋 API Endpoints

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/api/products` | Get all products |
| GET | `/api/products/{id}` | Get product by ID |
| GET | `/api/products/category/{category}` | Get products by category |
| POST | `/api/products` | Create new product |
| PUT | `/api/products/{id}` | Update existing product |
| DELETE | `/api/products/{id}` | Delete product |

## 🧪 Testing the API

### Option 1: HTML Test Interface
1. Run the application
2. Open `ProductsAPI/test-page.html` in your browser
3. Use the interactive interface to test all endpoints

### Option 2: PowerShell Script
```powershell
# Navigate to the project directory
cd ProductsAPI

# Run the test script
.\test-api.ps1
```

### Option 3: OpenAPI Documentation
- Start the application
- Visit the OpenAPI endpoint for interactive documentation

## 🛠️ Technologies Used

- **ASP.NET Core 9.0** - Web API framework
- **Entity Framework Core 9.0** - ORM with In-Memory provider
- **C# 12** - Programming language
- **OpenAPI/Swagger** - API documentation

## 📚 Learning Objectives

This solution demonstrates:

1. **Clean Architecture Patterns**
   - Controller → Service → Repository pattern
   - Dependency injection
   - DTOs for API contracts

2. **Entity Framework Core**
   - Code-first approach
   - In-Memory database provider
   - Data seeding

3. **ASP.NET Core Web API**
   - RESTful endpoint design
   - Model validation
   - Error handling
   - CORS configuration

4. **Testing & Documentation**
   - Multiple testing approaches
   - API documentation
   - Sample data and use cases

## 🔧 Development Tips

- The In-Memory database resets every time you restart the application
- CORS is enabled for all origins (suitable for development/testing)
- All endpoints include comprehensive error handling and logging
- The solution is structured to easily add more projects (tests, shared libraries, etc.)

## 📖 Next Steps

- Add unit tests project to the solution
- Implement authentication and authorization
- Add more complex business logic
- Switch to a persistent database (SQL Server, PostgreSQL, etc.)
- Add API versioning
- Implement caching strategies

For detailed documentation about the API functionality, see the [README in the ProductsAPI project](ProductsAPI/README.md).
