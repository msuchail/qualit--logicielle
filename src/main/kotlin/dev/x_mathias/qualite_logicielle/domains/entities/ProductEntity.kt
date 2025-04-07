package dev.x_mathias.qualite_logicielle.domains.entities



import jakarta.persistence.*

/**
 * @property id String
 * @property name String
 * @property purchasePrice Float
 * @property sellingPrice Float
 * @property stock Int
 * @property productFamilyEntity ProductFamilyEntity
 * @constructor
 */
@Entity
@Table(name = "product-entities")
class ProductEntity (
    @Id
    val id: String,
    val name: String,
    val purchasePrice: Float,
    val sellingPrice: Float,
    val stock: Int,
    @ManyToOne
    val productFamilyEntity: ProductFamilyEntity,
)