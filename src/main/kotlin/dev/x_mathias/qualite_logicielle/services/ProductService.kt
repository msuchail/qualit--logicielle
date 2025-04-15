package dev.x_mathias.qualite_logicielle.services

import dev.x_mathias.qualite_logicielle.domains.dtos.*
import dev.x_mathias.qualite_logicielle.exceptions.ProductAlreadyExistsException
import dev.x_mathias.qualite_logicielle.exceptions.ProductDoesNotExistsException
import dev.x_mathias.qualite_logicielle.exceptions.ProductNotEnoughStockException
import dev.x_mathias.qualite_logicielle.repositories.ProductRepository
import org.springframework.stereotype.Service
import kotlin.jvm.optionals.getOrElse

@Service
class ProductService(
    private val productRepository: ProductRepository,
    private val productMapper: ProductMapper
) {
    fun create(productRequestDto: ProductRequestDto): ProductSimplifiedResponseDto {
        if(productRepository.existsById(productRequestDto.id)) throw ProductAlreadyExistsException()
        val productEntity = productMapper.toEntity(productRequestDto)
        val result = productRepository.save(productEntity)
        return productMapper.fromEntityToSimplifiedResponseDto(result)
    }
    fun findById(id: String): ProductResponseDto {
        val productEntity = productRepository.findById(id).getOrElse {
            throw ProductDoesNotExistsException()
        }
        return productMapper.fromEntity(
            productEntity
        )
    }
    fun findAll(): List<ProductSimplifiedResponseDto> =
        productRepository.findAll().map {
            productMapper.fromEntityToSimplifiedResponseDto(it)
        }

    fun decrementStock(id: String, value: UInt): ProductResponseDto {
        val productEntity = productRepository.findById(id).orElseThrow { ProductDoesNotExistsException() }
        if(productEntity.stock < value) throw ProductNotEnoughStockException()
        productEntity.stock -= value
        return productMapper.fromEntity(productRepository.save(productEntity))
    }
    fun incrementStock(id: String, value: UInt) : ProductResponseDto {
        val productEntity = productRepository.findById(id).orElseThrow { ProductDoesNotExistsException() }
        productEntity.stock += value
        return productMapper.fromEntity(productRepository.save(productEntity))
    }
    fun setStock(id: String, stock: UInt) : ProductResponseDto {
        val productEntity = productRepository.findById(id).orElseThrow { ProductDoesNotExistsException() }
        productEntity.stock = stock
        return productMapper.fromEntity(productRepository.save(productEntity))
    }
    fun update(id: String, productRequestWithoutIdDto: ProductRequestWithoutIdDto): ProductResponseDto {
        val productEntity = productMapper.toEntity(id, productRequestWithoutIdDto)
        return productMapper.fromEntity(productRepository.save(productEntity))
    }
    fun delete(id: String) {
        if (!productRepository.existsById(id)) throw ProductDoesNotExistsException()
        productRepository.deleteById(id)
    }
}