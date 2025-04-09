package dev.x_mathias.qualite_logicielle.controllers

import dev.x_mathias.qualite_logicielle.domains.dtos.AddressRequestDto
import dev.x_mathias.qualite_logicielle.domains.dtos.AddressResponseDto
import dev.x_mathias.qualite_logicielle.services.AddressService
import org.springframework.http.HttpStatus
import org.springframework.web.bind.annotation.*

@RestController
@RequestMapping("/api/v1/addresses")
class AddressController(
    private val addressService: AddressService
) {
    @PostMapping("/")
    @ResponseStatus(HttpStatus.CREATED)
    fun create(@RequestBody addressRequestDto: AddressRequestDto): AddressResponseDto =
        addressService.create(addressRequestDto)

    @GetMapping("/{addressId}")
    @ResponseStatus(HttpStatus.OK)
    fun getAddressById(@PathVariable addressId: Long) = addressService.findById(addressId)

    @GetMapping("/user={userId}")
    @ResponseStatus(HttpStatus.OK)
    fun getAddressByUserId(@PathVariable userId: String) = addressService.findByUserId(userId)

    @PutMapping("/{addressId}")
    @ResponseStatus(HttpStatus.OK)
    fun updateAddress(@PathVariable addressId: Long, @RequestBody addressRequestDto: AddressRequestDto) =
        addressService.update(addressId, addressRequestDto)

    @DeleteMapping("/{addressId}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    fun deleteAddressById(@PathVariable addressId: Long) = addressService.delete(addressId)
}