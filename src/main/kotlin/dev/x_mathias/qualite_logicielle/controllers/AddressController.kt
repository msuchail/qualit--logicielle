package dev.x_mathias.qualite_logicielle.controllers

import dev.x_mathias.qualite_logicielle.domains.dtos.AddressRequestDto
import dev.x_mathias.qualite_logicielle.domains.dtos.AddressResponseDto
import dev.x_mathias.qualite_logicielle.exceptions.AuthorizationDeniedException
import dev.x_mathias.qualite_logicielle.services.AddressService
import org.springframework.http.HttpStatus
import org.springframework.security.access.prepost.PreAuthorize
import org.springframework.security.oauth2.server.resource.authentication.JwtAuthenticationToken
import org.springframework.web.bind.annotation.*

@RestController
@RequestMapping("/api/v1/addresses")
class AddressController(
    private val addressService: AddressService
) {
    @PostMapping("/")
    @PreAuthorize("hasRole('CUSTOMMER')")
    @ResponseStatus(HttpStatus.CREATED)
    fun create(
        @RequestBody addressRequestDto: AddressRequestDto,
        jwtAuthenticationToken: JwtAuthenticationToken
    ): AddressResponseDto =
        addressService.create(jwtAuthenticationToken.token.subject, addressRequestDto)

    @GetMapping("/")
    @PreAuthorize("hasRole('CUSTOMMER')")
    @ResponseStatus(HttpStatus.OK)
    fun getAuthenticatedUserAddresses(auth: JwtAuthenticationToken) = addressService.findByUserId(
        auth.token.subject
    )

    @GetMapping("/{addressId}")
    @PreAuthorize("hasRole('CUSTOMMER')")
    @ResponseStatus(HttpStatus.OK)
    fun getAddressById(@PathVariable addressId: Long, jwtAuthenticationToken: JwtAuthenticationToken) =
        addressService.findById(addressId).also {
            if (it.userId != jwtAuthenticationToken.token.subject) throw AuthorizationDeniedException()
        }

    @PutMapping("/{addressId}")
    @PreAuthorize("hasRole('CUSTOMMER')")
    @ResponseStatus(HttpStatus.OK)
    fun updateAddress(
        @PathVariable addressId: Long,
        @RequestBody addressRequestDto: AddressRequestDto,
        jwtAuthenticationToken: JwtAuthenticationToken
    ) = addressService.findById(addressId).let {
        if(it.userId != jwtAuthenticationToken.token.subject) throw AuthorizationDeniedException()
        addressService.update(addressId, it.userId, addressRequestDto)
    }

    @DeleteMapping("/{addressId}")
    @PreAuthorize("hasRole('CUSTOMMER')")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    fun deleteAddressById(@PathVariable addressId: Long, jwtAuthenticationToken: JwtAuthenticationToken) =
        addressService.findById(addressId).let {
            if (it.userId != jwtAuthenticationToken.token.subject) throw AuthorizationDeniedException()
            addressService.delete(it.id)
        }

}