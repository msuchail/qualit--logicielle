package dev.x_mathias.qualite_logicielle.controllers

import dev.x_mathias.qualite_logicielle.domains.dtos.OrderRequestDto
import dev.x_mathias.qualite_logicielle.services.OrderService
import org.springframework.http.HttpStatus
import org.springframework.web.bind.annotation.*
import java.util.*

@RestController
@RequestMapping("/api/v1/orders")
class OrderController (private val orderService: OrderService) {
    @PostMapping("/")
    @ResponseStatus(HttpStatus.CREATED)
    fun placeOrder(@RequestBody orderRequestDto: OrderRequestDto) = orderService.create(orderRequestDto)

    @GetMapping("/")
    @ResponseStatus(HttpStatus.OK)
    fun getOrders() = orderService.findAll()

    @GetMapping("/{orderId}")
    @ResponseStatus(HttpStatus.OK)
    fun getOrderById(@PathVariable orderId: UUID) = orderService.findById(orderId)

    @GetMapping("/user={userId}")
    @ResponseStatus(HttpStatus.OK)
    fun getOrderByUserId(@PathVariable userId: String) = orderService.findByUserId(userId)

    @DeleteMapping("/{orderId}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    fun deleteOrderById(@PathVariable orderId: UUID) = orderService.delete(orderId)

}