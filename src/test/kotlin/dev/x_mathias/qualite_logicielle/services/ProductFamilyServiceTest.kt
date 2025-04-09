package dev.x_mathias.qualite_logicielle.services

import dev.x_mathias.qualite_logicielle.domains.dtos.ProductFamilyRequestDto
import dev.x_mathias.qualite_logicielle.domains.dtos.ProductFamilyWithoutIdRequestDto
import dev.x_mathias.qualite_logicielle.domains.dtos.ProductRequestDto
import dev.x_mathias.qualite_logicielle.exceptions.ProductFamilyAlreadyExists
import dev.x_mathias.qualite_logicielle.exceptions.ProductFamilyDoesNotExists
import dev.x_mathias.qualite_logicielle.repositories.ProductFamilyRepository
import org.assertj.core.api.Assertions.assertThat
import org.assertj.core.api.Assertions.assertThatExceptionOfType
import org.junit.jupiter.api.MethodOrderer
import org.junit.jupiter.api.Order
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.TestMethodOrder
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.boot.test.context.SpringBootTest
import org.springframework.boot.testcontainers.service.connection.ServiceConnection
import org.testcontainers.containers.MySQLContainer
import org.testcontainers.junit.jupiter.Container
import org.testcontainers.junit.jupiter.Testcontainers

@SpringBootTest
@Testcontainers
@TestMethodOrder(MethodOrderer.OrderAnnotation::class)
class ProductFamilyServiceTest {
    companion object {
        @Container
        @ServiceConnection
        @JvmStatic
        val mysql = MySQLContainer("mysql:5.7")
    }

    @Autowired
    private lateinit var productFamilyRepository: ProductFamilyRepository

    @Autowired
    private lateinit var productService: ProductService

    @Autowired
    private lateinit var productFamilyService: ProductFamilyService

    val productFamilyRequestDto = ProductFamilyRequestDto(
        id = "FIG",
        name = "Figurine"
    )

    @Test
    @Order(1)
    fun testProductFamilyCreation() {
        val result = productFamilyService.create(productFamilyRequestDto)
        assertThat(result.id).isEqualTo(productFamilyRequestDto.id)
    }

    @Test
    @Order(2)
    fun testProductFamilyCreationFailIfIdIsNotUnique() {
        assertThatExceptionOfType(ProductFamilyAlreadyExists::class.java).isThrownBy {
            productFamilyService.create(
                productFamilyRequestDto
            )
        }
    }

    @Test
    @Order(3)
    fun testFindProductFamilyById() {
        val result = productFamilyService.findById("FIG")
        assertThat(result.id).isEqualTo(productFamilyRequestDto.id)
    }

    @Test
    @Order(4)
    fun testFindProductFamilyFailWithInvalidId() {
        assertThatExceptionOfType(ProductFamilyDoesNotExists::class.java).isThrownBy {
            productFamilyService.findById("TOTO")
        }
    }


    @Test
    @Order(5)
    fun testFindAllProductFamily () {
        val result = productFamilyService.findAll()
        assertThat(result).size().isEqualTo(1)
    }

    @Test
    @Order(6)
    fun testProductFamilyUpdate() {
        val result = productFamilyService.update(productFamilyRequestDto.id, ProductFamilyWithoutIdRequestDto (
            name = "Jouet",
        ))

        assertThat(result.name).isEqualTo("Jouet")
    }

    @Test
    @Order(7)
    fun testProductFamilyUpdateFailIfIdDoesNotExist() {
        assertThatExceptionOfType(ProductFamilyDoesNotExists::class.java).isThrownBy {
            productFamilyService.update("TOTO", ProductFamilyWithoutIdRequestDto (
                name = "Jouet",
            ))
        }
    }

    @Test
    @Order(8)
    fun testProductsIdMapCorrectlyInResponseDto() {
        productService.create(
            ProductRequestDto(
                id = "FIGLOL",
                name = "Figurine LOL",
                purchasePrice = 10u,
                sellingPrice = 20u,
                stock = 10u,
                productFamilyId = "FIG"
            )
        )
        val productResponse = productFamilyService.findById(productFamilyRequestDto.id)

        assertThat(productResponse.products.first()).isEqualTo("FIGLOL")
    }

    @Test
    @Order(9)
    fun testProductFamilyDelete() {
        productFamilyService.delete(productFamilyRequestDto.id)
    }

    @Test
    @Order(10)
    fun testProductFamilyDeleteFailIfIdDoesNotExist() {
        assertThatExceptionOfType(ProductFamilyDoesNotExists::class.java).isThrownBy {
            productFamilyService.delete(productFamilyRequestDto.id)
        }
    }
}