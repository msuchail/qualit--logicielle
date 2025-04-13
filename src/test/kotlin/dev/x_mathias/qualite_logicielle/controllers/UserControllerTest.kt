package dev.x_mathias.qualite_logicielle.controllers

import org.junit.jupiter.api.Test
import org.springframework.test.web.servlet.get

private const val BASE_URL = "/api/v1/users"


class UserControllerTest : AbstractControllerTestClass() {
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