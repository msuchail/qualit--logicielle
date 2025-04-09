package dev.x_mathias.qualite_logicielle.exceptions

import org.springframework.http.HttpStatus
import org.springframework.web.bind.annotation.ResponseStatus

@ResponseStatus(HttpStatus.CONFLICT)
class ProductAlreadyExistsException: AlreadyExistsException("Product already exists")
@ResponseStatus(HttpStatus.NOT_FOUND)
class ProductDoesNotExistsException: DoesNotExistException("Product does not exists")
@ResponseStatus(HttpStatus.UNPROCESSABLE_ENTITY)
class ProductNotEnoughStockException : DoesNotExistException("Not enough stock form product")