package dev.x_mathias.qualite_logicielle.controllers

import com.fasterxml.jackson.databind.ObjectMapper
import org.junit.jupiter.api.BeforeAll
import org.junit.jupiter.api.MethodOrderer
import org.junit.jupiter.api.TestInstance
import org.junit.jupiter.api.TestMethodOrder
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.boot.test.context.SpringBootTest
import org.springframework.security.core.authority.SimpleGrantedAuthority
import org.springframework.security.oauth2.core.oidc.StandardClaimNames
import org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestPostProcessors
import org.springframework.security.test.web.servlet.setup.SecurityMockMvcConfigurers.springSecurity
import org.springframework.test.web.servlet.MockMvc
import org.springframework.test.web.servlet.setup.DefaultMockMvcBuilder
import org.springframework.test.web.servlet.setup.MockMvcBuilders
import org.springframework.web.context.WebApplicationContext
import org.testcontainers.junit.jupiter.Testcontainers

@SpringBootTest
@Testcontainers
@TestMethodOrder(MethodOrderer.OrderAnnotation::class)
@TestInstance(TestInstance.Lifecycle.PER_CLASS)
abstract class AbstractControllerTestClass {
    @Autowired
    lateinit var context: WebApplicationContext
    @Autowired
    lateinit var objectMapper: ObjectMapper
    lateinit var mockMvc: MockMvc

    val margotUUID = "AAAAAAAA-AAAA-AAAA-AAAA-AAAAAAAAAAAA"
    val leonardoUUID = "BBBBBBBB-BBBB-BBBB-BBBB-BBBBBBBBBBBB"

    val margot: SecurityMockMvcRequestPostProcessors.JwtRequestPostProcessor = SecurityMockMvcRequestPostProcessors.jwt()
        .jwt { it.claim(StandardClaimNames.SUB, margotUUID) }
        .authorities(listOf(SimpleGrantedAuthority("ROLE_CUSTOMMER")))

    val leonardo: SecurityMockMvcRequestPostProcessors.JwtRequestPostProcessor = SecurityMockMvcRequestPostProcessors.jwt()
        .jwt { it.claim(StandardClaimNames.SUB, leonardoUUID) }
        .authorities(listOf(SimpleGrantedAuthority("ROLE_ADMINISTRATOR"), SimpleGrantedAuthority("ROLE_CUSTOMMER")))


    @BeforeAll
    fun setup() {
        mockMvc = MockMvcBuilders
            .webAppContextSetup(context)
            .apply<DefaultMockMvcBuilder>(springSecurity())
            .build()
    }
}