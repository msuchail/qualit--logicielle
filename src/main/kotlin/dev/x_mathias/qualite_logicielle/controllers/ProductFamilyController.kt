package dev.x_mathias.qualite_logicielle.controllers

import dev.x_mathias.qualite_logicielle.domains.dtos.ProductFamilyRequestDto
import dev.x_mathias.qualite_logicielle.domains.dtos.ProductFamilyWithoutIdRequestDto
import dev.x_mathias.qualite_logicielle.services.ProductFamilyService
import org.springframework.http.HttpStatus
import org.springframework.web.bind.annotation.*

@RestController
@RequestMapping("/api/v1/product-families")
class ProductFamilyController(
    private val productFamilyService: ProductFamilyService
) {
    @PostMapping("/")
    @ResponseStatus(HttpStatus.CREATED)
    fun create(@RequestBody productFamilyRequestDto: ProductFamilyRequestDto) =
        productFamilyService.create(productFamilyRequestDto)

    @GetMapping("/")
    @ResponseStatus(HttpStatus.OK)
    fun getProductFamilies() = productFamilyService.findAll()

    @GetMapping("/{productFamilyId}")
    @ResponseStatus(HttpStatus.OK)
    fun getProductFamilyById(@PathVariable productFamilyId: String) = productFamilyService.findById(productFamilyId)

    @PutMapping("/{productFamilyId}")
    @ResponseStatus(HttpStatus.OK)
    fun updateProductFamily(
        @PathVariable productFamilyId: String,
        @RequestBody productFamilyWithoutIdRequestDto: ProductFamilyWithoutIdRequestDto
    ) = productFamilyService.update(productFamilyId, productFamilyWithoutIdRequestDto)

    @DeleteMapping("/{productFamilyId}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    fun delete(@PathVariable productFamilyId: String) = productFamilyService.delete(productFamilyId)
}