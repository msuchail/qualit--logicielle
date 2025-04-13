package dev.x_mathias.qualite_logicielle.controllers

import dev.x_mathias.qualite_logicielle.domains.dtos.ProductFamilyRequestDto
import dev.x_mathias.qualite_logicielle.domains.dtos.ProductRequestDto
import dev.x_mathias.qualite_logicielle.domains.dtos.ProductRequestWithoutIdDto
import dev.x_mathias.qualite_logicielle.services.ProductFamilyService
import org.hamcrest.Matchers.equalTo
import org.junit.jupiter.api.BeforeAll
import org.junit.jupiter.api.Order
import org.junit.jupiter.api.Test
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.boot.testcontainers.service.connection.ServiceConnection
import org.springframework.http.MediaType
import org.springframework.test.web.servlet.delete
import org.springframework.test.web.servlet.get
import org.springframework.test.web.servlet.post
import org.springframework.test.web.servlet.put
import org.testcontainers.containers.MySQLContainer
import org.testcontainers.junit.jupiter.Container

private const val BASE_URL = "/api/v1/products"


class ProductControllerTest: AbstractControllerTestClass() {
    companion object {
        @Container
        @ServiceConnection
        @JvmStatic
        val mysql = MySQLContainer("mysql:8.0")
    }

    @Autowired
    private lateinit var productFamilyService: ProductFamilyService

    @BeforeAll
    fun beforeAll(): Unit {
        productFamilyService.create(
            ProductFamilyRequestDto(
                id = "FIG",
                name = "Figurine"
            )
        )
    }

    @Test
    @Order(1)
    fun testCreateProductWithGuest() {
        mockMvc.post("$BASE_URL/") {
            contentType = MediaType.APPLICATION_JSON
            content = objectMapper.writeValueAsString(
                ProductRequestDto(
                    id = "FIGLOL",
                    name = "Figurine LOL",
                    purchasePrice = 10u,
                    sellingPrice = 20u,
                    stock = 10u,
                    productFamilyId = "FIG"
                )
            )
        }.andExpect { status { isForbidden() } }
    }
    @Test
    @Order(2)
    fun testCreateProductWithCustommerUser() {
        mockMvc.post("$BASE_URL/") {
            with(margot)
            contentType = MediaType.APPLICATION_JSON
            content = objectMapper.writeValueAsString(
                ProductRequestDto(
                    id = "FIGLOL",
                    name = "Figurine LOL",
                    purchasePrice = 10u,
                    sellingPrice = 20u,
                    stock = 10u,
                    productFamilyId = "FIG"
                )
            )
        }.andExpect { status { isForbidden() } }
    }
    @Test
    @Order(3)
    fun testCreateProductWithAdminUser() {
        mockMvc.post("$BASE_URL/") {
            with(leonardo)
            contentType = MediaType.APPLICATION_JSON
            content = objectMapper.writeValueAsString(
                ProductRequestDto(
                    id = "FIGLOL",
                    name = "Figurine LOL",
                    purchasePrice = 10u,
                    sellingPrice = 20u,
                    stock = 10u,
                    productFamilyId = "FIG"
                )
            )
        }.andExpectAll {
            status { isCreated() }
            jsonPath("$.id", equalTo("FIGLOL"))
        }
    }

    @Test
    @Order(4)
    fun testGetProductsWithGuest() {
        mockMvc.get("$BASE_URL/").andExpectAll {
            status { isOk() }
            jsonPath("$[0].id") { value("FIGLOL") }
        }
    }

    @Test
    @Order(5)
    fun testGetProductsWithCustommerUser() {
        mockMvc.get("$BASE_URL/") { with(margot) }.andExpectAll {
            status { isOk() }
            jsonPath("$[0].id") { value("FIGLOL") }
        }
    }

    @Test
    @Order(6)
    fun testGetProductsWithAdminUser() {
        mockMvc.get("$BASE_URL/") { with(leonardo) }.andExpectAll {
            status { isOk() }
            jsonPath("$[0].id") { value("FIGLOL") }
        }
    }


    @Test
    @Order(7)
    fun testGetProductByIdWithGuest() {
        mockMvc.get("$BASE_URL/FIGLOL").andExpectAll {
            status { isOk() }
            jsonPath("$.id") { value("FIGLOL") }
        }
    }

    @Test
    @Order(8)
    fun testGetProductByIdWithCustommerUser() {
        mockMvc.get("$BASE_URL/FIGLOL") { with(margot) }.andExpectAll {
            status { isOk() }
            jsonPath("$.id") { value("FIGLOL") }
        }
    }

