package dev.x_mathias.qualite_logicielle.services

import dev.x_mathias.qualite_logicielle.domains.dtos.*
import dev.x_mathias.qualite_logicielle.exceptions.AddressDoesNotExistException
import dev.x_mathias.qualite_logicielle.exceptions.OrderDoesNotExistException
import dev.x_mathias.qualite_logicielle.exceptions.ProductDoesNotExistsException
import dev.x_mathias.qualite_logicielle.exceptions.ProductNotEnoughStockException
import org.assertj.core.api.Assertions.assertThat
import org.assertj.core.api.Assertions.assertThatExceptionOfType
import org.junit.jupiter.api.BeforeAll
import org.junit.jupiter.api.Order
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.boot.testcontainers.service.connection.ServiceConnection
import org.testcontainers.containers.MongoDBContainer
import org.testcontainers.containers.MySQLContainer
import org.testcontainers.junit.jupiter.Container
import java.util.*
import kotlin.test.Test


class OrderServiceTest : AbstractServiceTestClass() {
    companion object {
        @Container
        @ServiceConnection
        @JvmStatic
        val mySqlContainer = MySQLContainer("mysql:8.0")

        @Container
        @ServiceConnection
        @JvmStatic
        val mongoDBContainer = MongoDBContainer("mongo:7.0")
    }

    @Autowired
    private lateinit var productFamilyService: ProductFamilyService

    @Autowired
    private lateinit var productService: ProductService

    @Autowired
    private lateinit var orderService: OrderService

    @Autowired
    private lateinit var addressService: AddressService

    @Autowired
    private lateinit var orderMapper: OrderMapper


    @BeforeAll
    fun beforeAll() {
        val shippingAddress = AddressRequestDto(
            streetNumber = 12,
            streetName = "Rue du Pilat",
            city = "Saint Petersburg",
            state = "FR",
            zipCode = "12324",
            country = "France"
        )
        val invoiceAddress = AddressRequestDto(
            streetNumber = 12,
            streetName = "Rue du Pilat",
            city = "Lyon",
            state = "FR",
            zipCode = "12324",
            country = "France"
        )
        val randomAddress = AddressRequestDto(
            streetNumber = 12,
            streetName = "Rue du Pilat",
            city = "Random",
            state = "FR",
            zipCode = "12324",
            country = "France"
        )
        addressService.create("USERID", invoiceAddress)
        addressService.create("USERID", shippingAddress)
        addressService.create("RANDOM-USER", randomAddress)

        productFamilyService.create(
            ProductFamilyRequestDto(
                id = "FIG",
                name = "Figurine",
            )
        )
        productService.create(
            ProductRequestDto(
                id = "FIGLOL",
                name = "Figurine LOL",
                purchasePrice = 1000u,
                sellingPrice = 2000u,
                stock = 11u,
                productFamilyId = "FIG",
            )
        )
    }



    @Test
    @Order(1)
    fun testOrderCreate() {
        orderService.create(
            userId = "USERID",
            orderRequestDto = OrderRequestDto(
                invoiceAddressId = 1,
                shippingAddressId = 2,
                products = mapOf(
                    "FIGLOL" to 1u
                )
            )
        )
    }

    @Test
    @Order(2)
    fun testOrderCreateFailWithBadProduct() {
        assertThatExceptionOfType(ProductDoesNotExistsException::class.java).isThrownBy {
            orderService.create(
                userId = "USERID",
                orderRequestDto = OrderRequestDto(
                    invoiceAddressId = 1,
                    shippingAddressId = 2,
                    products = mapOf(
                        "FIGLOL" to 1u,
                        "TOTO" to 1u
                    )
                )
            )
        }
    }

    @Test
    @Order(3)
    fun testOrderCreateFailWithoutProduct() {
        assertThatExceptionOfType(IllegalArgumentException::class.java).isThrownBy {
            orderService.create(
                userId = "USERID",
                orderRequestDto = OrderRequestDto(
                    invoiceAddressId = 1,
                    shippingAddressId = 2,
                    products = mapOf()
                )
            )
        }
    }

    @Test
    @Order(4)
    fun testOrderCrateFailWithInvoiceAddressThatDoesNotBelongToTheUser() {
        assertThatExceptionOfType(AddressDoesNotExistException::class.java).isThrownBy {
            orderService.create(
                userId = "USERID",
                orderRequestDto = OrderRequestDto(
                    invoiceAddressId = 3,
                    shippingAddressId = 2,
                    products = mapOf(
                        "FIGLOL" to 1u
                    )
                )
            )
        }
    }

