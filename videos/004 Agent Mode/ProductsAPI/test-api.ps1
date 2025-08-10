# API Test Script for ProductsAPI

# Base URL - Update the port number based on your actual running application
$baseUrl = "http://localhost:5166/api/products"

Write-Host "Testing ProductsAPI endpoints..." -ForegroundColor Green
Write-Host "Base URL: $baseUrl" -ForegroundColor Yellow

# Test 1: Get all products
Write-Host "`n1. Testing GET /api/products (Get all products)" -ForegroundColor Cyan
try {
    $response = Invoke-RestMethod -Uri $baseUrl -Method GET
    Write-Host "✓ Success! Found $($response.Length) products:" -ForegroundColor Green
    $response | Format-Table -Property Id, Name, Price, Category, StockQuantity
} catch {
    Write-Host "✗ Failed: $($_.Exception.Message)" -ForegroundColor Red
}

# Test 2: Get product by ID
Write-Host "`n2. Testing GET /api/products/1 (Get product by ID)" -ForegroundColor Cyan
try {
    $response = Invoke-RestMethod -Uri "$baseUrl/1" -Method GET
    Write-Host "✓ Success! Retrieved product:" -ForegroundColor Green
    $response | Format-Table -Property Id, Name, Price, Category, StockQuantity
} catch {
    Write-Host "✗ Failed: $($_.Exception.Message)" -ForegroundColor Red
}

# Test 3: Get products by category
Write-Host "`n3. Testing GET /api/products/category/Electronics (Get products by category)" -ForegroundColor Cyan
try {
    $response = Invoke-RestMethod -Uri "$baseUrl/category/Electronics" -Method GET
    Write-Host "✓ Success! Found $($response.Length) electronics:" -ForegroundColor Green
    $response | Format-Table -Property Id, Name, Price, Category, StockQuantity
} catch {
    Write-Host "✗ Failed: $($_.Exception.Message)" -ForegroundColor Red
}

# Test 4: Create a new product
Write-Host "`n4. Testing POST /api/products (Create new product)" -ForegroundColor Cyan
$newProduct = @{
    name = "Wireless Mouse"
    description = "Ergonomic wireless mouse with precision tracking"
    price = 29.99
    stockQuantity = 75
    category = "Electronics"
} | ConvertTo-Json

try {
    $response = Invoke-RestMethod -Uri $baseUrl -Method POST -Body $newProduct -ContentType "application/json"
    Write-Host "✓ Success! Created product with ID: $($response.id)" -ForegroundColor Green
    $response | Format-Table -Property Id, Name, Price, Category, StockQuantity
    $createdProductId = $response.id
} catch {
    Write-Host "✗ Failed: $($_.Exception.Message)" -ForegroundColor Red
    $createdProductId = $null
}

# Test 5: Update the created product (if creation was successful)
if ($createdProductId) {
    Write-Host "`n5. Testing PUT /api/products/$createdProductId (Update product)" -ForegroundColor Cyan
    $updateProduct = @{
        name = "Wireless Gaming Mouse"
        description = "High-performance wireless gaming mouse with RGB lighting"
        price = 39.99
        stockQuantity = 50
        category = "Gaming"
    } | ConvertTo-Json

    try {
        $response = Invoke-RestMethod -Uri "$baseUrl/$createdProductId" -Method PUT -Body $updateProduct -ContentType "application/json"
        Write-Host "✓ Success! Updated product:" -ForegroundColor Green
        $response | Format-Table -Property Id, Name, Price, Category, StockQuantity
    } catch {
        Write-Host "✗ Failed: $($_.Exception.Message)" -ForegroundColor Red
    }

    # Test 6: Delete the created product
    Write-Host "`n6. Testing DELETE /api/products/$createdProductId (Delete product)" -ForegroundColor Cyan
    try {
        Invoke-RestMethod -Uri "$baseUrl/$createdProductId" -Method DELETE
        Write-Host "✓ Success! Product deleted" -ForegroundColor Green
    } catch {
        Write-Host "✗ Failed: $($_.Exception.Message)" -ForegroundColor Red
    }
} else {
    Write-Host "`n5-6. Skipping UPDATE and DELETE tests due to failed CREATE" -ForegroundColor Yellow
}

# Test 7: Verify final state
Write-Host "`n7. Final verification - Get all products" -ForegroundColor Cyan
try {
    $response = Invoke-RestMethod -Uri $baseUrl -Method GET
    Write-Host "✓ Final state - Total products: $($response.Length)" -ForegroundColor Green
    $response | Format-Table -Property Id, Name, Price, Category, StockQuantity
} catch {
    Write-Host "✗ Failed: $($_.Exception.Message)" -ForegroundColor Red
}

Write-Host "`nAPI Testing Complete!" -ForegroundColor Green
