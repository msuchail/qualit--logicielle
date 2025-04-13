package dev.x_mathias.qualite_logicielle.controllers

import dev.x_mathias.qualite_logicielle.domains.dtos.AddressRequestDto
import org.hamcrest.Matchers.equalTo
import org.hamcrest.Matchers.hasSize
import org.junit.jupiter.api.Order
import org.springframework.boot.testcontainers.service.connection.ServiceConnection
import org.springframework.http.MediaType
import org.springframework.test.web.servlet.delete
import org.springframework.test.web.servlet.get
import org.springframework.test.web.servlet.post
import org.springframework.test.web.servlet.put
import org.testcontainers.containers.MySQLContainer
import org.testcontainers.junit.jupiter.Container
import kotlin.test.Test


private const val BASE_URL = "/api/v1/addresses"


class AddressControllerTest: AbstractControllerTestClass() {
    companion object {
        @Container
        @ServiceConnection
        @JvmStatic
        val mysql = MySQLContainer("mysql:8.0")
    }

    @Test
    @Order(1)
    fun testCreateAddressWithGuest() {
        mockMvc.post("$BASE_URL/") {
            contentType = MediaType.APPLICATION_JSON
            content = objectMapper.writeValueAsString(
                AddressRequestDto(
                    streetNumber = 1,
                    streetName = "Rue du Pilat",
                    city = "LYON",
                    state = "FR",
                    zipCode = "69000",
                    country = "France"
                )
            )
        }.andExpect { status { isForbidden() } }
    }


    @Test
    @Order(2)
    fun testCreateAddressWithCustommerUser() {
        mockMvc.post("$BASE_URL/") {
            with(
                margot
            )
            contentType = MediaType.APPLICATION_JSON
            content = objectMapper.writeValueAsString(
                AddressRequestDto(
                    streetNumber = 1,
                    streetName = "Rue du Pilat",
                    city = "LYON",
                    state = "FR",
                    zipCode = "69000",
                    country = "France"
                )
            )
        }.andExpectAll {
            status { isCreated() }
            jsonPath("$.id", equalTo(1))
        }
    }

    @Test
    @Order(3)
    fun testCreateAddressWithAdminUser() {
        mockMvc.post("$BASE_URL/") {
            with(
                leonardo
            )
            contentType = MediaType.APPLICATION_JSON
            content = objectMapper.writeValueAsString(
                AddressRequestDto(
                    streetNumber = 1,
                    streetName = "Rue du Pilat",
                    city = "LYON",
                    state = "FR",
                    zipCode = "69000",
                    country = "France"
                )
            )
        }.andExpectAll {
            status { isCreated() }
            jsonPath("$.id", equalTo(2))
        }
    }

    @Test
    @Order(4)
    fun testGetAuthenticatedUserAddressesWithGuest() {
        mockMvc.get("$BASE_URL/").andExpect { status { isForbidden() } }
    }

    @Test
    @Order(5)
    fun testGetAuthenticatedUserAddressesWithCustommerUser() {
        mockMvc.get("$BASE_URL/") { with(margot) }.andExpect { status { isOk() } }
            .andExpectAll {
                jsonPath("$", hasSize<List<*>>(1))
                jsonPath("$.[0].id", equalTo(1))
            }
    }

    @Test
    @Order(6)
    fun testGetAuthenticatedUserAddressesWithAdminUser() {
        mockMvc.get("$BASE_URL/") { with(leonardo) }.andExpect { status { isOk() } }
            .andExpectAll {
                jsonPath("$", hasSize<List<*>>(1))
                jsonPath("$.[0].id", equalTo(2))
            }
    }

    @Test
    @Order(7)
    fun testGetAddressByIdWithCustommerUser() {
        mockMvc.get("$BASE_URL/1") { with(margot) }
            .andExpectAll {
                status { isOk() }
                jsonPath("$.id", equalTo(1))
            }
    }

    @Test
    @Order(8)
    fun testGetAddressByIdWithAdminUser() {
        mockMvc.get("$BASE_URL/2") { with(leonardo) }
            .andExpectAll {
                status { isOk() }
                jsonPath("$.id", equalTo(2))
            }
    }

    @Test
    @Order(9)
    fun testGetSomeoneElseAddressByIdWithGuest() {
        mockMvc.get("$BASE_URL/1").andExpect { status { isForbidden() } }
    }

