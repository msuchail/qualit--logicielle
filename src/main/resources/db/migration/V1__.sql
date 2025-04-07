CREATE TABLE addresses
(
    id            BIGINT AUTO_INCREMENT NOT NULL,
    user_id       VARCHAR(255)          NULL,
    street_number SMALLINT              NOT NULL,
    city          VARCHAR(255)          NULL,
    state         VARCHAR(255)          NULL,
    zip_code      VARCHAR(255)          NULL,
    country       VARCHAR(255)          NULL,
    CONSTRAINT pk_addresses PRIMARY KEY (id)
);

CREATE TABLE orders
(
    id                  BIGINT AUTO_INCREMENT NOT NULL,
    timestamp           datetime              NULL,
    invoice_address_id  BIGINT                NULL,
    shipping_address_id BIGINT                NULL,
    CONSTRAINT pk_orders PRIMARY KEY (id)
);

CREATE TABLE `product-entities`
(
    id                       VARCHAR(255) NOT NULL,
    name                     VARCHAR(255) NULL,
    purchase_price           FLOAT        NOT NULL,
    selling_price            FLOAT        NOT NULL,
    stock                    INT          NOT NULL,
    product_family_entity_id VARCHAR(255) NULL,
    CONSTRAINT `pk_product-entities` PRIMARY KEY (id)
);

CREATE TABLE `product-families`
(
    id   VARCHAR(255) NOT NULL,
    name VARCHAR(255) NULL,
    CONSTRAINT `pk_product-families` PRIMARY KEY (id)
);

CREATE TABLE `product-families_products`
(
    product_family_entity_id VARCHAR(255) NOT NULL,
    products_id              VARCHAR(255) NOT NULL
);

ALTER TABLE `product-families_products`
    ADD CONSTRAINT `uc_product-families_products_products` UNIQUE (products_id);

ALTER TABLE orders
    ADD CONSTRAINT FK_ORDERS_ON_INVOICEADDRESS FOREIGN KEY (invoice_address_id) REFERENCES addresses (id);

ALTER TABLE orders
    ADD CONSTRAINT FK_ORDERS_ON_SHIPPINGADDRESS FOREIGN KEY (shipping_address_id) REFERENCES addresses (id);

ALTER TABLE `product-entities`
    ADD CONSTRAINT `FK_PRODUCT-ENTITIES_ON_PRODUCTFAMILYENTITY` FOREIGN KEY (product_family_entity_id) REFERENCES `product-families` (id);

ALTER TABLE `product-families_products`
    ADD CONSTRAINT fk_propro_on_product_entity FOREIGN KEY (products_id) REFERENCES `product-entities` (id);

ALTER TABLE `product-families_products`
    ADD CONSTRAINT fk_propro_on_product_family_entity FOREIGN KEY (product_family_entity_id) REFERENCES `product-families` (id);