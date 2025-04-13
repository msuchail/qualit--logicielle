package dev.x_mathias.qualite_logicielle.domains.dtos

import org.junit.jupiter.api.Assertions.*
import org.junit.jupiter.api.Test



class AddressRequestDtoTest {
    @Test
    fun `valid address should pass validation`() {
        val validAddress = AddressRequestDto(
            streetNumber = (STREET_NUMBER_MAX_NUMBER - 1).toShort(),
            streetName = "A".repeat(STREET_NAME_MAX_LENGTH - 1),
            city = "A".repeat(CITY_NAME_MAX_LENGTH - 1),
            state = "A".repeat(STATE_NAME_MAX_LENGTH - 1),
            zipCode = "1".repeat(ZIPCODE_LENGTH),
            country = "A".repeat(COUNTRY_NAME_MAX_LENGTH - 1)
        )
        assertNotNull(validAddress)
    }

    // Tests for streetNumber
    @Test
    fun `streetNumber should be in valid range`() {
        assertThrows(IllegalArgumentException::class.java) {
            AddressRequestDto(
                streetNumber = 0,
                streetName = "A".repeat(STREET_NAME_MAX_LENGTH - 1),
                city = "A".repeat(CITY_NAME_MAX_LENGTH - 1),
                state = "A".repeat(STATE_NAME_MAX_LENGTH - 1),
                zipCode = "1".repeat(ZIPCODE_LENGTH),
                country = "A".repeat(COUNTRY_NAME_MAX_LENGTH - 1)
            )
        }

        assertThrows(IllegalArgumentException::class.java) {
            AddressRequestDto(
                streetNumber = (STREET_NUMBER_MAX_NUMBER + 1).toShort(),
                streetName = "A".repeat(STREET_NAME_MAX_LENGTH - 1),
                city = "A".repeat(CITY_NAME_MAX_LENGTH - 1),
                state = "A".repeat(STATE_NAME_MAX_LENGTH - 1),
                zipCode = "1".repeat(ZIPCODE_LENGTH),
                country = "A".repeat(COUNTRY_NAME_MAX_LENGTH - 1)
            )
        }
    }

    // Tests for streetName
    @Test
    fun `streetName length should be within limits`() {
        assertThrows(IllegalArgumentException::class.java) {
            AddressRequestDto(
                streetNumber = (STREET_NUMBER_MAX_NUMBER - 1).toShort(),
                streetName = "A".repeat(STREET_NAME_MIN_LENGTH -1),
                city = "A".repeat(CITY_NAME_MAX_LENGTH - 1),
                state = "A".repeat(STATE_NAME_MAX_LENGTH - 1),
                zipCode = "1".repeat(ZIPCODE_LENGTH),
                country = "A".repeat(COUNTRY_NAME_MAX_LENGTH - 1)
            )
        }

        assertDoesNotThrow {
            AddressRequestDto(
                streetNumber = (STREET_NUMBER_MAX_NUMBER - 1).toShort(),
                streetName = "A".repeat(STREET_NAME_MIN_LENGTH),
                city = "A".repeat(CITY_NAME_MAX_LENGTH - 1),
                state = "A".repeat(STATE_NAME_MAX_LENGTH - 1),
                zipCode = "1".repeat(ZIPCODE_LENGTH),
                country = "A".repeat(COUNTRY_NAME_MAX_LENGTH - 1)
            )
        }

        assertDoesNotThrow {
            AddressRequestDto(
                streetNumber = (STREET_NUMBER_MAX_NUMBER - 1).toShort(),
                streetName = "A".repeat(STREET_NAME_MAX_LENGTH),
                city = "A".repeat(CITY_NAME_MAX_LENGTH - 1),
                state = "A".repeat(STATE_NAME_MAX_LENGTH - 1),
                zipCode = "1".repeat(ZIPCODE_LENGTH),
                country = "A".repeat(COUNTRY_NAME_MAX_LENGTH - 1)
            )
        }

        assertThrows(IllegalArgumentException::class.java) {
            AddressRequestDto(
                streetNumber = 10,
                streetName = "A".repeat(STREET_NAME_MAX_LENGTH + 1), // Invalid - Above maximum length
                city = "Springfield",
                state = "IL",
                zipCode = "12345",
                country = "USA"
            )
        }
    }


