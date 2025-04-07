package dev.x_mathias.qualite_logicielle.domains.entities;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany
import jakarta.persistence.Table;

/**
 * @property id String
 * @property name String
 * @property products List<ProductEntity>
 * @constructor
 */
@Entity
@Table(name = "product-families")
class ProductFamilyEntity(
    @Id
    val id: String,
    val name: String,
    @OneToMany
    val products: List<ProductEntity>,
)
