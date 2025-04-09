package dev.x_mathias.qualite_logicielle.services

import dev.x_mathias.qualite_logicielle.domains.dtos.AddressMapper
import dev.x_mathias.qualite_logicielle.domains.dtos.AddressRequestDto
import dev.x_mathias.qualite_logicielle.domains.entities.AddressEntity
import dev.x_mathias.qualite_logicielle.exceptions.AddressDoesNotExistException
import org.assertj.core.api.Assertions.*
import org.junit.jupiter.api.MethodOrderer
import org.junit.jupiter.api.Order
import org.junit.jupiter.api.TestMethodOrder
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.boot.test.context.SpringBootTest
import org.springframework.boot.testcontainers.service.connection.ServiceConnection
import org.testcontainers.containers.MySQLContainer
import org.testcontainers.junit.jupiter.Container
import org.testcontainers.junit.jupiter.Testcontainers
import kotlin.test.Test

@SpringBootTest
@Testcontainers
@TestMethodOrder(MethodOrderer.OrderAnnotation::class)
class AddressServiceTest {
    companion object {
        @Container
        @ServiceConnection
        @JvmStatic
        val mysql = MySQLContainer("mysql:5.7")
    }

    @Autowired
    private lateinit var addressMapper: AddressMapper
    @Autowired private lateinit var addressService: AddressService

    @Test
    @Order(1)
    fun testCreateAddress() {
        val addressRequest = AddressRequestDto(
            userId = "USERID",
            streetNumber = 12,
            streetName = "Some street name",
            city = "LYON",
            state = "France",
            zipCode = "12443",
            country = "FRANCE"
        )
        addressService.create(addressRequest)
    }

    @Test
    @Order(2)
    fun testFindById() {
        val result = addressService.findById(1)
        assertThat(result.streetName).isEqualTo("Some street name")
    }

    @Test
    @Order(3)
    fun testFindByIdFailWithBadId() {
        assertThatExceptionOfType(AddressDoesNotExistException::class.java).isThrownBy {
            addressService.findById(2)
        }
    }

    @Test
    @Order(4)
    fun testFindByUserId() {
        addressService.create(AddressRequestDto(
            userId = "USERID1",
            streetNumber = 12,
            streetName = "Some street name 2",
            city = "LYON",
            state = "France",
            zipCode = "12443",
            country = "FRANCE"
        ))

        val result = addressService.findByUserId("USERID")
        assertThat(result).hasSize(1)
        assertThat(result[0].streetName).isEqualTo("Some street name")
    }

    @Test
    @Order(5)
    fun testUpdateAddress() {
        val result = addressService.update(1, AddressRequestDto(
            userId = "USERID",
            streetNumber = 12,
            streetName = "Some street name 3",
            city = "LYON",
            state = "France",
            zipCode = "12443",
            country = "FRANCE"
        ))
        assertThat(result.streetName).isEqualTo("Some street name 3")
    }
    @Test
    @Order(6)
    fun testUpdateAddressFailWithBadId() {
        assertThatExceptionOfType(AddressDoesNotExistException::class.java).isThrownBy {
            addressService.update(5, AddressRequestDto(
                userId = "USERID",
                streetNumber = 12,
                streetName = "Some street name 3",
                city = "LYON",
                state = "France",
                zipCode = "12443",
                country = "FRANCE"
            ))
        }
    }

    @Test
    @Order(7)
    fun testAddressDelete() {
        addressService.delete(1)
    }

    @Test
    @Order(8)
    fun testDeleteAddress() {
        assertThatExceptionOfType(AddressDoesNotExistException::class.java).isThrownBy {
            addressService.delete(10)
        }
    }

    @Test
    @Order(9)
    fun testThatAddressMapperThrowExceptionWhenEntityIdIsNull() {
        assertThatExceptionOfType(NullPointerException::class.java).isThrownBy {
            addressMapper.fromEntity(AddressEntity(
                id = null,
                userId = "USERID",
                streetNumber = 12,
                streetName = "Some street name",
                city = "LYON",
                state = "France",
                zipCode = "12443",
                country = "FRANCE"
            ))
        }
    }
}