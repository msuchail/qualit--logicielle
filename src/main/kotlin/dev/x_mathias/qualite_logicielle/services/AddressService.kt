package dev.x_mathias.qualite_logicielle.services

import dev.x_mathias.qualite_logicielle.domains.dtos.AddressMapper
import dev.x_mathias.qualite_logicielle.domains.dtos.AddressRequestDto
import dev.x_mathias.qualite_logicielle.domains.dtos.AddressResponseDto
import dev.x_mathias.qualite_logicielle.exceptions.AddressDoesNotExistException
import dev.x_mathias.qualite_logicielle.repositories.AddressRepository
import org.springframework.stereotype.Service

@Service
class AddressService (
    val addressRepository: AddressRepository,
    val addressMapper: AddressMapper
) {
    fun create(userId: String, addressRequestDto: AddressRequestDto): AddressResponseDto {
        val addressEntity = addressMapper.toEntity(userId, addressRequestDto)
        val result = addressRepository.save(addressEntity)
        return addressMapper.fromEntity(result)
    }
    fun findById(id: Long): AddressResponseDto {
        val adressEntity = addressRepository.findById(id).orElseThrow {
            AddressDoesNotExistException()
        }

        return addressMapper.fromEntity(adressEntity)
    }

    fun findByUserId(userId: String): List<AddressResponseDto> {
        return addressRepository.findByUserId(userId).map {
            addressMapper.fromEntity(it)
        }
    }

    fun update(id: Long, userId: String, addressRequestDto: AddressRequestDto): AddressResponseDto {
        if(!addressRepository.existsById(id)) throw AddressDoesNotExistException()
        val addressEntity = addressMapper.toEntity(userId, addressRequestDto).apply { this.id = id }
        return addressMapper.fromEntity(addressRepository.save(addressEntity))
    }

    fun delete(id: Long) {
        if (!addressRepository.existsById(id)) throw AddressDoesNotExistException()
        addressRepository.deleteById(id)
    }
}
