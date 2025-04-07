package dev.x_mathias.qualite_logicielle.domains.entities

import jakarta.persistence.*
import java.sql.Timestamp

/**
 * @property id Long
 * @property timestamp Timestamp
 * @property invoiceAddress AddressEntity
 * @property shippingAddress AddressEntity
 * @constructor
 */
@Entity
@Table(name = "orders")
class OrderEntity(
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    val id: Long,
    val timestamp: Timestamp,
    @ManyToOne
    val invoiceAddress: AddressEntity,
    @ManyToOne
    val shippingAddress: AddressEntity,
)