    @Test
    @Order(10)
    fun testGetSomeoneElseAddressByIdWithCustommerUser() {
        mockMvc.get("$BASE_URL/2") { with(margot) } .andExpect { status { isForbidden() } }
    }

    @Test
    @Order(11)
    fun testGetSomeoneElseAddressByIdWithAdminUser() {
        mockMvc.get("$BASE_URL/1") {with(leonardo)} .andExpect { status { isForbidden() } }
    }

    @Test
    @Order(12)
    fun testUpdateAddressWithCustommerUser() {
        mockMvc.put("$BASE_URL/1") {
            with(margot)
            contentType = MediaType.APPLICATION_JSON
            content = objectMapper.writeValueAsString(
                AddressRequestDto(
                    streetNumber = 1,
                    streetName = "Rue du Pilat",
                    city = "PARIS",
                    state = "FR",
                    zipCode = "69000",
                    country = "France"
                )
            )
        }.andExpectAll {
            status { isOk() }
            jsonPath("$.city", equalTo("PARIS"))
        }
    }
    @Test
    @Order(13)
    fun testUpdateAddressWithAdminUser() {
        mockMvc.put("$BASE_URL/2") {
            with(leonardo)
            contentType = MediaType.APPLICATION_JSON
            content = objectMapper.writeValueAsString(
                AddressRequestDto(
                    streetNumber = 2,
                    streetName = "Rue du Pilat",
                    city = "PARIS",
                    state = "FR",
                    zipCode = "69000",
                    country = "France"
                )
            )
        }.andExpectAll {
            status { isOk() }
            jsonPath("$.city", equalTo("PARIS"))
        }
    }

    @Test
    @Order(14)
    fun testUpdateSomeoneElseAddressWithGuest() {
        mockMvc.put("$BASE_URL/1") {
            contentType = MediaType.APPLICATION_JSON
            content = objectMapper.writeValueAsString(
                AddressRequestDto(
                    streetNumber = 1,
                    streetName = "Rue du Pilat",
                    city = "PARIS",
                    state = "FR",
                    zipCode = "69000",
                    country = "France"
                )
            )
        }.andExpect { status { isForbidden() } }
    }

    @Test
    @Order(15)
    fun testUpdateSomeoneElseAddressWithCustommerUser() {
        mockMvc.put("$BASE_URL/2") {
            with(margot)
            contentType = MediaType.APPLICATION_JSON
            content = objectMapper.writeValueAsString(
                AddressRequestDto(
                    streetNumber = 2,
                    streetName = "Rue du Pilat",
                    city = "PARIS",
                    state = "FR",
                    zipCode = "69000",
                    country = "France"
                )
            )
        }.andExpect { status { isForbidden() } }
    }

    @Test
    @Order(16)
    fun testUpdateSomeoneElseAddressWithAdminUser() {
        mockMvc.put("$BASE_URL/1") {
            with(leonardo)
            contentType = MediaType.APPLICATION_JSON
            content = objectMapper.writeValueAsString(
                AddressRequestDto(
                    streetNumber = 2,
                    streetName = "Rue du Pilat",
                    city = "PARIS",
                    state = "FR",
                    zipCode = "69000",
                    country = "France"
                )
            )
        }.andExpect { status { isForbidden() } }
    }

    @Test
    @Order(17)
    fun testDeleteSomeoneElseAddressWithGuest() {
        mockMvc.delete("$BASE_URL/1").andExpect { status { isForbidden() } }
    }

    @Test
    @Order(18)
    fun testDeleteSomeoneElseAddressWithCustommerUser() {
        mockMvc.delete("$BASE_URL/2") {
            with(margot)
        }.andExpect { status { isForbidden() } }
    }

    @Test
    @Order(19)
    fun testDeleteSomeoneElseAddressWithAdminUser() {
        mockMvc.delete("$BASE_URL/1") {
            with(leonardo)
        }.andExpect { status { isForbidden() } }
    }

    @Test
    @Order(20)
    fun testDeleteAddressWithCustommerUser() {
        mockMvc.delete("$BASE_URL/1") {
            with(margot)
        }.andExpect { status { isNoContent() } }
    }

    @Test
    @Order(21)
    fun testDeleteAddressWithAdminUser() {
        mockMvc.delete("$BASE_URL/2") {
            with(leonardo)
        }.andExpect { status { isNoContent() } }
    }
}