package dev.x_mathias.qualite_logicielle.repositories

import dev.x_mathias.qualite_logicielle.domains.entities.OrderDocument
import org.springframework.data.mongodb.repository.MongoRepository
import org.springframework.stereotype.Repository
import java.util.*


@Repository
interface OrderRepository : MongoRepository<OrderDocument, UUID> {
    fun findByUserId(userId: String): MutableList<OrderDocument>

}