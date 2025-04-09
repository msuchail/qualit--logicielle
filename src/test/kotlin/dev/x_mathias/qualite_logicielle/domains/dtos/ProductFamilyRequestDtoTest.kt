package dev.x_mathias.qualite_logicielle.domains.dtos
import org.junit.jupiter.api.Assertions.*
import org.junit.jupiter.api.Test

class ProductFamilyRequestDtoTest {
    @Test
    fun `test name length`() {
        assertThrowsExactly(IllegalArgumentException::class.java) {
            ProductFamilyRequestDto(
                id = "FIG",
                name = "F".repeat(PRODUCT_FAMILY_NAME_MIN_LENGTH - 1)
            )
        }

        ProductFamilyRequestDto(
            id = "FIG",
            name = "F".repeat(PRODUCT_FAMILY_NAME_MIN_LENGTH)
        )
        ProductFamilyRequestDto(
            id = "FIG",
            name = "F".repeat(PRODUCT_FAMILY_NAME_MAX_LENGTH - 1) // Valid upper case letters
        )
        ProductFamilyRequestDto(
            id = "FIG",
            name = "F".repeat(PRODUCT_FAMILY_NAME_MAX_LENGTH)
        )

        assertThrowsExactly(IllegalArgumentException::class.java) {
            ProductFamilyRequestDto(
                id = "FIG",
                name = "F".repeat(PRODUCT_FAMILY_NAME_MAX_LENGTH + 1)
            )
        }
    }
}