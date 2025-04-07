package dev.x_mathias.qualite_logicielle.domains.entities

import jakarta.persistence.*

/**
 * @property id Long
 * @property userId String
 * @property streetNumber Short
 * @property city String
 * @property state String
 * @property zipCode String
 * @property country String
 * @constructor
 */
@Entity
@Table(name = "addresses")
class AddressEntity (
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    val id: Long,
    val userId: String,
    val streetNumber: Short,
    val city: String,
    val state: String,
    val zipCode: String,
    val country: String,
)