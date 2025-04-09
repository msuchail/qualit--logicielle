package dev.x_mathias.qualite_logicielle.controllers

import dev.x_mathias.qualite_logicielle.domains.dtos.*
import dev.x_mathias.qualite_logicielle.services.AddressService
import dev.x_mathias.qualite_logicielle.services.OrderService
import dev.x_mathias.qualite_logicielle.services.ProductService
import jakarta.annotation.PreDestroy
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
import org.testcontainers.containers.MySQLContainer
import org.testcontainers.junit.jupiter.Container
import org.testcontainers.junit.jupiter.Testcontainers
import kotlin.test.Test

@SpringBootTest
@Testcontainers
@TestMethodOrder(MethodOrderer.OrderAnnotation::class)
class OrderControllerTest {
    @Autowired
    lateinit var controller: OrderController

    @Autowired
    lateinit var productService: ProductService

    @Autowired
    lateinit var productFamilyService: ProductFamilyController

    @Autowired
    lateinit var orderService: OrderService

    @Autowired
    lateinit var addressService: AddressService
    lateinit var client: WebTestClient

    companion object {
        @Container
        @ServiceConnection
        @JvmStatic
        val mysql = MySQLContainer("mysql:5.7")

        @Container
        @ServiceConnection
        @JvmStatic
        val mongoDBContainer = MongoDBContainer("mongo:7.0")
    }

    @BeforeEach
    fun setup() {
        client = MockMvcWebTestClient.bindToController(controller).configureClient().baseUrl("/api/v1/orders").build()
    }

    @Test
    @Order(1)
    fun testPlaceOrder() {
        productFamilyService.create(
            ProductFamilyRequestDto(
                id = "FIG",
                name = "Figurine"
            )
        )
        productService.create(
            ProductRequestDto(
                id = "FIGLOL",
                name = "Figurine LOL",
                purchasePrice = 700u,
                sellingPrice = 2000u,
                stock = 10u,
                productFamilyId = "FIG"
            )
        )
        addressService.create(
            AddressRequestDto(
                userId = "USERID",
                streetNumber = 1,
                streetName = "Rue du Pilat",
                city = "LYON",
                state = "FR",
                zipCode = "69000",
                country = "France"
            )
        )
        client.post().uri("/").bodyValue(
            OrderRequestDto(
                invoiceAddressId = 1,
                shippingAddressId = 1,
                userId = "USERID",
                products = mapOf(
                    "FIGLOL" to 2u
                )
            )
        ).exchange().expectStatus().isCreated().expectBody<OrderResponseSimplifiedDto>()
    }

    @Test
    @Order(2)
    fun testGetOrders() {
        client.get().uri("/").exchange().expectStatus().isOk().expectBody<List<OrderResponseSimplifiedDto>>()
    }

    @Test
    @Order(3)
    fun testProductGetById() {
        client.get().uri("/${orderService.findAll().first().id}").exchange().expectStatus().isOk().expectBody<OrderResponseDto>()
    }

    @Test
    @Order(4)
    fun testGetOrdersByUserId() {
        client.get().uri("/user=USERID").exchange().expectStatus().isOk().expectBody<List<OrderResponseSimplifiedDto>>()
    }

    @Test
    @Order(5)
    fun testOrderDeleteById() {
        client.delete().uri("/${orderService.findAll().first().id}").exchange().expectStatus().isNoContent()
    }

    @PreDestroy
    fun preDestroy() {
        productFamilyService.delete("FIG")
    }
}