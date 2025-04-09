package dev.x_mathias.qualite_logicielle.services

import dev.x_mathias.qualite_logicielle.domains.dtos.OrderMapper
import dev.x_mathias.qualite_logicielle.domains.dtos.OrderRequestDto
import dev.x_mathias.qualite_logicielle.domains.dtos.OrderResponseDto
import dev.x_mathias.qualite_logicielle.domains.dtos.OrderResponseSimplifiedDto
import dev.x_mathias.qualite_logicielle.exceptions.OrderDoesNotExistException
import dev.x_mathias.qualite_logicielle.repositories.OrderRepository
import org.springframework.stereotype.Service
import org.springframework.transaction.annotation.Transactional
import java.util.*

@Service
class OrderService(
    private val orderRepository: OrderRepository,
    private val orderMapper: OrderMapper,
    private val productService: ProductService
) {
    @Transactional
    fun create(orderRequestDto: OrderRequestDto): OrderResponseSimplifiedDto {
        orderRequestDto.products.forEach {
            productService.decrementStock(it.key, it.value)
        }
        val orderDocument = orderRepository.save(
            orderMapper.toDocument(
                orderRequestDto
            )
        )
        return orderMapper.fromDocumentToSimplifiedResponseDto(orderDocument)
    }
    fun findById(orderId: UUID): OrderResponseDto {
        val orderDocument = orderRepository.findById(orderId).orElseThrow {
            OrderDoesNotExistException()
        }
        return orderMapper.fromDocument(orderDocument)
    }
    fun findByUserId(userId: String): List<OrderResponseSimplifiedDto> {
        return orderRepository.findByUserId(userId).map {
            orderMapper.fromDocumentToSimplifiedResponseDto(it)
        }
    }
    fun findAll(): List<OrderResponseSimplifiedDto> {
        return orderRepository.findAll().map {
            orderMapper.fromDocumentToSimplifiedResponseDto(it)
        }
    }
    fun delete(orderId: UUID) {
        if(!orderRepository.existsById(orderId)) throw OrderDoesNotExistException()
        orderRepository.deleteById(orderId)
    }
}