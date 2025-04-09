package dev.x_mathias.qualite_logicielle.controllers

import dev.x_mathias.qualite_logicielle.domains.dtos.ProductRequestDto
import dev.x_mathias.qualite_logicielle.domains.dtos.ProductRequestWithoutIdDto
import dev.x_mathias.qualite_logicielle.services.ProductService
import org.springframework.http.HttpStatus
import org.springframework.web.bind.annotation.*

@RestController
@RequestMapping("/api/v1/products")
class ProductController(
    private val productService: ProductService
) {
    @PostMapping("/")
    @ResponseStatus(HttpStatus.CREATED)
    fun create(@RequestBody productRequestDto: ProductRequestDto) = productService.create(productRequestDto)

    @GetMapping("/")
    @ResponseStatus(HttpStatus.OK)
    fun getProducts() = productService.findAll()

    @GetMapping("/{productId}")
    @ResponseStatus(HttpStatus.OK)
    fun getProductById(@PathVariable productId: String) = productService.findById(productId)

    @PutMapping("/{productId}")
    @ResponseStatus(HttpStatus.OK)
    fun updateProduct(@PathVariable productId: String, @RequestBody productRequestWithoutIdDto: ProductRequestWithoutIdDto) =
        productService.update(productId, productRequestWithoutIdDto)

    @PutMapping("/{productId}/set-stock={quantity}")
    @ResponseStatus(HttpStatus.OK)
    fun setStock(@PathVariable productId: String, @PathVariable quantity: UInt) =
        productService.setStock(productId, quantity)

    @PutMapping("/{productId}/increment-stock={quantity}")
    @ResponseStatus(HttpStatus.OK)
    fun incrementStock(@PathVariable productId: String, @PathVariable quantity: UInt) =
        productService.incrementStock(productId, quantity)

    @PutMapping("/{productId}/decrement-stock={quantity}")
    @ResponseStatus(HttpStatus.OK)
    fun decrementStock(@PathVariable productId: String, @PathVariable quantity: UInt) =
        productService.decrementStock(productId, quantity)

    @DeleteMapping("/{productId}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    fun deleteProduct(@PathVariable productId: String) = productService.delete(productId)
}