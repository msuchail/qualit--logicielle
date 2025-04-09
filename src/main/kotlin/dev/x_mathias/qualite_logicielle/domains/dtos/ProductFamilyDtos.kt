package dev.x_mathias.qualite_logicielle.domains.dtos

import dev.x_mathias.qualite_logicielle.domains.entities.ProductFamilyEntity
import org.springframework.stereotype.Component

const val PRODUCT_FAMILY_NAME_MIN_LENGTH=3
const val PRODUCT_FAMILY_NAME_MAX_LENGTH= 30


@Component
class ProductFamilyMapper {
    fun toEntity(productFamilyRequestDto: ProductFamilyRequestDto): ProductFamilyEntity =
        ProductFamilyEntity(
            productFamilyRequestDto.id, productFamilyRequestDto.name,
            products = listOf()
        )

    fun toEntity(id: String, productFamilyWithoutIdRequestDto: ProductFamilyWithoutIdRequestDto): ProductFamilyEntity =
        ProductFamilyEntity(
            id,
            productFamilyWithoutIdRequestDto.name,
            products = listOf()
        )

    fun fromEntity(productFamilyEntity: ProductFamilyEntity): ProductFamilyResponseDto =
        ProductFamilyResponseDto(
            productFamilyEntity.id,
            productFamilyEntity.name,
            productFamilyEntity.products.map {
                it.id
            }
        )
    fun fromEntityToProductFamilySimplifiedResponseDto(productFamilyEntity: ProductFamilyEntity): ProductFamilySimplifiedResponseDto =
        ProductFamilySimplifiedResponseDto(
            productFamilyEntity.id,
            productFamilyEntity.name,
        )
}

data class ProductFamilyRequestDto(
    val id: String,
    val name: String,
) {
    init {
        validateName(name)
    }
}
data class ProductFamilyWithoutIdRequestDto(
    val name: String,
) {
    init {
        validateName(name)
    }
}

private fun validateName(name: String) {
    require(name.length >= PRODUCT_FAMILY_NAME_MIN_LENGTH) {
        "Name length must be greater than $PRODUCT_FAMILY_NAME_MIN_LENGTH"
    }
    require(name.length <= PRODUCT_FAMILY_NAME_MAX_LENGTH) {
        "Name length must be less than $PRODUCT_FAMILY_NAME_MAX_LENGTH"
    }
}


data class ProductFamilyResponseDto(
    val id: String,
    val name: String,
    val products: List<String>
)

data class ProductFamilySimplifiedResponseDto(
    val id: String,
    val name: String,
)
