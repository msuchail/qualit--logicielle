package dev.x_mathias.qualite_logicielle.services

import dev.x_mathias.qualite_logicielle.domains.dtos.ProductFamilyRequestDto
import dev.x_mathias.qualite_logicielle.domains.dtos.ProductRequestDto
import dev.x_mathias.qualite_logicielle.domains.dtos.ProductRequestWithoutIdDto
import dev.x_mathias.qualite_logicielle.exceptions.ProductAlreadyExistsException
import dev.x_mathias.qualite_logicielle.exceptions.ProductDoesNotExistsException
import dev.x_mathias.qualite_logicielle.exceptions.ProductFamilyDoesNotExists
import dev.x_mathias.qualite_logicielle.exceptions.ProductNotEnoughStockException
import org.assertj.core.api.Assertions.assertThat
import org.assertj.core.api.Assertions.assertThatExceptionOfType
import org.junit.jupiter.api.BeforeAll
import org.junit.jupiter.api.Order
import org.junit.jupiter.api.Test
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.boot.testcontainers.service.connection.ServiceConnection
import org.testcontainers.containers.MySQLContainer
import org.testcontainers.junit.jupiter.Container

class ProductServiceTest : AbstractServiceTestClass() {
    companion object {
        @Container
        @ServiceConnection
        @JvmStatic
        val mysql = MySQLContainer("mysql:8.0")
    }

    @Autowired
    lateinit var productFamilyService: ProductFamilyService
    @Autowired
    lateinit var productService: ProductService

    @BeforeAll()
    fun beforeAll() {
        productFamilyService.create(
            ProductFamilyRequestDto(
                id = "FIG",
                name = "Figurine"
            )
        )
    }

    @Test
    @Order(1)
    fun testProductCreationWithGoodProudctFamilyId() {
        val productRequestDto = ProductRequestDto(
            id = "FIGLOL",
            name = "Figurine LOL",
            purchasePrice = 700u,
            sellingPrice = 2000u,
            stock = 10u,
            productFamilyId = "FIG"
        )

        val result = productService.create(productRequestDto)
        assertThat(result.id).isEqualTo("FIGLOL")
    }

    @Test
    @Order(2)
    fun testProductCreationFailWithAlreadyExistingId() {
        val productRequestDto = ProductRequestDto(
            id = "FIGLOL",
            name = "Figurine LOL",
            purchasePrice = 700u,
            sellingPrice = 2000u,
            stock = 10u,
            productFamilyId = "FIG"
        )
        assertThatExceptionOfType(ProductAlreadyExistsException::class.java).isThrownBy {
            productService.create(productRequestDto)
        }
    }

    @Test
    @Order(3)
    fun testProductCreationFailWithBadProudctFamilyId() {
        val productRequestDto = ProductRequestDto(
            id = "FIGLOL2",
            name = "Figurine LOL",
            purchasePrice = 700u,
            sellingPrice = 2000u,
            stock = 10u,
            productFamilyId = "TOTO"
        )
        assertThatExceptionOfType(ProductFamilyDoesNotExists::class.java).isThrownBy {
            productService.create(
                productRequestDto
            )
        }
    }

    @Test
    @Order(4)
    fun testProductFindById() {
        productService.findById("FIGLOL")
    }

    @Test
    @Order(5)
    fun testProductFindByIdFailWhitBadId() {
        assertThatExceptionOfType(ProductDoesNotExistsException::class.java).isThrownBy {
            productService.findById("TOTO")
        }
    }

    @Test
    @Order(6)
    fun testFindAll() {
        assertThat(productService.findAll()).hasSize(1)
    }

    @Test
    @Order(7)
    fun testProductUpdateWithGoodProductFamilyId() {
        val result = productService.update(
            "FIGLOL", ProductRequestWithoutIdDto(
                name = "TOTO",
                purchasePrice = 700u,
                sellingPrice = 2000u,
                stock = 10u,
                productFamilyId = "FIG"
            )
        )

        assertThat(result.name).isEqualTo("TOTO")
    }

    @Test
    @Order(8)
    fun testProductUpdateFailWithBadProductId() {
        assertThatExceptionOfType(
            ProductDoesNotExistsException::class.java
        ).isThrownBy {
            productService.update(
                "TOTO", ProductRequestWithoutIdDto(
                    name = "TOTO",
                    purchasePrice = 700u,
                    sellingPrice = 2000u,
                    stock = 10u,
                    productFamilyId = "FIG"
                )
            )
        }
    }

    @Test
    @Order(9)
    fun testProductUpdateFailWithBadFamilyId() {
        assertThatExceptionOfType(ProductFamilyDoesNotExists::class.java).isThrownBy {
            productService.update(
                "FIGLOL", ProductRequestWithoutIdDto(
                    name = "TOTO",
                    purchasePrice = 700u,
                    sellingPrice = 2000u,
                    stock = 10u,
                    productFamilyId = "TOTO"
                )
            )
        }
    }

    @Test
    @Order(10)
    fun testProductIncrementStock() {
        val result = productService.incrementStock("FIGLOL", 20u)
        assertThat(result.stock).isEqualTo(30u)
    }

    @Test
    @Order(11)
    fun testProductSetStock() {
        val result = productService.setStock("FIGLOL", 10u)
        assertThat(result.stock).isEqualTo(10u)
    }

    @Test
    @Order(12)
    fun testProductDecrementStock() {
        val result = productService.decrementStock("FIGLOL", 5u)
        assertThat(result.stock).isEqualTo(5u)
    }

    @Test
    @Order(14)
    fun testProductDecrementFailIfNotEnouthStock() {
        assertThatExceptionOfType(ProductNotEnoughStockException::class.java).isThrownBy {
            productService.decrementStock("FIGLOL", 6u)
        }
    }

    @Test
    @Order(15)
    fun testProductDelete() {
        productService.delete("FIGLOL")
    }

    @Test
    @Order(16)
    fun testProductDeleteFailIfIdDoesNotExist() {
        assertThatExceptionOfType(ProductDoesNotExistsException::class.java).isThrownBy {
            productService.delete("TOTO")
        }
    }

    @Test
    @Order(17)
    fun testCascadeDeleteWithProductFamily() {
        val productRequestDto = ProductRequestDto(
            id = "FIGLOL",
            name = "Figurine LOL",
            purchasePrice = 700u,
            sellingPrice = 2000u,
            stock = 10u,
            productFamilyId = "FIG"
        )
        productService.create(productRequestDto)
        productFamilyService.delete("FIG")

        assertThatExceptionOfType(ProductDoesNotExistsException::class.java).isThrownBy {
            productService.findById("FIGLOL")
        }
    }
}