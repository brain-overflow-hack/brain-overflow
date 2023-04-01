create table purchases(
    "id" varchar(30) primary key,
    "purchase_name" text,
    "lot_name" text,
    "price" decimal,
    "customer_inn" varchar(12),
    "customer_name" text,
    "delivery_region" text,
    "publish_date" timestamp,
    "contract_category" varchar(12)
);

create table participants(
    "id" varchar(30),
    "supplier_inn" varchar(12),
    "is_winner" varchar(3)
);

create table contracts(
    "contract_reg_number" text,
    "id" varchar(30),
    "price" decimal,
    "contract_conclusion_date" date
);

create table companies(
    "name" text,
    "supplier_inn" varchar(12),
    "supplier_kpp" text,
    "okved" text,
    "status" varchar(20),
    "count_managers" integer
);


copy purchases from '/docker-entrypoint-initdb.d/data/purchases.csv' delimiter ';' csv header;
copy participants from '/docker-entrypoint-initdb.d/data/participants.csv' delimiter ';' csv header;
copy contacts from '/docker-entrypoint-initdb.d/data/contracts.csv' delimiter ';' csv header;
copy companies from '/docker-entrypoint-initdb.d/data/companies.csv' delimiter ';' csv header;