    @Test
    @Order(5)
    fun testOrderCrateFailWithShippingAddressThatDoesNotBelongToTheUser() {
        assertThatExceptionOfType(AddressDoesNotExistException::class.java).isThrownBy {
            orderService.create(
                userId = "USERID",
                orderRequestDto = OrderRequestDto(
                    invoiceAddressId = 1,
                    shippingAddressId = 3,
                    products = mapOf(
                        "FIGLOL" to 1u
                    )
                )
            )
        }
    }


    @Test
    @Order(6)
    fun testStockUpdated() {
        assertThat(productService.findById("FIGLOL").stock).isEqualTo(10u)
    }

    @Test
    @Order(7)
    fun testOrderCreateWithInexistingProduct() {
        assertThatExceptionOfType(ProductDoesNotExistsException::class.java).isThrownBy {
            orderService.create(
                userId = "USERID",
                orderRequestDto = OrderRequestDto(
                    invoiceAddressId = 1,
                    shippingAddressId = 2,
                    products = mapOf(
                        "TOTO" to 1u
                    )
                )
            )
        }
    }

    @Test
    @Order(8)
    fun testOrderCreateWithInexistingAddress() {
        assertThatExceptionOfType(AddressDoesNotExistException::class.java).isThrownBy {
            orderService.create(
                userId = "USERID",
                orderRequestDto = OrderRequestDto(
                    invoiceAddressId = 1,
                    shippingAddressId = 3,
                    products = mapOf(
                        "FIGLOL" to 1u
                    )
                )
            )
        }
        assertThatExceptionOfType(AddressDoesNotExistException::class.java).isThrownBy {
            orderService.create(
                userId = "USERID",
                orderRequestDto = OrderRequestDto(
                    invoiceAddressId = 3,
                    shippingAddressId = 1,
                    products = mapOf(
                        "FIGLOL" to 1u
                    )
                )
            )
        }
    }

    @Test
    @Order(9)
    fun testOrderFindAll() {
        val result = orderService.findByUserId("USERID")
        assertThat(result).hasSize(1)
    }

    @Test
    @Order(10)
    fun testOrderFindById() {
        val id = orderService.findByUserId("USERID").first().id
        val result = orderService.findById(id)
        assertThat(result.userId).isEqualTo("USERID")
    }

    @Test
    @Order(11)
    fun testThatOrderDocumentMapperThrowExceptionIfProductDoesNotExists() {
        assertThatExceptionOfType(ProductDoesNotExistsException::class.java).isThrownBy {
            orderMapper.toDocument(
                userId = "USERID",
                OrderRequestDto(
                    invoiceAddressId = 1,
                    shippingAddressId = 2,
                    products = mapOf(
                        "TOTO" to 1u
                    )
                )
            )
        }
    }

    @Test
    @Order(12)
    fun testTransactionalAspectOfStockOrder() {
        productService.create(
            ProductRequestDto(
                id = "FIGMAR",
                name = "Figurine Mario",
                purchasePrice = 10u,
                sellingPrice = 20u,
                stock = 1u,
                productFamilyId = "FIG",
            )
        )
        assertThatExceptionOfType(ProductNotEnoughStockException::class.java).isThrownBy {
            orderService.create(
                userId = "USERID",
                OrderRequestDto(
                    invoiceAddressId = 1,
                    shippingAddressId = 2,
                    products = mapOf(
                        "FIGLOL" to 1u,
                        "FIGMAR" to 2u
                    )
                )
            )
        }
        assertThat(productService.findById("FIGLOL").stock).isEqualTo(10u)
    }

    @Test
    @Order(13)
    fun testOrderFindByIFailWithBadId() {
        assertThatExceptionOfType(OrderDoesNotExistException::class.java).isThrownBy {
            orderService.findById(UUID.randomUUID())
        }

    }

    @Test
    @Order(14)
    fun testOderFindByUserId() {
        assertThat(orderService.findByUserId("USERID")).hasSize(1)
    }

    @Test
    @Order(15)
    fun testOrderDetailsStillAvailableAfterProductAndAddressDelete() {
        addressService.delete(1)
        addressService.delete(2)
        val orderId = orderService.findByUserId("USERID").first().id
        productService.delete("FIGLOL")
        val result = orderService.findById(orderId)
        assertThat(result.products.first().product.name).isEqualTo("Figurine LOL")
        assertThat(result.invoiceAddress.city).isEqualTo("Lyon")
        assertThat(result.shippingAddress.city).isEqualTo("Saint Petersburg")
    }

    @Test
    @Order(16)
    fun testOrderDelete() {
        orderService.delete(orderService.findByUserId("USERID").first().id)
    }

    @Test
    @Order(17)
    fun testOrderDeleteFailWhenBadId() {
        assertThatExceptionOfType(OrderDoesNotExistException::class.java).isThrownBy {
            orderService.delete(UUID.randomUUID())
        }
    }
}