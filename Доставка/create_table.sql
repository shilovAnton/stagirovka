/* таблица "Статусы заказа" */
CREATE TABLE status_order (
    id_status_order             NUMBER
        GENERATED AS IDENTITY,
    status_order                VARCHAR2(60 CHAR) NOT NULL UNIQUE,
    CONSTRAINT status_order PRIMARY KEY ( id_status_order )
);

COMMENT ON TABLE status_order IS
    'Таблица "Статусы заказа"';

COMMENT ON COLUMN status_order.id_status_order IS
    'Идентификационный номер';

COMMENT ON COLUMN status_order.status_order IS
    'Статус заказа';

/* таблица "Тип доставки" */
CREATE TABLE type_delivery (
    id_type_delivery             NUMBER
        GENERATED AS IDENTITY,
    type_delivery                VARCHAR2(60 CHAR) NOT NULL UNIQUE,
    CONSTRAINT type_delivery PRIMARY KEY ( id_type_delivery )
);

COMMENT ON TABLE type_delivery IS
    'Таблица "Тип доставки" доставка/самовывоз';

COMMENT ON COLUMN type_delivery.id_type_delivery IS
    'Идентификационный номер';

COMMENT ON COLUMN type_delivery.type_delivery IS
    'Тип доставки';

/* таблица "Клиент" */
CREATE TABLE client (
    id_client                   NUMBER
        GENERATED AS IDENTITY,
    name_client                        VARCHAR2(60 CHAR),
    telephon_number                               NUMBER,
    CONSTRAINT type_delivery PRIMARY KEY ( id_type_delivery )
);

COMMENT ON TABLE client IS
    'Таблица "Тип доставки" доставка/самовывоз';

COMMENT ON COLUMN client.id_client IS
    'Идентификационный номер';

COMMENT ON COLUMN client.name_client IS
    'ФИО клиента';

COMMENT ON COLUMN client.telephon_number IS
    'Номер телефона клиента';

/* таблица "Адрес" */
CREATE TABLE address (
    id_address                      NUMBER
        GENERATED AS IDENTITY,
    city                            VARCHAR2(60 CHAR),
    street                          VARCHAR2(60 CHAR),
    house                           VARCHAR2(60 CHAR),
    flat                            VARCHAR2(60 CHAR),
    geo_lat                         NUMBER,
    geo_lon                         NUMBER,
    qc_geo                          NUMBER,
    qc                          NUMBER,
    CONSTRAINT address PRIMARY KEY ( id_address )
);

COMMENT ON TABLE address IS
    'Таблица "Адрес"';

COMMENT ON COLUMN address.id_address IS
    'Идентификационный номер';

COMMENT ON COLUMN address.city IS
    'Город';

COMMENT ON COLUMN address.street IS
    'Улица';

COMMENT ON COLUMN address.house IS
    'Дом';

COMMENT ON COLUMN address.flat IS
    'Квартира';

COMMENT ON COLUMN address.geo_lat IS
    'геоданные - широта';  

COMMENT ON COLUMN address.geo_lon IS
    'геоданные - долгота';

COMMENT ON COLUMN address.qc_geo IS
    'Точность геоданных 1-5';

COMMENT ON COLUMN address.qc IS
    'Нужно ли вручную проверить распознанный адрес';

/* таблица переходная "Клиент-адрес" */
CREATE TABLE address_client (
    id_address_client                       NUMBER
        GENERATED AS IDENTITY,
    id_client                               NUMBER
        CONSTRAINT id_client_fk
            REFERENCES client ( id_client ),
    id_address                              NUMBER
        CONSTRAINT id_address_fk
            REFERENCES address ( id_address ),
    CONSTRAINT address_client PRIMARY KEY ( id_address_client )
);

COMMENT ON TABLE address_client IS
    'Таблица "Адрес клиента"';

COMMENT ON COLUMN address_client.id_address_client IS
    'Идентификационный номер';

COMMENT ON COLUMN address_client.id_client IS
    'id клиента';

COMMENT ON COLUMN address_client.id_address IS
    'id адреса клиента';

/* таблица "Пакеты" */
CREATE TABLE packege (
    id_packege                          NUMBER
        GENERATED AS IDENTITY,
    id_courier                          NUMBER,
    detaTimeC_packege_create            DATE,
    detaTimeC_packege_end               DATE,
    CONSTRAINT packege_order PRIMARY KEY ( id_packege_order )
);

COMMENT ON TABLE packege IS
    'Таблица "Пакет заказов" (рейс курьера)';

COMMENT ON COLUMN packege.id_packege IS
    'Идентификационный номер';

COMMENT ON COLUMN packege.id_courier IS
    'id курьера';

COMMENT ON COLUMN packege.detaTimeC_packege_create IS
    'дата и время создания пакета заказов';

COMMENT ON COLUMN packege.detaTimeC_packege_end IS
    'дата и время закрытия пакета заказов';   

/* таблица заказов доставки */
CREATE TABLE order_delivery (
    id_order_delivery                           NUMBER
        GENERATED AS IDENTITY,
    id_order_rest                               NUMBER,
    id_administrator                            NUMBER,
    id_status_order                             NUMBER
        CONSTRAINT status_order_fk
            REFERENCES status_order ( id_status_order ),
    id_client                                   NUMBER
        CONSTRAINT client_fk
            REFERENCES client ( id_client ),
    id_address                                  NUMBER
        CONSTRAINT address_fk
            REFERENCES address ( id_address ),
    id_type_delivery                            NUMBER
        CONSTRAINT type_delivery_fk
            REFERENCES type_delivery ( id_type_delivery ),        
    dateTime_create                             DATE,
    dataTime_end                                DATE,
    commentary                                  VARCHAR2(255 CHAR),
    CONSTRAINT Order_delivery PRIMARY KEY ( id_order_delivery )
);

COMMENT ON TABLE order_delivery IS
    'Таблица заказов доставки';

COMMENT ON COLUMN order_delivery.id_order_delivery IS
    'Идентификационный номер';

COMMENT ON COLUMN order_delivery.id_order_rest IS
    'id заказа в ресторане';

COMMENT ON COLUMN order_delivery.id_administrator IS
    'id администратора доставки';

COMMENT ON COLUMN order_delivery.id_status_order IS
    'id статуса доставки';

COMMENT ON COLUMN order_delivery.id_client IS
    'id клиента';

COMMENT ON COLUMN order_delivery.id_address IS
    'id адреса';

COMMENT ON COLUMN order_delivery.id_type_delivery IS
    'id типа заказа доставка/самовывоз';

COMMENT ON COLUMN order_delivery.dateTime_create IS
    'Дата и время создания заказа доставки';

COMMENT ON COLUMN order_delivery.dataTime_end IS
    'Дата и время завершения заказа доставки';

COMMENT ON COLUMN order_delivery.commentary IS
    'Комментарий к заказу';
