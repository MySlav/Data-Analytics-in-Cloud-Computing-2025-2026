CREATE TABLE dbo.cloud_orders (
  order_id            varchar(20)  NOT NULL,
  order_date          date         NOT NULL,
  region              varchar(10)  NOT NULL,
  country             varchar(30)  NOT NULL,
  customer_id         varchar(10)  NOT NULL,
  customer_segment    varchar(20)  NOT NULL,
  product             varchar(20)  NOT NULL,
  channel             varchar(10)  NOT NULL,
  units               int          NOT NULL,
  unit_price_usd      decimal(10,2) NOT NULL,
  unit_net_usd        decimal(10,2) NOT NULL,
  revenue_usd         decimal(12,2) NOT NULL
);
