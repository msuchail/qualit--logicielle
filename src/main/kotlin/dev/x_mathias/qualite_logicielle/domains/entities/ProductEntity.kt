package dev.x_mathias.qualite_logicielle.domains.entities


import jakarta.persistence.*

@Entity
@Table(name = "product-entities")
class ProductEntity (
    @Id
    val id: String,
    val name: String,
    val purchasePrice: UInt,
    val sellingPrice: UInt,
    var stock: UInt,
    @ManyToOne
    val productFamily: ProductFamilyEntity,
)