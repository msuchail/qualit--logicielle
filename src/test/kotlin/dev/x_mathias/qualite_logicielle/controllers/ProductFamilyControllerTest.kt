package dev.x_mathias.qualite_logicielle.controllers

import dev.x_mathias.qualite_logicielle.domains.dtos.ProductFamilyRequestDto
import dev.x_mathias.qualite_logicielle.domains.dtos.ProductFamilyWithoutIdRequestDto
import org.hamcrest.Matchers.equalTo
import org.junit.jupiter.api.Order
import org.junit.jupiter.api.Test
import org.springframework.boot.testcontainers.service.connection.ServiceConnection
import org.springframework.http.MediaType
import org.springframework.test.web.servlet.delete
import org.springframework.test.web.servlet.get
import org.springframework.test.web.servlet.post
import org.springframework.test.web.servlet.put
import org.testcontainers.containers.MySQLContainer
import org.testcontainers.junit.jupiter.Container


private const val BASE_URL = "/api/v1/product-families"

class ProductFamilyControllerTest : AbstractControllerTestClass() {
    companion object {
        @Container
        @ServiceConnection
        @JvmStatic
        val mysql = MySQLContainer("mysql:8.0")
    }

    @Test
    @Order(1)
    fun testProductFamilyCreateWithGuest() {
        mockMvc.post("$BASE_URL/") {
            contentType = MediaType.APPLICATION_JSON
            content = objectMapper.writeValueAsString(
                ProductFamilyRequestDto(
                    id = "FIG",
                    name = "Figurine"
                )
            )
        }.andExpect { status { isForbidden() } }
    }

    @Test
    @Order(2)
    fun testProductFamilyCreateWithCustommerUser() {
        mockMvc.post("$BASE_URL/") {
            with(margot)
            contentType = MediaType.APPLICATION_JSON
            content = objectMapper.writeValueAsString(
                ProductFamilyRequestDto(
                    id = "FIG",
                    name = "Figurine"
                )
            )
        }.andExpect { status { isForbidden() } }
    }

    @Test
    @Order(3)
    fun testProductFamilyCreateWithAdminUser() {
        mockMvc.post("$BASE_URL/") {
            with(leonardo)
            contentType = MediaType.APPLICATION_JSON
            content = objectMapper.writeValueAsString(
                ProductFamilyRequestDto(
                    id = "FIG",
                    name = "Figurine"
                )
            )
        }.andExpectAll {
            status { isCreated() }
            content {
                jsonPath("$.id", equalTo("FIG"))
            }
        }
    }

    @Test
    @Order(4)
    fun testProductFamilyGetAllWithGuest() {
        mockMvc.get("$BASE_URL/").andExpectAll {
            status { isOk() }
            jsonPath("$[0].id") { value("FIG") }
        }
    }

    @Test
    @Order(5)
    fun testProductFamilyGetAllWithCustommerUser() {
        mockMvc.get("$BASE_URL/") { with(margot) }.andExpectAll {
            status { isOk() }
            jsonPath("$[0].id") { value("FIG") }
        }
    }

    @Test
    @Order(6)
    fun testProductFamilyGetAllWithAdminUser() {
        mockMvc.get("$BASE_URL/") { with(leonardo) }.andExpectAll {
            status { isOk() }
            jsonPath("$[0].id") { value("FIG") }
        }
    }

    @Test
    @Order(7)
    fun testProductFamilyGetByIdWithGuest() {
        mockMvc.get("$BASE_URL/FIG").andExpectAll {
            status { isOk() }
            jsonPath("$.id") { value("FIG") }
        }
    }

    @Test
    @Order(8)
    fun testProductFamilyGetByIdWithCustommerUser() {
        mockMvc.get("$BASE_URL/FIG") { with(margot) } .andExpectAll {
            status { isOk() }
            jsonPath("$.id") { value("FIG") }
        }
    }

    @Test
    @Order(9)
    fun testProductFamilyGetByIdWithAdminUser() {
        mockMvc.get("$BASE_URL/FIG") { with(leonardo) } .andExpectAll {
            status { isOk() }
            jsonPath("$.id") { value("FIG") }
        }
    }

    @Test
    @Order(10)
    fun testProductFamilyUpdateWithGuest() {
        mockMvc.put("$BASE_URL/FIG") {
            contentType = MediaType.APPLICATION_JSON
            content = objectMapper.writeValueAsString(
                ProductFamilyWithoutIdRequestDto(
                    name = "Figurine 2"
                )
            )
        }.andExpect { status { isForbidden() } }
    }

    @Test
    @Order(11)
    fun testProductFamilyUpdateWithCustommerUser() {
        mockMvc.put("$BASE_URL/FIG") {
            with(margot)
            contentType = MediaType.APPLICATION_JSON
            content = objectMapper.writeValueAsString(
                ProductFamilyWithoutIdRequestDto(
                    name = "Figurine 2"
                )
            )
        }.andExpect { status { isForbidden() } }
    }

    @Test
    @Order(12)
    fun testProductFamilyUpdateWithAdminUser() {
        mockMvc.put("$BASE_URL/FIG") {
            with(leonardo)
            contentType = MediaType.APPLICATION_JSON
            content = objectMapper.writeValueAsString(
                ProductFamilyWithoutIdRequestDto(
                    name = "Figurine 2"
                )
            )
        }.andExpectAll {
            status { isOk() }
            jsonPath("$.id") { value("FIG") }
        }
    }

    @Test
    @Order(13)
    fun productFamilyDeleteWithGuest() {
        mockMvc.delete("$BASE_URL/FIG").andExpect { status { isForbidden() } }
    }

    @Test
    @Order(14)
    fun productFamilyDeleteWithCustommerUser() {
        mockMvc.delete("$BASE_URL/FIG") { with(margot) } .andExpect { status { isForbidden() } }
    }

    @Test
    @Order(15)
    fun productFamilyDeleteWithAdminUser() {
        mockMvc.delete("$BASE_URL/FIG") { with(leonardo) } .andExpect { status { isNoContent() } }
    }
}