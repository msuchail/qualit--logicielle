package dev.x_mathias.qualite_logicielle.services

import dev.x_mathias.qualite_logicielle.domains.dtos.*
import dev.x_mathias.qualite_logicielle.exceptions.ProductFamilyAlreadyExists
import dev.x_mathias.qualite_logicielle.exceptions.ProductFamilyDoesNotExists
import dev.x_mathias.qualite_logicielle.repositories.ProductFamilyRepository
import org.springframework.stereotype.Service
import org.springframework.transaction.annotation.Transactional

@Service
class ProductFamilyService(
    private val productFamilyRepository: ProductFamilyRepository,
    private val productFamilyMapper: ProductFamilyMapper,
) {
    fun create(productFamilyRequestDto: ProductFamilyRequestDto): ProductFamilySimplifiedResponseDto {
        if (productFamilyRepository.existsById(productFamilyRequestDto.id)) throw ProductFamilyAlreadyExists()
        val productFamilyEntity = productFamilyMapper.toEntity(productFamilyRequestDto)
        val result = productFamilyRepository.save(productFamilyEntity)
        return productFamilyMapper.fromEntityToProductFamilySimplifiedResponseDto(result)
    }

    fun update(
        id: String,
        productFamilyWithoutIdRequestDto: ProductFamilyWithoutIdRequestDto
    ): ProductFamilySimplifiedResponseDto {
        if (!productFamilyRepository.existsById(id)) throw ProductFamilyDoesNotExists()
        val productFamilyEntity = productFamilyMapper.toEntity(id, productFamilyWithoutIdRequestDto)
        val result = productFamilyRepository.save(productFamilyEntity)
        return productFamilyMapper.fromEntityToProductFamilySimplifiedResponseDto(result)
    }

    fun findAll(): List<ProductFamilySimplifiedResponseDto> {
        return productFamilyRepository.findAll().map {
            productFamilyMapper.fromEntityToProductFamilySimplifiedResponseDto(it)
        }
    }

    fun findById(id: String): ProductFamilyResponseDto {
        return productFamilyMapper.fromEntity(
            productFamilyRepository.findById(id).orElseThrow {
                ProductFamilyDoesNotExists()
            }
        )
    }

    @Transactional
    fun delete(id: String) {
        if (!productFamilyRepository.existsById(id)) throw ProductFamilyDoesNotExists()
        productFamilyRepository.deleteById(id)
    }
}