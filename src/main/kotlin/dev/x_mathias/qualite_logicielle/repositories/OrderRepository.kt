package dev.x_mathias.qualite_logicielle.repositories;

import dev.x_mathias.qualite_logicielle.domains.entities.OrderEntity;
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.stereotype.Repository


@Repository
interface OrderRepository : JpaRepository<OrderEntity, Long>