package dev.x_mathias.qualite_logicielle.domains.dtos

import dev.x_mathias.qualite_logicielle.domains.entities.AddressEntity
import org.springframework.stereotype.Component


const val FIRST_NAME_MIN_LENGTH = 2
const val FIRST_NAME_MAX_LENGTH = 50
const val LAST_NAME_MIN_LENGTH = 2
const val LAST_NAME_MAX_LENGTH = 50
const val STREET_NUMBER_MAX_NUMBER = 1000
const val STREET_NAME_MIN_LENGTH = 3
const val STREET_NAME_MAX_LENGTH = 100
const val CITY_NAME_MIN_LENGTH = 3
const val CITY_NAME_MAX_LENGTH = 50
const val STATE_NAME_MIN_LENGTH = 2
const val STATE_NAME_MAX_LENGTH = 50
const val COUNTRY_NAME_MIN_LENGTH = 3
const val COUNTRY_NAME_MAX_LENGTH = 50
const val ZIPCODE_LENGTH = 5


@Component
class AddressMapper {
    fun toEntity(userId: String, addressRequestDto: AddressRequestDto) = AddressEntity(
        userId = userId,
        firstName = addressRequestDto.firstName,
        lastName = addressRequestDto.lastName,
        streetNumber = addressRequestDto.streetNumber,
        streetName = addressRequestDto.streetName,
        city = addressRequestDto.city,
        state = addressRequestDto.state,
        zipCode = addressRequestDto.zipCode,
        country = addressRequestDto.country
    )

    fun fromEntity(addressEntity: AddressEntity): AddressResponseDto {
        return AddressResponseDto(
            id = addressEntity.id ?: throw NullPointerException("Address entity id is null"),
            userId = addressEntity.userId,
            firstName = addressEntity.firstName,
            lastName = addressEntity.lastName,
            streetNumber = addressEntity.streetNumber,
            streetName = addressEntity.streetName,
            city = addressEntity.city,
            state = addressEntity.state,
            zipCode = addressEntity.zipCode,
            country = addressEntity.country
        )
    }
}

data class AddressRequestDto(
    val streetNumber: Short,
    val streetName: String,
    val firstName: String,
    val lastName: String,
    val city: String,
    val state: String,
    val zipCode: String,
    val country: String,
) {
    init {
        require(
            firstName.first().isUpperCase() && firstName.all {
                it.isLetter() || listOf(
                    '-',
                    '\''
                ).contains(it)
            }) {
            "firstName must start with an upper letter and contains only letters and dash or \'"
        }
        require(firstName.length in FIRST_NAME_MIN_LENGTH..FIRST_NAME_MAX_LENGTH) {
            "firstName must start with an upper letter and contains only letters or dash"
        }
        require(
            lastName.first().isUpperCase() && lastName.all {
                it.isLetter() || listOf(
                    '-',
                    '\''
                ).contains(it)
            }) {
            "lastname must start with an upper letter and contains only letters and dash or \'"
        }
        require(lastName.length in LAST_NAME_MIN_LENGTH..LAST_NAME_MAX_LENGTH) {
            "lastname must start with an upper letter and contains only letters or dash"
        }
        require(streetNumber in 1..<STREET_NUMBER_MAX_NUMBER + 1) {
            "streetNumber must be between 0 and $STREET_NUMBER_MAX_NUMBER"
        }
        require(streetName.length >= STREET_NAME_MIN_LENGTH) {
            "streetName length must be above $STREET_NAME_MIN_LENGTH"
        }
        require(streetName.length <= STREET_NAME_MAX_LENGTH) {
            "streetName length must be below $STREET_NAME_MAX_LENGTH"
        }
        require(city.length >= CITY_NAME_MIN_LENGTH) {
            "city length must be above $CITY_NAME_MIN_LENGTH"
        }
        require(city.length <= CITY_NAME_MAX_LENGTH) {
            "city length must be below $CITY_NAME_MAX_LENGTH"
        }
        require(state.length >= STATE_NAME_MIN_LENGTH) {
            "state length must be above $STATE_NAME_MIN_LENGTH"
        }
        require(state.length <= STATE_NAME_MAX_LENGTH) {
            "state length must be below $STATE_NAME_MIN_LENGTH"
        }
        require(country.length >= COUNTRY_NAME_MIN_LENGTH) {
            "country length must be above $COUNTRY_NAME_MIN_LENGTH"
        }
        require(country.length <= COUNTRY_NAME_MAX_LENGTH) {
            "country length must be below $COUNTRY_NAME_MAX_LENGTH"
        }
        require(zipCode.length == ZIPCODE_LENGTH) {
            "zipCode length must be equal to $ZIPCODE_LENGTH"
        }

        require(city.all { it.isLetter() || it.isWhitespace() }) {
            "Invalid city name"
        }
        require(state.all { it.isLetter() || it.isWhitespace() }) {
            "Invalid state name"
        }
        require(country.all { it.isLetter() || it.isWhitespace() }) {
            "Invalid country"
        }
        require(zipCode.all { it.isDigit() }) {
            "Invalid zip code"
        }
    }
}

data class AddressResponseDto(
    val id: Long,
    val userId: String,
    val firstName: String,
    val lastName: String,
    val streetNumber: Short,
    val streetName: String,
    val city: String,
    val state: String,
    val zipCode: String,
    val country: String,
)