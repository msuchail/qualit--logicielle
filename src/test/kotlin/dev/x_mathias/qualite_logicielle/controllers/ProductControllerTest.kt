package dev.x_mathias.qualite_logicielle.controllers

import dev.x_mathias.qualite_logicielle.domains.dtos.*
import dev.x_mathias.qualite_logicielle.services.ProductFamilyService
import jakarta.annotation.PreDestroy
import org.junit.jupiter.api.*
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.boot.test.context.SpringBootTest
import org.springframework.boot.testcontainers.service.connection.ServiceConnection
import org.springframework.test.web.reactive.server.WebTestClient
import org.springframework.test.web.reactive.server.expectBody
import org.springframework.test.web.servlet.client.MockMvcWebTestClient
import org.testcontainers.containers.MySQLContainer
import org.testcontainers.junit.jupiter.Container
import org.testcontainers.junit.jupiter.Testcontainers

@SpringBootTest
@Testcontainers
@TestMethodOrder(MethodOrderer.OrderAnnotation::class)
class ProductControllerTest {
    @Autowired
    private lateinit var productFamilyService: ProductFamilyService

    @Autowired
    private lateinit var controller: ProductController

    lateinit var client: WebTestClient

    companion object {
        @Container
        @ServiceConnection
        @JvmStatic
        val mysql = MySQLContainer("mysql:5.7")
    }

    @BeforeEach
    fun setup() {
        client = MockMvcWebTestClient.bindToController(controller).configureClient().baseUrl("/api/v1/products").build()
    }

    @Test
    @Order(1)
    fun testCreateProduct() {
        productFamilyService.create(
            ProductFamilyRequestDto(
                id = "FIG",
                name = "Figurine"
            )
        )
        client.post().uri("/").bodyValue(
            ProductRequestDto(
                id = "FIGLOL",
                name = "Figurine LOL",
                purchasePrice = 700u,
                sellingPrice = 2000u,
                stock = 10u,
                productFamilyId = "FIG"
            )
        ).exchange().expectStatus().isCreated().expectBody<ProductSimplifiedResponseDto>()
    }

    @Test
    @Order(2)
    fun testProductGetAll() {
        client.get().uri("/").exchange().expectStatus().isOk().expectBody<List<ProductSimplifiedResponseDto>>()
    }

    @Test
    @Order(3)
    fun testProductGetById() {
        client.get().uri("/FIGLOL").exchange().expectStatus().isOk().expectBody<ProductResponseDto>()
    }

    @Test
    @Order(4)
    fun testProductUpdate() {
        client.put().uri("/FIGLOL").bodyValue(
            ProductRequestWithoutIdDto(
                name = "Figurine LOL v2",
                purchasePrice = 700u,
                sellingPrice = 2000u,
                stock = 10u,
                productFamilyId = "FIG"
            )
        ).exchange().expectStatus().isOk().expectBody<ProductSimplifiedResponseDto>()
    }

    @Test
    @Order(5)
    fun testProductSetStock() {
        client.put().uri("/FIGLOL/set-stock=5").exchange().expectStatus().isOk()
            .expectBody<ProductSimplifiedResponseDto>()
    }

    @Test
    @Order(6)
    fun testProductIncrementStock() {
        client.put().uri("/FIGLOL/increment-stock=5").exchange().expectStatus().isOk()
            .expectBody<ProductSimplifiedResponseDto>()
    }

    @Test
    @Order(7)
    fun testProductDecrementStock() {
        client.put().uri("/FIGLOL/decrement-stock=5").exchange().expectStatus().isOk()
            .expectBody<ProductSimplifiedResponseDto>()
    }

    @Test
    @Order(8)
    fun testProductDelete() {
        client.delete().uri("/FIGLOL").exchange().expectStatus().isNoContent()
    }

    @PreDestroy
    fun preDestroy() {
        productFamilyService.delete("FIG")
    }
}