package dev.x_mathias.qualite_logicielle.exceptions

import org.springframework.http.HttpStatus
import org.springframework.web.bind.annotation.ResponseStatus

@ResponseStatus(HttpStatus.NOT_FOUND)
class OrderDoesNotExistException : DoesNotExistException("Order does not exist")