package dev.x_mathias.qualite_logicielle.repositories

import dev.x_mathias.qualite_logicielle.domains.entities.ProductFamilyEntity
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.stereotype.Repository

@Repository
interface ProductFamilyRepository : JpaRepository<ProductFamilyEntity, Long>