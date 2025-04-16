package dev.x_mathias.qualite_logicielle

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.context.properties.EnableConfigurationProperties
import org.springframework.boot.runApplication
import org.springframework.scheduling.annotation.EnableScheduling

@SpringBootApplication
@EnableConfigurationProperties
@EnableScheduling
class QualiteLogicielleApplication

fun main(args: Array<String>) {
	runApplication<QualiteLogicielleApplication>(*args)
}
