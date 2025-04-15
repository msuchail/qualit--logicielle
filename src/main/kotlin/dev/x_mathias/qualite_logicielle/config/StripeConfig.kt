package dev.x_mathias.qualite_logicielle.config

import org.springframework.boot.context.properties.ConfigurationProperties
import org.springframework.context.annotation.Configuration

@Configuration
@ConfigurationProperties(prefix = "stripe")
class StripeConfig {
    var privateKey: String = ""
    var publicKey: String = ""
    var endpointSecret: String = ""
}