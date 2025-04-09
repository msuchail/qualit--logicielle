package dev.x_mathias.qualite_logicielle.domains.entities


import jakarta.persistence.*

@Entity
@Table(name = "product-families")
class ProductFamilyEntity(
    @Id
    val id: String,
    val name: String,
    @OneToMany(
        fetch = FetchType.EAGER,
        mappedBy = "productFamily",
        cascade = [(CascadeType.REMOVE)],
        orphanRemoval = true
    )
    var products: List<ProductEntity>
)
