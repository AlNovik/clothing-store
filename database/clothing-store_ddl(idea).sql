CREATE TABLE brand
(
    id BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    description VARCHAR(255),
    created DATETIME,
    modify INT,
    updated DATETIME,
    url VARCHAR(255),
    visible BIT,
    title VARCHAR(255) NOT NULL
);
CREATE TABLE category
(
    id BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    description VARCHAR(255),
    created DATETIME,
    modify INT,
    updated DATETIME,
    url VARCHAR(255),
    visible BIT,
    title VARCHAR(255) NOT NULL
);
CREATE TABLE clothing
(
    id BIGINT PRIMARY KEY NOT NULL,
    description VARCHAR(255),
    price DOUBLE,
    created DATETIME,
    modify INT,
    updated DATETIME,
    url VARCHAR(255),
    visible BIT,
    title VARCHAR(255) NOT NULL,
    brand BIGINT NOT NULL,
    category BIGINT NOT NULL
);
CREATE TABLE clothing_cloth
(
    clothing_id BIGINT NOT NULL,
    cloth VARCHAR(255)
);
CREATE TABLE clothing_color
(
    clothing_id BIGINT NOT NULL,
    color VARCHAR(255)
);
CREATE TABLE clothing_height
(
    clothing_id BIGINT NOT NULL,
    height SMALLINT
);
CREATE TABLE clothing_season
(
    clothing_id BIGINT NOT NULL,
    season VARCHAR(255)
);
CREATE TABLE clothing_size
(
    clothing_id BIGINT NOT NULL,
    size SMALLINT
);
CREATE TABLE contact
(
    id BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    building INT,
    city VARCHAR(255),
    flat INT,
    house INT,
    street VARCHAR(255),
    name VARCHAR(255),
    number VARCHAR(255),
    title VARCHAR(255)
);
CREATE TABLE hibernate_sequences
(
    sequence_name VARCHAR(255),
    sequence_next_hi_value INT
);
CREATE TABLE order_items
(
    order_id BIGINT NOT NULL,
    quantity INT,
    size SMALLINT,
    title VARCHAR(255)
);
CREATE TABLE orders
(
    id BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    date DATETIME,
    note VARCHAR(255),
    status VARCHAR(255),
    contact_id BIGINT NOT NULL,
    date_create TINYBLOB
);
CREATE TABLE product_images
(
    product_id BIGINT NOT NULL,
    fileName VARCHAR(255),
    fileSize VARCHAR(255),
    fileType VARCHAR(255),
    link VARCHAR(255),
    title VARCHAR(255)
);
ALTER TABLE clothing ADD FOREIGN KEY ( category ) REFERENCES category ( id );
ALTER TABLE clothing ADD FOREIGN KEY ( brand ) REFERENCES brand ( id );
ALTER TABLE clothing_cloth ADD FOREIGN KEY ( clothing_id ) REFERENCES clothing ( id );
ALTER TABLE clothing_color ADD FOREIGN KEY ( clothing_id ) REFERENCES clothing ( id );
ALTER TABLE clothing_height ADD FOREIGN KEY ( clothing_id ) REFERENCES clothing ( id );
ALTER TABLE clothing_season ADD FOREIGN KEY ( clothing_id ) REFERENCES clothing ( id );
ALTER TABLE clothing_size ADD FOREIGN KEY ( clothing_id ) REFERENCES clothing ( id );
ALTER TABLE order_items ADD FOREIGN KEY ( order_id ) REFERENCES orders ( id );
ALTER TABLE orders ADD FOREIGN KEY ( contact_id ) REFERENCES contact ( id );
