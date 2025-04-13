package dev.x_mathias.qualite_logicielle.controllers

import dev.x_mathias.qualite_logicielle.domains.dtos.ProductFamilyRequestDto
import dev.x_mathias.qualite_logicielle.domains.dtos.ProductFamilyWithoutIdRequestDto
import dev.x_mathias.qualite_logicielle.services.ProductFamilyService
import org.springframework.http.HttpStatus
import org.springframework.security.access.prepost.PreAuthorize
import org.springframework.web.bind.annotation.*

@RestController
@RequestMapping("/api/v1/product-families")
class ProductFamilyController(
    private val productFamilyService: ProductFamilyService
) {
    @PostMapping("/")
    @PreAuthorize("hasRole('ADMINISTRATOR')")
    @ResponseStatus(HttpStatus.CREATED)
    fun create(@RequestBody productFamilyRequestDto: ProductFamilyRequestDto) =
        productFamilyService.create(productFamilyRequestDto)

    @GetMapping("/")
    @PreAuthorize("permitAll()")
    @ResponseStatus(HttpStatus.OK)
    fun getProductFamilies() = productFamilyService.findAll()

    @GetMapping("/{productFamilyId}")
    @PreAuthorize("permitAll()")
    @ResponseStatus(HttpStatus.OK)
    fun getProductFamilyById(@PathVariable productFamilyId: String) = productFamilyService.findById(productFamilyId)

    @PutMapping("/{productFamilyId}")
    @PreAuthorize("hasRole('ADMINISTRATOR')")
    @ResponseStatus(HttpStatus.OK)
    fun updateProductFamily(
        @PathVariable productFamilyId: String,
        @RequestBody productFamilyWithoutIdRequestDto: ProductFamilyWithoutIdRequestDto
    ) = productFamilyService.update(productFamilyId, productFamilyWithoutIdRequestDto)

    @DeleteMapping("/{productFamilyId}")
    @PreAuthorize("hasRole('ADMINISTRATOR')")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    fun delete(@PathVariable productFamilyId: String) = productFamilyService.delete(productFamilyId)
}