package dev.x_mathias.qualite_logicielle.repositories

import dev.x_mathias.qualite_logicielle.domains.entities.ProductEntity
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.stereotype.Repository

@Repository
interface ProductRepository : JpaRepository<ProductEntity, String>