    // Tests for city
    @Test
    fun `city length should be within limits`() {
        assertThrows(IllegalArgumentException::class.java) {
            AddressRequestDto(
                streetNumber = (STREET_NUMBER_MAX_NUMBER - 1).toShort(),
                streetName = "A".repeat(STREET_NAME_MAX_LENGTH - 1),
                city = "A".repeat(CITY_NAME_MIN_LENGTH - 1),
                state = "A".repeat(STATE_NAME_MAX_LENGTH - 1),
                zipCode = "1".repeat(ZIPCODE_LENGTH),
                country = "A".repeat(COUNTRY_NAME_MAX_LENGTH - 1)
            )
        }

        assertDoesNotThrow {
            AddressRequestDto(
                streetNumber = (STREET_NUMBER_MAX_NUMBER - 1).toShort(),
                streetName = "A".repeat(STREET_NAME_MAX_LENGTH - 1),
                city = "A".repeat(CITY_NAME_MIN_LENGTH),
                state = "A".repeat(STATE_NAME_MAX_LENGTH - 1),
                zipCode = "1".repeat(ZIPCODE_LENGTH),
                country = "A".repeat(COUNTRY_NAME_MAX_LENGTH - 1)
            )
        }

        assertDoesNotThrow {
            AddressRequestDto(
                streetNumber = (STREET_NUMBER_MAX_NUMBER - 1).toShort(),
                streetName = "A".repeat(STREET_NAME_MAX_LENGTH - 1),
                city = "A".repeat(CITY_NAME_MAX_LENGTH),
                state = "A".repeat(STATE_NAME_MAX_LENGTH - 1),
                zipCode = "1".repeat(ZIPCODE_LENGTH),
                country = "A".repeat(COUNTRY_NAME_MAX_LENGTH - 1)
            )
        }

        assertThrows(IllegalArgumentException::class.java) {
            AddressRequestDto(
                streetNumber = (STREET_NUMBER_MAX_NUMBER - 1).toShort(),
                streetName = "A".repeat(STREET_NAME_MAX_LENGTH - 1),
                city = "A".repeat(CITY_NAME_MAX_LENGTH + 1),
                state = "A".repeat(STATE_NAME_MAX_LENGTH - 1),
                zipCode = "1".repeat(ZIPCODE_LENGTH),
                country = "A".repeat(COUNTRY_NAME_MAX_LENGTH - 1)
            )
        }
    }

    @Test
    fun `city name should only contain valid characters`() {
        assertThrows(IllegalArgumentException::class.java) {
            AddressRequestDto(
                streetNumber = (STREET_NUMBER_MAX_NUMBER - 1).toShort(),
                streetName = "A".repeat(STREET_NAME_MAX_LENGTH - 1),
                city = "A".repeat(CITY_NAME_MAX_LENGTH - 2) + "1",
                state = "A".repeat(STATE_NAME_MAX_LENGTH - 1),
                zipCode = "1".repeat(ZIPCODE_LENGTH),
                country = "A".repeat(COUNTRY_NAME_MAX_LENGTH - 1)
            )
        }
    }

