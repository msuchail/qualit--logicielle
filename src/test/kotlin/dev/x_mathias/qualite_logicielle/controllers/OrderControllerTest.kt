package dev.x_mathias.qualite_logicielle.controllers

import dev.x_mathias.qualite_logicielle.domains.dtos.*
import dev.x_mathias.qualite_logicielle.repositories.OrderRepository
import dev.x_mathias.qualite_logicielle.services.AddressService
import dev.x_mathias.qualite_logicielle.services.OrderService
import dev.x_mathias.qualite_logicielle.services.ProductFamilyService
import dev.x_mathias.qualite_logicielle.services.ProductService
import org.hamcrest.Matchers.equalTo
import org.hamcrest.Matchers.hasSize
import org.junit.jupiter.api.AfterAll
import org.junit.jupiter.api.BeforeAll
import org.junit.jupiter.api.Order
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.boot.testcontainers.service.connection.ServiceConnection
import org.springframework.http.MediaType
import org.springframework.test.web.servlet.get
import org.springframework.test.web.servlet.post
import org.testcontainers.containers.MongoDBContainer
import org.testcontainers.containers.MySQLContainer
import org.testcontainers.junit.jupiter.Container
import kotlin.test.Test

private const val BASE_URL = "/api/v1/orders"

class OrderControllerTest: AbstractControllerTestClass() {
    companion object {
        @Container
        @ServiceConnection
        @JvmStatic
        val mysql = MySQLContainer("mysql:8.0")

        @Container
        @ServiceConnection
        @JvmStatic
        val mongoDBContainer = MongoDBContainer("mongo:7.0")
    }

    @Autowired
    private lateinit var orderService: OrderService

    @Autowired
    lateinit var productService: ProductService

    @Autowired
    lateinit var productFamilyService: ProductFamilyService

    @Autowired
    lateinit var addressService: AddressService

    @Autowired
    lateinit var orderRepository: OrderRepository

    @AfterAll
    fun afterAll() {
        orderRepository.deleteAll()
    }

    @BeforeAll
    fun beforeAll() {
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
        productService.create(
            ProductRequestDto(
                id = "FIGMAR",
                name = "Figurine Mario",
                purchasePrice = 700u,
                sellingPrice = 2000u,
                stock = 10u,
                productFamilyId = "FIG"
            )
        )
        addressService.create(
            userId = margotUUID,
            addressRequestDto = AddressRequestDto(
                firstName = "A".repeat(FIRST_NAME_MIN_LENGTH),
                lastName = "A".repeat(LAST_NAME_MIN_LENGTH),
                streetNumber = 1,
                streetName = "Rue du Pilat",
                city = "LYON",
                state = "FR",
                zipCode = "69000",
                country = "France"
            ),
        )
        addressService.create(
            userId = leonardoUUID,
            addressRequestDto = AddressRequestDto(
                firstName = "A".repeat(FIRST_NAME_MIN_LENGTH),
                lastName = "A".repeat(LAST_NAME_MIN_LENGTH),
                streetNumber = 1,
                streetName = "Rue du Pilat",
                city = "PARIS",
                state = "FR",
                zipCode = "69000",
                country = "France"
            ),
        )
    }

    @Test
    @Order(1)
    fun testPlaceOrderWithGuest() {
        mockMvc.post("$BASE_URL/") {
            contentType = MediaType.APPLICATION_JSON
            content = objectMapper.writeValueAsString(
                OrderRequestDto(
                    invoiceAddressId = 1,
                    shippingAddressId = 1,
                    products = mapOf(
                        "FIGLOL" to 1u
                    )
                )
            )
        }.andExpect { status { isForbidden() } }
    }

    @Test
    @Order(2)
    fun testPlaceOrderWithCustommerUser() {
        mockMvc.post("$BASE_URL/") {
            with(margot)
            contentType = MediaType.APPLICATION_JSON
            content = objectMapper.writeValueAsString(
                OrderRequestDto(
                    invoiceAddressId = 1,
                    shippingAddressId = 1,
                    products = mapOf(
                        "FIGLOL" to 1u
                    )
                )
            )
        }.andExpectAll {
            status { isCreated() }
            jsonPath("$.order.products", hasSize<Int>(1))
            jsonPath("$.order.products[0].productId", equalTo("FIGLOL"))
        }
    }

    @Test
    @Order(3)
    fun testPlaceOrderWithAdminUser() {
        mockMvc.post("$BASE_URL/") {
            with(leonardo)
            contentType = MediaType.APPLICATION_JSON
            content = objectMapper.writeValueAsString(
                OrderRequestDto(
                    invoiceAddressId = 2,
                    shippingAddressId = 2,
                    products = mapOf(
                        "FIGMAR" to 1u
                    )
                )
            )
        }.andExpectAll {
            status { isCreated() }
            jsonPath("$.order.products", hasSize<Int>(1))
            jsonPath("$.order.products[0].productId", equalTo("FIGMAR"))
        }
    }

    @Test
    @Order(3)
    fun testGetAuthenticatedUserOrdersWithGuest() {
        mockMvc.get("$BASE_URL/").andExpect { status { isForbidden() } }
    }

    @Test
    @Order(4)
    fun testGetAuthenticatedUserOrdersWithCustommerUser() {
        mockMvc.get("$BASE_URL/") {
            with(margot)
        }.andExpectAll {
            status { isOk() }
            jsonPath("$") { hasSize<List<*>>(2) }
        }
    }

    @Test
    @Order(5)
    fun testGetAuthenticatedUserOrdersWithAdminUser() {
        mockMvc.get("$BASE_URL/") {
            with(leonardo)
        }.andExpectAll {
            status { isOk() }
            jsonPath("$") { hasSize<List<*>>(2) }
        }
    }

    @Test
    @Order(6)
    fun testGetOrderByIdWithCustommerUser() {
        val margotOrderId = orderService.findByUserId(margotUUID).first().id
        mockMvc.get("$BASE_URL/$margotOrderId") {with(margot)}.andExpect { status { isOk() } }
    }

    @Test
    @Order(7)
    fun testGetOrderByIdWithAdminUser() {
        val leonardoOrderId = orderService.findByUserId(leonardoUUID).first().id
        mockMvc.get("$BASE_URL/$leonardoOrderId") {with(leonardo)}.andExpect { status { isOk() } }
    }

    @Test
    @Order(8)
    fun testGetSomeoneElseOrderWithGuestUser() {
        val margotOrderId = orderService.findByUserId(margotUUID).first().id
        mockMvc.get("$BASE_URL/$margotOrderId").andExpect { status { isForbidden() } }
    }

    @Test
    @Order(9)
    fun testGetSomeoneElseOrderWithCustommerUser() {
        val leonardoOrderId = orderService.findByUserId(leonardoUUID).first().id
        mockMvc.get("$BASE_URL/$leonardoOrderId") {with(margot)}.andExpect { status { isForbidden() } }
    }

    @Test
    @Order(10)
    fun testGetSomeoneElseOrderWithAdminUser() {
        val margotOrderId = orderService.findByUserId(margotUUID).first().id
        mockMvc.get("$BASE_URL/$margotOrderId") {with(leonardo)}.andExpect { status { isForbidden() } }
    }
}