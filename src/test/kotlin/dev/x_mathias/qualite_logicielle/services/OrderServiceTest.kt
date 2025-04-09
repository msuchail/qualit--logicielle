package dev.x_mathias.qualite_logicielle.services

import dev.x_mathias.qualite_logicielle.domains.dtos.*
import dev.x_mathias.qualite_logicielle.exceptions.AddressDoesNotExistException
import dev.x_mathias.qualite_logicielle.exceptions.OrderDoesNotExistException
import dev.x_mathias.qualite_logicielle.exceptions.ProductDoesNotExistsException
import dev.x_mathias.qualite_logicielle.exceptions.ProductNotEnoughStockException
import jakarta.annotation.PreDestroy
import org.assertj.core.api.Assertions.assertThat
import org.assertj.core.api.Assertions.assertThatExceptionOfType
import org.junit.jupiter.api.MethodOrderer
import org.junit.jupiter.api.Order
import org.junit.jupiter.api.TestMethodOrder
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.boot.test.context.SpringBootTest
import org.springframework.boot.testcontainers.service.connection.ServiceConnection
import org.testcontainers.containers.MongoDBContainer
import org.testcontainers.containers.MySQLContainer
import org.testcontainers.junit.jupiter.Container
import org.testcontainers.junit.jupiter.Testcontainers
import java.util.*
import kotlin.test.Test


@SpringBootTest
@Testcontainers
@TestMethodOrder(MethodOrderer.OrderAnnotation::class)
class OrderServiceTest {
    companion object {
        @Container
        @ServiceConnection
        @JvmStatic
        val mySqlContainer = MySQLContainer("mysql:5.7")

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

    private val shippingAddress = AddressRequestDto(
        userId = "USERID",
        streetNumber = 12,
        streetName = "Rue du Pilat",
        city = "Saint Petersburg",
        state = "FR",
        zipCode = "12324",
        country = "France"
    )
    private val invoiceAddress = AddressRequestDto(
        userId = "USERID",
        streetNumber = 12,
        streetName = "Rue du Pilat",
        city = "Lyon",
        state = "FR",
        zipCode = "12324",
        country = "France"
    )


    @Test
    @Order(0)
    fun preconditions() {
        addressService.create(invoiceAddress).id
        addressService.create(shippingAddress).id

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
                purchasePrice = 10u,
                sellingPrice = 20u,
                stock = 11u,
                productFamilyId = "FIG",
            )
        )
    }

    @Test
    @Order(1)
    fun testOrderCreate() {
        orderService.create(
            orderRequestDto = OrderRequestDto(
                invoiceAddressId = 1,
                shippingAddressId = 2,
                userId = "USERID",
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
                orderRequestDto = OrderRequestDto(
                    invoiceAddressId = 1,
                    shippingAddressId = 2,
                    userId = "USERID",
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
                orderRequestDto = OrderRequestDto(
                    invoiceAddressId = 1,
                    shippingAddressId = 2,
                    userId = "USERID",
                    products = mapOf()
                )
            )
        }
    }


    @Test
    @Order(4)
    fun testStockUpdated() {
        assertThat(productService.findById("FIGLOL").stock).isEqualTo(10u)
    }

    @Test
    @Order(5)
    fun testOrderCreateWithInexistingProduct() {
        assertThatExceptionOfType(ProductDoesNotExistsException::class.java).isThrownBy {
            orderService.create(
                orderRequestDto = OrderRequestDto(
                    invoiceAddressId = 1,
                    shippingAddressId = 2,
                    userId = "USERID",
                    products = mapOf(
                        "TOTO" to 1u
                    )
                )
            )
        }
    }

    @Test
    @Order(6)
    fun testOrderCreateWithInexistingAddress() {
        assertThatExceptionOfType(AddressDoesNotExistException::class.java).isThrownBy {
            orderService.create(
                orderRequestDto = OrderRequestDto(
                    invoiceAddressId = 1,
                    shippingAddressId = 3,
                    userId = "USERID",
                    products = mapOf(
                        "FIGLOL" to 1u
                    )
                )
            )
        }
        assertThatExceptionOfType(AddressDoesNotExistException::class.java).isThrownBy {
            orderService.create(
                orderRequestDto = OrderRequestDto(
                    invoiceAddressId = 3,
                    shippingAddressId = 1,
                    userId = "USERID",
                    products = mapOf(
                        "FIGLOL" to 1u
                    )
                )
            )
        }
    }

    @Test
    @Order(7)
    fun testOrderFindAll() {
        val result = orderService.findAll()
        assertThat(result).hasSize(1)
    }

    @Test
    @Order(8)
    fun testOrderFindById() {
        val id = orderService.findAll().first().id
        val result = orderService.findById(id)
        assertThat(result.userId).isEqualTo("USERID")
    }

    @Test
    @Order(9)
    fun testThatOrderDocumentMapperThrowExceptionIfProductDoesNotExists() {
        assertThatExceptionOfType(ProductDoesNotExistsException::class.java).isThrownBy {
            orderMapper.toDocument(
                OrderRequestDto(
                    invoiceAddressId = 1,
                    shippingAddressId = 2,
                    userId = "USERID",
                    products = mapOf(
                        "TOTO" to 1u
                    )
                )
            )
        }
    }

    @Test
    @Order(10)
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
                OrderRequestDto(
                    invoiceAddressId = 1,
                    shippingAddressId = 2,
                    userId = "USERID",
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
    @Order(11)
    fun testOrderFindByIFailWithBadId() {
        assertThatExceptionOfType(OrderDoesNotExistException::class.java).isThrownBy {
            orderService.findById(UUID.randomUUID())
        }

    }

    @Test
    @Order(12)
    fun testOderFindByUserId() {
        orderService.create(
            OrderRequestDto(
                invoiceAddressId = 1,
                shippingAddressId = 2,
                userId = "USERID2",
                products = mapOf(
                    "FIGLOL" to 1u,
                    "FIGMAR" to 1u
                )
            )
        )
        assertThat(orderService.findByUserId("USERID2")).hasSize(1)
    }

    @Test
    @Order(13)
    fun testOrderDetailsStillAvailableAfterProductAndAddressDelete() {
        addressService.delete(1)
        addressService.delete(2)
        val orderId = orderService.findAll().first().id
        productService.delete("FIGLOL")
        val result = orderService.findById(orderId)
        assertThat(result.products.first().name).isEqualTo("Figurine LOL")
        assertThat(result.invoiceAddress.city).isEqualTo("Lyon")
        assertThat(result.shippingAddress.city).isEqualTo("Saint Petersburg")
    }

    @Test
    @Order(14)
    fun testOrderDelete() {
        orderService.delete(orderService.findAll().first().id)
    }

    @Test
    @Order(15)
    fun testOrderDeleteFailWhenBadId() {
        assertThatExceptionOfType(OrderDoesNotExistException::class.java).isThrownBy {
            orderService.delete(UUID.randomUUID())
        }
    }

    @PreDestroy
    fun preDestroy() {
        productFamilyService.delete("FIG")
    }
}