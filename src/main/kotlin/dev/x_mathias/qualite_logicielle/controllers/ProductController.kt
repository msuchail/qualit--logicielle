package dev.x_mathias.qualite_logicielle.controllers

import dev.x_mathias.qualite_logicielle.domains.dtos.ProductRequestDto
import dev.x_mathias.qualite_logicielle.domains.dtos.ProductRequestWithoutIdDto
import dev.x_mathias.qualite_logicielle.services.ProductService
import org.springframework.http.HttpStatus
import org.springframework.security.access.prepost.PreAuthorize
import org.springframework.web.bind.annotation.*

@RestController
@RequestMapping("/api/v1/products")
class ProductController(
    private val productService: ProductService
) {
    @PostMapping("/")
    @PreAuthorize("hasRole('ADMINISTRATOR')")
    @ResponseStatus(HttpStatus.CREATED)
    fun create(@RequestBody productRequestDto: ProductRequestDto) = productService.create(productRequestDto)

    @GetMapping("/")
    @PreAuthorize("permitAll()")
    @ResponseStatus(HttpStatus.OK)
    fun getProducts() = productService.findAll()

    @GetMapping("/{productId}")
    @PreAuthorize("permitAll()")
    @ResponseStatus(HttpStatus.OK)
    fun getProductById(@PathVariable productId: String) = productService.findById(productId)

    @PutMapping("/{productId}")
    @PreAuthorize("hasRole('ADMINISTRATOR')")
    @ResponseStatus(HttpStatus.OK)
    fun updateProduct(@PathVariable productId: String, @RequestBody productRequestWithoutIdDto: ProductRequestWithoutIdDto) =
        productService.update(productId, productRequestWithoutIdDto)

    @PutMapping("/{productId}/set-stock={quantity}")
    @PreAuthorize("hasRole('ADMINISTRATOR')")
    @ResponseStatus(HttpStatus.OK)
    fun setStock(@PathVariable productId: String, @PathVariable quantity: UInt) =
        productService.setStock(productId, quantity)

    @PutMapping("/{productId}/increment-stock={quantity}")
    @PreAuthorize("hasRole('ADMINISTRATOR')")
    @ResponseStatus(HttpStatus.OK)
    fun incrementStock(@PathVariable productId: String, @PathVariable quantity: UInt) =
        productService.incrementStock(productId, quantity)

    @PutMapping("/{productId}/decrement-stock={quantity}")
    @PreAuthorize("hasRole('ADMINISTRATOR')")
    @ResponseStatus(HttpStatus.OK)
    fun decrementStock(@PathVariable productId: String, @PathVariable quantity: UInt) =
        productService.decrementStock(productId, quantity)

    @DeleteMapping("/{productId}")
    @PreAuthorize("hasRole('ADMINISTRATOR')")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    fun deleteProduct(@PathVariable productId: String) = productService.delete(productId)
}