package dev.x_mathias.qualite_logicielle.controllers

import com.fasterxml.jackson.databind.ObjectMapper
import dev.x_mathias.qualite_logicielle.domains.dtos.AddressRequestDto
import dev.x_mathias.qualite_logicielle.domains.dtos.AddressResponseDto
import org.junit.jupiter.api.BeforeEach
import org.junit.jupiter.api.MethodOrderer
import org.junit.jupiter.api.Order
import org.junit.jupiter.api.TestMethodOrder
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.boot.test.context.SpringBootTest
import org.springframework.boot.testcontainers.service.connection.ServiceConnection
import org.springframework.http.MediaType
import org.springframework.test.web.reactive.server.WebTestClient
import org.springframework.test.web.reactive.server.expectBody
import org.springframework.test.web.servlet.client.MockMvcWebTestClient
import org.testcontainers.containers.MySQLContainer
import org.testcontainers.junit.jupiter.Container
import org.testcontainers.junit.jupiter.Testcontainers
import kotlin.test.Test


@SpringBootTest
@Testcontainers
@TestMethodOrder(MethodOrderer.OrderAnnotation::class)
class AddressControllerTest {
    @Autowired
    lateinit var objectMapper: ObjectMapper
    @Autowired
    lateinit var controller: AddressController
    lateinit var client: WebTestClient

    companion object {
        @Container
        @ServiceConnection
        @JvmStatic
        val mysql = MySQLContainer("mysql:5.7")
    }


    @BeforeEach
    fun setup() {
        client = MockMvcWebTestClient.bindToController(controller).configureClient().baseUrl("/api/v1/addresses").build()
    }

    @Test
    @Order(1)
    fun testCreateAddress() {
        client.post().uri("/")
            .contentType(MediaType.APPLICATION_JSON)
            .bodyValue(
            objectMapper.writeValueAsString(
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
        ).exchange()
        .expectStatus().isCreated().expectBody<AddressResponseDto>()
    }

    @Test
    @Order(2)
    fun testGetById() {
        client.get().uri("/1").exchange()
            .expectStatus().isOk().expectBody<AddressResponseDto>()
    }

    @Test
    @Order(3)
    fun testGetByUserId() {
        client.get().uri("/user=USERID").exchange()
            .expectStatus().isOk().expectBody<List<AddressResponseDto>>()
    }

    @Test
    @Order(4)
    fun testUpdate() {
        client.put().uri("/1").bodyValue(
            AddressRequestDto(
                userId = "USERID",
                streetNumber = 1,
                streetName = "Rue du Pilat",
                city = "PARIS",
                state = "FR",
                zipCode = "69000",
                country = "France"
            )
        ).exchange()
            .expectStatus().isOk().expectBody<AddressResponseDto>()
    }

    @Test
    @Order(5)
    fun testDeleteById() {
        client.delete().uri("/1").exchange().expectStatus().isNoContent()
    }
}