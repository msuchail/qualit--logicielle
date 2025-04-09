package dev.x_mathias.qualite_logicielle.repositories

import dev.x_mathias.qualite_logicielle.domains.entities.AddressEntity
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.stereotype.Repository

@Repository
interface AddressRepository : JpaRepository<AddressEntity, Long> {
    fun findByUserId(userId: String): List<AddressEntity>
}