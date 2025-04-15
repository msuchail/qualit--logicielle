package dev.x_mathias.qualite_logicielle.controllers

import dev.x_mathias.qualite_logicielle.domains.dtos.OrderRequestDto
import dev.x_mathias.qualite_logicielle.domains.dtos.OrderResponseDto
import dev.x_mathias.qualite_logicielle.domains.dtos.OrderResponseSimplifiedDto
import dev.x_mathias.qualite_logicielle.exceptions.AuthorizationDeniedException
import dev.x_mathias.qualite_logicielle.services.OrderService
import dev.x_mathias.qualite_logicielle.services.StripeService
import org.springframework.http.HttpStatus
import org.springframework.security.access.prepost.PreAuthorize
import org.springframework.security.oauth2.server.resource.authentication.JwtAuthenticationToken
import org.springframework.web.bind.annotation.*
import java.util.*

@RestController
@RequestMapping("/api/v1/orders")
@PreAuthorize("permitAll()")
class OrderController(
    private val orderService: OrderService,
    private val stripeService: StripeService
) {
    @PostMapping("/webhooks")
    @PreAuthorize("permitAll()")
    @ResponseStatus(HttpStatus.OK)
    fun webHook(
        @RequestBody requestPayload: String,
        @RequestHeader("Stripe-Signature") requestSignature: String
    ) {
        stripeService.manageWebHook(requestPayload, requestSignature)
    }

    @PostMapping("/")
    @PreAuthorize("hasRole('CUSTOMMER')")
    @ResponseStatus(HttpStatus.CREATED)
    fun placeOrder(
        @RequestBody orderRequestDto: OrderRequestDto,
        jwtAuthenticationToken: JwtAuthenticationToken
    ): Map<String, Any> =
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
