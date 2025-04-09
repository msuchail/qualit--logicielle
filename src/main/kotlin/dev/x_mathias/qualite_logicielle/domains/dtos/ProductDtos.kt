package dev.x_mathias.qualite_logicielle.domains.dtos

import dev.x_mathias.qualite_logicielle.domains.entities.ProductEntity
import dev.x_mathias.qualite_logicielle.exceptions.ProductDoesNotExistsException
import dev.x_mathias.qualite_logicielle.exceptions.ProductFamilyDoesNotExists
import dev.x_mathias.qualite_logicielle.repositories.ProductFamilyRepository
import dev.x_mathias.qualite_logicielle.repositories.ProductRepository
import org.springframework.stereotype.Component

const val PRODUCT_NAME_MIN_LENGTH=3
const val PRODUCT_NAME_MAX_LENGTH=30

@Component
class ProductMapper(
    val productFamilyMapper: ProductFamilyMapper,
    val productFamilyRepository: ProductFamilyRepository,
    private val productRepository: ProductRepository
) {
    fun toEntity(productRequestDto: ProductRequestDto): ProductEntity {
        val productFamilyEntity = productFamilyRepository.findById(productRequestDto.productFamilyId).orElseThrow {
            ProductFamilyDoesNotExists()
        }
        return ProductEntity(
            id = productRequestDto.id,
            name = productRequestDto.name,
            purchasePrice = productRequestDto.purchasePrice,
            sellingPrice = productRequestDto.sellingPrice,
            stock = productRequestDto.stock,
            productFamily = productFamilyEntity
        )
    }

    fun toEntity(id: String, productRequestWithoutIdDto: ProductRequestWithoutIdDto): ProductEntity {
        if(!productRepository.existsById(id)) throw ProductDoesNotExistsException()
        val productFamilyEntity = productFamilyRepository.findById(productRequestWithoutIdDto.productFamilyId).orElseThrow {
            ProductFamilyDoesNotExists()
        }
        return ProductEntity(
            id = id,
            name = productRequestWithoutIdDto.name,
            purchasePrice = productRequestWithoutIdDto.purchasePrice,
            sellingPrice = productRequestWithoutIdDto.sellingPrice,
            stock = productRequestWithoutIdDto.stock,
            productFamily = productFamilyEntity
        )
    }

    fun fromEntity(productEntity: ProductEntity) = ProductResponseDto(
        id = productEntity.id,
        name = productEntity.name,
        purchasePrice = productEntity.purchasePrice,
        sellingPrice = productEntity.sellingPrice,
        stock = productEntity.stock,
        productFamily = productFamilyMapper.fromEntityToProductFamilySimplifiedResponseDto(productEntity.productFamily),
    )

    fun fromEntityToSimplifiedResponseDto(productEntity: ProductEntity) = ProductSimplifiedResponseDto(
        id = productEntity.id,
        name = productEntity.name,
        purchasePrice = productEntity.purchasePrice,
        sellingPrice = productEntity.sellingPrice,
        stock = productEntity.stock,
        productFamily = productEntity.productFamily.id,
    )

}


data class ProductRequestDto(
    val id: String,
    val name: String,
    val purchasePrice: UInt,
    val sellingPrice: UInt,
    val stock: UInt,
    val productFamilyId: String,
) {
    init {
        validateName(name)
    }
}

data class ProductRequestWithoutIdDto(
    val name: String,
    val purchasePrice: UInt,
    val sellingPrice: UInt,
    val stock: UInt,
    val productFamilyId: String,
) {
    init {
        validateName(name)
    }
}

private fun validateName(name: String) {
    require(name.length >= PRODUCT_NAME_MIN_LENGTH) {
        "Product name must be greater than $PRODUCT_NAME_MIN_LENGTH"
    }
    require(name.length <= PRODUCT_NAME_MAX_LENGTH) {
        "Product name must be lower than $PRODUCT_NAME_MAX_LENGTH"
    }
}

data class ProductResponseDto(
    val id: String,
    val name: String,
    val purchasePrice: UInt,
    val sellingPrice: UInt,
    val stock: UInt,
    val productFamily: ProductFamilySimplifiedResponseDto,
)

data class ProductSimplifiedResponseDto(
    val id: String,
    val name: String,
    val purchasePrice: UInt,
    val sellingPrice: UInt,
    val stock: UInt,
    val productFamily: String,
)