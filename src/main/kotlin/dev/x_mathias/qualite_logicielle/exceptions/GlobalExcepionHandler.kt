package dev.x_mathias.qualite_logicielle.exceptions

import io.github.oshai.kotlinlogging.KLogger
import org.springframework.http.HttpStatus
import org.springframework.security.authorization.AuthorizationDeniedException
import org.springframework.web.bind.annotation.ExceptionHandler
import org.springframework.web.bind.annotation.ResponseStatus
import org.springframework.web.bind.annotation.RestControllerAdvice


open class DoesNotExistException(message: String): RuntimeException(message)
open class AlreadyExistsException(message: String): RuntimeException(message)
class AuthorizationDeniedException: AuthorizationDeniedException("Access denied")


@RestControllerAdvice
class GlobalExcepionHandler(
    val logger: KLogger
) {
    @ExceptionHandler(IllegalArgumentException::class)
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    fun handle(e: IllegalArgumentException) = mapOf("error" to e.message)

    @ExceptionHandler(DoesNotExistException::class)
    @ResponseStatus(HttpStatus.NOT_FOUND)
    fun handle(e: DoesNotExistException) = mapOf("error" to e.message)


    @ExceptionHandler(AlreadyExistsException::class)
    @ResponseStatus(HttpStatus.CONFLICT)
    fun handle(e: AlreadyExistsException) = mapOf("error" to e.message)

    @ExceptionHandler(AuthorizationDeniedException::class)
    @ResponseStatus(HttpStatus.FORBIDDEN)
    fun handle(e: AuthorizationDeniedException) = mapOf("error" to e.message)

    @ExceptionHandler(Exception::class)
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    fun handle(e: Exception): Map<String, String> {
        logger.error {
            e.stackTraceToString()
        }
        return mapOf("error" to "Bad request")
    }
}