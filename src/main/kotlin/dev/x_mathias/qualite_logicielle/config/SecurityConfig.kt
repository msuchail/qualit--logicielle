package dev.x_mathias.qualite_logicielle.config

import org.springframework.context.annotation.Bean
import org.springframework.context.annotation.Configuration
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity
import org.springframework.security.config.annotation.web.builders.HttpSecurity
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity
import org.springframework.security.config.annotation.web.invoke
import org.springframework.security.core.authority.SimpleGrantedAuthority
import org.springframework.security.oauth2.server.resource.authentication.JwtAuthenticationConverter
import org.springframework.security.web.SecurityFilterChain
import java.util.*


const val baseUri = "/api/v1"

@Configuration
@EnableWebSecurity
@EnableMethodSecurity
class SecurityConfig {
    @Bean
    @Throws(Exception::class)
    fun resourceServerSecurityFilterChain(
        http: HttpSecurity,
    ): SecurityFilterChain {
        http {
            oauth2ResourceServer {
                jwt {
                    jwtAuthenticationConverter = JwtAuthenticationConverter().apply {
                        setJwtGrantedAuthoritiesConverter {
                            val realmAccess = it.claims["realm_access"] as Map<*, *>
                            val roles = realmAccess["roles"] as List<*>
                            roles.map { role -> SimpleGrantedAuthority("ROLE_$role") }
                        }
                    }
                }
            }
        }
        return http.build()
    }
}