package dev.x_mathias.qualite_logicielle.controllers

import org.junit.jupiter.api.Test
import org.springframework.boot.testcontainers.service.connection.ServiceConnection
import org.springframework.test.web.servlet.get
import org.testcontainers.containers.MySQLContainer
import org.testcontainers.junit.jupiter.Container

private const val BASE_URL = "/api/v1/users"


class UserControllerTest : AbstractControllerTestClass() {
    companion object {
        @Container
        @ServiceConnection
        @JvmStatic
        val mysql = MySQLContainer("mysql:8.0")
    }

    @Test
    fun testGetUserWithGuest() {
        mockMvc.get("$BASE_URL/me").andExpect {
            status { isForbidden() }
        }
    }

    @Test
    fun testGetUserWithCustommerUser() {
        mockMvc.get("$BASE_URL/me") { with(margot) }.andExpect {
            status { isOk() }
        }.andExpect {

        }
    }

    @Test
    fun testGetUserWithAdminUser() {
        mockMvc.get("$BASE_URL/me") { with(leonardo) }.andExpect {
            status { isOk() }
        }
    }
}