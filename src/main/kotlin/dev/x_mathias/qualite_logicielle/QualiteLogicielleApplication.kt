package dev.x_mathias.qualite_logicielle

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.context.properties.EnableConfigurationProperties
import org.springframework.boot.runApplication

@SpringBootApplication
@EnableConfigurationProperties
class QualiteLogicielleApplication

fun main(args: Array<String>) {
	runApplication<QualiteLogicielleApplication>(*args)
}
