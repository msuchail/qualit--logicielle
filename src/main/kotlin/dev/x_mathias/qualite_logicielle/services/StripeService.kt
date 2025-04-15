package dev.x_mathias.qualite_logicielle.services

import com.fasterxml.jackson.databind.ObjectMapper
import com.stripe.Stripe
import com.stripe.model.checkout.Session
import com.stripe.net.Webhook
import com.stripe.param.checkout.SessionCreateParams
import com.stripe.param.checkout.SessionCreateParams.LineItem
import com.stripe.param.checkout.SessionCreateParams.LineItem.PriceData.ProductData
import com.stripe.param.checkout.SessionCreateParams.PaymentIntentData
import dev.x_mathias.qualite_logicielle.config.StripeConfig
import dev.x_mathias.qualite_logicielle.domains.dtos.OrderStatus
import dev.x_mathias.qualite_logicielle.domains.entities.OrderDocument
import dev.x_mathias.qualite_logicielle.exceptions.OrderDoesNotExistException
import dev.x_mathias.qualite_logicielle.repositories.OrderRepository
import io.github.oshai.kotlinlogging.KLogger
import org.springframework.stereotype.Service
import java.util.*


@Service
class StripeService(
    private val stripeConfig: StripeConfig,
    private val objectMapper: ObjectMapper,
    private val orderRepository: OrderRepository,
    private val logger: KLogger,
) {
    init {
        Stripe.apiKey = stripeConfig.privateKey
    }


    fun manageWebHook(requestPayload: String, signature: String) {
        Webhook.constructEvent(
            requestPayload,
            signature,
            stripeConfig.endpointSecret
        )
        val event = objectMapper.readTree(requestPayload)
        val type = event["type"].asText()

        when (type) {
             "payment_intent.succeeded" -> {
                val orderId = event["data"]["object"]["metadata"]["orderId"].asText()
                val order =
                    orderRepository.findById(UUID.fromString(orderId)).orElseThrow { OrderDoesNotExistException() }
                order.status = OrderStatus.PENDING
                orderRepository.save(order)
                logger.info { "Successfully processed payment intent for order $orderId" }
            }
        }
    }

    fun createCheckoutSession(orderDocument: OrderDocument): String {
        val products: List<LineItem> = orderDocument.products.map {
            LineItem.builder()
                .setQuantity(it.quantity.toLong())
                .setPriceData(
                    LineItem.PriceData
                        .builder()
                        .setCurrency("eur")
                        .setUnitAmount(it.product.sellingPrice.toLong())
                        .setProductData(
                            ProductData
                                .builder()
                                .setName(it.product.name)
                                .build()
                        )
                        .build()
                ).build()
        }

        val params: SessionCreateParams = SessionCreateParams.builder()
            .setMode(SessionCreateParams.Mode.PAYMENT)
            .addAllLineItem(products)
            .setSuccessUrl("https://storage.googleapis.com/pod_public/800webp/200776.webp")
            .setPaymentIntentData(
                PaymentIntentData.builder().putAllMetadata(
                    mapOf(
                        "orderId" to orderDocument.id.toString()
                    )
                ).build()
            )
            .build()

        return Session.create(params).url
    }
}