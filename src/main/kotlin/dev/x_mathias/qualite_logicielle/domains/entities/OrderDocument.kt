package dev.x_mathias.qualite_logicielle.domains.entities

import dev.x_mathias.qualite_logicielle.domains.dtos.AddressResponseDto
import dev.x_mathias.qualite_logicielle.domains.dtos.ProductSimplifiedResponseDto
import jakarta.persistence.Id
import jakarta.persistence.ManyToOne
import jakarta.persistence.OneToMany
import org.hibernate.annotations.Fetch
import org.hibernate.annotations.FetchMode
import org.springframework.data.mongodb.core.mapping.Document
import java.time.LocalDateTime
import java.util.*


@Document
class OrderDocument(
    @Id
    val id: UUID = UUID.randomUUID(),
    val createdAt: LocalDateTime = LocalDateTime.now(),
    @ManyToOne
    val invoiceAddress: AddressResponseDto,
    @ManyToOne
    val shippingAddress: AddressResponseDto,
    val userId: String,
    @OneToMany
    @Fetch(FetchMode.JOIN)
    var products: List<ProductSimplifiedResponseDto>,
)