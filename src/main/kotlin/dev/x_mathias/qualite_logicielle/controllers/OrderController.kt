package dev.x_mathias.qualite_logicielle.controllers

import dev.x_mathias.qualite_logicielle.domains.dtos.OrderRequestDto
import dev.x_mathias.qualite_logicielle.domains.dtos.OrderResponseDto
import dev.x_mathias.qualite_logicielle.domains.dtos.OrderResponseSimplifiedDto
import dev.x_mathias.qualite_logicielle.exceptions.AuthorizationDeniedException
import dev.x_mathias.qualite_logicielle.services.OrderService
import org.springframework.http.HttpStatus
import org.springframework.security.access.prepost.PreAuthorize
import org.springframework.security.oauth2.server.resource.authentication.JwtAuthenticationToken
import org.springframework.web.bind.annotation.*
import java.util.*

@RestController
@RequestMapping("/api/v1/orders")
class OrderController(private val orderService: OrderService) {
    @PostMapping("/")
    @PreAuthorize("hasRole('CUSTOMMER')")
    @ResponseStatus(HttpStatus.CREATED)
    fun placeOrder(
        @RequestBody orderRequestDto: OrderRequestDto,
        jwtAuthenticationToken: JwtAuthenticationToken
    ): OrderResponseSimplifiedDto =
        orderService.create(jwtAuthenticationToken.token.subject, orderRequestDto)

    @GetMapping("/")
    @PreAuthorize("hasRole('CUSTOMMER')")
    @ResponseStatus(HttpStatus.OK)
    fun getAuthenticatedUserOrders(jwtAuthenticationToken: JwtAuthenticationToken): List<OrderResponseSimplifiedDto> =
        orderService.findByUserId(
            jwtAuthenticationToken.token.subject,
        )

    @GetMapping("/{orderId}")
    @PreAuthorize("hasRole('CUSTOMMER')")
    @ResponseStatus(HttpStatus.OK)
    fun getOrderById(@PathVariable orderId: UUID, jwtAuthenticationToken: JwtAuthenticationToken): OrderResponseDto =
        orderService.findById(orderId).also {
            if (jwtAuthenticationToken.token.subject != it.userId) throw AuthorizationDeniedException()
        }
}
