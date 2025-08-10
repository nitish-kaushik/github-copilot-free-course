using ProductsAPI.DTOs;
using ProductsAPI.Models;

namespace ProductsAPI.Services
{
    public interface IProductService
    {
        Task<IEnumerable<ProductResponseDto>> GetAllProductsAsync();
        Task<ProductResponseDto?> GetProductByIdAsync(int id);
        Task<ProductResponseDto> CreateProductAsync(ProductCreateDto productCreateDto);
        Task<ProductResponseDto?> UpdateProductAsync(int id, ProductUpdateDto productUpdateDto);
        Task<bool> DeleteProductAsync(int id);
        Task<IEnumerable<ProductResponseDto>> GetProductsByCategoryAsync(string category);
    }
}
