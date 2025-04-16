package dev.x_mathias.qualite_logicielle.domains.entities

import jakarta.persistence.*


@Entity
@Table(name = "addresses")
class AddressEntity (
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    var id: Long? = null,
    val userId: String,
    val firstName: String,
    val lastName: String,
    val streetNumber: Short,
    val streetName: String,
    val city: String,
    val state: String,
    val zipCode: String,
    val country: String,
)