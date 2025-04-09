package dev.x_mathias.qualite_logicielle.exceptions

import org.springframework.http.HttpStatus
import org.springframework.web.bind.annotation.ResponseStatus

@ResponseStatus(HttpStatus.CONFLICT)
class ProductFamilyAlreadyExists : AlreadyExistsException("Product family already exists")
@ResponseStatus(HttpStatus.NOT_FOUND)
class ProductFamilyDoesNotExists : DoesNotExistException("Product family does not exists")