    // Tests for state
    @Test
    fun `state length should be within limits`() {
        assertThrows(IllegalArgumentException::class.java) {
            AddressRequestDto(
                streetNumber = (STREET_NUMBER_MAX_NUMBER - 1).toShort(),
                streetName = "A".repeat(STREET_NAME_MAX_LENGTH - 1),
                city = "A".repeat(CITY_NAME_MAX_LENGTH - 1),
                state = "A".repeat(STATE_NAME_MIN_LENGTH - 1),
                zipCode = "1".repeat(ZIPCODE_LENGTH),
                country = "A".repeat(COUNTRY_NAME_MAX_LENGTH - 1)
            )
        }

        assertDoesNotThrow {
            AddressRequestDto(
                streetNumber = (STREET_NUMBER_MAX_NUMBER - 1).toShort(),
                streetName = "A".repeat(STREET_NAME_MAX_LENGTH - 1),
                city = "A".repeat(CITY_NAME_MAX_LENGTH - 1),
                state = "A".repeat(STATE_NAME_MIN_LENGTH),
                zipCode = "1".repeat(ZIPCODE_LENGTH),
                country = "A".repeat(COUNTRY_NAME_MAX_LENGTH - 1)
            )
        }

        assertDoesNotThrow {
            AddressRequestDto(
                streetNumber = (STREET_NUMBER_MAX_NUMBER - 1).toShort(),
                streetName = "A".repeat(STREET_NAME_MAX_LENGTH - 1),
                city = "A".repeat(CITY_NAME_MAX_LENGTH - 1),
                state = "A".repeat(STATE_NAME_MAX_LENGTH),
                zipCode = "1".repeat(ZIPCODE_LENGTH),
                country = "A".repeat(COUNTRY_NAME_MAX_LENGTH - 1)
            )
        }

        assertThrows(IllegalArgumentException::class.java) {
            AddressRequestDto(
                streetNumber = (STREET_NUMBER_MAX_NUMBER - 1).toShort(),
                streetName = "A".repeat(STREET_NAME_MAX_LENGTH - 1),
                city = "A".repeat(CITY_NAME_MAX_LENGTH - 1),
                state = "A".repeat(STATE_NAME_MAX_LENGTH + 1),
                zipCode = "1".repeat(ZIPCODE_LENGTH),
                country = "A".repeat(COUNTRY_NAME_MAX_LENGTH - 1)
            )
        }
    }

    @Test
    fun `state name should only contain valid characters`() {
        assertThrows(IllegalArgumentException::class.java) {
            AddressRequestDto(
                streetNumber = (STREET_NUMBER_MAX_NUMBER - 1).toShort(),
                streetName = "A".repeat(STREET_NAME_MAX_LENGTH - 1),
                city = "A".repeat(CITY_NAME_MAX_LENGTH - 1),
                state = "A".repeat(STATE_NAME_MAX_LENGTH - 1)+"1",
                zipCode = "1".repeat(ZIPCODE_LENGTH),
                country = "A".repeat(COUNTRY_NAME_MAX_LENGTH - 1)
            )
        }
    }

    // Tests for country
    @Test
    fun `country length should be within limits`() {
        assertThrows(IllegalArgumentException::class.java) {
            AddressRequestDto(
                streetNumber = (STREET_NUMBER_MAX_NUMBER - 1).toShort(),
                streetName = "A".repeat(STREET_NAME_MAX_LENGTH - 1),
                city = "A".repeat(CITY_NAME_MAX_LENGTH - 1),
                state = "A".repeat(STATE_NAME_MAX_LENGTH - 1),
                zipCode = "1".repeat(ZIPCODE_LENGTH),
                country = "A".repeat(COUNTRY_NAME_MIN_LENGTH - 1)
            )
        }

        assertDoesNotThrow {
            AddressRequestDto(
                streetNumber = (STREET_NUMBER_MAX_NUMBER - 1).toShort(),
                streetName = "A".repeat(STREET_NAME_MAX_LENGTH - 1),
                city = "A".repeat(CITY_NAME_MAX_LENGTH - 1),
                state = "A".repeat(STATE_NAME_MAX_LENGTH - 1),
                zipCode = "1".repeat(ZIPCODE_LENGTH),
                country = "A".repeat(COUNTRY_NAME_MIN_LENGTH)
            )
        }

        assertDoesNotThrow {
            AddressRequestDto(
                streetNumber = (STREET_NUMBER_MAX_NUMBER - 1).toShort(),
                streetName = "A".repeat(STREET_NAME_MAX_LENGTH - 1),
                city = "A".repeat(CITY_NAME_MAX_LENGTH - 1),
                state = "A".repeat(STATE_NAME_MAX_LENGTH - 1),
                zipCode = "1".repeat(ZIPCODE_LENGTH),
                country = "A".repeat(COUNTRY_NAME_MAX_LENGTH)
            )
        }

        assertThrows(IllegalArgumentException::class.java) {
            AddressRequestDto(
                streetNumber = (STREET_NUMBER_MAX_NUMBER - 1).toShort(),
                streetName = "A".repeat(STREET_NAME_MAX_LENGTH - 1),
                city = "A".repeat(CITY_NAME_MAX_LENGTH - 1),
                state = "A".repeat(STATE_NAME_MAX_LENGTH - 1),
                zipCode = "1".repeat(ZIPCODE_LENGTH),
                country = "A".repeat(COUNTRY_NAME_MAX_LENGTH + 1)
            )
        }
    }

