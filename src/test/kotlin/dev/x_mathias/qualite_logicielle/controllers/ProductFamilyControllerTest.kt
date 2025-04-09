package dev.x_mathias.qualite_logicielle.controllers

import dev.x_mathias.qualite_logicielle.domains.dtos.ProductFamilyRequestDto
import dev.x_mathias.qualite_logicielle.domains.dtos.ProductFamilyResponseDto
import dev.x_mathias.qualite_logicielle.domains.dtos.ProductFamilySimplifiedResponseDto
import dev.x_mathias.qualite_logicielle.domains.dtos.ProductFamilyWithoutIdRequestDto
import org.junit.jupiter.api.BeforeEach
import org.junit.jupiter.api.MethodOrderer
import org.junit.jupiter.api.Order
import org.junit.jupiter.api.TestMethodOrder
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.boot.test.context.SpringBootTest
import org.springframework.boot.testcontainers.service.connection.ServiceConnection
import org.springframework.test.web.reactive.server.WebTestClient
import org.springframework.test.web.reactive.server.expectBody
import org.springframework.test.web.servlet.client.MockMvcWebTestClient
import org.testcontainers.containers.MongoDBContainer
import org.testcontainers.junit.jupiter.Container
import org.testcontainers.junit.jupiter.Testcontainers
import kotlin.test.Test

@SpringBootTest
@Testcontainers
@TestMethodOrder(MethodOrderer.OrderAnnotation::class)
class ProductFamilyControllerTest {
    @Autowired
    lateinit var controller: ProductFamilyController
    lateinit var client: WebTestClient

    companion object {
        @Container
        @ServiceConnection
        @JvmStatic
        val mongoDBContainer = MongoDBContainer("mongo:7.0")
    }

    @BeforeEach
    fun setup() {
        client =
            MockMvcWebTestClient.bindToController(controller).configureClient().baseUrl("/api/v1/product-families").build()
    }

    @Test
    @Order(1)
    fun testCreateProductFamily() {
        client.post().uri("/").bodyValue(
            ProductFamilyRequestDto(
                id = "FIG",
                name = "Figurine"
            )
        ).exchange().expectStatus().isCreated().expectBody<ProductFamilySimplifiedResponseDto>()
    }

    @Test
    @Order(2)
    fun testGetAllProductFamilies() {
        client.get().uri("/").exchange().expectStatus().isOk()
            .expectBody<List<ProductFamilySimplifiedResponseDto>>()
    }

    @Test
    @Order(3)
    fun testGetProductFamilyById() {
        client.get().uri("/FIG").exchange().expectStatus().isOk().expectBody<ProductFamilyResponseDto>()
    }

    @Test
    @Order(4)
    fun testProductFamilyUpdate() {
        client.put().uri("/FIG").bodyValue(
            ProductFamilyWithoutIdRequestDto(
                name = "Figurine LOL 2"
            )
        ).exchange().expectStatus().isOk().expectBody<ProductFamilySimplifiedResponseDto>()
    }

    @Test
    @Order(5)
    fun testProductFamilyDelete() {
        client.delete().uri("/FIG").exchange().expectStatus().isNoContent()
    }
}