CREATE TABLE addresses
(
    id            BIGINT AUTO_INCREMENT NOT NULL,
    user_id       VARCHAR(255)          NULL,
    street_number SMALLINT              NOT NULL,
    street_name   VARCHAR(255)          NULL,
    city          VARCHAR(255)          NULL,
    state         VARCHAR(255)          NULL,
    zip_code      VARCHAR(255)          NULL,
    country       VARCHAR(255)          NULL,
    CONSTRAINT pk_addresses PRIMARY KEY (id)
);

CREATE TABLE `product-entities`
(
    id                VARCHAR(255) NOT NULL,
    name              VARCHAR(255) NULL,
    purchase_price    INT          NOT NULL,
    selling_price     INT          NOT NULL,
    stock             INT          NOT NULL,
    product_family_id VARCHAR(255) NULL,
    CONSTRAINT `pk_product-entities` PRIMARY KEY (id)
);

CREATE TABLE `product-families`
(
    id   VARCHAR(255) NOT NULL,
    name VARCHAR(255) NULL,
    CONSTRAINT `pk_product-families` PRIMARY KEY (id)
);

ALTER TABLE `product-entities`
    ADD CONSTRAINT `FK_PRODUCT-ENTITIES_ON_PRODUCTFAMILY` FOREIGN KEY (product_family_id) REFERENCES `product-families` (id);