    @Test
    fun `country name should only contain valid characters`() {
        assertThrows(IllegalArgumentException::class.java) {
            AddressRequestDto(
                streetNumber = (STREET_NUMBER_MAX_NUMBER - 1).toShort(),
                streetName = "A".repeat(STREET_NAME_MAX_LENGTH - 1),
                city = "A".repeat(CITY_NAME_MAX_LENGTH - 1),
                state = "A".repeat(STATE_NAME_MAX_LENGTH - 1),
                zipCode = "1".repeat(ZIPCODE_LENGTH),
                country = "A".repeat(COUNTRY_NAME_MAX_LENGTH - 2) + "1"
            )
        }
    }

    @Test
    fun `zipcode length should be within limits`() {
        assertThrows(IllegalArgumentException::class.java) {
            AddressRequestDto(
                streetNumber = (STREET_NUMBER_MAX_NUMBER - 1).toShort(),
                streetName = "A".repeat(STREET_NAME_MAX_LENGTH - 1),
                city = "A".repeat(CITY_NAME_MAX_LENGTH - 1),
                state = "A".repeat(STATE_NAME_MAX_LENGTH - 1),
                zipCode = "1".repeat(ZIPCODE_LENGTH - 1),
                country = "A".repeat(COUNTRY_NAME_MAX_LENGTH - 1)
            )
        }
        assertThrows(IllegalArgumentException::class.java) {
            AddressRequestDto(
                streetNumber = (STREET_NUMBER_MAX_NUMBER - 1).toShort(),
                streetName = "A".repeat(STREET_NAME_MAX_LENGTH - 1),
                city = "A".repeat(CITY_NAME_MAX_LENGTH - 1),
                state = "A".repeat(STATE_NAME_MAX_LENGTH - 1),
                zipCode = "1".repeat(ZIPCODE_LENGTH + 1),
                country = "A".repeat(COUNTRY_NAME_MAX_LENGTH - 1)
            )
        }
    }

    // Tests for zipCode
    @Test
    fun `zipCode should contain only digits`() {
        assertThrows(IllegalArgumentException::class.java) {
            AddressRequestDto(
                streetNumber = (STREET_NUMBER_MAX_NUMBER - 1).toShort(),
                streetName = "A".repeat(STREET_NAME_MAX_LENGTH - 1),
                city = "A".repeat(CITY_NAME_MAX_LENGTH - 1),
                state = "A".repeat(STATE_NAME_MAX_LENGTH - 1),
                zipCode = "1".repeat(ZIPCODE_LENGTH-1)+"A",
                country = "A".repeat(COUNTRY_NAME_MAX_LENGTH - 1)
            )
        }

        assertThrows(IllegalArgumentException::class.java) {
            AddressRequestDto(
                streetNumber = (STREET_NUMBER_MAX_NUMBER - 1).toShort(),
                streetName = "A".repeat(STREET_NAME_MAX_LENGTH - 1),
                city = "A".repeat(CITY_NAME_MAX_LENGTH - 1),
                state = "A".repeat(STATE_NAME_MAX_LENGTH - 1),
                zipCode = "1".repeat(ZIPCODE_LENGTH-1)+" ",
                country = "A".repeat(COUNTRY_NAME_MAX_LENGTH - 1)
            )
        }
    }

}