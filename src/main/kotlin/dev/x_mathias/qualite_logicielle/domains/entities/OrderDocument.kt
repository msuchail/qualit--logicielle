package dev.x_mathias.qualite_logicielle.domains.entities

import dev.x_mathias.qualite_logicielle.domains.dtos.AddressResponseDto
import dev.x_mathias.qualite_logicielle.domains.dtos.OrderStatus
import dev.x_mathias.qualite_logicielle.domains.dtos.OrderType
import dev.x_mathias.qualite_logicielle.domains.dtos.ProductInOrderDto
import jakarta.persistence.Id
import org.springframework.data.mongodb.core.mapping.Document
import java.time.LocalDateTime
import java.util.*


@Document
class OrderDocument(
    @Id
    val id: UUID = UUID.randomUUID(),
    val createdAt: LocalDateTime = LocalDateTime.now(),
    var status: OrderStatus = OrderStatus.WAITING_FOR_PAYMENT,
    val type: OrderType = OrderType.ONLINE,
    val invoiceAddress: AddressResponseDto,
    val shippingAddress: AddressResponseDto,
    val userId: String,
    var products: List<ProductInOrderDto>
)