    @Test
    @Order(9)
    fun testGetProductByIdWithAdminUser() {
        mockMvc.get("$BASE_URL/FIGLOL") { with(leonardo) }.andExpectAll {
            status { isOk() }
            jsonPath("$.id") { value("FIGLOL") }
        }
    }

    @Test
    @Order(10)
    fun testUpdateProductWithGuest() {
        mockMvc.put("$BASE_URL/FIGLOL") {
            contentType = MediaType.APPLICATION_JSON
            content = objectMapper.writeValueAsString(
                ProductRequestWithoutIdDto(
                    name = "Figurine LOL 2",
                    purchasePrice = 10u,
                    sellingPrice = 20u,
                    productFamilyId = "FIG",
                    stock = 10u
                )
            )
        }.andExpect { status { isForbidden() } }
    }

    @Test
    @Order(10)
    fun testUpdateProductWithCustommerUser() {
        mockMvc.put("$BASE_URL/FIGLOL") {
            with(margot)
            contentType = MediaType.APPLICATION_JSON
            content = objectMapper.writeValueAsString(
                ProductRequestWithoutIdDto(
                    name = "Figurine LOL 2",
                    purchasePrice = 10u,
                    sellingPrice = 20u,
                    productFamilyId = "FIG",
                    stock = 10u
                )
            )
        }.andExpect { status { isForbidden() } }
    }

    @Test
    @Order(11)
    fun testUpdateProductWithAdminUser() {
        mockMvc.put("$BASE_URL/FIGLOL") {
            with(leonardo)
            contentType = MediaType.APPLICATION_JSON
            content = objectMapper.writeValueAsString(
                ProductRequestWithoutIdDto(
                    name = "Figurine LOL 2",
                    purchasePrice = 10u,
                    sellingPrice = 20u,
                    productFamilyId = "FIG",
                    stock = 10u
                )
            )
        }.andExpectAll {
            status { isOk() }
            jsonPath("$.id") { value("FIGLOL") }
        }
    }

    @Test
    @Order(12)
    fun testSetStockWithGuest() {
        mockMvc.put("$BASE_URL/FIGLOL/set-stock=20").andExpect { status { isForbidden() } }
    }

    @Test
    @Order(13)
    fun testSetStockWithCustommerUser() {
        mockMvc.put("$BASE_URL/FIGLOL/set-stock=20") { with(margot) }.andExpect { status { isForbidden() } }
    }

    @Test
    @Order(13)
    fun testSetStockWithAdminUser() {
        mockMvc.put("$BASE_URL/FIGLOL/set-stock=20") { with(leonardo) }.andExpectAll {
            status { isOk() }
            jsonPath("$.id") { value("FIGLOL") }
        }
    }

    @Test
    @Order(15)
    fun testIncrementStockWithGuest() {
        mockMvc.put("$BASE_URL/FIGLOL/increment-stock=2").andExpect { status { isForbidden() } }
    }

    @Test
    @Order(16)
    fun testIncrementStockWithCustommerUser() {
        mockMvc.put("$BASE_URL/FIGLOL/increment-stock=2") { with(margot) }.andExpect { status { isForbidden() } }
    }

    @Test
    @Order(17)
    fun testIncrementStockWithAdminUser() {
        mockMvc.put("$BASE_URL/FIGLOL/increment-stock=2") { with(leonardo) }.andExpectAll {
            status { isOk() }
            jsonPath("$.id") { value("FIGLOL") }
        }
    }

    @Test
    @Order(18)
    fun testDecrementStockWithGuest() {
        mockMvc.put("$BASE_URL/FIGLOL/decrement-stock=2").andExpect { status { isForbidden() } }
    }

    @Test
    @Order(19)
    fun testDecrementStockWithCustommerUser() {
        mockMvc.put("$BASE_URL/FIGLOL/decrement-stock=2") { with(margot) }.andExpect { status { isForbidden() } }
    }

    @Test
    @Order(20)
    fun testDecrementStockWithAdminUser() {
        mockMvc.put("$BASE_URL/FIGLOL/decrement-stock=2") { with(leonardo) }.andExpectAll {
            status { isOk() }
            jsonPath("$.id") { value("FIGLOL") }
        }
    }

    @Test
    @Order(21)
    fun testDeleteWithGuest() {
        mockMvc.delete("$BASE_URL/FIGLOL").andExpect { status { isForbidden() } }
    }

    @Test
    @Order(22)
    fun testDeleteWithCustommerUser() {
        mockMvc.delete("$BASE_URL/FIGLOL") { with(margot) }.andExpect { status { isForbidden() } }
    }

    @Test
    @Order(23)
    fun testDeleteWithAdminUser() {
        mockMvc.delete("$BASE_URL/FIGLOL") { with(leonardo) }.andExpect { status { isNoContent() } }
    }
}