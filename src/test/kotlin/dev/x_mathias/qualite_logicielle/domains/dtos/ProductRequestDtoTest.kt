package dev.x_mathias.qualite_logicielle.domains.dtos

import org.junit.jupiter.api.Assertions.*
import org.junit.jupiter.api.Test

class ProductRequestDtoTest {
    @Test
    fun `test name length`() {
        assertThrowsExactly(IllegalArgumentException::class.java) {
            ProductRequestDto(
                id = "FIGLOL",
                name = "F".repeat(PRODUCT_NAME_MIN_LENGTH - 1),
                purchasePrice = 10u,
                sellingPrice = 20u,
                stock = 100u,
                productFamilyId = "FIG"
            )
        }

        ProductRequestDto(
            id = "FIGLOL",
            name = "F".repeat(PRODUCT_NAME_MIN_LENGTH),
            purchasePrice = 10u,
            sellingPrice = 20u,
            stock = 100u,
            productFamilyId = "FIG"
        )
        ProductRequestDto(
            id = "FIGLOL",
            name = "F".repeat(PRODUCT_NAME_MAX_LENGTH - 1),
            purchasePrice = 10u,
            sellingPrice = 20u,
            stock = 100u,
            productFamilyId = "FIG"
        )
        ProductRequestDto(
            id = "FIGLOL",
            name = "F".repeat(PRODUCT_NAME_MAX_LENGTH),
            purchasePrice = 10u,
            sellingPrice = 20u,
            stock = 100u,
            productFamilyId = "FIG"
        )

        assertThrowsExactly(IllegalArgumentException::class.java) {
            ProductRequestDto(
                id = "FIGLOL",
                name = "F".repeat(PRODUCT_NAME_MAX_LENGTH + 1),
                purchasePrice = 10u,
                sellingPrice = 20u,
                stock = 100u,
                productFamilyId = "FIG"
            )
        }
    }
}