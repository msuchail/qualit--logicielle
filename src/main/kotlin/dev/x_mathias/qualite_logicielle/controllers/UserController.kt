package dev.x_mathias.qualite_logicielle.controllers

import org.springframework.security.access.prepost.PreAuthorize
import org.springframework.security.core.Authentication
import org.springframework.security.core.context.SecurityContextHolder
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController

@RestController
@RequestMapping("/api/v1/users")
class UserController {
    @GetMapping("/me")
    @PreAuthorize("hasRole('CUSTOMMER')")
    fun getUser(): Authentication? {
        return SecurityContextHolder.getContext().authentication
    }
}