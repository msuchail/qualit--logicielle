package dev.x_mathias.qualite_logicielle.domains.dtos

import dev.x_mathias.qualite_logicielle.domains.entities.OrderDocument
import dev.x_mathias.qualite_logicielle.exceptions.AddressDoesNotExistException
import dev.x_mathias.qualite_logicielle.exceptions.ProductDoesNotExistsException
import dev.x_mathias.qualite_logicielle.repositories.ProductRepository
import dev.x_mathias.qualite_logicielle.services.AddressService
import org.springframework.stereotype.Component
import java.time.LocalDateTime
import java.util.*

@Component
class OrderMapper(
    private val addressService: AddressService,
    private val productRepository: ProductRepository,
    private val productMapper: ProductMapper
) {
    fun toDocument(userId: String, orderRequestDto: OrderRequestDto) = OrderDocument(
        invoiceAddress = addressService.findById(orderRequestDto.invoiceAddressId).also {
            if(it.userId != userId) throw AddressDoesNotExistException()
        },
        shippingAddress = addressService.findById(orderRequestDto.shippingAddressId).also {
            if(it.userId != userId) throw AddressDoesNotExistException()
        },
        userId = userId,
        products = orderRequestDto.products.map { product ->
            ProductInOrderDto(
                product = productRepository.findById(product.key)
                    .orElseThrow { throw ProductDoesNotExistsException() }
                    .let { productMapper.fromEntityToSimplifiedResponseDto(it) },
                quantity = product.value,
            )
        }
    )

    fun fromDocument(orderDocument: OrderDocument) : OrderResponseDto {
        return OrderResponseDto(
            id = orderDocument.id,
            status = orderDocument.status,
            type = orderDocument.type,
            createdAt = orderDocument.createdAt,
            invoiceAddress = orderDocument.invoiceAddress,
            shippingAddress = orderDocument.shippingAddress,
            userId = orderDocument.userId,
            products = orderDocument.products
        )
    }
    fun fromDocumentToSimplifiedResponseDto(orderDocument: OrderDocument) : OrderResponseSimplifiedDto {
        return OrderResponseSimplifiedDto(
            id = orderDocument.id,
            status = orderDocument.status,
            type = orderDocument.type,
            createdAt = orderDocument.createdAt,
            invoiceAddress = orderDocument.invoiceAddress.id,
            shippingAddress = orderDocument.shippingAddress.id,
            userId = orderDocument.userId,
            products = orderDocument.products.map {
                ProductIdInOrderDto(
                    productId = it.product.id,
                    quantity = it.quantity,
                )
            }
        )
    }
}

data class OrderRequestDto (
    val status: OrderStatus = OrderStatus.WAITING_FOR_PAYMENT,
    val type: OrderType = OrderType.ONLINE,
    val invoiceAddressId: Long,
    val shippingAddressId: Long,
    var products: Map<String, UInt>,
) {
    init {
        require(products.isNotEmpty()) {
            "At least one product is required"
        }
    }
}

data class OrderResponseDto(
    val id: UUID,
    val status: OrderStatus,
    val type: OrderType,
    val createdAt: LocalDateTime,
    val invoiceAddress: AddressResponseDto,
    val shippingAddress: AddressResponseDto,
    var userId: String,
    val products: List<ProductInOrderDto>,
)

data class OrderResponseSimplifiedDto(
    val id: UUID,
    val status: OrderStatus,
    val type: OrderType,
    val createdAt: LocalDateTime,
    val invoiceAddress: Long,
    val shippingAddress: Long,
    var userId: String,
    val products: List<ProductIdInOrderDto>
)

data class ProductInOrderDto(
    val quantity: UInt,
    val product: ProductSimplifiedResponseDto
)

data class ProductIdInOrderDto(
    val quantity: UInt,
    val productId: String
)

enum class OrderStatus {
    WAITING_FOR_PAYMENT,
    PENDING,
    CANCELED,
    PREPARATION,
    READY_FOR_DELIVERY,
    SHIPPED,
}
enum class OrderType {
    ONLINE,
    PHYSICAL,
}