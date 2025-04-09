package dev.x_mathias.qualite_logicielle.domains.dtos

import dev.x_mathias.qualite_logicielle.domains.entities.OrderDocument
import dev.x_mathias.qualite_logicielle.exceptions.ProductDoesNotExistsException
import dev.x_mathias.qualite_logicielle.repositories.ProductRepository
import dev.x_mathias.qualite_logicielle.services.AddressService
import org.springframework.stereotype.Component
import java.time.LocalDateTime
import java.util.*

@Component
class OrderMapper(
    private val addressService: AddressService,
    private val productMapper: ProductMapper,
    private val productRepository: ProductRepository,
) {
    fun toDocument(orderRequestDto: OrderRequestDto) = OrderDocument(
        invoiceAddress = addressService.findById(orderRequestDto.invoiceAddressId),
        shippingAddress = addressService.findById(orderRequestDto.shippingAddressId),
        userId = orderRequestDto.userId,
        products = orderRequestDto.products.map {
            productMapper.fromEntityToSimplifiedResponseDto(
                productRepository.findById(it.key).orElseThrow {
                    ProductDoesNotExistsException()
                }
            )
        }
    )

    fun fromDocument(orderDocument: OrderDocument) : OrderResponseDto {
        return OrderResponseDto(
            id = orderDocument.id,
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
            createdAt = orderDocument.createdAt,
            invoiceAddress = orderDocument.invoiceAddress.id,
            shippingAddress = orderDocument.shippingAddress.id,
            userId = orderDocument.userId,
            products = orderDocument.products.map { it.id }
        )
    }
}

data class OrderRequestDto (
    val invoiceAddressId: Long,
    val shippingAddressId: Long,
    var userId: String,
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
    val createdAt: LocalDateTime,
    val invoiceAddress: AddressResponseDto,
    val shippingAddress: AddressResponseDto,
    var userId: String,
    val products: List<ProductSimplifiedResponseDto>,
)

data class OrderResponseSimplifiedDto(
    val id: UUID,
    val createdAt: LocalDateTime,
    val invoiceAddress: Long,
    val shippingAddress: Long,
    var userId: String,
    val products: List<String>
)