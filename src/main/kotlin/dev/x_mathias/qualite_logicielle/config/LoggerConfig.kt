package dev.x_mathias.qualite_logicielle.config

import io.github.oshai.kotlinlogging.KLogger
import io.github.oshai.kotlinlogging.KotlinLogging
import org.springframework.context.annotation.Bean
import org.springframework.context.annotation.Configuration

@Configuration
class LoggerConfig {
    @Bean
    fun logger(): KLogger = KotlinLogging.logger {}
}