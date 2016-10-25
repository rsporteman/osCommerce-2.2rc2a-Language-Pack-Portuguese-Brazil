# $Id: oscommerce.sql 1818 2008-01-15 09:10:52Z hpdl $
#
# osCommerce, Open Source E-Commerce Solutions
# http://www.oscommerce.com
#
# Copyright (c) 2008 osCommerce
#
# Released under the GNU General Public License
#
# NOTE: * Please make any modifications to this file by hand!
#       * DO NOT use a mysqldump created file for new changes!
#       * Please take note of the table structure, and use this
#         structure as a standard for future modifications!
#       * Any tables you add here should be added in admin/backup.php
#         and in catalog/install/includes/functions/database.php
#       * To see the 'diff'erence between MySQL databases, use
#         the mysqldiff perl script located in the extras
#         directory of the 'catalog' module.
#       * Comments should be like these, full line comments.
#         (don't use inline comments)

DROP TABLE IF EXISTS address_book;
CREATE TABLE address_book (
   address_book_id int NOT NULL auto_increment,
   customers_id int NOT NULL,
   entry_gender char(1) NOT NULL,
   entry_company varchar(32),
   entry_firstname varchar(32) NOT NULL,
   entry_lastname varchar(32) NOT NULL,
   entry_street_address varchar(64) NOT NULL,
   entry_suburb varchar(32),
   entry_postcode varchar(10) NOT NULL,
   entry_city varchar(32) NOT NULL,
   entry_state varchar(32),
   entry_country_id int DEFAULT '0' NOT NULL,
   entry_zone_id int DEFAULT '0' NOT NULL,
   PRIMARY KEY (address_book_id),
   KEY idx_address_book_customers_id (customers_id)
);

DROP TABLE IF EXISTS address_format;
CREATE TABLE address_format (
  address_format_id int NOT NULL auto_increment,
  address_format varchar(128) NOT NULL,
  address_summary varchar(48) NOT NULL,
  PRIMARY KEY (address_format_id)
);

DROP TABLE IF EXISTS administrators;
CREATE TABLE administrators (
  id int NOT NULL auto_increment,
  user_name varchar(32) binary NOT NULL,
  user_password varchar(40) NOT NULL,
  PRIMARY KEY (id)
);

DROP TABLE IF EXISTS banners;
CREATE TABLE banners (
  banners_id int NOT NULL auto_increment,
  banners_title varchar(64) NOT NULL,
  banners_url varchar(255) NOT NULL,
  banners_image varchar(64) NOT NULL,
  banners_group varchar(10) NOT NULL,
  banners_html_text text,
  expires_impressions int(7) DEFAULT '0',
  expires_date datetime DEFAULT NULL,
  date_scheduled datetime DEFAULT NULL,
  date_added datetime NOT NULL,
  date_status_change datetime DEFAULT NULL,
  status int(1) DEFAULT '1' NOT NULL,
  PRIMARY KEY (banners_id),
  KEY idx_banners_group (banners_group)
);

DROP TABLE IF EXISTS banners_history;
CREATE TABLE banners_history (
  banners_history_id int NOT NULL auto_increment,
  banners_id int NOT NULL,
  banners_shown int(5) NOT NULL DEFAULT '0',
  banners_clicked int(5) NOT NULL DEFAULT '0',
  banners_history_date datetime NOT NULL,
  PRIMARY KEY (banners_history_id),
  KEY idx_banners_history_banners_id (banners_id)
);

DROP TABLE IF EXISTS categories;
CREATE TABLE categories (
   categories_id int NOT NULL auto_increment,
   categories_image varchar(64),
   parent_id int DEFAULT '0' NOT NULL,
   sort_order int(3),
   date_added datetime,
   last_modified datetime,
   PRIMARY KEY (categories_id),
   KEY idx_categories_parent_id (parent_id)
);

DROP TABLE IF EXISTS categories_description;
CREATE TABLE categories_description (
   categories_id int DEFAULT '0' NOT NULL,
   language_id int DEFAULT '1' NOT NULL,
   categories_name varchar(32) NOT NULL,
   PRIMARY KEY (categories_id, language_id),
   KEY idx_categories_name (categories_name)
);

DROP TABLE IF EXISTS configuration;
CREATE TABLE configuration (
  configuration_id int NOT NULL auto_increment,
  configuration_title varchar(255) NOT NULL,
  configuration_key varchar(255) NOT NULL,
  configuration_value varchar(255) NOT NULL,
  configuration_description varchar(255) NOT NULL,
  configuration_group_id int NOT NULL,
  sort_order int(5) NULL,
  last_modified datetime NULL,
  date_added datetime NOT NULL,
  use_function varchar(255) NULL,
  set_function varchar(255) NULL,
  PRIMARY KEY (configuration_id)
);

DROP TABLE IF EXISTS configuration_group;
CREATE TABLE configuration_group (
  configuration_group_id int NOT NULL auto_increment,
  configuration_group_title varchar(64) NOT NULL,
  configuration_group_description varchar(255) NOT NULL,
  sort_order int(5) NULL,
  visible int(1) DEFAULT '1' NULL,
  PRIMARY KEY (configuration_group_id)
);

DROP TABLE IF EXISTS counter;
CREATE TABLE counter (
  startdate char(8),
  counter int(12)
);

DROP TABLE IF EXISTS counter_history;
CREATE TABLE counter_history (
  month char(8),
  counter int(12)
);

DROP TABLE IF EXISTS countries;
CREATE TABLE countries (
  countries_id int NOT NULL auto_increment,
  countries_name varchar(64) NOT NULL,
  countries_iso_code_2 char(2) NOT NULL,
  countries_iso_code_3 char(3) NOT NULL,
  address_format_id int NOT NULL,
  PRIMARY KEY (countries_id),
  KEY IDX_COUNTRIES_NAME (countries_name)
);

DROP TABLE IF EXISTS currencies;
CREATE TABLE currencies (
  currencies_id int NOT NULL auto_increment,
  title varchar(32) NOT NULL,
  code char(3) NOT NULL,
  symbol_left varchar(12),
  symbol_right varchar(12),
  decimal_point char(1),
  thousands_point char(1),
  decimal_places char(1),
  value float(13,8),
  last_updated datetime NULL,
  PRIMARY KEY (currencies_id),
  KEY idx_currencies_code (code)
);

DROP TABLE IF EXISTS customers;
CREATE TABLE customers (
   customers_id int NOT NULL auto_increment,
   customers_gender char(1) NOT NULL,
   customers_firstname varchar(32) NOT NULL,
   customers_lastname varchar(32) NOT NULL,
   customers_dob datetime DEFAULT '0000-00-00 00:00:00' NOT NULL,
   customers_email_address varchar(96) NOT NULL,
   customers_default_address_id int,
   customers_telephone varchar(32) NOT NULL,
   customers_fax varchar(32),
   customers_password varchar(40) NOT NULL,
   customers_newsletter char(1),
   PRIMARY KEY (customers_id),
   KEY idx_customers_email_address (customers_email_address)
);

DROP TABLE IF EXISTS customers_basket;
CREATE TABLE customers_basket (
  customers_basket_id int NOT NULL auto_increment,
  customers_id int NOT NULL,
  products_id tinytext NOT NULL,
  customers_basket_quantity int(2) NOT NULL,
  final_price decimal(15,4),
  customers_basket_date_added char(8),
  PRIMARY KEY (customers_basket_id),
  KEY idx_customers_basket_customers_id (customers_id)
);

DROP TABLE IF EXISTS customers_basket_attributes;
CREATE TABLE customers_basket_attributes (
  customers_basket_attributes_id int NOT NULL auto_increment,
  customers_id int NOT NULL,
  products_id tinytext NOT NULL,
  products_options_id int NOT NULL,
  products_options_value_id int NOT NULL,
  PRIMARY KEY (customers_basket_attributes_id),
  KEY idx_customers_basket_att_customers_id (customers_id)
);

DROP TABLE IF EXISTS customers_info;
CREATE TABLE customers_info (
  customers_info_id int NOT NULL,
  customers_info_date_of_last_logon datetime,
  customers_info_number_of_logons int(5),
  customers_info_date_account_created datetime,
  customers_info_date_account_last_modified datetime,
  global_product_notifications int(1) DEFAULT '0',
  PRIMARY KEY (customers_info_id)
);

DROP TABLE IF EXISTS languages;
CREATE TABLE languages (
  languages_id int NOT NULL auto_increment,
  name varchar(32)  NOT NULL,
  code char(2) NOT NULL,
  image varchar(64),
  directory varchar(32),
  sort_order int(3),
  PRIMARY KEY (languages_id),
  KEY IDX_LANGUAGES_NAME (name)
);


DROP TABLE IF EXISTS manufacturers;
CREATE TABLE manufacturers (
  manufacturers_id int NOT NULL auto_increment,
  manufacturers_name varchar(32) NOT NULL,
  manufacturers_image varchar(64),
  date_added datetime NULL,
  last_modified datetime NULL,
  PRIMARY KEY (manufacturers_id),
  KEY IDX_MANUFACTURERS_NAME (manufacturers_name)
);

DROP TABLE IF EXISTS manufacturers_info;
CREATE TABLE manufacturers_info (
  manufacturers_id int NOT NULL,
  languages_id int NOT NULL,
  manufacturers_url varchar(255) NOT NULL,
  url_clicked int(5) NOT NULL default '0',
  date_last_click datetime NULL,
  PRIMARY KEY (manufacturers_id, languages_id)
);

DROP TABLE IF EXISTS newsletters;
CREATE TABLE newsletters (
  newsletters_id int NOT NULL auto_increment,
  title varchar(255) NOT NULL,
  content text NOT NULL,
  module varchar(255) NOT NULL,
  date_added datetime NOT NULL,
  date_sent datetime,
  status int(1),
  locked int(1) DEFAULT '0',
  PRIMARY KEY (newsletters_id)
);

DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
  orders_id int NOT NULL auto_increment,
  customers_id int NOT NULL,
  customers_name varchar(64) NOT NULL,
  customers_company varchar(32),
  customers_street_address varchar(64) NOT NULL,
  customers_suburb varchar(32),
  customers_city varchar(32) NOT NULL,
  customers_postcode varchar(10) NOT NULL,
  customers_state varchar(32),
  customers_country varchar(32) NOT NULL,
  customers_telephone varchar(32) NOT NULL,
  customers_email_address varchar(96) NOT NULL,
  customers_address_format_id int(5) NOT NULL,
  delivery_name varchar(64) NOT NULL,
  delivery_company varchar(32),
  delivery_street_address varchar(64) NOT NULL,
  delivery_suburb varchar(32),
  delivery_city varchar(32) NOT NULL,
  delivery_postcode varchar(10) NOT NULL,
  delivery_state varchar(32),
  delivery_country varchar(32) NOT NULL,
  delivery_address_format_id int(5) NOT NULL,
  billing_name varchar(64) NOT NULL,
  billing_company varchar(32),
  billing_street_address varchar(64) NOT NULL,
  billing_suburb varchar(32),
  billing_city varchar(32) NOT NULL,
  billing_postcode varchar(10) NOT NULL,
  billing_state varchar(32),
  billing_country varchar(32) NOT NULL,
  billing_address_format_id int(5) NOT NULL,
  payment_method varchar(255) NOT NULL,
  cc_type varchar(20),
  cc_owner varchar(64),
  cc_number varchar(32),
  cc_expires varchar(4),
  last_modified datetime,
  date_purchased datetime,
  orders_status int(5) NOT NULL,
  orders_date_finished datetime,
  currency char(3),
  currency_value decimal(14,6),
  PRIMARY KEY (orders_id),
  KEY idx_orders_customers_id (customers_id)
);

DROP TABLE IF EXISTS orders_products;
CREATE TABLE orders_products (
  orders_products_id int NOT NULL auto_increment,
  orders_id int NOT NULL,
  products_id int NOT NULL,
  products_model varchar(12),
  products_name varchar(64) NOT NULL,
  products_price decimal(15,4) NOT NULL,
  final_price decimal(15,4) NOT NULL,
  products_tax decimal(7,4) NOT NULL,
  products_quantity int(2) NOT NULL,
  PRIMARY KEY (orders_products_id),
  KEY idx_orders_products_orders_id (orders_id),
  KEY idx_orders_products_products_id (products_id)
);

DROP TABLE IF EXISTS orders_status;
CREATE TABLE orders_status (
   orders_status_id int DEFAULT '0' NOT NULL,
   language_id int DEFAULT '1' NOT NULL,
   orders_status_name varchar(32) NOT NULL,
   public_flag int DEFAULT '1',
   downloads_flag int DEFAULT '0',
   PRIMARY KEY (orders_status_id, language_id),
   KEY idx_orders_status_name (orders_status_name)
);

DROP TABLE IF EXISTS orders_status_history;
CREATE TABLE orders_status_history (
   orders_status_history_id int NOT NULL auto_increment,
   orders_id int NOT NULL,
   orders_status_id int(5) NOT NULL,
   date_added datetime NOT NULL,
   customer_notified int(1) DEFAULT '0',
   comments text,
   PRIMARY KEY (orders_status_history_id),
   KEY idx_orders_status_history_orders_id (orders_id)
);

DROP TABLE IF EXISTS orders_products_attributes;
CREATE TABLE orders_products_attributes (
  orders_products_attributes_id int NOT NULL auto_increment,
  orders_id int NOT NULL,
  orders_products_id int NOT NULL,
  products_options varchar(32) NOT NULL,
  products_options_values varchar(32) NOT NULL,
  options_values_price decimal(15,4) NOT NULL,
  price_prefix char(1) NOT NULL,
  PRIMARY KEY (orders_products_attributes_id),
  KEY idx_orders_products_att_orders_id (orders_id)
);

DROP TABLE IF EXISTS orders_products_download;
CREATE TABLE orders_products_download (
  orders_products_download_id int NOT NULL auto_increment,
  orders_id int NOT NULL default '0',
  orders_products_id int NOT NULL default '0',
  orders_products_filename varchar(255) NOT NULL default '',
  download_maxdays int(2) NOT NULL default '0',
  download_count int(2) NOT NULL default '0',
  PRIMARY KEY  (orders_products_download_id),
  KEY idx_orders_products_download_orders_id (orders_id)
);

DROP TABLE IF EXISTS orders_total;
CREATE TABLE orders_total (
  orders_total_id int unsigned NOT NULL auto_increment,
  orders_id int NOT NULL,
  title varchar(255) NOT NULL,
  text varchar(255) NOT NULL,
  value decimal(15,4) NOT NULL,
  class varchar(32) NOT NULL,
  sort_order int NOT NULL,
  PRIMARY KEY (orders_total_id),
  KEY idx_orders_total_orders_id (orders_id)
);

DROP TABLE IF EXISTS products;
CREATE TABLE products (
  products_id int NOT NULL auto_increment,
  products_quantity int(4) NOT NULL,
  products_model varchar(12),
  products_image varchar(64),
  products_price decimal(15,4) NOT NULL,
  products_date_added datetime NOT NULL,
  products_last_modified datetime,
  products_date_available datetime,
  products_weight decimal(5,2) NOT NULL,
  products_status tinyint(1) NOT NULL,
  products_tax_class_id int NOT NULL,
  manufacturers_id int NULL,
  products_ordered int NOT NULL default '0',
  PRIMARY KEY (products_id),
  KEY idx_products_model (products_model),
  KEY idx_products_date_added (products_date_added)
);

DROP TABLE IF EXISTS products_attributes;
CREATE TABLE products_attributes (
  products_attributes_id int NOT NULL auto_increment,
  products_id int NOT NULL,
  options_id int NOT NULL,
  options_values_id int NOT NULL,
  options_values_price decimal(15,4) NOT NULL,
  price_prefix char(1) NOT NULL,
  PRIMARY KEY (products_attributes_id),
  KEY idx_products_attributes_products_id (products_id)
);

DROP TABLE IF EXISTS products_attributes_download;
CREATE TABLE products_attributes_download (
  products_attributes_id int NOT NULL,
  products_attributes_filename varchar(255) NOT NULL default '',
  products_attributes_maxdays int(2) default '0',
  products_attributes_maxcount int(2) default '0',
  PRIMARY KEY  (products_attributes_id)
);

DROP TABLE IF EXISTS products_description;
CREATE TABLE products_description (
  products_id int NOT NULL auto_increment,
  language_id int NOT NULL default '1',
  products_name varchar(64) NOT NULL default '',
  products_description text,
  products_url varchar(255) default NULL,
  products_viewed int(5) default '0',
  PRIMARY KEY  (products_id,language_id),
  KEY products_name (products_name)
);

DROP TABLE IF EXISTS products_notifications;
CREATE TABLE products_notifications (
  products_id int NOT NULL,
  customers_id int NOT NULL,
  date_added datetime NOT NULL,
  PRIMARY KEY (products_id, customers_id)
);

DROP TABLE IF EXISTS products_options;
CREATE TABLE products_options (
  products_options_id int NOT NULL default '0',
  language_id int NOT NULL default '1',
  products_options_name varchar(32) NOT NULL default '',
  PRIMARY KEY  (products_options_id,language_id)
);

DROP TABLE IF EXISTS products_options_values;
CREATE TABLE products_options_values (
  products_options_values_id int NOT NULL default '0',
  language_id int NOT NULL default '1',
  products_options_values_name varchar(64) NOT NULL default '',
  PRIMARY KEY  (products_options_values_id,language_id)
);

DROP TABLE IF EXISTS products_options_values_to_products_options;
CREATE TABLE products_options_values_to_products_options (
  products_options_values_to_products_options_id int NOT NULL auto_increment,
  products_options_id int NOT NULL,
  products_options_values_id int NOT NULL,
  PRIMARY KEY (products_options_values_to_products_options_id)
);

DROP TABLE IF EXISTS products_to_categories;
CREATE TABLE products_to_categories (
  products_id int NOT NULL,
  categories_id int NOT NULL,
  PRIMARY KEY (products_id,categories_id)
);

DROP TABLE IF EXISTS reviews;
CREATE TABLE reviews (
  reviews_id int NOT NULL auto_increment,
  products_id int NOT NULL,
  customers_id int,
  customers_name varchar(64) NOT NULL,
  reviews_rating int(1),
  date_added datetime,
  last_modified datetime,
  reviews_read int(5) NOT NULL default '0',
  PRIMARY KEY (reviews_id),
  KEY idx_reviews_products_id (products_id),
  KEY idx_reviews_customers_id (customers_id)
);

DROP TABLE IF EXISTS reviews_description;
CREATE TABLE reviews_description (
  reviews_id int NOT NULL,
  languages_id int NOT NULL,
  reviews_text text NOT NULL,
  PRIMARY KEY (reviews_id, languages_id)
);

DROP TABLE IF EXISTS sessions;
CREATE TABLE sessions (
  sesskey varchar(32) NOT NULL,
  expiry int(11) unsigned NOT NULL,
  value text NOT NULL,
  PRIMARY KEY (sesskey)
);

DROP TABLE IF EXISTS specials;
CREATE TABLE specials (
  specials_id int NOT NULL auto_increment,
  products_id int NOT NULL,
  specials_new_products_price decimal(15,4) NOT NULL,
  specials_date_added datetime,
  specials_last_modified datetime,
  expires_date datetime,
  date_status_change datetime,
  status int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (specials_id),
  KEY idx_specials_products_id (products_id)
);

DROP TABLE IF EXISTS tax_class;
CREATE TABLE tax_class (
  tax_class_id int NOT NULL auto_increment,
  tax_class_title varchar(32) NOT NULL,
  tax_class_description varchar(255) NOT NULL,
  last_modified datetime NULL,
  date_added datetime NOT NULL,
  PRIMARY KEY (tax_class_id)
);

DROP TABLE IF EXISTS tax_rates;
CREATE TABLE tax_rates (
  tax_rates_id int NOT NULL auto_increment,
  tax_zone_id int NOT NULL,
  tax_class_id int NOT NULL,
  tax_priority int(5) DEFAULT 1,
  tax_rate decimal(7,4) NOT NULL,
  tax_description varchar(255) NOT NULL,
  last_modified datetime NULL,
  date_added datetime NOT NULL,
  PRIMARY KEY (tax_rates_id)
);

DROP TABLE IF EXISTS geo_zones;
CREATE TABLE geo_zones (
  geo_zone_id int NOT NULL auto_increment,
  geo_zone_name varchar(32) NOT NULL,
  geo_zone_description varchar(255) NOT NULL,
  last_modified datetime NULL,
  date_added datetime NOT NULL,
  PRIMARY KEY (geo_zone_id)
);

DROP TABLE IF EXISTS whos_online;
CREATE TABLE whos_online (
  customer_id int,
  full_name varchar(64) NOT NULL,
  session_id varchar(128) NOT NULL,
  ip_address varchar(15) NOT NULL,
  time_entry varchar(14) NOT NULL,
  time_last_click varchar(14) NOT NULL,
  last_page_url text NOT NULL
);

DROP TABLE IF EXISTS zones;
CREATE TABLE zones (
  zone_id int NOT NULL auto_increment,
  zone_country_id int NOT NULL,
  zone_code varchar(32) NOT NULL,
  zone_name varchar(32) NOT NULL,
  PRIMARY KEY (zone_id),
  KEY idx_zones_country_id (zone_country_id)
);

DROP TABLE IF EXISTS zones_to_geo_zones;
CREATE TABLE zones_to_geo_zones (
   association_id int NOT NULL auto_increment,
   zone_country_id int NOT NULL,
   zone_id int NULL,
   geo_zone_id int NULL,
   last_modified datetime NULL,
   date_added datetime NOT NULL,
   PRIMARY KEY (association_id),
   KEY idx_zones_to_geo_zones_country_id (zone_country_id)
);


# data

INSERT INTO address_book VALUES ( '1', '1', 'm', 'ACME Inc.', 'osCommerce', 'Brasil', 'www.oscommerce.raonibs.com.br', '', '12345', 'NeverNever', '', '223', '12');

# 1 - Default, 2 - USA, 3 - Spain, 4 - Singapore, 5 - Germany
INSERT INTO address_format VALUES (1, '$firstname $lastname$cr$streets$cr$city, $postcode$cr$statecomma$country','$city / $country');
INSERT INTO address_format VALUES (2, '$firstname $lastname$cr$streets$cr$city, $state    $postcode$cr$country','$city, $state / $country');
INSERT INTO address_format VALUES (3, '$firstname $lastname$cr$streets$cr$city$cr$postcode - $statecomma$country','$state / $country');
INSERT INTO address_format VALUES (4, '$firstname $lastname$cr$streets$cr$city ($postcode)$cr$country', '$postcode / $country');
INSERT INTO address_format VALUES (5, '$firstname $lastname$cr$streets$cr$postcode $city$cr$country','$city / $country');

INSERT INTO banners VALUES (1, 'osCommerce', 'http://www.oscommerce.com', 'banners/oscommerce.gif', '468x50', '', 0, null, null, now(), null, 1);

INSERT INTO categories VALUES ('1', 'category_hardware.gif', '0', '1', now(), null);
INSERT INTO categories VALUES ('2', 'category_software.gif', '0', '2', now(), null);
INSERT INTO categories VALUES ('3', 'category_dvd_movies.gif', '0', '3', now(), null);
INSERT INTO categories VALUES ('4', 'subcategory_graphic_cards.gif', '1', '0', now(), null);
INSERT INTO categories VALUES ('5', 'subcategory_printers.gif', '1', '0', now(), null);
INSERT INTO categories VALUES ('6', 'subcategory_monitors.gif', '1', '0', now(), null);
INSERT INTO categories VALUES ('7', 'subcategory_speakers.gif', '1', '0', now(), null);
INSERT INTO categories VALUES ('8', 'subcategory_keyboards.gif', '1', '0', now(), null);
INSERT INTO categories VALUES ('9', 'subcategory_mice.gif', '1', '0', now(), null);
INSERT INTO categories VALUES ('10', 'subcategory_action.gif', '3', '0', now(), null);
INSERT INTO categories VALUES ('11', 'subcategory_science_fiction.gif', '3', '0', now(), null);
INSERT INTO categories VALUES ('12', 'subcategory_comedy.gif', '3', '0', now(), null);
INSERT INTO categories VALUES ('13', 'subcategory_cartoons.gif', '3', '0', now(), null);
INSERT INTO categories VALUES ('14', 'subcategory_thriller.gif', '3', '0', now(), null);
INSERT INTO categories VALUES ('15', 'subcategory_drama.gif', '3', '0', now(), null);
INSERT INTO categories VALUES ('16', 'subcategory_memory.gif', '1', '0', now(), null);
INSERT INTO categories VALUES ('17', 'subcategory_cdrom_drives.gif', '1', '0', now(), null);
INSERT INTO categories VALUES ('18', 'subcategory_simulation.gif', '2', '0', now(), null);
INSERT INTO categories VALUES ('19', 'subcategory_action_games.gif', '2', '0', now(), null);
INSERT INTO categories VALUES ('20', 'subcategory_strategy.gif', '2', '0', now(), null);

INSERT INTO categories_description VALUES ( '1', '1', 'Hardware');
INSERT INTO categories_description VALUES ( '2', '1', 'Software');
INSERT INTO categories_description VALUES ( '3', '1', 'DVD Filmes');
INSERT INTO categories_description VALUES ( '4', '1', 'Placas de V�deos');
INSERT INTO categories_description VALUES ( '5', '1', 'Impressoras');
INSERT INTO categories_description VALUES ( '6', '1', 'Monitores');
INSERT INTO categories_description VALUES ( '7', '1', 'Microfones');
INSERT INTO categories_description VALUES ( '8', '1', 'Teclados');
INSERT INTO categories_description VALUES ( '9', '1', 'Mouse');
INSERT INTO categories_description VALUES ( '10', '1', 'A��o');
INSERT INTO categories_description VALUES ( '11', '1', 'Fic��o Cient�fica');
INSERT INTO categories_description VALUES ( '12', '1', 'Com�dia');
INSERT INTO categories_description VALUES ( '13', '1', 'Desenhos');
INSERT INTO categories_description VALUES ( '14', '1', 'Policial');
INSERT INTO categories_description VALUES ( '15', '1', 'Drama');
INSERT INTO categories_description VALUES ( '16', '1', 'Memory');
INSERT INTO categories_description VALUES ( '17', '1', 'Drives de CDROM');
INSERT INTO categories_description VALUES ( '18', '1', 'Simula��o');
INSERT INTO categories_description VALUES ( '19', '1', 'A��o');
INSERT INTO categories_description VALUES ( '20', '1', 'Estrat�gia');
INSERT INTO categories_description VALUES ( '1', '2', 'Hardware');
INSERT INTO categories_description VALUES ( '2', '2', 'Software');
INSERT INTO categories_description VALUES ( '3', '2', 'DVD Movies');
INSERT INTO categories_description VALUES ( '4', '2', 'Graphics Cards');
INSERT INTO categories_description VALUES ( '5', '2', 'Printers');
INSERT INTO categories_description VALUES ( '6', '2', 'Monitors');
INSERT INTO categories_description VALUES ( '7', '2', 'Speakers');
INSERT INTO categories_description VALUES ( '8', '2', 'Keyboards');
INSERT INTO categories_description VALUES ( '9', '2', 'Mice');
INSERT INTO categories_description VALUES ( '10', '2', 'Action');
INSERT INTO categories_description VALUES ( '11', '2', 'Science Fiction');
INSERT INTO categories_description VALUES ( '12', '2', 'Comedy');
INSERT INTO categories_description VALUES ( '13', '2', 'Cartoons');
INSERT INTO categories_description VALUES ( '14', '2', 'Thriller');
INSERT INTO categories_description VALUES ( '15', '2', 'Drama');
INSERT INTO categories_description VALUES ( '16', '2', 'Memory');
INSERT INTO categories_description VALUES ( '17', '2', 'CDROM Drives');
INSERT INTO categories_description VALUES ( '18', '2', 'Simulation');
INSERT INTO categories_description VALUES ( '19', '2', 'Action');
INSERT INTO categories_description VALUES ( '20', '2', 'Strategy');
INSERT INTO categories_description VALUES ( '1', '3', 'Hardware');
INSERT INTO categories_description VALUES ( '2', '3', 'Software');
INSERT INTO categories_description VALUES ( '3', '3', 'DVD Filme');
INSERT INTO categories_description VALUES ( '4', '3', 'Grafikkarten');
INSERT INTO categories_description VALUES ( '5', '3', 'Drucker');
INSERT INTO categories_description VALUES ( '6', '3', 'Bildschirme');
INSERT INTO categories_description VALUES ( '7', '3', 'Lautsprecher');
INSERT INTO categories_description VALUES ( '8', '3', 'Tastaturen');
INSERT INTO categories_description VALUES ( '9', '3', 'M�use');
INSERT INTO categories_description VALUES ( '10', '3', 'Action');
INSERT INTO categories_description VALUES ( '11', '3', 'Science Fiction');
INSERT INTO categories_description VALUES ( '12', '3', 'Kom�die');
INSERT INTO categories_description VALUES ( '13', '3', 'Zeichentrick');
INSERT INTO categories_description VALUES ( '14', '3', 'Thriller');
INSERT INTO categories_description VALUES ( '15', '3', 'Drama');
INSERT INTO categories_description VALUES ( '16', '3', 'Speicher');
INSERT INTO categories_description VALUES ( '17', '3', 'CDROM Laufwerke');
INSERT INTO categories_description VALUES ( '18', '3', 'Simulation');
INSERT INTO categories_description VALUES ( '19', '3', 'Action');
INSERT INTO categories_description VALUES ( '20', '3', 'Strategie');
INSERT INTO categories_description VALUES ( '1', '4', 'Hardware');
INSERT INTO categories_description VALUES ( '2', '4', 'Software');
INSERT INTO categories_description VALUES ( '3', '4', 'Peliculas DVD');
INSERT INTO categories_description VALUES ( '4', '4', 'Tarjetas Graficas');
INSERT INTO categories_description VALUES ( '5', '4', 'Impresoras');
INSERT INTO categories_description VALUES ( '6', '4', 'Monitores');
INSERT INTO categories_description VALUES ( '7', '4', 'Altavoces');
INSERT INTO categories_description VALUES ( '8', '4', 'Teclados');
INSERT INTO categories_description VALUES ( '9', '4', 'Ratones');
INSERT INTO categories_description VALUES ( '10', '4', 'Accion');
INSERT INTO categories_description VALUES ( '11', '4', 'Ciencia Ficcion');
INSERT INTO categories_description VALUES ( '12', '4', 'Comedia');
INSERT INTO categories_description VALUES ( '13', '4', 'Dibujos Animados');
INSERT INTO categories_description VALUES ( '14', '4', 'Suspense');
INSERT INTO categories_description VALUES ( '15', '4', 'Drama');
INSERT INTO categories_description VALUES ( '16', '4', 'Memoria');
INSERT INTO categories_description VALUES ( '17', '4', 'Unidades CDROM');
INSERT INTO categories_description VALUES ( '18', '4', 'Simulacion');
INSERT INTO categories_description VALUES ( '19', '4', 'Accion');
INSERT INTO categories_description VALUES ( '20', '4', 'Estrategia');

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Nome da Loja', 'STORE_NAME', 'osCommerce', 'O nome da minha loja', '1', '1', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Propriet�rio da Loja', 'STORE_OWNER', 'Harald Ponce de Leon', 'Nome do Propriet�rio da Loja', '1', '2', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('E-Mail do Propriet�rio', 'STORE_OWNER_EMAIL_ADDRESS', 'root@localhost', 'E-mail do propriet�rio da loja', '1', '3', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('E-Mail dos pedidos', 'EMAIL_FROM', 'osCommerce <root@localhost>', 'E-mail usado para o envio dos pedidos', '1', '4', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, use_function, set_function, date_added) VALUES ('Pa�s', 'STORE_COUNTRY', '30', 'Minha loja est� localizada no pa�s <br><br><b>Observa��o: Lembre-se de atualizar o Estado da loja.</b>', '1', '6', 'tep_get_country_name', 'tep_cfg_pull_down_country_list(', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, use_function, set_function, date_added) VALUES ('Estado', 'STORE_ZONE', '', 'Estado onde a loja est� localizada', '1', '7', 'tep_cfg_get_zone_name', 'tep_cfg_pull_down_zone_list(', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Ordem dos produtos', 'EXPECTED_PRODUCTS_SORT', 'desc', 'Esta � a ordem usada na caixa de sele��o dos produtos.', '1', '8', 'tep_cfg_select_option(array(\'asc\', \'desc\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Como aparecer� a ordem dos produtos', 'EXPECTED_PRODUCTS_FIELD', 'date_expected', 'A ordem dos produtos que s�o mostrados.', '1', '9', 'tep_cfg_select_option(array(\'products_name\', \'date_expected\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Trocar a moeda corrente do idioma para padr�o', 'USE_DEFAULT_LANGUAGE_CURRENCY', 'false', 'Mudar automaticamente para a moeda corrente padr�o do idioma quando for mudado', '1', '10', 'tep_cfg_select_option(array(\'true\', \'false\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Avisar pedidos por e-mail', 'SEND_EXTRA_ORDER_EMAILS_TO', '', 'Enviar aviso para o e-mail da loja quando pedidos forem realizados: Name 1 &lt;email@address1&gt;, Name 2 &lt;email@address2&gt;', '1', '11', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Usar Search-Engine URLs Seguros (ainda em desenvolvimento)', 'SEARCH_ENGINE_FRIENDLY_URLS', 'false', 'Usar search-engine URLs seguros para todos links de site', '1', '12', 'tep_cfg_select_option(array(\'true\', \'false\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Mostrar produtos comprados', 'DISPLAY_CART', 'true', 'Mostrar o carrinho de compras ap�s a adi��o de um produto (ou voltar ao in�cio)', '1', '14', 'tep_cfg_select_option(array(\'true\', \'false\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Enviar p�gina para um amigo', 'ALLOW_GUEST_TO_TELL_A_FRIEND', 'false', 'Permitir que o visitante envie informa��es da loja e produtos para amigo', '1', '15', 'tep_cfg_select_option(array(\'true\', \'false\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Usar o m�todo de busca padr�o', 'ADVANCED_SEARCH_DEFAULT_OPERATOR', 'and', 'M�todo de busca padr�o', '1', '17', 'tep_cfg_select_option(array(\'and\', \'or\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Endere�o e Telefone da loja', 'STORE_NAME_ADDRESS', 'Nome da loja\nEndere�o\nPa�s\nTelefone', 'Isto � o Nome de Loja, Endere�o e Telefona para ser usado em documentos imprim�veis e exibidos online', '1', '18', 'tep_cfg_textarea(', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Mostrar Quantidades nas categorias', 'SHOW_COUNTS', 'true', 'Mostra quantos produtos est�o em cada categoria', '1', '19', 'tep_cfg_select_option(array(\'true\', \'false\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Taxas e Impostos', 'TAX_DECIMAL_PLACES', '0', 'Adicionar o valor da taxa a ser cobrado', '1', '20', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Mostrar pre�os com taxas', 'DISPLAY_PRICE_WITH_TAX', 'false', 'Mostrar os pre�os com o imposto inclu�do (true) ou mostre o valor do imposto ao lado do pre�o (false) ', '1', '21', 'tep_cfg_select_option(array(\'true\', \'false\'), ', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Primeiro nome', 'ENTRY_FIRST_NAME_MIN_LENGTH', '2', 'Quantidade m�nima de letras para o primeiro nome', '2', '1', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Sobrenome', 'ENTRY_LAST_NAME_MIN_LENGTH', '2', 'Quantidade m�nima de letras para o sobrenome', '2', '2', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Data de Nascimento', 'ENTRY_DOB_MIN_LENGTH', '10', 'Quantidade m�nima de letras para a data', '2', '3', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('E-Mail', 'ENTRY_EMAIL_ADDRESS_MIN_LENGTH', '6', 'Quantidade m�nima de letras para o e-mail', '2', '4', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Endere�o', 'ENTRY_STREET_ADDRESS_MIN_LENGTH', '5', 'Quantidade m�nima de letras para o endere�o', '2', '5', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Empresa', 'ENTRY_COMPANY_MIN_LENGTH', '2', 'Quantidade m�nima de letras para o nome da Empresa', '2', '6', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('CEP', 'ENTRY_POSTCODE_MIN_LENGTH', '4', 'Quantidade m�nima de letras para o CEP', '2', '7', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Cidade', 'ENTRY_CITY_MIN_LENGTH', '3', 'Quantidade m�nima de letras para a Cidade', '2', '8', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Estado', 'ENTRY_STATE_MIN_LENGTH', '2', 'Quantidade m�nima de letras para o estado', '2', '9', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Telefone', 'ENTRY_TELEPHONE_MIN_LENGTH', '3', 'Quantidade m�nima de n�meros para o telefone', '2', '10', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Senha', 'ENTRY_PASSWORD_MIN_LENGTH', '5', 'Quantidade m�nima de letras para a senha', '2', '11', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Nome do Titular do Cart�o', 'CC_OWNER_MIN_LENGTH', '3', 'Quantidade m�nima de letras do nome do titular do cart�o', '2', '12', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('N�mero do cart�o de Cr�dito', 'CC_NUMBER_MIN_LENGTH', '10', 'Quantidade m�nima de n�meros para o cart�o de cr�dito', '2', '13', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Coment�rios', 'REVIEW_TEXT_MIN_LENGTH', '50', 'Quantidade m�nima de letras em um coment�rio', '2', '14', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Mais Vendidos', 'MIN_DISPLAY_BESTSELLERS', '1', 'N�mero m�nimo de mais vendidos para exibi��o', '2', '15', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Tamb�m Compraram', 'MIN_DISPLAY_ALSO_PURCHASED', '1', 'N�mero m�nimo de produtos para exibi��o em \'Clientes tamb�m Compraram\' box', '2', '16', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Livro de Endere�os', 'MAX_ADDRESS_BOOK_ENTRIES', '5', 'N�mero m�ximo de endere�os de entrega que um cliente pode ter', '3', '1', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Resultado da Busca', 'MAX_DISPLAY_SEARCH_RESULTS', '20', 'N�mero m�ximo de produtos a serem listados', '3', '2', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Links', 'MAX_DISPLAY_PAGE_LINKS', '5', 'N�mero m�ximo de links em uma p�gina', '3', '3', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Ofertas', 'MAX_DISPLAY_SPECIAL_PRODUCTS', '9', 'N�mero m�ximo de ofertas a serem exibidas', '3', '4', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Novidades', 'MAX_DISPLAY_NEW_PRODUCTS', '9', 'N�mero m�ximo de novos produtos a serem exibidos em uma categoria', '3', '5', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Lan�amentos', 'MAX_DISPLAY_UPCOMING_PRODUCTS', '10', 'N�meros m�ximo de lan�amentos a serem exibidos', '3', '6', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Lista de Fabricantes', 'MAX_DISPLAY_MANUFACTURERS_IN_A_LIST', '0', 'Usado no box dos fabricantes; quando o n�mero de fabricantes exceder este n�mero o menu passar� a ser de sele��o', '3', '7', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Tamanho da Caixa de sele��o de fabricantes', 'MAX_MANUFACTURERS_LIST', '1', 'Usado no box dos fabricantes; Quando o valor � \'1\' o drop-down list cl�ssico � usado, do contr�rio, uma lista com o n�mero definido de linhas ser� exibida.', '3', '7', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Tamanho m�ximo do nome do Fabricante', 'MAX_DISPLAY_MANUFACTURER_NAME_LEN', '15', 'Usado no box dos fabricantes; n�mero  m�ximo de letras do nome do fabricante a ser exibido', '3', '8', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Novos Coment�rios', 'MAX_DISPLAY_NEW_REVIEWS', '6', 'N�mero m�ximo de novos coment�rios a serem exibidos', '3', '9', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Sele��o Rand�mica de coment�rios', 'MAX_RANDOM_SELECT_REVIEWS', '10', 'N�mero de coment�rios que ser�o utilizados na sele��o', '3', '10', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Sele��o Rand�mica de Novidades', 'MAX_RANDOM_SELECT_NEW', '10', 'N�mero de coment�rios que ser�o utilizados na sele��o', '3', '11', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Sele��o Rand�mica de Ofertas', 'MAX_RANDOM_SELECT_SPECIALS', '10', 'Quantos registros ser�o utilizados para selecionar ofertas a serem exibidas', '3', '12', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Categorias a serem listadas', 'MAX_DISPLAY_CATEGORIES_PER_ROW', '3', 'N�mero de categorias a serem listadas por fila', '3', '13', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Lista de Novos Produtos', 'MAX_DISPLAY_PRODUCTS_NEW', '10', 'N�mero m�ximo de produtos a serem listados na p�gina de novos produtos', '3', '14', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Mais Vendidos', 'MAX_DISPLAY_BESTSELLERS', '10', 'N�mero m�ximo de mais vendidos a serem exibidos', '3', '15', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Tamb�m compraram', 'MAX_DISPLAY_ALSO_PURCHASED', '6', 'N�mero m�ximo de indica��es a serem exibidos no box \'Clientes tamb�m compraram\' box', '3', '16', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Historico de Pedidos do Cliente', 'MAX_DISPLAY_PRODUCTS_IN_ORDER_HISTORY_BOX', '6', 'N�mero m�ximo dos produtos a mostrar na caixa do hist�rico de pedidos do cliente', '3', '17', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Hist�rico de Pedidos', 'MAX_DISPLAY_ORDER_HISTORY', '10', 'N�mero m�ximo de pedidos na p�gina do hist�rico de pedidos', '3', '18', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Quantidade de produtos no carrinho de compras', 'MAX_QTY_IN_CART', '99', 'N�mero m�ximo de produtos que podem ser adicionados ao carrinho de compras (0 igual a sem limite)', '3', '19', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Largura da Imagem Pequena', 'SMALL_IMAGE_WIDTH', '100', 'Em pixels', '4', '1', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Altura da Imagem Pequena', 'SMALL_IMAGE_HEIGHT', '80', 'Em pixels', '4', '2', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Largura da Imagem do Cabe�alho', 'HEADING_IMAGE_WIDTH', '57', 'Em pixels', '4', '3', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Altura da Imagem do Cabe�alho', 'HEADING_IMAGE_HEIGHT', '40', 'Em pixels', '4', '4', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Largura da Imagem da Subcategoria', 'SUBCATEGORY_IMAGE_WIDTH', '100', 'Em pixels', '4', '5', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Altura da Imagem da Subcategoria', 'SUBCATEGORY_IMAGE_HEIGHT', '57', 'Em pixels', '4', '6', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Calcular tamanho da Imagem', 'CONFIG_CALCULATE_IMAGE_SIZE', 'true', 'Calcular o tamanho da imagem?', '4', '7', 'tep_cfg_select_option(array(\'true\', \'false\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Imagem Obrigat�ria', 'IMAGE_REQUIRED', 'true', 'Abilitar inser��o obrigat�ria de imagens.', '4', '8', 'tep_cfg_select_option(array(\'true\', \'false\'), ', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Sexo (Masculino/Feminino)', 'ACCOUNT_GENDER', 'true', 'Ativar Sexo no cadastro de clientes', '5', '1', 'tep_cfg_select_option(array(\'true\', \'false\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Data de Nascimento', 'ACCOUNT_DOB', 'true', 'Ativar Data de nascimento no cadastro de clientes', '5', '2', 'tep_cfg_select_option(array(\'true\', \'false\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Empresa', 'ACCOUNT_COMPANY', 'true', 'Ativar Detalhes da Empresa no cadastro de clientes', '5', '3', 'tep_cfg_select_option(array(\'true\', \'false\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Bairro', 'ACCOUNT_SUBURB', 'true', 'Ativar Bairro no cadastro de clientes', '5', '4', 'tep_cfg_select_option(array(\'true\', \'false\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Estado', 'ACCOUNT_STATE', 'true', 'Ativar Estado no cadastro de clientes', '5', '5', 'tep_cfg_select_option(array(\'true\', \'false\'), ', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('M�dulos Instalados', 'MODULE_PAYMENT_INSTALLED', 'cc.php;cod.php', 'Lista os arquivos de m�dulos de pagamento separados por um ponto e virgula. Esta listagem � autom�tica e n�o pode ser editada. (Examplo: cc.php;cod.php;paypal.php)', '6', '0', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('M�dulos Instalados', 'MODULE_ORDER_TOTAL_INSTALLED', 'ot_subtotal.php;ot_tax.php;ot_shipping.php;ot_total.php', 'Lista os arquivos de m�dulos de pagamento separados por um ponto e virgula. Esta listagem � autom�tica e n�o pode ser editada. (Examplo: ot_subtotal.php;ot_tax.php;ot_shipping.php;ot_total.php)', '6', '0', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('M�dulos Instalados', 'MODULE_SHIPPING_INSTALLED', 'flat.php', 'Lista os arquivos de m�dulos de pagamento separados por um ponto e virgula. Esta listagem � autom�tica e n�o pode ser editada. (Examplo: ups.php;flat.php;item.php)', '6', '0', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Enable Cash On Delivery Module', 'MODULE_PAYMENT_COD_STATUS', 'True', 'Do you want to accept Cash On Delevery payments?', '6', '1', 'tep_cfg_select_option(array(\'True\', \'False\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, use_function, set_function, date_added) VALUES ('Payment Zone', 'MODULE_PAYMENT_COD_ZONE', '0', 'If a zone is selected, only enable this payment method for that zone.', '6', '2', 'tep_get_zone_class_title', 'tep_cfg_pull_down_zone_classes(', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Sort order of display.', 'MODULE_PAYMENT_COD_SORT_ORDER', '0', 'Sort order of display. Lowest is displayed first.', '6', '0', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, use_function, date_added) VALUES ('Set Order Status', 'MODULE_PAYMENT_COD_ORDER_STATUS_ID', '0', 'Set the status of orders made with this payment module to this value', '6', '0', 'tep_cfg_pull_down_order_statuses(', 'tep_get_order_status_name', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Enable Credit Card Module', 'MODULE_PAYMENT_CC_STATUS', 'True', 'Do you want to accept credit card payments?', '6', '0', 'tep_cfg_select_option(array(\'True\', \'False\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Split Credit Card E-Mail Address', 'MODULE_PAYMENT_CC_EMAIL', '', 'If an e-mail address is entered, the middle digits of the credit card number will be sent to the e-mail address (the outside digits are stored in the database with the middle digits censored)', '6', '0', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Sort order of display.', 'MODULE_PAYMENT_CC_SORT_ORDER', '0', 'Sort order of display. Lowest is displayed first.', '6', '0' , now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, use_function, set_function, date_added) VALUES ('Payment Zone', 'MODULE_PAYMENT_CC_ZONE', '0', 'If a zone is selected, only enable this payment method for that zone.', '6', '2', 'tep_get_zone_class_title', 'tep_cfg_pull_down_zone_classes(', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, use_function, date_added) VALUES ('Set Order Status', 'MODULE_PAYMENT_CC_ORDER_STATUS_ID', '0', 'Set the status of orders made with this payment module to this value', '6', '0', 'tep_cfg_pull_down_order_statuses(', 'tep_get_order_status_name', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Enable Flat Shipping', 'MODULE_SHIPPING_FLAT_STATUS', 'True', 'Do you want to offer flat rate shipping?', '6', '0', 'tep_cfg_select_option(array(\'True\', \'False\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Shipping Cost', 'MODULE_SHIPPING_FLAT_COST', '5.00', 'The shipping cost for all orders using this shipping method.', '6', '0', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, use_function, set_function, date_added) VALUES ('Tax Class', 'MODULE_SHIPPING_FLAT_TAX_CLASS', '0', 'Use the following tax class on the shipping fee.', '6', '0', 'tep_get_tax_class_title', 'tep_cfg_pull_down_tax_classes(', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, use_function, set_function, date_added) VALUES ('Shipping Zone', 'MODULE_SHIPPING_FLAT_ZONE', '0', 'If a zone is selected, only enable this shipping method for that zone.', '6', '0', 'tep_get_zone_class_title', 'tep_cfg_pull_down_zone_classes(', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Sort Order', 'MODULE_SHIPPING_FLAT_SORT_ORDER', '0', 'Sort order of display.', '6', '0', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Default Currency', 'DEFAULT_CURRENCY', 'BRL', 'Default Currency', '6', '0', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Default Language', 'DEFAULT_LANGUAGE', 'pt-BR', 'Default Language', '6', '0', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Default Order Status For New Orders', 'DEFAULT_ORDERS_STATUS_ID', '1', 'When a new order is created, this order status will be assigned to it.', '6', '0', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Display Shipping', 'MODULE_ORDER_TOTAL_SHIPPING_STATUS', 'true', 'Do you want to display the order shipping cost?', '6', '1','tep_cfg_select_option(array(\'true\', \'false\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Sort Order', 'MODULE_ORDER_TOTAL_SHIPPING_SORT_ORDER', '2', 'Sort order of display.', '6', '2', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Allow Free Shipping', 'MODULE_ORDER_TOTAL_SHIPPING_FREE_SHIPPING', 'false', 'Do you want to allow free shipping?', '6', '3', 'tep_cfg_select_option(array(\'true\', \'false\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, use_function, date_added) VALUES ('Free Shipping For Orders Over', 'MODULE_ORDER_TOTAL_SHIPPING_FREE_SHIPPING_OVER', '50', 'Provide free shipping for orders over the set amount.', '6', '4', 'currencies->format', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Provide Free Shipping For Orders Made', 'MODULE_ORDER_TOTAL_SHIPPING_DESTINATION', 'national', 'Provide free shipping for orders sent to the set destination.', '6', '5', 'tep_cfg_select_option(array(\'national\', \'international\', \'both\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Display Sub-Total', 'MODULE_ORDER_TOTAL_SUBTOTAL_STATUS', 'true', 'Do you want to display the order sub-total cost?', '6', '1','tep_cfg_select_option(array(\'true\', \'false\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Sort Order', 'MODULE_ORDER_TOTAL_SUBTOTAL_SORT_ORDER', '1', 'Sort order of display.', '6', '2', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Display Tax', 'MODULE_ORDER_TOTAL_TAX_STATUS', 'true', 'Do you want to display the order tax value?', '6', '1','tep_cfg_select_option(array(\'true\', \'false\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Sort Order', 'MODULE_ORDER_TOTAL_TAX_SORT_ORDER', '3', 'Sort order of display.', '6', '2', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Display Total', 'MODULE_ORDER_TOTAL_TOTAL_STATUS', 'true', 'Do you want to display the total order value?', '6', '1','tep_cfg_select_option(array(\'true\', \'false\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Sort Order', 'MODULE_ORDER_TOTAL_TOTAL_SORT_ORDER', '4', 'Sort order of display.', '6', '2', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, use_function, set_function, date_added) VALUES ('Pa�s de Origem', 'SHIPPING_ORIGIN_COUNTRY', '223', 'Pa�s de origem (ser� mostrado nos dados do remetende.)', '7', '1', 'tep_get_country_name', 'tep_cfg_pull_down_country_list(', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('CEP', 'SHIPPING_ORIGIN_ZIP', 'NONE', 'Entre com o c�digo postal (CEP) da sua loja (ser� mostrado nos dados do remetende.).', '7', '2', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Peso M�ximo do Pacote que Voc� Enviar�', 'SHIPPING_MAX_WEIGHT', '50', 'Os correios t�m um limite de peso m�ximo para cada pacote.', '7', '3', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Peso Normal dos Pacotes.', 'SHIPPING_BOX_WEIGHT', '3', 'Qual � o peso da embalagem t�pica de pacotes pequenos e m�dios?', '7', '4', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Pacotes grandes - Incrementar percentual.', 'SHIPPING_BOX_PADDING', '10', 'Para 10% digite apenas 10', '7', '5', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Exibir Imagens do Produto', 'PRODUCT_LIST_IMAGE', '1', 'Voc� deseja exibir a imagem do produto?', '8', '1', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Exibir Nomes dos Fabricantes','PRODUCT_LIST_MANUFACTURER', '0', 'Voc� deseja exibir o nome do fabricante do produto?', '8', '2', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Exibir Modelos dos Produtos', 'PRODUCT_LIST_MODEL', '0', 'Voc� deseja exibir o modelo do produto?', '8', '3', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Exibir Nomes dos Produtos', 'PRODUCT_LIST_NAME', '2', 'Voc� deseja exibir o nome do produto?', '8', '4', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Exibir Pre�os dos Produtos', 'PRODUCT_LIST_PRICE', '3', 'Voc� deseja exibir o pre�o do produto?', '8', '5', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Exibir Quantidade dos Produtos', 'PRODUCT_LIST_QUANTITY', '0', 'Voc� deseja exibir a quantidade de produtos?', '8', '6', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Exibir Peso dos Produtos', 'PRODUCT_LIST_WEIGHT', '0', 'Voc� deseja exibiro peso dos produtos?', '8', '7', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Exibir Coluna Compre Agora', 'PRODUCT_LIST_BUY_NOW', '4', 'Voc� deseja exibir a coluna "compre agora"?', '8', '8', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Exibir Filtros Categorias/Fabricantes (0=dasativado; 1=ativado)', 'PRODUCT_LIST_FILTER', '1', 'Voc� deseja exibir Filtros Categorias/Fabricantes', '8', '9', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Localiza��o dos Bot�es Anterior/Pr�ximo (1-topo, 2-abaixo, 3-ambos)', 'PREV_NEXT_BAR_LOCATION', '2', 'Localiza��o dos Bot�es Anterior/Pr�ximo (1-topo, 2-abaixo, 3-ambos)', '8', '10', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Checar Estoque', 'STOCK_CHECK', 'true', 'Verifica se h� estoque suficiente dispon�vel', '9', '1', 'tep_cfg_select_option(array(\'true\', \'false\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Subtrair do Estoque', 'STOCK_LIMITED', 'true', 'Subtrair produto do estoque quando for realizado um pedido', '9', '2', 'tep_cfg_select_option(array(\'true\', \'false\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Permitir Ir ao Caixa', 'STOCK_ALLOW_CHECKOUT', 'true', 'Permitir cliente ir ao caixa mesmo quando o estoque for insuficiente', '9', '3', 'tep_cfg_select_option(array(\'true\', \'false\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Marcar Produtos Sem Estoque', 'STOCK_MARK_PRODUCT_OUT_OF_STOCK', '***', 'Exibir *** quando o produto n�o estiver dispon�vel em estoque', '9', '4', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Estoque Baixo', 'STOCK_REORDER_LEVEL', '5', 'Defina a quantidade cr�tica do seu estoque', '9', '5', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Analisar o Tempo na P�gina da Loja', 'STORE_PAGE_PARSE_TIME', 'false', 'Armazene o tempo que leva para analisar uma p�gina', '10', '1', 'tep_cfg_select_option(array(\'true\', \'false\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Destino do Log', 'STORE_PAGE_PARSE_TIME_LOG', '/var/log/www/tep/page_parse_time.log', 'O diret�rio e nome do arquivo da p�gina que analisar� o tempo do log', '10', '2', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Formato da Data do Log', 'STORE_PARSE_DATE_TIME_FORMAT', '%d/%m/%Y %H:%M:%S', 'O formato da data', '10', '3', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Mostrar Analise do Tempo da P�gina ', 'DISPLAY_PAGE_PARSE_TIME', 'true', 'Mostrar a p�gina de analise tempo (Deve estar habilitado)', '10', '4', 'tep_cfg_select_option(array(\'true\', \'false\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Armazene as Informa��es do Banco de Dados', 'STORE_DB_TRANSACTIONS', 'false', 'Armazene as informa��es do banco de dados na p�gina de analise do tempo do log (PHP4 somente)', '10', '5', 'tep_cfg_select_option(array(\'true\', \'false\'), ', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Usar Cache', 'USE_CACHE', 'false', 'Utilizar recursos de cache', '11', '1', 'tep_cfg_select_option(array(\'true\', \'false\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Diret�rio do Cache', 'DIR_FS_CACHE', '/tmp/', 'O diret�rio onde os arquivos de cache ser�o armazenados', '11', '2', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('M�todo de Envio de E-Mail', 'EMAIL_TRANSPORT', 'sendmail', 'Defina se este servidor usa uma conex�o de local para enviar emails ou se usa uma conex�o de SMTP via TCP/IP. Os servidores que executam em Windows e MacOS deveram mudar esta configura��o para SMTP.', '12', '1', 'tep_cfg_select_option(array(\'sendmail\', \'smtp\'),', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('E-Mail Linefeeds', 'EMAIL_LINEFEED', 'LF', 'Defina a seq��ncia de caractere usada para separar o cabe�alho do email.', '12', '2', 'tep_cfg_select_option(array(\'LF\', \'CRLF\'),', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Use MIME HTML Quando Enviar Emails', 'EMAIL_USE_HTML', 'false', 'Enviar e-mails em formato HTML', '12', '3', 'tep_cfg_select_option(array(\'true\', \'false\'),', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Verifique Endere�os de E-mail por DNS', 'ENTRY_EMAIL_ADDRESS_CHECK', 'false', 'Verifique o endere�o de e-mail atrav�s do servidor DNS', '12', '4', 'tep_cfg_select_option(array(\'true\', \'false\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Enviar E-mails', 'SEND_EMAILS', 'true', 'Enviar e-mails', '12', '5', 'tep_cfg_select_option(array(\'true\', \'false\'), ', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Ativar Download', 'DOWNLOAD_ENABLED', 'false', 'Ativa as fun��es para downloads de produtos.', '13', '1', 'tep_cfg_select_option(array(\'true\', \'false\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Redirecionar o Download', 'DOWNLOAD_BY_REDIRECT', 'false', 'Use redirecionamento de Browser para download. Use somente em sistemas Unix.', '13', '2', 'tep_cfg_select_option(array(\'true\', \'false\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Tempo de Expira��o (em dias)' ,'DOWNLOAD_MAX_DAYS', '7', 'Configurar n�mero de dias antes do link de download expirar. Se for 0 o link n�o ira expirar.', '13', '3', '', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('N�mero M�ximo de Downloads' ,'DOWNLOAD_MAX_COUNT', '5', 'Configurar o n�mero m�ximo de downloads. ( 0 ) significa sem limites.', '13', '4', '', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Ativar Compress�o GZip', 'GZIP_COMPRESSION', 'false', 'Ativar compress�o de HTTP GZip.', '14', '1', 'tep_cfg_select_option(array(\'true\', \'false\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('N�vel de Compress�o', 'GZIP_LEVEL', '5', 'Use um n�vel de compress�o de 0 at� 9 (0 = m�nimo, 9 = m�ximo).', '14', '2', now());

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) VALUES ('Diret�rio da sess�o', 'SESSION_WRITE_DIRECTORY', '/tmp', 'Se as sess�es s�o baseadas em arquivos eles ser�o armazenados nesse diret�rio.', '15', '1', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('For�ar Uso de Cookies', 'SESSION_FORCE_COOKIE_USE', 'False', 'Quando habilitado for�a o uso de cookies nas se��os.', '15', '2', 'tep_cfg_select_option(array(\'True\', \'False\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Checar Sess�o de SSL ID', 'SESSION_CHECK_SSL_SESSION_ID', 'False', 'Valida o SSL_SESSION_ID em todo pedido de p�gina de HTTPS seguro.', '15', '3', 'tep_cfg_select_option(array(\'True\', \'False\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Checar Identidade do usu�rio', 'SESSION_CHECK_USER_AGENT', 'False', 'Valida a identidade dos clientes em cada solicita��o de p�gina.', '15', '4', 'tep_cfg_select_option(array(\'True\', \'False\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Checar Endere�o de IP', 'SESSION_CHECK_IP_ADDRESS', 'False', 'Valida o endere�o IP de clientes  em cada solicita��o de p�gina.', '15', '5', 'tep_cfg_select_option(array(\'True\', \'False\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Previnir Sess�es de Spider', 'SESSION_BLOCK_SPIDERS', 'True', 'Previne que Spiders conehcidos iniciem uma sess�o.', '15', '6', 'tep_cfg_select_option(array(\'True\', \'False\'), ', now());
INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) VALUES ('Recriar Sess�o', 'SESSION_RECREATE', 'False', 'Recriar a sess�o para gerar uma nova sess�o de identifica��o quando o cliente logar ou cria uma conta (necess�rio PHP >= 4,1).', '15', '7', 'tep_cfg_select_option(array(\'True\', \'False\'), ', now());

INSERT INTO configuration_group VALUES ('1', 'Minha Loja', 'Informa��es gerais sobre minha loja', '1', '1');
INSERT INTO configuration_group VALUES ('2', 'Valores M�nimos', 'Valores m�nimos para as fun��es / dados', '2', '1');
INSERT INTO configuration_group VALUES ('3', 'Valores M�ximos', 'Valores m�ximos para as fun��es / dados', '3', '1');
INSERT INTO configuration_group VALUES ('4', 'Imagens', 'Par�metros das Imagens', '4', '1');
INSERT INTO configuration_group VALUES ('5', 'Detalhes do Cliente', 'Configura��o da conta do cliente', '5', '1');
INSERT INTO configuration_group VALUES ('6', 'Op��es de M�dulos', 'Esconder Configura��o', '6', '0');
INSERT INTO configuration_group VALUES ('7', 'Entrega/Pacotes', 'Op��es de entrega da sua loja', '7', '1');
INSERT INTO configuration_group VALUES ('8', 'Lista de Produtos', 'Op��es de configura��o da lista de produtos', '8', '1');
INSERT INTO configuration_group VALUES ('9', 'Estoque', 'Configura��es do estoque', '9', '1');
INSERT INTO configuration_group VALUES ('10', 'Login', 'Configura��es de login', '10', '1');
INSERT INTO configuration_group VALUES ('11', 'Cache', 'Op��es de cache', '11', '1');
INSERT INTO configuration_group VALUES ('12', 'Op��es de E-Mail', 'Op��es para o envio dos emails', '12', '1');
INSERT INTO configuration_group VALUES ('13', 'Download', 'Op��es de Download de produtos', '13', '1');
INSERT INTO configuration_group VALUES ('14', 'Compress�o GZip', 'Op��es do GZip', '14', '1');
INSERT INTO configuration_group VALUES ('15', 'Sess�es', 'Op��es de sess�es', '15', '1');

INSERT INTO countries VALUES (1,'Afghanistan','AF','AFG','1');
INSERT INTO countries VALUES (2,'Albania','AL','ALB','1');
INSERT INTO countries VALUES (3,'Algeria','DZ','DZA','1');
INSERT INTO countries VALUES (4,'American Samoa','AS','ASM','1');
INSERT INTO countries VALUES (5,'Andorra','AD','AND','1');
INSERT INTO countries VALUES (6,'Angola','AO','AGO','1');
INSERT INTO countries VALUES (7,'Anguilla','AI','AIA','1');
INSERT INTO countries VALUES (8,'Antarctica','AQ','ATA','1');
INSERT INTO countries VALUES (9,'Antigua and Barbuda','AG','ATG','1');
INSERT INTO countries VALUES (10,'Argentina','AR','ARG','1');
INSERT INTO countries VALUES (11,'Armenia','AM','ARM','1');
INSERT INTO countries VALUES (12,'Aruba','AW','ABW','1');
INSERT INTO countries VALUES (13,'Australia','AU','AUS','1');
INSERT INTO countries VALUES (14,'Austria','AT','AUT','5');
INSERT INTO countries VALUES (15,'Azerbaijan','AZ','AZE','1');
INSERT INTO countries VALUES (16,'Bahamas','BS','BHS','1');
INSERT INTO countries VALUES (17,'Bahrain','BH','BHR','1');
INSERT INTO countries VALUES (18,'Bangladesh','BD','BGD','1');
INSERT INTO countries VALUES (19,'Barbados','BB','BRB','1');
INSERT INTO countries VALUES (20,'Belarus','BY','BLR','1');
INSERT INTO countries VALUES (21,'Belgium','BE','BEL','1');
INSERT INTO countries VALUES (22,'Belize','BZ','BLZ','1');
INSERT INTO countries VALUES (23,'Benin','BJ','BEN','1');
INSERT INTO countries VALUES (24,'Bermuda','BM','BMU','1');
INSERT INTO countries VALUES (25,'Bhutan','BT','BTN','1');
INSERT INTO countries VALUES (26,'Bolivia','BO','BOL','1');
INSERT INTO countries VALUES (27,'Bosnia and Herzegowina','BA','BIH','1');
INSERT INTO countries VALUES (28,'Botswana','BW','BWA','1');
INSERT INTO countries VALUES (29,'Bouvet Island','BV','BVT','1');
INSERT INTO countries VALUES (30,'Brazil','BR','BRA','1');
INSERT INTO countries VALUES (31,'British Indian Ocean Territory','IO','IOT','1');
INSERT INTO countries VALUES (32,'Brunei Darussalam','BN','BRN','1');
INSERT INTO countries VALUES (33,'Bulgaria','BG','BGR','1');
INSERT INTO countries VALUES (34,'Burkina Faso','BF','BFA','1');
INSERT INTO countries VALUES (35,'Burundi','BI','BDI','1');
INSERT INTO countries VALUES (36,'Cambodia','KH','KHM','1');
INSERT INTO countries VALUES (37,'Cameroon','CM','CMR','1');
INSERT INTO countries VALUES (38,'Canada','CA','CAN','1');
INSERT INTO countries VALUES (39,'Cape Verde','CV','CPV','1');
INSERT INTO countries VALUES (40,'Cayman Islands','KY','CYM','1');
INSERT INTO countries VALUES (41,'Central African Republic','CF','CAF','1');
INSERT INTO countries VALUES (42,'Chad','TD','TCD','1');
INSERT INTO countries VALUES (43,'Chile','CL','CHL','1');
INSERT INTO countries VALUES (44,'China','CN','CHN','1');
INSERT INTO countries VALUES (45,'Christmas Island','CX','CXR','1');
INSERT INTO countries VALUES (46,'Cocos (Keeling) Islands','CC','CCK','1');
INSERT INTO countries VALUES (47,'Colombia','CO','COL','1');
INSERT INTO countries VALUES (48,'Comoros','KM','COM','1');
INSERT INTO countries VALUES (49,'Congo','CG','COG','1');
INSERT INTO countries VALUES (50,'Cook Islands','CK','COK','1');
INSERT INTO countries VALUES (51,'Costa Rica','CR','CRI','1');
INSERT INTO countries VALUES (52,'Cote D\'Ivoire','CI','CIV','1');
INSERT INTO countries VALUES (53,'Croatia','HR','HRV','1');
INSERT INTO countries VALUES (54,'Cuba','CU','CUB','1');
INSERT INTO countries VALUES (55,'Cyprus','CY','CYP','1');
INSERT INTO countries VALUES (56,'Czech Republic','CZ','CZE','1');
INSERT INTO countries VALUES (57,'Denmark','DK','DNK','1');
INSERT INTO countries VALUES (58,'Djibouti','DJ','DJI','1');
INSERT INTO countries VALUES (59,'Dominica','DM','DMA','1');
INSERT INTO countries VALUES (60,'Dominican Republic','DO','DOM','1');
INSERT INTO countries VALUES (61,'East Timor','TP','TMP','1');
INSERT INTO countries VALUES (62,'Ecuador','EC','ECU','1');
INSERT INTO countries VALUES (63,'Egypt','EG','EGY','1');
INSERT INTO countries VALUES (64,'El Salvador','SV','SLV','1');
INSERT INTO countries VALUES (65,'Equatorial Guinea','GQ','GNQ','1');
INSERT INTO countries VALUES (66,'Eritrea','ER','ERI','1');
INSERT INTO countries VALUES (67,'Estonia','EE','EST','1');
INSERT INTO countries VALUES (68,'Ethiopia','ET','ETH','1');
INSERT INTO countries VALUES (69,'Falkland Islands (Malvinas)','FK','FLK','1');
INSERT INTO countries VALUES (70,'Faroe Islands','FO','FRO','1');
INSERT INTO countries VALUES (71,'Fiji','FJ','FJI','1');
INSERT INTO countries VALUES (72,'Finland','FI','FIN','1');
INSERT INTO countries VALUES (73,'France','FR','FRA','1');
INSERT INTO countries VALUES (74,'France, Metropolitan','FX','FXX','1');
INSERT INTO countries VALUES (75,'French Guiana','GF','GUF','1');
INSERT INTO countries VALUES (76,'French Polynesia','PF','PYF','1');
INSERT INTO countries VALUES (77,'French Southern Territories','TF','ATF','1');
INSERT INTO countries VALUES (78,'Gabon','GA','GAB','1');
INSERT INTO countries VALUES (79,'Gambia','GM','GMB','1');
INSERT INTO countries VALUES (80,'Georgia','GE','GEO','1');
INSERT INTO countries VALUES (81,'Germany','DE','DEU','5');
INSERT INTO countries VALUES (82,'Ghana','GH','GHA','1');
INSERT INTO countries VALUES (83,'Gibraltar','GI','GIB','1');
INSERT INTO countries VALUES (84,'Greece','GR','GRC','1');
INSERT INTO countries VALUES (85,'Greenland','GL','GRL','1');
INSERT INTO countries VALUES (86,'Grenada','GD','GRD','1');
INSERT INTO countries VALUES (87,'Guadeloupe','GP','GLP','1');
INSERT INTO countries VALUES (88,'Guam','GU','GUM','1');
INSERT INTO countries VALUES (89,'Guatemala','GT','GTM','1');
INSERT INTO countries VALUES (90,'Guinea','GN','GIN','1');
INSERT INTO countries VALUES (91,'Guinea-bissau','GW','GNB','1');
INSERT INTO countries VALUES (92,'Guyana','GY','GUY','1');
INSERT INTO countries VALUES (93,'Haiti','HT','HTI','1');
INSERT INTO countries VALUES (94,'Heard and Mc Donald Islands','HM','HMD','1');
INSERT INTO countries VALUES (95,'Honduras','HN','HND','1');
INSERT INTO countries VALUES (96,'Hong Kong','HK','HKG','1');
INSERT INTO countries VALUES (97,'Hungary','HU','HUN','1');
INSERT INTO countries VALUES (98,'Iceland','IS','ISL','1');
INSERT INTO countries VALUES (99,'India','IN','IND','1');
INSERT INTO countries VALUES (100,'Indonesia','ID','IDN','1');
INSERT INTO countries VALUES (101,'Iran (Islamic Republic of)','IR','IRN','1');
INSERT INTO countries VALUES (102,'Iraq','IQ','IRQ','1');
INSERT INTO countries VALUES (103,'Ireland','IE','IRL','1');
INSERT INTO countries VALUES (104,'Israel','IL','ISR','1');
INSERT INTO countries VALUES (105,'Italy','IT','ITA','1');
INSERT INTO countries VALUES (106,'Jamaica','JM','JAM','1');
INSERT INTO countries VALUES (107,'Japan','JP','JPN','1');
INSERT INTO countries VALUES (108,'Jordan','JO','JOR','1');
INSERT INTO countries VALUES (109,'Kazakhstan','KZ','KAZ','1');
INSERT INTO countries VALUES (110,'Kenya','KE','KEN','1');
INSERT INTO countries VALUES (111,'Kiribati','KI','KIR','1');
INSERT INTO countries VALUES (112,'Korea, Democratic People\'s Republic of','KP','PRK','1');
INSERT INTO countries VALUES (113,'Korea, Republic of','KR','KOR','1');
INSERT INTO countries VALUES (114,'Kuwait','KW','KWT','1');
INSERT INTO countries VALUES (115,'Kyrgyzstan','KG','KGZ','1');
INSERT INTO countries VALUES (116,'Lao People\'s Democratic Republic','LA','LAO','1');
INSERT INTO countries VALUES (117,'Latvia','LV','LVA','1');
INSERT INTO countries VALUES (118,'Lebanon','LB','LBN','1');
INSERT INTO countries VALUES (119,'Lesotho','LS','LSO','1');
INSERT INTO countries VALUES (120,'Liberia','LR','LBR','1');
INSERT INTO countries VALUES (121,'Libyan Arab Jamahiriya','LY','LBY','1');
INSERT INTO countries VALUES (122,'Liechtenstein','LI','LIE','1');
INSERT INTO countries VALUES (123,'Lithuania','LT','LTU','1');
INSERT INTO countries VALUES (124,'Luxembourg','LU','LUX','1');
INSERT INTO countries VALUES (125,'Macau','MO','MAC','1');
INSERT INTO countries VALUES (126,'Macedonia, The Former Yugoslav Republic of','MK','MKD','1');
INSERT INTO countries VALUES (127,'Madagascar','MG','MDG','1');
INSERT INTO countries VALUES (128,'Malawi','MW','MWI','1');
INSERT INTO countries VALUES (129,'Malaysia','MY','MYS','1');
INSERT INTO countries VALUES (130,'Maldives','MV','MDV','1');
INSERT INTO countries VALUES (131,'Mali','ML','MLI','1');
INSERT INTO countries VALUES (132,'Malta','MT','MLT','1');
INSERT INTO countries VALUES (133,'Marshall Islands','MH','MHL','1');
INSERT INTO countries VALUES (134,'Martinique','MQ','MTQ','1');
INSERT INTO countries VALUES (135,'Mauritania','MR','MRT','1');
INSERT INTO countries VALUES (136,'Mauritius','MU','MUS','1');
INSERT INTO countries VALUES (137,'Mayotte','YT','MYT','1');
INSERT INTO countries VALUES (138,'Mexico','MX','MEX','1');
INSERT INTO countries VALUES (139,'Micronesia, Federated States of','FM','FSM','1');
INSERT INTO countries VALUES (140,'Moldova, Republic of','MD','MDA','1');
INSERT INTO countries VALUES (141,'Monaco','MC','MCO','1');
INSERT INTO countries VALUES (142,'Mongolia','MN','MNG','1');
INSERT INTO countries VALUES (143,'Montserrat','MS','MSR','1');
INSERT INTO countries VALUES (144,'Morocco','MA','MAR','1');
INSERT INTO countries VALUES (145,'Mozambique','MZ','MOZ','1');
INSERT INTO countries VALUES (146,'Myanmar','MM','MMR','1');
INSERT INTO countries VALUES (147,'Namibia','NA','NAM','1');
INSERT INTO countries VALUES (148,'Nauru','NR','NRU','1');
INSERT INTO countries VALUES (149,'Nepal','NP','NPL','1');
INSERT INTO countries VALUES (150,'Netherlands','NL','NLD','1');
INSERT INTO countries VALUES (151,'Netherlands Antilles','AN','ANT','1');
INSERT INTO countries VALUES (152,'New Caledonia','NC','NCL','1');
INSERT INTO countries VALUES (153,'New Zealand','NZ','NZL','1');
INSERT INTO countries VALUES (154,'Nicaragua','NI','NIC','1');
INSERT INTO countries VALUES (155,'Niger','NE','NER','1');
INSERT INTO countries VALUES (156,'Nigeria','NG','NGA','1');
INSERT INTO countries VALUES (157,'Niue','NU','NIU','1');
INSERT INTO countries VALUES (158,'Norfolk Island','NF','NFK','1');
INSERT INTO countries VALUES (159,'Northern Mariana Islands','MP','MNP','1');
INSERT INTO countries VALUES (160,'Norway','NO','NOR','1');
INSERT INTO countries VALUES (161,'Oman','OM','OMN','1');
INSERT INTO countries VALUES (162,'Pakistan','PK','PAK','1');
INSERT INTO countries VALUES (163,'Palau','PW','PLW','1');
INSERT INTO countries VALUES (164,'Panama','PA','PAN','1');
INSERT INTO countries VALUES (165,'Papua New Guinea','PG','PNG','1');
INSERT INTO countries VALUES (166,'Paraguay','PY','PRY','1');
INSERT INTO countries VALUES (167,'Peru','PE','PER','1');
INSERT INTO countries VALUES (168,'Philippines','PH','PHL','1');
INSERT INTO countries VALUES (169,'Pitcairn','PN','PCN','1');
INSERT INTO countries VALUES (170,'Poland','PL','POL','1');
INSERT INTO countries VALUES (171,'Portugal','PT','PRT','1');
INSERT INTO countries VALUES (172,'Puerto Rico','PR','PRI','1');
INSERT INTO countries VALUES (173,'Qatar','QA','QAT','1');
INSERT INTO countries VALUES (174,'Reunion','RE','REU','1');
INSERT INTO countries VALUES (175,'Romania','RO','ROM','1');
INSERT INTO countries VALUES (176,'Russian Federation','RU','RUS','1');
INSERT INTO countries VALUES (177,'Rwanda','RW','RWA','1');
INSERT INTO countries VALUES (178,'Saint Kitts and Nevis','KN','KNA','1');
INSERT INTO countries VALUES (179,'Saint Lucia','LC','LCA','1');
INSERT INTO countries VALUES (180,'Saint Vincent and the Grenadines','VC','VCT','1');
INSERT INTO countries VALUES (181,'Samoa','WS','WSM','1');
INSERT INTO countries VALUES (182,'San Marino','SM','SMR','1');
INSERT INTO countries VALUES (183,'Sao Tome and Principe','ST','STP','1');
INSERT INTO countries VALUES (184,'Saudi Arabia','SA','SAU','1');
INSERT INTO countries VALUES (185,'Senegal','SN','SEN','1');
INSERT INTO countries VALUES (186,'Seychelles','SC','SYC','1');
INSERT INTO countries VALUES (187,'Sierra Leone','SL','SLE','1');
INSERT INTO countries VALUES (188,'Singapore','SG','SGP', '4');
INSERT INTO countries VALUES (189,'Slovakia (Slovak Republic)','SK','SVK','1');
INSERT INTO countries VALUES (190,'Slovenia','SI','SVN','1');
INSERT INTO countries VALUES (191,'Solomon Islands','SB','SLB','1');
INSERT INTO countries VALUES (192,'Somalia','SO','SOM','1');
INSERT INTO countries VALUES (193,'South Africa','ZA','ZAF','1');
INSERT INTO countries VALUES (194,'South Georgia and the South Sandwich Islands','GS','SGS','1');
INSERT INTO countries VALUES (195,'Spain','ES','ESP','3');
INSERT INTO countries VALUES (196,'Sri Lanka','LK','LKA','1');
INSERT INTO countries VALUES (197,'St. Helena','SH','SHN','1');
INSERT INTO countries VALUES (198,'St. Pierre and Miquelon','PM','SPM','1');
INSERT INTO countries VALUES (199,'Sudan','SD','SDN','1');
INSERT INTO countries VALUES (200,'Suriname','SR','SUR','1');
INSERT INTO countries VALUES (201,'Svalbard and Jan Mayen Islands','SJ','SJM','1');
INSERT INTO countries VALUES (202,'Swaziland','SZ','SWZ','1');
INSERT INTO countries VALUES (203,'Sweden','SE','SWE','1');
INSERT INTO countries VALUES (204,'Switzerland','CH','CHE','1');
INSERT INTO countries VALUES (205,'Syrian Arab Republic','SY','SYR','1');
INSERT INTO countries VALUES (206,'Taiwan','TW','TWN','1');
INSERT INTO countries VALUES (207,'Tajikistan','TJ','TJK','1');
INSERT INTO countries VALUES (208,'Tanzania, United Republic of','TZ','TZA','1');
INSERT INTO countries VALUES (209,'Thailand','TH','THA','1');
INSERT INTO countries VALUES (210,'Togo','TG','TGO','1');
INSERT INTO countries VALUES (211,'Tokelau','TK','TKL','1');
INSERT INTO countries VALUES (212,'Tonga','TO','TON','1');
INSERT INTO countries VALUES (213,'Trinidad and Tobago','TT','TTO','1');
INSERT INTO countries VALUES (214,'Tunisia','TN','TUN','1');
INSERT INTO countries VALUES (215,'Turkey','TR','TUR','1');
INSERT INTO countries VALUES (216,'Turkmenistan','TM','TKM','1');
INSERT INTO countries VALUES (217,'Turks and Caicos Islands','TC','TCA','1');
INSERT INTO countries VALUES (218,'Tuvalu','TV','TUV','1');
INSERT INTO countries VALUES (219,'Uganda','UG','UGA','1');
INSERT INTO countries VALUES (220,'Ukraine','UA','UKR','1');
INSERT INTO countries VALUES (221,'United Arab Emirates','AE','ARE','1');
INSERT INTO countries VALUES (222,'United Kingdom','GB','GBR','1');
INSERT INTO countries VALUES (223,'United States','US','USA', '2');
INSERT INTO countries VALUES (224,'United States Minor Outlying Islands','UM','UMI','1');
INSERT INTO countries VALUES (225,'Uruguay','UY','URY','1');
INSERT INTO countries VALUES (226,'Uzbekistan','UZ','UZB','1');
INSERT INTO countries VALUES (227,'Vanuatu','VU','VUT','1');
INSERT INTO countries VALUES (228,'Vatican City State (Holy See)','VA','VAT','1');
INSERT INTO countries VALUES (229,'Venezuela','VE','VEN','1');
INSERT INTO countries VALUES (230,'Viet Nam','VN','VNM','1');
INSERT INTO countries VALUES (231,'Virgin Islands (British)','VG','VGB','1');
INSERT INTO countries VALUES (232,'Virgin Islands (U.S.)','VI','VIR','1');
INSERT INTO countries VALUES (233,'Wallis and Futuna Islands','WF','WLF','1');
INSERT INTO countries VALUES (234,'Western Sahara','EH','ESH','1');
INSERT INTO countries VALUES (235,'Yemen','YE','YEM','1');
INSERT INTO countries VALUES (236,'Yugoslavia','YU','YUG','1');
INSERT INTO countries VALUES (237,'Zaire','ZR','ZAR','1');
INSERT INTO countries VALUES (238,'Zambia','ZM','ZMB','1');
INSERT INTO countries VALUES (239,'Zimbabwe','ZW','ZWE','1');

INSERT INTO currencies VALUES (1,'Real','BRL','R$','','.',',','2','1.0000', now());
INSERT INTO currencies VALUES (2,'US Dollar','USD','$','','.',',','2','0.6000', now());
INSERT INTO currencies VALUES (3,'Euro','EUR','','EUR','.',',','2','0.4000', now());

INSERT INTO customers VALUES ( '1', 'm', 'osCommerce', 'Brasil', '2001-01-01 00:00:00', 'root@localhost', '1', '12345', '', 'd95e8fa7f20a009372eb3477473fcd34:1c', '0');

INSERT INTO customers_info VALUES('1', null, '0', now(), null, '0');

INSERT INTO languages VALUES (1,'Portugu�s','pt-BR','icon.gif','portugues',1);
INSERT INTO languages VALUES (2,'English','en','icon.gif','english',2);
INSERT INTO languages VALUES (3,'Deutsch','de','icon.gif','german',3);
INSERT INTO languages VALUES (4,'Espa�ol','es','icon.gif','espanol',4);

INSERT INTO manufacturers VALUES (1,'Matrox','manufacturer_matrox.gif', now(), null);
INSERT INTO manufacturers VALUES (2,'Microsoft','manufacturer_microsoft.gif', now(), null);
INSERT INTO manufacturers VALUES (3,'Warner','manufacturer_warner.gif', now(), null);
INSERT INTO manufacturers VALUES (4,'Fox','manufacturer_fox.gif', now(), null);
INSERT INTO manufacturers VALUES (5,'Logitech','manufacturer_logitech.gif', now(), null);
INSERT INTO manufacturers VALUES (6,'Canon','manufacturer_canon.gif', now(), null);
INSERT INTO manufacturers VALUES (7,'Sierra','manufacturer_sierra.gif', now(), null);
INSERT INTO manufacturers VALUES (8,'GT Interactive','manufacturer_gt_interactive.gif', now(), null);
INSERT INTO manufacturers VALUES (9,'Hewlett Packard','manufacturer_hewlett_packard.gif', now(), null);

INSERT INTO manufacturers_info VALUES (1, 1, 'http://www.matrox.com', 0, null);
INSERT INTO manufacturers_info VALUES (1, 2, 'http://www.matrox.de', 0, null);
INSERT INTO manufacturers_info VALUES (1, 3, 'http://www.matrox.com', 0, null);
INSERT INTO manufacturers_info VALUES (2, 1, 'http://www.microsoft.com', 0, null);
INSERT INTO manufacturers_info VALUES (2, 2, 'http://www.microsoft.de', 0, null);
INSERT INTO manufacturers_info VALUES (2, 3, 'http://www.microsoft.es', 0, null);
INSERT INTO manufacturers_info VALUES (3, 1, 'http://www.warner.com', 0, null);
INSERT INTO manufacturers_info VALUES (3, 2, 'http://www.warner.de', 0, null);
INSERT INTO manufacturers_info VALUES (3, 3, 'http://www.warner.com', 0, null);
INSERT INTO manufacturers_info VALUES (4, 1, 'http://www.fox.com', 0, null);
INSERT INTO manufacturers_info VALUES (4, 2, 'http://www.fox.de', 0, null);
INSERT INTO manufacturers_info VALUES (4, 3, 'http://www.fox.com', 0, null);
INSERT INTO manufacturers_info VALUES (5, 1, 'http://www.logitech.com', 0, null);
INSERT INTO manufacturers_info VALUES (5, 2, 'http://www.logitech.com', 0, null);
INSERT INTO manufacturers_info VALUES (5, 3, 'http://www.logitech.com', 0, null);
INSERT INTO manufacturers_info VALUES (6, 1, 'http://www.canon.com', 0, null);
INSERT INTO manufacturers_info VALUES (6, 2, 'http://www.canon.de', 0, null);
INSERT INTO manufacturers_info VALUES (6, 3, 'http://www.canon.es', 0, null);
INSERT INTO manufacturers_info VALUES (7, 1, 'http://www.sierra.com', 0, null);
INSERT INTO manufacturers_info VALUES (7, 2, 'http://www.sierra.de', 0, null);
INSERT INTO manufacturers_info VALUES (7, 3, 'http://www.sierra.com', 0, null);
INSERT INTO manufacturers_info VALUES (8, 1, 'http://www.infogrames.com', 0, null);
INSERT INTO manufacturers_info VALUES (8, 2, 'http://www.infogrames.de', 0, null);
INSERT INTO manufacturers_info VALUES (8, 3, 'http://www.infogrames.com', 0, null);
INSERT INTO manufacturers_info VALUES (9, 1, 'http://www.hewlettpackard.com', 0, null);
INSERT INTO manufacturers_info VALUES (9, 2, 'http://www.hewlettpackard.de', 0, null);
INSERT INTO manufacturers_info VALUES (9, 3, 'http://welcome.hp.com/country/es/spa/welcome.htm', 0, null);

INSERT INTO orders_status VALUES ( '1', '1', 'Pendente', '1', '0');
INSERT INTO orders_status VALUES ( '1', '2', 'Pending', '1', '0');
INSERT INTO orders_status VALUES ( '1', '3', 'Offen', '1', '0');
INSERT INTO orders_status VALUES ( '1', '4', 'Pendiente', '1', '0');
INSERT INTO orders_status VALUES ( '2', '1', 'Processando', '1', '1');
INSERT INTO orders_status VALUES ( '2', '2', 'Processing', '1', '1');
INSERT INTO orders_status VALUES ( '2', '3', 'In Bearbeitung', '1', '1');
INSERT INTO orders_status VALUES ( '2', '4', 'Proceso', '1', '1');
INSERT INTO orders_status VALUES ( '3', '1', 'Enviado', '1', '1');
INSERT INTO orders_status VALUES ( '3', '2', 'Delivered', '1', '1');
INSERT INTO orders_status VALUES ( '3', '3', 'Versendet', '1', '1');
INSERT INTO orders_status VALUES ( '3', '4', 'Entregado', '1', '1');

INSERT INTO products VALUES (1,32,'MG200MMS','matrox/mg200mms.gif',299.99, now(),null,null,23.00,1,1,1,0);
INSERT INTO products VALUES (2,32,'MG400-32MB','matrox/mg400-32mb.gif',499.99, now(),null,null,23.00,1,1,1,0);
INSERT INTO products VALUES (3,2,'MSIMPRO','microsoft/msimpro.gif',49.99, now(),null,null,7.00,1,1,3,0);
INSERT INTO products VALUES (4,13,'DVD-RPMK','dvd/replacement_killers.gif',42.00, now(),null,null,23.00,1,1,2,0);
INSERT INTO products VALUES (5,17,'DVD-BLDRNDC','dvd/blade_runner.gif',35.99, now(),null,null,7.00,1,1,3,0);
INSERT INTO products VALUES (6,10,'DVD-MATR','dvd/the_matrix.gif',39.99, now(),null,null,7.00,1,1,3,0);
INSERT INTO products VALUES (7,10,'DVD-YGEM','dvd/youve_got_mail.gif',34.99, now(),null,null,7.00,1,1,3,0);
INSERT INTO products VALUES (8,10,'DVD-ABUG','dvd/a_bugs_life.gif',35.99, now(),null,null,7.00,1,1,3,0);
INSERT INTO products VALUES (9,10,'DVD-UNSG','dvd/under_siege.gif',29.99, now(),null,null,7.00,1,1,3,0);
INSERT INTO products VALUES (10,10,'DVD-UNSG2','dvd/under_siege2.gif',29.99, now(),null,null,7.00,1,1,3,0);
INSERT INTO products VALUES (11,10,'DVD-FDBL','dvd/fire_down_below.gif',29.99, now(),null,null,7.00,1,1,3,0);
INSERT INTO products VALUES (12,10,'DVD-DHWV','dvd/die_hard_3.gif',39.99, now(),null,null,7.00,1,1,4,0);
INSERT INTO products VALUES (13,10,'DVD-LTWP','dvd/lethal_weapon.gif',34.99, now(),null,null,7.00,1,1,3,0);
INSERT INTO products VALUES (14,10,'DVD-REDC','dvd/red_corner.gif',32.00, now(),null,null,7.00,1,1,3,0);
INSERT INTO products VALUES (15,10,'DVD-FRAN','dvd/frantic.gif',35.00, now(),null,null,7.00,1,1,3,0);
INSERT INTO products VALUES (16,10,'DVD-CUFI','dvd/courage_under_fire.gif',38.99, now(),null,null,7.00,1,1,4,0);
INSERT INTO products VALUES (17,10,'DVD-SPEED','dvd/speed.gif',39.99, now(),null,null,7.00,1,1,4,0);
INSERT INTO products VALUES (18,10,'DVD-SPEED2','dvd/speed_2.gif',42.00, now(),null,null,7.00,1,1,4,0);
INSERT INTO products VALUES (19,10,'DVD-TSAB','dvd/theres_something_about_mary.gif',49.99, now(),null,null,7.00,1,1,4,0);
INSERT INTO products VALUES (20,10,'DVD-BELOVED','dvd/beloved.gif',54.99, now(),null,null,7.00,1,1,3,0);
INSERT INTO products VALUES (21,16,'PC-SWAT3','sierra/swat_3.gif',79.99, now(),null,null,7.00,1,1,7,0);
INSERT INTO products VALUES (22,13,'PC-UNTM','gt_interactive/unreal_tournament.gif',89.99, now(),null,null,7.00,1,1,8,0);
INSERT INTO products VALUES (23,16,'PC-TWOF','gt_interactive/wheel_of_time.gif',99.99, now(),null,null,10.00,1,1,8,0);
INSERT INTO products VALUES (24,17,'PC-DISC','gt_interactive/disciples.gif',90.00, now(),null,null,8.00,1,1,8,0);
INSERT INTO products VALUES (25,16,'MSINTKB','microsoft/intkeyboardps2.gif',69.99, now(),null,null,8.00,1,1,2,0);
INSERT INTO products VALUES (26,10,'MSIMEXP','microsoft/imexplorer.gif',64.95, now(),null,null,8.00,1,1,2,0);
INSERT INTO products VALUES (27,8,'HPLJ1100XI','hewlett_packard/lj1100xi.gif',499.99, now(),null,null,45.00,1,1,9,0);

INSERT INTO products_description VALUES (1,1,'Matrox G200 MMS', 'Agora voc� j� pode adquirir a poderosa placa Matrox, uma das placas mais \r\npoderosas do momento, ela possui o sistema VE (Suporta dois monitores \r\nsimultaneamente), e com ela os seus jogos 3D ganharam mais vida e voc� tera um \r\notimo desempenho em todos os tipos de trababalho com o sistema Dual Display. <br>\r\n<br>\r\nEspecifica��es :<br>\r\nModelo: Matrox G200 Quad Multi - Monitor Series ( MMS ) Graphics Controller ( 32 \r\nMB ) <br>\r\nMaior Performance 2D/3D<br>\r\nAlta Qualidade em DVD Playback<br>\r\nArquitetura Gr�fica: 256-bit <br>\r\nMem�ria: 32MB DDR <br>\r\nChip Set: Millennium G200 <br>\r\nPlug and Play <br>\r\n<br>\r\nCaracter�sticas Especiais:<br>\r\n-Saida para TV (TV-Out)<br>\r\n-Excelente performance em jogos 3D e 2D<br>\r\n-Sistema VE Dual Edition:<br>\r\nSuporta dois monitores simultaneamente.', 'www.matrox.com/mga/products/g200_mms/home.cfm', 0);
INSERT INTO products_description VALUES (2,1,'Matrox G400 32MB', 'Alta performance Gr�fica</b> <br>\r\n<br>\r\nMillennium G400 Series - � extremamente diferente com alta performance gr�fica, \r\no chip da Millennium G400 Series tem grande velocidade e alta qualidade das \r\nimagens, junto com uma inigual�vel versatilidade exibindo todas as imagens 3D, \r\n2D e ainda aplicativos DVD. � a mais poderosa e inovadora ferramenta para PC''s.<br>\r\nA Millennium G400 Series n�o muda somente o modo como voc� v� os seus gr�ficos \r\nmas, revolucionar� o modo como voc� v� o seu computador. <br>\r\n<br>\r\n<b>Especifica��es:</b> </p>\r\n<ul>\r\n  <li>Nova Matrox G400 256-bit DualBus graphics chip </li>\r\n  <li>Alta performance em 3D, 2D e DVD </li>\r\n  <li>Sistema VE Dual Edition: Suporta dois monitores simultaneamente. </li>\r\n  <li>Sa�da para DVD e TV </li>\r\n  <li>Qualidade de Cor Vibrante com modelo tridimensional </li>\r\n  <li>UltraSharp DAC of up to 360 MHz </li>\r\n  <li>Processador 3D Rendering Array </li>\r\n  <li>Suporte para 16 ou 32 MB de mem�ria</li>\r\n</ul>', 'www.matrox.com/mga/products/mill_g400/home.htm', 0);
INSERT INTO products_description VALUES (3,1,'Microsoft IntelliMouse Pro', 'O Microsoft IntelliMouse � o mais novo membro da fam�lia de produtos de \r\nmouse. A nova esfera posicionada no centro entre os dois bot�es fornece nova \r\nfuncionalidade no Windows 95, 98,ME,XP, Internet Explorer 6.0 e no conjunto de \r\nprodutos do Office 2003. <br>\r\n<br>\r\nBenef�cios<br>\r\nTodos os aplicativos do Office 2003 ser�o compat�veis com o novo mouse, \r\npermitindo ao usu�rio a transfer�ncia com zoom, rolagem e zoom de dados para o \r\nmouse. <br>\r\nA rolagem no Windows Explorer pode ser feita com o mouse - barras de rolagem \r\nnunca mais! <br>\r\nAcesse rapidamente os v�nculos ativos na Web (zoom de dados) e retorne � home \r\npage usando o mouse. Agora, navegar nas p�ginas Web � t�o f�cil quanto usar o \r\nWord e o IntelliMouse, rolando com a esfera.</p>', 'www.microsoft.com/hardware/mouse/intellimouse.asp', 0);
INSERT INTO products_description VALUES (4,1,'Assassinos Substitutos', 'T�tulo Original: &quot;The Replacement Killers&quot; <br>\r\n<br>\r\nC�digo Regional: 2 (Jap�o, Europa, Oriente M�dio, �frica do Sul). <br>\r\nIdioma: Ingl�s, Alem�o. <br>\r\nLegendas: Ingl�s, Alem�o, Espanhol. <br>\r\nAudio: Dolby Surround 5.1. <br>\r\nFormato da Tela: 16:9 Wide-Screen. <br>\r\nDura��o: (aprox) 80 minutes. <br>\r\nOutros: Menu interativo, Sele��o de cap�tulos, Legendas (mais idiomas). <br>\r\n<br>\r\nSinopse:O astro dos filmes de John Woo, Chow Yun-Fat faz sua estr�ia em \r\nHollywood tendo ao seu lado Mira Sorvino (vencedora do Oscar de 1995 como Melhor \r\nAtriz Coadjuvante, em Poderosa Afrodite) em ASSASSINOS SUBSTITUTOS, um fren�tico \r\ne explosivo suspense de a��o do diretor Antoine Fuqua (do video-clip de Coolio &quot;Gangsta''s \r\nParadise&quot;). <br>\r\nAp�s trair Mr. Wei, o impiedoso chef�o do crime que o havia contratado para \r\nvingar a morte do filho, o assassino profissional John Lee (Chow) agora est� \r\nfugindo. Contando com a ajuda da bela falsificadora de documentos Meg Coburn (Sorvino), \r\nLee pretende retornar para sua fam�lia na China, antes que esta seja vitimada \r\npor causa de sua trai��o. Mas a armada de Wei de &quot;assassinos substitutos&quot; est� \r\nna sua trilha, e agora ele e Meg s�o os alvos de um impressionante poder de \r\nfogo. <br>\r\nCom os dois lados totalmente armados e determinados a lutar at� a morte, um \r\ntiroteio ultra-violento explode quando finalmente os dois grupos se encontram. � \r\n&quot;uma fus�o nunca antes vista do estilo com a a��o e a aventura dos filmes de \r\nHong Kong&quot; (The New York Times) que vai deixar todos sem f�lego - incluindo \r\nvoc�!</p>', 'www.replacement-killers.com', 0);
INSERT INTO products_description VALUES (5,1,'Busca Fren�tica', 'T�tulo Original: &quot;Frantic&quot; <br>\r\n<br>\r\nC�digo Regional: 2 (Jap�o, Europa, Oriente M�dio, �frica do Sul). <br>\r\nIdioma: Ingl�s, Alem�o. <br>\r\nLegendas: Ingl�s, Alem�o, Espanhol. <br>\r\nAudio: Dolby Surround 5.1. <br>\r\nFormato da Tela: 16:9 Wide-Screen. <br>\r\nDura��o: (aprox) 115 minutes. <br>\r\nOutros: Menu interativo, Sele��o de cap�tulos, Legendas (mais idiomas). <br>\r\n<br>\r\nSinopse: Harrison Ford � o Dr. Richard Walker, famoso m�dico que junto com sua \r\nesposa Sondra (Betty Buckley), visitam Paris pela segunda vez. <br>\r\nPela primeira vez, viveram uma lua-de-mel inesquec�vel. Agora eles v�o viver \r\nmomentos de suspense e terror. Tudo come�a quando Sondra desaparece \r\nmisteriosamente do hotel e Walker se v� sozinho em uma terra estranha, sem \r\npistas e sem ningu�m. At� que surge a linda Michelle (Eammanuelle Seigner) que \r\nresolve ajud�-lo e o leva � aterradora realidade do submundo de uma busca \r\nincans�vel por sua esposa. <br>\r\nDirigido pelo aclamado Roman Polanski, BUSCA FREN�TICA � um thriller de a��o e \r\nsuspense de tirar o f�lego. Prepare-se para muita adrenalina.</p>', 'www.bladerunner.com', 0);
INSERT INTO products_description VALUES (6,1,'Matrix', 'T�tulo Original: "The Matrix" <br>\r\n<br>\r\nC�digo Regional: 2 (Jap�o, Europa, Oriente M�dio, �frica do Sul). <br>\r\nIdioma: Ingl�s, Alem�o. <br>\r\nLegendas: Ingl�s, Alem�o, Espanhol. <br>\r\nAudio: Dolby Surround 5.1. <br>\r\nFormato da Tela: 16:9 Wide-Screen. <br>\r\nDura��o: (aprox) 131 minutes. <br>\r\nOutros: Menu interativo, Sele��o de cap�tulos, Making Of. <br><br>\r\nSinopse: <br><br>\r\nO que vemos: Nosso dia a dia � verdadeiro. <br>\r\nO que � real: O mundo � uma farsa, constru�do por uma das mais poderosas \r\nm�quinas com intelig�ncia artificial para nos controlar. <br>\r\nProezas de tirar o f�lego. Efeitos alucinantes. Cenas de arrebentar. Keanu \r\nReeves e Laurence Fishburne lutam pela liberta��o da humanidade em Matrix, um \r\nsuspense cibern�tico para ver e rever muitas vezes, escrito e dirigido pelos \r\nIrm�os Wachowski (Ligadas pelo Desejo). Uma surpreendente hist�ria, com efeitos \r\nvisuais alucinantes, marcando uma nova era no cinema. Um filme arrasador.</p>', 'www.thematrix.com', 0);
INSERT INTO products_description VALUES (7,1,'Mensagem para voc�', 'T�tulo Original: &quot;You''ve Got Mail&quot; <br>\r\n<br>\r\nC�digo Regional: 2 (Jap�o, Europa, Oriente M�dio, �frica do Sul). <br>\r\nIdioma: Ingl�s, Alem�o, Espanhol. <br>\r\nLegendas: Ingl�s, Alem�o, Espanhol, Franc�s, N�rdico, Polon�s. <br>\r\nAudio: Dolby Surround 5.1. <br>\r\nFormato da Tela: 16:9 Wide-Screen. <br>\r\nDura��o: (aprox) 115 minutes. <br>\r\nOutros: Menu interativo, Sele��o de cap�tulos, Legendas (mais idiomas). <br>\r\n<br>\r\nSinopse: MENSAGEM PARA VOC� confirma todo romance, charme e emo��o que as \r\npessoas poderiam esperar do reencontro das estrelas Tom Hanks e Meg Ryan e da \r\ndiretora Nora Ephron de Sintonia de Amor. Greg Kinnear, Parker Posey, Jean \r\nStapleton e outros coadjuvantes s�o os ingredientes perfeitos adicionados a este \r\nromance moderno em que o propriet�rio magnata de uma super-loja de livros e a \r\ndona de uma aconchegante livraria infantil s�o correspondentes an�nimos por \r\ne-mail que se apaixonam perdidamente sem saber que s�o, na verdade, rivais nos \r\nneg�cios</p>', 'www.youvegotmail.com', 0);
INSERT INTO products_description VALUES (8,1,'Vida de Inseto', 'T�tulo Original: &quot;A Bug''s Life&quot; <br>\r\n<br>\r\nC�digo Regional: 2 (Jap�o, Europa, Oriente M�dio, �frica do Sul). <br>\r\nIdioma: Ingl�s, Alem�o. <br>\r\nLegendas: Ingl�s, Alem�o, Espanhol. <br>\r\nAudio: Dolby Surround 5.1. <br>\r\nFormato da Tela: 16:9 Wide-Screen. <br>\r\nDura��o: (aprox) 91 minutes. <br>\r\nOutros: Menu interativo, Sele��o de cap�tulos, Legendas (mais idiomas). <br>\r\n<br>\r\nSinopse: Entre numa viagem folha a folha dentro do min�sculo mundo dos insetos, \r\njunto com os mais diferentes, coloridos e divertidos personagens, na anima��o \r\ncomputadorizada Disney/Pixar VIDA DE INSETO. <br>\r\nFlik � uma formiga cheia de id�ias que, em nome dos &quot;insetos oprimidos de todo o \r\nmundo&quot;, precisa contratar guerreiros para defender sua col�nia de um faminto \r\nbando de gafanhotos liderado por Hopper. Mas quando descobrem que o ex�rcito de \r\ninsetos � na verdade um fracassado grupo de atores de um circo de pulgas, o \r\ncen�rio est� armado para divertidas confus�es... com estes improv�veis her�is.\r\n<br>\r\nEstrelando um elenco de dubladores sensacionais, VIDA DE INSETO apresenta uma \r\nnova e surpreendente vis�o de trabalho de equipe e determina��o, que revela \r\nnovos detalhes cada vez que voc� assiste.</p>', 'www.abugslife.com', 0);
INSERT INTO products_description VALUES (9,1,'For�a em Alerta', 'T�tulo Original: &quot;Under Siege&quot; <br>\r\n<br>\r\nC�digo Regional: 2 (Jap�o, Europa, Oriente M�dio, �frica do Sul). <br>\r\nIdioma: Ingl�s, Alem�o. <br>\r\nLegendas: Ingl�s, Alem�o, Espanhol. <br>\r\nAudio: Dolby Surround 5.1. <br>\r\nFormato da Tela: 16:9 Wide-Screen. <br>\r\nDura��o: (aprox) 98 minutes. <br>\r\nOutros: Menu interativo, Sele��o de cap�tulos, Legendas (mais idiomas). <br>\r\n<br>\r\nSinopse: O encoura�ado USS Missouri prepara-se para a �ltima viagem. A Marinha \r\norganiza uma grande festa. Por�m, s�o surpreendidos com a presen�a de \r\nterroristas que pretendem roubar o arsenal de armas nucleares do navio e \r\nprovocar a 3a. Guerra Mundial. Com incr�vel per�cia em artes marciais, est� a \r\nbordo o cozinheiro Casey Ryback (Steven Seagal, de Nico - Acima da Lei), que \r\nprepara para os terroristas uma receita explosiva. Ele conta com a ajuda da bela \r\ngarota da Playboy Erika Eleniak contra esses bandidos da pesada, que est�o sendo \r\nliderados por um ex-agente da CIA (Tommy Lee Jones, de O Cliente) e um oficial \r\nque trai a Marinha (Gary Busey, de M�quina Mort�fera).</p>', '', 0);
INSERT INTO products_description VALUES (10,1,'For�a em Alerta 2', 'T�tulo Original: &quot;Under Siege 2 - Dark Territory&quot; <br>\r\n<br>\r\nC�digo Regional: 2 (Jap�o, Europa, Oriente M�dio, �frica do Sul). <br>\r\nIdioma: Ingl�s, Alem�o. <br>\r\nLegendas: Ingl�s, Alem�o, Espanhol. <br>\r\nAudio: Dolby Surround 5.1. <br>\r\nFormato da Tela: 16:9 Wide-Screen. <br>\r\nDura��o: (aprox) 98 minutes. <br>\r\nOutros: Menu interativo, Sele��o de cap�tulos, Legendas (mais idiomas). <br>\r\n<br>\r\nSinopse: O man�aco Travis Dane (Eric Bogosian) sequestrou um luxuoso trem de \r\npassageiros e o transformou em um centro de comando de alta tecnologia, capaz de \r\ncontrolar um poderoso sat�lite americano. Seu plano: destruir a Costa Leste dos \r\nEstados Unidos. Seu alvo: um reator nuclear, localizado nos subterr�neos do \r\nPent�gono. Seu pre�o: um bilh�o de d�lares. Seu problema: Casey Ryback (Steven \r\nSeagal, de A For�a em Alerta) um dos passageiros a bordo do trem. \r\nEx-especialista da marinha, Casey � uma arma letal de combate. <br>\r\nCom o trem se dirigindo a um territ�rio selvagem, onde todos os tipos de \r\ncomunica��o externa s�o naturalmente interrompidos, a vida de tr�s milh�es de \r\npessoas depende das habilidade mortais de Ryback, que enfrentar� sozinho Travis \r\ne seus perigosos terroristas</p>', '', 0);
INSERT INTO products_description VALUES (11,1,'Amea�a Subterr�nea', 'T�tulo Original: &quot;Fire Down Below&quot; <br>\r\n<br>\r\nC�digo Regional: 2 (Jap�o, Europa, Oriente M�dio, �frica do Sul). <br>\r\nIdioma: Ingl�s, Alem�o. <br>\r\nLegendas: Ingl�s, Alem�o, Espanhol. <br>\r\nAudio: Dolby Surround 5.1. <br>\r\nFormato da Tela: 16:9 Wide-Screen. <br>\r\nDura��o: (aprox) 104 minutes. <br>\r\nOutros: Menu interativo, Sele��o de cap�tulos, Legendas (mais idiomas). <br>\r\nSinopse: O Agente Federal de prote��o ambiental Jack Taggart (Steven Seagal, de \r\nA For�a em Alerta) est� investigando a morte de um colega. Seguindo as pistas \r\ndeixadas pelo agente assassinado, Jack parte em viagem pelas pequenas \r\ncomunidades ruais do Kentucky. Em pouco tempo, ele descobre que toneladas de \r\nresiduos t�xicos est�o sendo despejadas nas antigas minas de carv�o da regi�o. \r\nMuitos habitantes locais est�o ficando doentes, mas os criminosos est�o \r\nprotegidos pelo sil�ncio de uma cidade dominada pelo medo. Taggart descobre \r\ninforma��es importantes conta o poderoso minerador Orin Hanner (Kris \r\nKristofferson, de Rodeio da Vida) e decide enfrent�-lo antes que uma cat�strofe \r\necol�gica destrua completamente a regi�o.', '', 0);
INSERT INTO products_description VALUES (12,1,'Duro de Matar', 'C�digo Regional: 2 (Jap�o, Europa, Oriente M�dio, �frica do Sul). <br>\r\nIdioma: Ingl�s, Alem�o. <br>\r\nLegendas: Ingl�s, Alem�o, Espanhol. <br>\r\nAudio: Dolby Surround 5.1. <br>\r\nFormato da Tela: 16:9 Wide-Screen. <br>\r\nDura��o: (aprox) 122 minutes. <br>\r\nOutros: Menu Interativo, Sele��o de Cap�tulos, Legendas (Mais idiomas). <br>\r\n<br>\r\nEm Nova York, o terrorista Simon (Jeremy Irons) explode uma bomba dentro de um \r\nshopping lotado. John Mc Lane (Bruce Willis) corre contra o tempo, desvendando \r\ncharadas propostas pelo vil�o. <br>\r\nGRAHAM GREENE BRUCE WILLIS SAMUEL L. JACKSON COLLEEN CAMP LARRY BRYGGMAN SAM \r\nPHILLIPS JEREMY IRONS', '', 0);
INSERT INTO products_description VALUES (13,1,'M�quina Mort�fera', 'T�tulo Original: &quot;Lethal Weapon&quot; <br>\r\n<br>\r\nC�digo Regional: 2 (Jap�o, Europa, Oriente M�dio, �frica do Sul). <br>\r\nIdioma: Ingl�s, Alem�o. <br>\r\nLegendas: Ingl�s, Alem�o, Espanhol. <br>\r\nAudio: Dolby Surround 5.1. <br>\r\nFormato da Tela: 16:9 Wide-Screen. <br>\r\nDura��o: (aprox) 100 minutes. <br>\r\nOutros: Menu interativo, Sele��o de cap�tulos, Legendas (mais idiomas). <br>\r\n<br>\r\nSinopse:Martin Riggs (Mel Gibson, da famosa s�rie Mad Max) n�o � um policial \r\ncomum. � um Mad Max que se tornou man�aco, um homem cuja destreza para matar e \r\ntend�ncias suicidas o tranformam numa M�quina Mort�fera para qualquer um que \r\nesteja tanto contra como a seu favor. Roger Murtaugh (Danny Glover, de A Cor \r\nP�rpura) � um tranq�ilo detetive de homic�dios, que ama sua fam�lia, tem uma \r\nbela casa, e espera uma boa aposentadoria que n�o quer perder. Imagine o susto \r\nde Murtaugh quando descobre que seu novo parceiro ser� algu�m que n�o tenha nada \r\na perder: o desvairado e desprezado Martin Riggs.', '', 0);
INSERT INTO products_description VALUES (14,1,'Justi�a Vermelha', 'T�tulo Original: &quot;Red Corner&quot; <br>\r\n<br>\r\nC�digo Regional: 2 (Jap�o, Europa, Oriente M�dio, �frica do Sul). <br>\r\nIdioma: Ingl�s, Alem�o. <br>\r\nLegendas: Ingl�s, Alem�o, Espanhol. <br>\r\nAudio: Dolby Surround 5.1. <br>\r\nFormato da Tela: 16:9 Wide-Screen. <br>\r\nDura��o: (aprox) 117 minutes. <br>\r\nOutros: Menu interativo, Sele��o de cap�tulos, Legendas (mais idiomas). <br>\r\n<br>\r\nSinopse: <br>\r\nNa hist�ria, Richard Gere interpreta Jack Moore, um brilhante advogado de um \r\ngrande conglomerado de entretenimento e o melhor negociador que o Ocidente tem \r\npara oferecer. Ele est� na China para fechar o primeiro contrato de comunica��o \r\nde sat�lites sancionado pelo governo chin�s mas, ap�s uma noite com uma mulher \r\nex�tica, se v� envolvido numa trama que p�e sua vida em jogo. Preso por um \r\nassassinato que n�o cometeu e abandonado por seus colegas de trabalho \r\namericanos, Jack precisa encontrar uma sa�da desse labirinto conhecido como \r\nsistema judicial chin�s. Diferente da Am�rica, um culpado por ofensa capital na \r\nChina � morto no per�odo de uma semana ap�s a sua senten�a e o custo da muni��o \r\n� cobrado � sua fam�lia; um julgamento nesse pa�s dura, em m�dia, menos de \r\nquatro horas, e o grau de convic��o beira os 99%. <br>\r\nA �nica chance de Jack � sua advogada de defesa, Shen Yuelin (Bai Ling), \r\napontada pela corte. Imediatamente, ela entra com uma declara��o de culpa \r\ninsistindo ser a �nica forma de salvar a vida de seu cliente - &quot;clem�ncia \r\n�queles que confessam; severidade �queles que resistem&quot;. <br>\r\nEla acredita na inoc�ncia de Jack e, ao se comprometer em salv�-lo dentro de um \r\nsistema imperdo�vel, est� se comprometendo a sacrificar sua vida. Trabalhando \r\njuntos, apesar das grandes diferen�as culturais, os dois come�am a descobrir \r\nevid�ncias bizarras do envolvimento de membros do alto escal�o do governo.</p>', '', 0);
INSERT INTO products_description VALUES (16,1,'Coragem Sob Fogo', 'T�tulo Original: &quot;Courage Under Fire&quot; <br>\r\n<br>\r\nC�digo Regional: 2 (Jap�o, Europa, Oriente M�dio, �frica do Sul). <br>\r\nIdioma: Ingl�s, Alem�o. <br>\r\nLegendas: Ingl�s, Alem�o, Espanhol. <br>\r\nAudio: Dolby Surround 5.1. <br>\r\nFormato da Tela: 16:9 Wide-Screen. <br>\r\nDura��o: (aprox) 112 minutes. <br>\r\nOutros: Menu interativo, Sele��o de cap�tulos, Legendas (mais idiomas). <br>\r\n<br>\r\nSinopse: <br>\r\n&quot;Em tempo de guerra, a primeira baixa � sempre a verdade.&quot; <br>\r\nJaneiro de 1991. O mundo est� assistindo � Guerra do Golfo dia e noite, milh�es \r\nde pessoas sintonizam a CNN para ver a vida real e o drama da morte nas cidades \r\ne desertos do Iraque. <br>\r\nComo o Ex�rcito americano ocupa um lugar de destaque na trama, o Departamento de \r\nRela��es P�blicas da Casa Branca est� trabalhando al�m da conta. O que eles \r\nest�o procurando � um her�i. O que eles encontram � um esc�ndalo. O que um \r\noficial encrencado agora precisa encobrir � a verdade.</p>', '', 0);
INSERT INTO products_description VALUES (17,1,'Velocidade M�xima', 'T�tulo Original: &quot;Speed&quot; <br>\r\n<br>\r\nC�digo Regional: 2 (Jap�o, Europa, Oriente M�dio, �frica do Sul). <br>\r\nIdioma: Ingl�s, Alem�o. <br>\r\nLegendas: Ingl�s, Alem�o, Espanhol. <br>\r\nAudio: Dolby Surround 5.1. <br>\r\nFormato da Tela: 16:9 Wide-Screen. <br>\r\nDura��o: (aprox) 112 minutes. <br>\r\nOutros: Menu interativo, Sele��o de cap�tulos, Legendas (mais idiomas). <br>\r\n<br>\r\nSinopse: Prepare-se para uma sequ�ncia de emo��es vibrantes, cenas de a��o de \r\ntirar o f�lego e um romance inesperado, num filme que voc� vai querer ver muitas \r\nvezes. Keanu Reeves � Jack Traven, um especialista da equipe SWAT da pol�cia de \r\nLos Angeles que � enviado para desarmar uma bomba colocada num �nibus por um \r\nman�aco vingativo (Dennis Hopper). Jack e a passageira Sandra Bullock t�m que \r\nmanter o �nibus a mais de 80 km/h ou a bomba explodir�. Uma persegui��o cheia de \r\nsuspense, a��o e reviravoltas que vai deixar voc� com os olhos grudados na tela.</p>', '', 0);
INSERT INTO products_description VALUES (18,1,'Velocidade M�xima 2', 'T�tulo Original: &quot;Speed 2: Cruise Control&quot; <br>\r\n<br>\r\nC�digo Regional: 2 (Jap�o, Europa, Oriente M�dio, �frica do Sul). <br>\r\nIdioma: Ingl�s, Alem�o. <br>\r\nLegendas: Ingl�s, Alem�o, Espanhol. <br>\r\nAudio: Dolby Surround 5.1. <br>\r\nFormato da Tela: 16:9 Wide-Screen. <br>\r\nDura��o: (aprox) 120 minutes. <br>\r\nOutros: Menu interativo, Sele��o de cap�tulos, Legendas (mais idiomas). <br>\r\n<br>\r\nSinopse:Agarre-se ao seu salva-vidas quando a super sequ�ncia de Velocidade \r\nM�xima atingir o alto-mar. Sandra Bullock revive o papel que a transformou em \r\nestrela como Annie Porter, uma jovem mulher esperando divertir-se em f�rias no \r\nCaribe ao lado do seu namorado (Jason Patric) a bordo do transatl�ntico mais \r\nluxuoso do mundo. Mas sua viagem ao para�so torna-se mortal quando um lun�tico \r\ng�nio de computadores (Willem Dafoe) assume o controle do navio e o coloca numa \r\nrota de destrui��o. Uma viagem explosiva conduzida pelo audacioso diretor Jan De \r\nBont (Velocidade M�xima, Twister), VELOCIDADE M�XIMA 2 navega nas ondas \r\nselvagens em velocidade alucinante.</p>', '', 0);
INSERT INTO products_description VALUES (19,1,'Quem vai ficar com Mary?', 'T�tulo Original: &quot;There''s Something About Mary&quot; <br>\r\n<br>\r\nC�digo Regional: 2 (Jap�o, Europa, Oriente M�dio, �frica do Sul). <br>\r\nIdioma: Ingl�s, Alem�o. <br>\r\nLegendas: Ingl�s, Alem�o, Espanhol. <br>\r\nAudio: Dolby Surround 5.1. <br>\r\nFormato da Tela: 16:9 Wide-Screen. <br>\r\nDura��o: (aprox) 114 minutes. <br>\r\nOutros: Menu interativo, Sele��o de cap�tulos, Legendas (mais idiomas). <br>\r\n<br>\r\nSinopse: Uma com�dia rom�ntica com muitas goza��es sobre a maneira como os \r\njovens se apaixonam e as dificuldades de lidar com o amor... <br>\r\nApaixonado desde os tempos do curso colegial por Mary (Cameron Diaz), o \r\ntrapalh�o Ted (Ben Stiller) localiza de novo a gata de seus sonhos treza anos \r\nmais tarde com a ajuda de um investigador particular muito pilantra (Matt Dillon), \r\nque tamb�m se apaixona por ela. Para complicar ainda mais as coisas, os dois \r\ndescobrem que qualquer homem que conhe�a a deslumbrante Mary fica doido para se \r\ncasar com ela. Mais um grande �xito da famosa dupla de diretores, os irm�os \r\nBobby e Peter Farrelly, que j� fizeram grande sucesso com D�bi &amp; L�ide.</p>', '', 0);
INSERT INTO products_description VALUES (20,1,'Bem Amada', 'T�tulo Original: &quot;Beloved&quot; <br>\r\n<br>\r\nC�digo Regional: 2 (Jap�o, Europa, Oriente M�dio, �frica do Sul). <br>\r\nIdioma: Ingl�s, Alem�o. <br>\r\nLegendas: Ingl�s, Alem�o, Espanhol. <br>\r\nAudio: Dolby Surround 5.1. <br>\r\nFormato da Tela: 16:9 Wide-Screen. <br>\r\nDura��o: (aprox) 164 minutes. <br>\r\nOutros: Menu interativo, Sele��o de cap�tulos, Legendas (mais idiomas). <br>\r\n<br>\r\nSinopse:<br>\r\nBaseado em um romance da vencedora do pr�mio Nobel Toni Morrison, Bem Amada (Beloved) \r\n� um grande afresco hist�rico da Am�rica do Norte escravagista no fim do s�culo \r\nXIX. A popular apresentadora de TV Oprah Winfrey interpreta a protagonista, \r\nSethe, uma ex-escrava que tenta levar uma vida normal ao lado da voluntariosa \r\nfilha Denver (Kimberly Elise). Atormentada por segredos inconfess�veis de seu \r\npassado, ela encontra no velho amigo Paul D (Danny Glover) um consolo para seu \r\nsofrimento interior. Thandie Newton encarna a personagem que d� nome ao filme. \r\nBeloved � uma presen�a misteriosa, cuja influ�ncia mal�fica ir� desequilibrar a \r\nexist�ncia de todos � sua volta.</p>', '', 0);
INSERT INTO products_description VALUES (21,1,'SWAT 3: Close Quarters Battle', 'Los Angeles 2005. Representantes de todas as na��es do mundo estar�o reunidos \r\npara testemunhar a assinatura do Tratado de Desarmamento Nuclear das Na��es \r\nUnidas. A prote��o desses homens contra os ataques implac�veis de for�as \r\nterroristas caber� � SWAT. O destino de muitas vidas est� em suas m�os.<br>\r\n<br>\r\nDestaques<br>\r\n<br>\r\nTeste sua coragem em 21 miss�es intensas - todas em locais reais de Los Angeles. \r\nA vida de pessoas inocentes e a captura dos terroristas dependem de voc� e de \r\nsua equipe.<br>\r\n<br>\r\nJogue no modo cooperativo ou de combate mortal contra at� cinco jogadores, em \r\nrede ou via Internet. Personalize tudo, de armas e skins ao n�mero e tipos de \r\nadvers�rios e ref�ns.<br>\r\n<br>\r\nColoque � prova sua imagina��o. Crie novos n�veis ou mude os que j� existem. \r\nRecrie conflitos da vida real e rescreva a hist�ria da cidade. Instale \r\nmodifica��es rapidamente usando o MOD Selector.', 'www.swat3.com', 0);
INSERT INTO products_description VALUES (22,1,'Torneio irreal', 'T�tulo Original: &quot;Unreal Tournament&quot; <br>\r\n<br>\r\nO jogo Single player � emo��o do come�o ao fim, que vai fazer voc� cerrar os \r\npunhos enquanto os tiros v�m de todos os lados! Comande sua equipe de \r\nguerrilheiros virtuais &quot;bots&quot; contra os mais mortais gladiadores virtuais da \r\ngal�xia e torne-se o Grande Mestre do Unreal. A��o Multiplayer de arrepiar a \r\nespinha. Seja ou n�o On-line. Arrase com todo mundo, bots ou humanos, em novos \r\nmodos de jogo: Capturar bandeira, Ataque, Domina��o e novas varia��es de \r\nCombates Mortais que n�o requerem acesso � Internet.<br>\r\n<br>\r\n50 N�veis de batalha, verdadeiras obras de arte. Um gale�o, tumbas eg�pcias, \r\nsubmarinos, trens de alta velocidade, castelos espaciais e muito mais ! Tudo \r\nisso pode ser jogado on-line ou n�o e nos modos para um ou v�rios jogadores. \r\nEsses n�veis elevam o padr�o dos ambientes de a��o 3D<br>\r\n<br>\r\nImagens e sons al�m da realidade. Texturas super detalhadas criam mundos \r\nfant�sticos. Suporta as placas 3D de �ltima gera��o, mas n�o exige placa 3D.<br>\r\n<br>\r\nArsenal Detonante, totalmente novo e aperfei�oado, uma garantia de que vai rolar \r\nmuito sangue ! Mais de 10 armas - cada uma com dois modos de tiro - a sua \r\ndisposi��o.<br>\r\n<br>\r\nTome controle do jogo.Treine no modo novato e use os n�veis tutoriais para \r\narrasar em combate. Se voc� quiser mais velocidade, mais dano, mais intensidade \r\ne mais tudo... tente o modo Hardcore.', 'www.unrealtournament.net', 0);
INSERT INTO products_description VALUES (23,1,'A Roda do Tempo', 'T�tulo Original: &quot;The Wheel Of Time&quot; <br>\r\n<br>\r\nDas p�ginas dos best-sellers de Robert Jordan para as telas dos PCs, The Wheel \r\nof Time conta a hist�ria da busca dos quatro selos m�gicos utilizados para \r\naprisionar &quot;O Obscuro&quot;, uma entidade das trevas com poder suficiente para \r\ndestruir o mundo. <br>\r\n<br>\r\nPara recuperar esses selos, voc� dever� se envolver em uma trama de intrigas e \r\ntrai��es no papel de Elayna Sedai, Guardi� das Cr�nicas da Torre Branca. Em The \r\nWheel of Time, voc� percorrer� 18 n�veis de jogo, unidos por bel�ssimas cenas de \r\nanima��o que contam esta fascinante hist�ria de aventura �pica. A hist�ria que \r\nse desenrola, pouco a pouco, � medida que ocorre a a��o, tendo como objetivo \r\nrecuperar os selos m�gicos roubados da Torre Branca por for�as malignas. <br>\r\n<br>\r\nUm Fant�stico modo de jogo single palyer, que permite viajar por 15 mundos em \r\numa jornada para encontrar os selos m�sticos, com a possibilidade de utilizar \r\nmais de 40 magias e artefatos de poder inimagin�vel, como bolas de fogo, \r\nrel�mpagos, disfarces, levita��o, etc. <br>\r\n<br>\r\nVisuais espetaculares criados por uma vers�o aprimorada do poderoso engine do \r\nUnreal. Chamas iluminam o cen�rio e gotas de chuva caem, agitando po�as de �gua \r\ncom realismo jamais visto. Ambientes bel�ssimos e cen�rios monumentais \r\ninspirados na arte g�tica trazem inigual�veis detalhes arquitet�nicos, real�ados \r\npor incr�veis efeitos especiais. <br>\r\n&nbsp;', 'www.wheeloftime.com', 0);
INSERT INTO products_description VALUES (24,1,'A Terra Sagrada', 'T�tulo original: &quot;Disciples: Sacred Lands&quot; <br>\r\n<br>\r\nUma nova era esta nascendo...<br>\r\n<br>\r\nEntre no reino das terras sagradas, onde o nascer da nova era encontra-se nos \r\nmaiores momentos da guerra. Como prev� a profecia, quatro ra�as confrontam-se \r\ncom espadas e feiti�aria numa perigosa disputa pelo controle do destino dos seus \r\nDeuses. Enfrente a busca como o campe�o do Imp�rio, cl� das montanhas, legi�o \r\ndos malditos, ou multid�o dos mortos-vivos e teste sua f� nas batalhas de for�a, \r\nenfeiti�ando e atuando com mal�cia matando dem�nios, vencendo gigantes e \r\ncombatendo sem miseric�rdia as for�as dos mortos e dos mortos-vivos. Mas a \r\nseguran�a da salva��o do seu Deus deve envolver o her�i dentro de voc�.<br>\r\n&nbsp;', '', 0);
INSERT INTO products_description VALUES (25,1,'Microsoft Internet Keyboard PS/2', '<p>Acesso � Internet com um toque e muito mais! O Internet Keyboard possui dez \r\nteclas de acesso em um design de teclado padr�o confort�vel que tamb�m traz um \r\ndescanso para m�os destac�vel. As teclas de acesso permitem navegar na Web ou \r\nverificar correio eletr�nico diretamente de seu teclado. O software IntelliType \r\nPro tamb�m permite personalizar suas teclas de acesso � trabalhe com o Internet \r\nKeyboard da maneira que preferir! <br>\r\n<br>\r\nBenef�cios <br>\r\nDez teclas de acesso permitem que voc� tenha maior controle sobre seu PC - \r\nAcesse a Internet, seu correio eletr�nico e os programas favoritos diretamente \r\nde seu teclado. <br>\r\nAlta qualidade, alto valor � O Microsoft Internet Keyboard � um teclado de alta \r\nqualidade, feito para durar e tem garantia de 3 anos pela PHPmania. <br>\r\nDescanso para m�os destac�vel - O confort�vel descanso para m�os serve de apoio \r\npara os antebra�os e pode ser removido para aumentar o espa�o na mesa. <br>\r\nExecute tarefas comuns rapidamente como Recortar, Copiar e Colar com a ajuda dos \r\natalhos da tecla Control.</p>', '', 0);
INSERT INTO products_description VALUES (26,1,'Microsoft IntelliMouse Explorer', 'O primeiro avan�o realmente importante na tecnologia dos mouses desde a \r\nd�cada de 60.<br>\r\nO IntelliMouse com IntelliEye ultrapassou toda a antiga tecnologia mec�nica \r\nusada nos mouses atuais. Este mouse usa um novo sensor �ptico que rastreia a \r\nsuperf�cie abaixo do mouse 1.500 vezes por segundo para registrar com precis�o e \r\nregularidade os m�nimos movimentos. Ele funciona em centenas de superf�cies (ou \r\nseja, chega de mouse pad) e permanece "preciso como novo" porque n�o existem \r\npe�as m�veis que se desgastam ou ret�m sujeira. <br>\r\n<br>\r\nBenef�cios<br>\r\n<br>\r\nPrecis�o - O sensor �ptico preciso do IntelliEye registra os movimentos sobre \r\nqualquer tipo de superf�cie. O sensor precisa apenas de uma superf�cie com um \r\npequeno volume de detalhes, o que inclui madeira, pl�stico ou at� o tecido de \r\nsua cal�a. <br>\r\nNavega��o mais f�cil na Internet - Os dois bot�es do polegar atuam com bot�es de \r\navan�ar e voltar no seu navegador. <br>\r\nPrecis�o - Nada de partes m�veis, e portanto seu mouse est� sempre suave e \r\npreciso, n�o sendo necess�rio usar um mouse pad. <br>\r\nAcomoda-se muito bem � sua m�o - Este mouse foi desenvolvido para dar apoio � \r\nsua m�o e seus dedos. As laterais emborrachadas facilitam prender o mouse entre \r\nos dedos e o deixam mais confort�vel de usar, pois ele exige menos esfor�o para \r\nsegurar. <br>\r\nGarantia - O IntelliMouse Explorer vem com garantia limitada de hardware de 5 \r\nanos pela PHPmania.org.</p>', 'www.microsoft.com/hardware/mouse/explorer.asp', 0);
INSERT INTO products_description VALUES (27,1,'Hewlett Packard LaserJet 1100Xi', 'A Hewlett Packard est� sempre na frente na tecnologia de impress�o a laser. A nova \r\ngera��o HP LaserJet 1100, marca outra s�rie impressionante no ritmo de impress�o \r\ne velocidade, sendo de 8 p�ginas por minuto. Imprimir em uma resolu��o de 600 \r\ndpi, com tecnologia de resolu��o avan�ada (Resolution Enhancement technology - \r\nREt) HP faz todos os documentos mais profissionais, aumentando a velocidade de \r\nimpress�o e a qualidade a laser, resultam apenas no come�o com 2MB de mem�ria.<br>\r\n<br>\r\nUsu�rios da HP LaserJet 1100xi ser�o capazes de imprimir p�ginas cada vez mais \r\ncomplexas, a mem�ria � expans�vel para at� 18MB, facilitando a impress�o de \r\ndocumentos mais complexos. A HP LaserJet 1100xi suporta as plataformas Windows \r\n3.1, 3.11, 95, 98, ME, XP. Compatibilidade de rede atrav�s do HP JetDirect \r\nExternal Print Servers.<br>\r\n<br>\r\nHP LaserJet 1100xi tamb�m pode criar documentos para a Web Era da Trellix Corp. \r\n(Oferencendo um software que � capaz de criar documentos web).</p>', 'www.pandi.hp.com/pandi-db/prodinfo.main?product=laserjet1100', 0);
INSERT INTO products_description VALUES (1,2,'Matrox G200 MMS','Reinforcing its position as a multi-monitor trailblazer, Matrox Graphics Inc. has once again developed the most flexible and highly advanced solution in the industry. Introducing the new Matrox G200 Multi-Monitor Series; the first graphics card ever to support up to four DVI digital flat panel displays on a single 8&quot; PCI board.<br><br>With continuing demand for digital flat panels in the financial workplace, the Matrox G200 MMS is the ultimate in flexible solutions. The Matrox G200 MMS also supports the new digital video interface (DVI) created by the Digital Display Working Group (DDWG) designed to ease the adoption of digital flat panels. Other configurations include composite video capture ability and onboard TV tuner, making the Matrox G200 MMS the complete solution for business needs.<br><br>Based on the award-winning MGA-G200 graphics chip, the Matrox G200 Multi-Monitor Series provides superior 2D/3D graphics acceleration to meet the demanding needs of business applications such as real-time stock quotes (Versus), live video feeds (Reuters & Bloombergs), multiple windows applications, word processing, spreadsheets and CAD.','www.matrox.com/mga/products/g200_mms/home.cfm',0);
INSERT INTO products_description VALUES (2,2,'Matrox G400 32MB','<b>Dramatically Different High Performance Graphics</b><br><br>Introducing the Millennium G400 Series - a dramatically different, high performance graphics experience. Armed with the industry\'s fastest graphics chip, the Millennium G400 Series takes explosive acceleration two steps further by adding unprecedented image quality, along with the most versatile display options for all your 3D, 2D and DVD applications. As the most powerful and innovative tools in your PC\'s arsenal, the Millennium G400 Series will not only change the way you see graphics, but will revolutionize the way you use your computer.<br><br><b>Key features:</b><ul><li>New Matrox G400 256-bit DualBus graphics chip</li><li>Explosive 3D, 2D and DVD performance</li><li>DualHead Display</li><li>Superior DVD and TV output</li><li>3D Environment-Mapped Bump Mapping</li><li>Vibrant Color Quality rendering </li><li>UltraSharp DAC of up to 360 MHz</li><li>3D Rendering Array Processor</li><li>Support for 16 or 32 MB of memory</li></ul>','www.matrox.com/mga/products/mill_g400/home.htm',0);
INSERT INTO products_description VALUES (3,2,'Microsoft IntelliMouse Pro','Every element of IntelliMouse Pro - from its unique arched shape to the texture of the rubber grip around its base - is the product of extensive customer and ergonomic research. Microsoft\'s popular wheel control, which now allows zooming and universal scrolling functions, gives IntelliMouse Pro outstanding comfort and efficiency.','www.microsoft.com/hardware/mouse/intellimouse.asp',0);
INSERT INTO products_description VALUES (4,2,'The Replacement Killers','Regional Code: 2 (Japan, Europe, Middle East, South Africa).<br>Languages: English, Deutsch.<br>Subtitles: English, Deutsch, Spanish.<br>Audio: Dolby Surround 5.1.<br>Picture Format: 16:9 Wide-Screen.<br>Length: (approx) 80 minutes.<br>Other: Interactive Menus, Chapter Selection, Subtitles (more languages).','www.replacement-killers.com',0);
INSERT INTO products_description VALUES (5,2,'Blade Runner - Director\'s Cut','Regional Code: 2 (Japan, Europe, Middle East, South Africa).<br>Languages: English, Deutsch.<br>Subtitles: English, Deutsch, Spanish.<br>Audio: Dolby Surround 5.1.<br>Picture Format: 16:9 Wide-Screen.<br>Length: (approx) 112 minutes.<br>Other: Interactive Menus, Chapter Selection, Subtitles (more languages).','www.bladerunner.com',0);
INSERT INTO products_description VALUES (6,2,'The Matrix','Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br>\nLanguages: English, Deutsch.\r<br>\nSubtitles: English, Deutsch.\r<br>\nAudio: Dolby Surround.\r<br>\nPicture Format: 16:9 Wide-Screen.\r<br>\nLength: (approx) 131 minutes.\r<br>\nOther: Interactive Menus, Chapter Selection, Making Of.','www.thematrix.com',0);
INSERT INTO products_description VALUES (7,2,'You\'ve Got Mail','Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br>\nLanguages: English, Deutsch, Spanish.\r<br>\nSubtitles: English, Deutsch, Spanish, French, Nordic, Polish.\r<br>\nAudio: Dolby Digital 5.1.\r<br>\nPicture Format: 16:9 Wide-Screen.\r<br>\nLength: (approx) 115 minutes.\r<br>\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).','www.youvegotmail.com',0);
INSERT INTO products_description VALUES (8,2,'A Bug\'s Life','Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br>\nLanguages: English, Deutsch.\r<br>\nSubtitles: English, Deutsch, Spanish.\r<br>\nAudio: Dolby Digital 5.1 / Dobly Surround Stereo.\r<br>\nPicture Format: 16:9 Wide-Screen.\r<br>\nLength: (approx) 91 minutes.\r<br>\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).','www.abugslife.com',0);
INSERT INTO products_description VALUES (9,2,'Under Siege','Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br>\nLanguages: English, Deutsch.\r<br>\nSubtitles: English, Deutsch, Spanish.\r<br>\nAudio: Dolby Surround 5.1.\r<br>\nPicture Format: 16:9 Wide-Screen.\r<br>\nLength: (approx) 98 minutes.\r<br>\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).','',0);
INSERT INTO products_description VALUES (10,2,'Under Siege 2 - Dark Territory','Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br>\nLanguages: English, Deutsch.\r<br>\nSubtitles: English, Deutsch, Spanish.\r<br>\nAudio: Dolby Surround 5.1.\r<br>\nPicture Format: 16:9 Wide-Screen.\r<br>\nLength: (approx) 98 minutes.\r<br>\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).','',0);
INSERT INTO products_description VALUES (11,2,'Fire Down Below','Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br>\nLanguages: English, Deutsch.\r<br>\nSubtitles: English, Deutsch, Spanish.\r<br>\nAudio: Dolby Surround 5.1.\r<br>\nPicture Format: 16:9 Wide-Screen.\r<br>\nLength: (approx) 100 minutes.\r<br>\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).','',0);
INSERT INTO products_description VALUES (12,2,'Die Hard With A Vengeance','Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br>\nLanguages: English, Deutsch.\r<br>\nSubtitles: English, Deutsch, Spanish.\r<br>\nAudio: Dolby Surround 5.1.\r<br>\nPicture Format: 16:9 Wide-Screen.\r<br>\nLength: (approx) 122 minutes.\r<br>\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).','',0);
INSERT INTO products_description VALUES (13,2,'Lethal Weapon','Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br>\nLanguages: English, Deutsch.\r<br>\nSubtitles: English, Deutsch, Spanish.\r<br>\nAudio: Dolby Surround 5.1.\r<br>\nPicture Format: 16:9 Wide-Screen.\r<br>\nLength: (approx) 100 minutes.\r<br>\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).','',0);
INSERT INTO products_description VALUES (14,2,'Red Corner','Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br>\nLanguages: English, Deutsch.\r<br>\nSubtitles: English, Deutsch, Spanish.\r<br>\nAudio: Dolby Surround 5.1.\r<br>\nPicture Format: 16:9 Wide-Screen.\r<br>\nLength: (approx) 117 minutes.\r<br>\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).','',0);
INSERT INTO products_description VALUES (15,2,'Frantic','Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br>\nLanguages: English, Deutsch.\r<br>\nSubtitles: English, Deutsch, Spanish.\r<br>\nAudio: Dolby Surround 5.1.\r<br>\nPicture Format: 16:9 Wide-Screen.\r<br>\nLength: (approx) 115 minutes.\r<br>\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).','',0);
INSERT INTO products_description VALUES (16,2,'Courage Under Fire','Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br>\nLanguages: English, Deutsch.\r<br>\nSubtitles: English, Deutsch, Spanish.\r<br>\nAudio: Dolby Surround 5.1.\r<br>\nPicture Format: 16:9 Wide-Screen.\r<br>\nLength: (approx) 112 minutes.\r<br>\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).','',0);
INSERT INTO products_description VALUES (17,2,'Speed','Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br>\nLanguages: English, Deutsch.\r<br>\nSubtitles: English, Deutsch, Spanish.\r<br>\nAudio: Dolby Surround 5.1.\r<br>\nPicture Format: 16:9 Wide-Screen.\r<br>\nLength: (approx) 112 minutes.\r<br>\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).','',0);
INSERT INTO products_description VALUES (18,2,'Speed 2: Cruise Control','Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br>\nLanguages: English, Deutsch.\r<br>\nSubtitles: English, Deutsch, Spanish.\r<br>\nAudio: Dolby Surround 5.1.\r<br>\nPicture Format: 16:9 Wide-Screen.\r<br>\nLength: (approx) 120 minutes.\r<br>\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).','',0);
INSERT INTO products_description VALUES (19,2,'There\'s Something About Mary','Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br>\nLanguages: English, Deutsch.\r<br>\nSubtitles: English, Deutsch, Spanish.\r<br>\nAudio: Dolby Surround 5.1.\r<br>\nPicture Format: 16:9 Wide-Screen.\r<br>\nLength: (approx) 114 minutes.\r<br>\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).','',0);
INSERT INTO products_description VALUES (20,2,'Beloved','Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br>\nLanguages: English, Deutsch.\r<br>\nSubtitles: English, Deutsch, Spanish.\r<br>\nAudio: Dolby Surround 5.1.\r<br>\nPicture Format: 16:9 Wide-Screen.\r<br>\nLength: (approx) 164 minutes.\r<br>\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).','',0);
INSERT INTO products_description VALUES (21,2,'SWAT 3: Close Quarters Battle','<b>Windows 95/98</b><br><br>211 in progress with shots fired. Officer down. Armed suspects with hostages. Respond Code 3! Los Angles, 2005, In the next seven days, representatives from every nation around the world will converge on Las Angles to witness the signing of the United Nations Nuclear Abolishment Treaty. The protection of these dignitaries falls on the shoulders of one organization, LAPD SWAT. As part of this elite tactical organization, you and your team have the weapons and all the training necessary to protect, to serve, and \"When needed\" to use deadly force to keep the peace. It takes more than weapons to make it through each mission. Your arsenal includes C2 charges, flashbangs, tactical grenades. opti-Wand mini-video cameras, and other devices critical to meeting your objectives and keeping your men free of injury. Uncompromised Duty, Honor and Valor!','www.swat3.com',0);
INSERT INTO products_description VALUES (22,2,'Unreal Tournament','From the creators of the best-selling Unreal, comes Unreal Tournament. A new kind of single player experience. A ruthless multiplayer revolution.<br><br>This stand-alone game showcases completely new team-based gameplay, groundbreaking multi-faceted single player action or dynamic multi-player mayhem. It\'s a fight to the finish for the title of Unreal Grand Master in the gladiatorial arena. A single player experience like no other! Guide your team of \'bots\' (virtual teamates) against the hardest criminals in the galaxy for the ultimate title - the Unreal Grand Master.','www.unrealtournament.net',0);
INSERT INTO products_description VALUES (23,2,'The Wheel Of Time','The world in which The Wheel of Time takes place is lifted directly out of Jordan\'s pages; it\'s huge and consists of many different environments. How you navigate the world will depend largely on which game - single player or multipayer - you\'re playing. The single player experience, with a few exceptions, will see Elayna traversing the world mainly by foot (with a couple notable exceptions). In the multiplayer experience, your character will have more access to travel via Ter\'angreal, Portal Stones, and the Ways. However you move around, though, you\'ll quickly discover that means of locomotion can easily become the least of the your worries...<br><br>During your travels, you quickly discover that four locations are crucial to your success in the game. Not surprisingly, these locations are the homes of The Wheel of Time\'s main characters. Some of these places are ripped directly from the pages of Jordan\'s books, made flesh with Legend\'s unparalleled pixel-pushing ways. Other places are specific to the game, conceived and executed with the intent of expanding this game world even further. Either way, they provide a backdrop for some of the most intense first person action and strategy you\'ll have this year.','www.wheeloftime.com',0);
INSERT INTO products_description VALUES (24,2,'Disciples: Sacred Lands','A new age is dawning...<br><br>Enter the realm of the Sacred Lands, where the dawn of a New Age has set in motion the most momentous of wars. As the prophecies long foretold, four races now clash with swords and sorcery in a desperate bid to control the destiny of their gods. Take on the quest as a champion of the Empire, the Mountain Clans, the Legions of the Damned, or the Undead Hordes and test your faith in battles of brute force, spellbinding magic and acts of guile. Slay demons, vanquish giants and combat merciless forces of the dead and undead. But to ensure the salvation of your god, the hero within must evolve.<br><br>The day of reckoning has come... and only the chosen will survive.','',0);
INSERT INTO products_description VALUES (25,2,'Microsoft Internet Keyboard PS/2','The Internet Keyboard has 10 Hot Keys on a comfortable standard keyboard design that also includes a detachable palm rest. The Hot Keys allow you to browse the web, or check e-mail directly from your keyboard. The IntelliType Pro software also allows you to customize your hot keys - make the Internet Keyboard work the way you want it to!','',0);
INSERT INTO products_description VALUES (26,2,'Microsoft IntelliMouse Explorer','Microsoft introduces its most advanced mouse, the IntelliMouse Explorer! IntelliMouse Explorer features a sleek design, an industrial-silver finish, a glowing red underside and taillight, creating a style and look unlike any other mouse. IntelliMouse Explorer combines the accuracy and reliability of Microsoft IntelliEye optical tracking technology, the convenience of two new customizable function buttons, the efficiency of the scrolling wheel and the comfort of expert ergonomic design. All these great features make this the best mouse for the PC!','www.microsoft.com/hardware/mouse/explorer.asp',0);
INSERT INTO products_description VALUES (27,2,'Hewlett Packard LaserJet 1100Xi','HP has always set the pace in laser printing technology. The new generation HP LaserJet 1100 series sets another impressive pace, delivering a stunning 8 pages per minute print speed. The 600 dpi print resolution with HP\'s Resolution Enhancement technology (REt) makes every document more professional.<br><br>Enhanced print speed and laser quality results are just the beginning. With 2MB standard memory, HP LaserJet 1100xi users will be able to print increasingly complex pages. Memory can be increased to 18MB to tackle even more complex documents with ease. The HP LaserJet 1100xi supports key operating systems including Windows 3.1, 3.11, 95, 98, NT 4.0, OS/2 and DOS. Network compatibility available via the optional HP JetDirect External Print Servers.<br><br>HP LaserJet 1100xi also features The Document Builder for the Web Era from Trellix Corp. (featuring software to create Web documents).','www.pandi.hp.com/pandi-db/prodinfo.main?product=laserjet1100',0);
INSERT INTO products_description VALUES (1,3,'Matrox G200 MMS','<b>Unterst�tzung f�r zwei bzw. vier analoge oder digitale Monitore</b><br><br>\r\nDie Matrox G200 Multi-Monitor-Serie f�hrt die bew�hrte Matrox Tradition im Multi-Monitor- Bereich fort und bietet flexible und fortschrittliche L�sungen.Matrox stellt als erstes Unternehmen einen vierfachen digitalen PanelLink� DVI Flachbildschirm Ausgang zur Verf�gung. Mit den optional erh�ltlichen TV Tuner und Video-Capture M�glichkeiten stellt die Matrox G200 MMS eine alles umfassende Mehrschirm-L�sung dar.<br><br>\r\n<b>Leistungsmerkmale:</b>\r\n<ul>\r\n<li>Preisgekr�nter Matrox G200 128-Bit Grafikchip</li>\r\n<li>Schneller 8 MB SGRAM-Speicher pro Kanal</li>\r\n<li>Integrierter, leistungsstarker 250 MHz RAMDAC</li>\r\n<li>Unterst�tzung f�r bis zu 16 Bildschirme �ber 4 Quad-Karten (unter Win NT,ab Treiber 4.40)</li>\r\n<li>Unterst�tzung von 9 Monitoren unter Win 98</li>\r\n<li>2 bzw. 4 analoge oder digitale Ausgabekan�le pro PCI-Karte</li>\r\n<li>Desktop-Darstellung von 1800 x 1440 oder 1920 x 1200 pro Chip</li>\r\n<li>Anschlu�m�glichkeit an einen 15-poligen VGA-Monitor oder an einen 30-poligen digitalen DVI-Flachbildschirm plus integriertem Composite-Video-Eingang (bei der TV-Version)</li>\r\n<li>PCI Grafikkarte, kurze Baul�nge</li>\r\n<li>Treiberunterst�tzung: Windows� 2000, Windows NT� und Windows� 98</li>\r\n<li>Anwendungsbereiche: B�rsenumgebung mit zeitgleich gro�em Visualisierungsbedarf, Video�berwachung, Video-Conferencing</li>\r\n</ul>','www.matrox.com/mga/deutsch/products/g200_mms/home.cfm',0);
INSERT INTO products_description VALUES (2,3,'Matrox G400 32 MB','<b>Neu! Matrox G400 &quot;all inclusive&quot; und vieles mehr...</b><br><br>\r\nDie neue Millennium G400-Serie - Hochleistungsgrafik mit dem sensationellen Unterschied. Ausgestattet mit dem neu eingef�hrten Matrox G400 Grafikchip, bietet die Millennium G400-Serie eine �berragende Beschleunigung inklusive bisher nie dagewesener Bildqualitat und enorm flexibler Darstellungsoptionen bei allen Ihren 3D-, 2D- und DVD-Anwendungen.<br><br>\r\n<ul>\r\n<li>DualHead Display und TV-Ausgang</li>\r\n<li>Environment Mapped Bump Mapping</li>\r\n<li>Matrox G400 256-Bit DualBus</li>\r\n<li>3D Rendering Array Prozessor</li>\r\n<li>Vibrant Color Quality� (VCQ�)</li>\r\n<li>UltraSharp DAC</li>\r\n</ul>\r\n<i>&quot;Bleibt abschlie�end festzustellen, da� die Matrox Millennium G400 Max als Allroundkarte f�r den Highend-PC derzeit unerreicht ist. Das ergibt den Testsieg und unsere w�rmste Empfehlung.&quot;</i><br>\r\n<b>GameStar 8/99 (S.184)</b>','www.matrox.com/mga/deutsch/products/mill_g400/home.cfm',0);
INSERT INTO products_description VALUES (3,3,'Microsoft IntelliMouse Pro','Die IntelliMouse Pro hat mit der IntelliRad-Technologie einen neuen Standard gesetzt. Anwenderfreundliche Handhabung und produktiveres Arbeiten am PC zeichnen die IntelliMouse aus. Die gew�lbte Oberseite pa�t sich nat�rlich in die Handfl�che ein, die geschwungene Form erleichtert das Bedienen der Maus. Sie ist sowohl f�r Rechts- wie auch f�r Linksh�nder geeignet. Mit dem Rad der IntelliMouse kann der Anwender einfach und komfortabel durch Dokumente navigieren.<br><br>\r\n<b>Eigenschaften:</b>\r\n<ul>\r\n<li><b>ANSCHLUSS:</b> PS/2</li>\r\n<li><b>FARBE:</b> wei�</li>\r\n<li><b>TECHNIK:</b> Mauskugel</li>\r\n<li><b>TASTEN:</b> 3 (incl. Scrollrad)</li>\r\n<li><b>SCROLLRAD:</b> Ja</li>\r\n</ul>','',0);
INSERT INTO products_description VALUES (4,3,'Die Ersatzkiller','Originaltitel: &quot;The Replacement Killers&quot;<br><br>\r\nRegional Code: 2 (Japan, Europe, Middle East, South Africa).<br>\r\nSprachen: English, Deutsch.<br>\r\nUntertitel: English, Deutsch, Spanish.<br>\r\nAudio: Dolby Surround 5.1.<br>\r\nBildformat: 16:9 Wide-Screen.<br>\r\nDauer: (approx) 80 minutes.<br>\r\nAu�erdem: Interaktive Menus, Kapitelauswahl, Untertitel.<br><br>\r\n(USA 1998). Til Schweiger schie�t auf Hongkong-Star Chow Yun-Fat (&quot;Anna und der K�nig&quot;) � ein Fehler ...','www.replacement-killers.com',0);
INSERT INTO products_description VALUES (5,3,'Blade Runner - Director\'s Cut','Regional Code: 2 (Japan, Europe, Middle East, South Africa).<br>\r\nSprachen: English, Deutsch.<br>\r\nUntertitel: English, Deutsch, Spanish.<br>\r\nAudio: Dolby Surround 5.1.<br>\r\nBildformat: 16:9 Wide-Screen.<br>\r\nDauer: (approx) 112 minutes.<br>\r\nAu�erdem: Interaktive Menus, Kapitelauswahl, Untertitel.<br><br>\r\n<b>Sci-Fi-Klassiker, USA 1983, 112 Min.</b><br><br>\r\nLos Angeles ist im Jahr 2019 ein Hexenkessel. Dauerregen und Smog tauchen den �berbev�lkerten Moloch in ewige D�mmerung. Polizeigleiter schwirren durch die Luft und �berwachen das grelle Ethnogemisch, das sich am Fu�e 400st�ckiger Stahlbeton-Pyramiden tummelt. Der abgehalfterte Ex-Cop und \"Blade Runner\" Rick Deckard ist Spezialist f�r die Beseitigung von Replikanten, k�nstlichen Menschen, geschaffen f�r harte Arbeit auf fremden Planeten. Nur ihm kann es gelingen, vier fl�chtige, hochintelligente \"Nexus 6\"-Spezialmodelle zu stellen. Die sind mit ihrem starken und brandgef�hrlichen Anf�hrer Batty auf der Suche nach ihrem Sch�pfer. Er soll ihnen eine l�ngere Lebenszeit schenken. Das mu� Rick Deckard verhindern.  Als sich der eiskalte J�ger in Rachel, die Sekret�rin seines Auftraggebers, verliebt, ger�t sein Weltbild jedoch ins Wanken. Er entdeckt, da� sie - vielleicht wie er selbst - ein Replikant ist ...<br><br>\r\nDie Konfrontation des Menschen mit \"Realit�t\" und \"Virtualit�t\" und das verstrickte Spiel mit get�rkten Erinnerungen zieht sich als roter Faden durch das Werk von Autor Philip K. Dick (\"Die totale Erinnerung\"). Sein Roman \"Tr�umen Roboter von elektrischen Schafen?\" liefert die Vorlage f�r diesen doppelb�digen Thriller, der den Zuschauer mit faszinierenden\r\nZukunftsvisionen und der gigantischen Kulisse des Gro�stadtmolochs gefangen nimmt.','www.bladerunner.com',0);
INSERT INTO products_description VALUES (6,3,'Matrix','Originaltitel: &quot;The Matrix&quot;<br><br>\r\nRegional Code: 2 (Japan, Europe, Middle East, South Africa).<br>\r\nSprachen: English, Deutsch.<br>\r\nUntertitel: English, Deutsch, Spanish.<br>\r\nAudio: Dolby Surround 5.1.<br>\r\nBildformat: 16:9 Wide-Screen.<br>\r\nDauer: (approx) 136 minuten.<br>\r\nAu�erdem: Interaktive Menus, Kapitelauswahl, Untertitel.<br><br>\r\n(USA 1999) Der Geniestreich der Wachowski-Br�der. In dieser technisch perfekten Utopie k�mpft Hacker Keanu Reeves gegen die Diktatur der Maschinen...','www.whatisthematrix.com',0);
INSERT INTO products_description VALUES (7,3,'e-m@il f�r Dich','Original: &quot;You\'ve got mail&quot;<br>\r\nRegional Code: 2 (Japan, Europe, Middle East, South Africa).<br>\r\nSprachen: English, Deutsch.<br>\r\nUntertitel: English, Deutsch, Spanish.<br>\r\nAudio: Dolby Surround 5.1.<br>\r\nBildformat: 16:9 Wide-Screen.<br>\r\nDauer: (approx) 112 minutes.<br>\r\nAu�erdem: Interaktive Menus, Kapitelauswahl, Untertitel.<br><br>\r\n(USA 1998) von Nora Ephron (&qout;Schlaflos in Seattle&quot;). Meg Ryan und Tom Hanks kn�pfen per E-Mail zarte Bande. Dass sie sich schon kennen, ahnen sie nicht ...','www.youvegotmail.com',0);
INSERT INTO products_description VALUES (8,3,'Das Gro�e Krabbeln','Originaltitel: &quot;A Bug\'s Life&quot;<br><br>\r\nRegional Code: 2 (Japan, Europe, Middle East, South Africa).<br>\r\nSprachen: English, Deutsch.<br>\r\nUntertitel: English, Deutsch, Spanish.<br>\r\nAudio: Dolby Surround 5.1.<br>\r\nBildformat: 16:9 Wide-Screen.<br>\r\nDauer: (approx) 96 minuten.<br>\r\nAu�erdem: Interaktive Menus, Kapitelauswahl, Untertitel.<br><br>\r\n(USA 1998). Ameise Flik zettelt einen Aufstand gegen gefr��ige Grash�pfer an ... Eine fantastische Computeranimation des \"Toy Story\"-Teams. ','www.abugslife.com',0);
INSERT INTO products_description VALUES (9,3,'Alarmstufe: Rot','Originaltitel: &quot;Under Siege&quot;<br><br>\r\nRegional Code: 2 (Japan, Europe, Middle East, South Africa).<br>\r\nSprachen: English, Deutsch.<br>\r\nUntertitel: English, Deutsch, Spanish.<br>\r\nAudio: Dolby Surround 5.1.<br>\r\nBildformat: 16:9 Wide-Screen.<br>\r\nDauer: (approx) 96 minuten.<br>\r\nAu�erdem: Interaktive Menus, Kapitelauswahl, Untertitel.<br><br>\r\n<b>Actionthriller. Smutje Steven Seagal versalzt Schurke Tommy Lee Jones die Suppe</b><br><br>\r\nKatastrophe ahoi: Kurz vor Ausmusterung der \"U.S.S. Missouri\" kapert die High-tech-Bande von Ex-CIA-Agent Strannix (Tommy Lee Jones) das Schlachtschiff. Strannix will die Nuklearraketen des Kreuzers klauen und verscherbeln. Mit Hilfe des irren Ersten Offiziers Krill (lustig: Gary Busey) killen die Gangster den K�pt�n und sperren seine Crew unter Deck. Bl�d, dass sie dabei Schiffskoch Rybak (Steven Seagal) vergessen. Der Ex-Elitek�mpfer knipst einen Schurken nach dem anderen aus. Eine Verb�ndete findet er in Stripperin Jordan (Ex-\"Baywatch\"-Biene Erika Eleniak). Die sollte eigentlich aus K�pt�ns Geburtstagstorte h�pfen ... Klar: Seagal ist kein Edelmime. Daf�r ist Regisseur Andrew Davis (\"Auf der Flucht\") ein K�nner: Er w�rzt die Action-Orgie mit Ironie und nutzt die imposante Schiffskulisse voll aus. F�r Effekte und Ton gab es 1993 Oscar-Nominierungen. ','',0);
INSERT INTO products_description VALUES (10,3,'Alarmstufe: Rot 2','Originaltitel: &quot;Under Siege 2: Dark Territory&quot;<br><br>\r\nRegional Code: 2 (Japan, Europe, Middle East, South Africa).<br>\r\nSprachen: English, Deutsch.<br>\r\nUntertitel: English, Deutsch, Spanish.<br>\r\nAudio: Dolby Surround 5.1.<br>\r\nBildformat: 16:9 Wide-Screen.<br>\r\nDauer: (approx) 96 minuten.<br>\r\nAu�erdem: Interaktive Menus, Kapitelauswahl, Untertitel.<br><br>\r\n(USA �95). Von einem gekaperten Zug aus �bernimmt Computerspezi Dane die Kontrolle �ber einen Kampfsatelliten und erpresst das Pentagon. Aber auch Ex-Offizier Ryback (Steven Seagal) ist im Zug ...\r\n','',0);
INSERT INTO products_description VALUES (11,3,'Fire Down Below','Regional Code: 2 (Japan, Europe, Middle East, South Africa).<br>\r\nSprachen: English, Deutsch.<br>\r\nUntertitel: English, Deutsch, Spanish.<br>\r\nAudio: Dolby Surround 5.1.<br>\r\nBildformat: 16:9 Wide-Screen.<br>\r\nDauer: (approx) 96 minuten.<br>\r\nAu�erdem: Interaktive Menus, Kapitelauswahl, Untertitel.<br><br>\r\nEin mysteri�ser Mordfall f�hrt den Bundesmarschall Jack Taggert in eine Kleinstadt im US-Staat Kentucky. Doch bei seinen Ermittlungen st��t er auf eine Mauer des Schweigens. Angst beherrscht die Stadt, und alle Spuren f�hren zu dem undurchsichtigen Minen-Tycoon Orin Hanner. Offenbar werden in der friedlichen Berglandschaft gigantische Mengen Giftm�lls verschoben, mit unkalkulierbaren Risiken. Um eine Katastrophe zu verhindern, r�umt Taggert gnadenlos auf ...','',0);
INSERT INTO products_description VALUES (12,3,'Stirb Langsam - Jetzt Erst Recht','Originaltitel: &quot;Die Hard With A Vengeance&quot;<br><br>\r\nRegional Code: 2 (Japan, Europe, Middle East, South Africa).<br>\r\nSprachen: English, Deutsch.<br>\r\nUntertitel: English, Deutsch, Spanish.<br>\r\nAudio: Dolby Surround 5.1.<br>\r\nBildformat: 16:9 Wide-Screen.<br>\r\nDauer: (approx) 96 minuten.<br>\r\nAu�erdem: Interaktive Menus, Kapitelauswahl, Untertitel.<br><br>\r\nSo explosiv, so spannend, so rasant wie nie zuvor: Bruce Willis als Detectiv John McClane in einem Action-Thriller der Superlative! Das ist heute nicht McClanes Tag. Seine Frau hat ihn verlassen, sein Bo� hat ihn vom Dienst suspendiert und irgendein Verr�ckter hat ihn gerade zum Gegenspieler in einem teuflischen Spiel erkoren - und der Einsatz ist New York selbst. Ein Kaufhaus ist explodiert, doch das ist nur der Auftakt. Der geniale Superverbrecher Simon droht, die ganze Stadt St�ck f�r St�ck in die Luft zu sprengen, wenn McClane und sein Partner wider Willen seine explosiven\" R�tsel nicht l�sen. Eine m�rderische Hetzjagd quer durch New York beginnt - bis McClane merkt, da� der Bombenterror eigentlich nur ein brillantes Ablenkungsman�ver ist...!<br><i>\"Perfekt gemacht und stark besetzt. Das Action-Highlight des Jahres!\"</i> <b>(Bild)</b>','',0);
INSERT INTO products_description VALUES (13,3,'Zwei stahlharte Profis','Originaltitel: &quot;Lethal Weapon&quot;<br><br>\r\nRegional Code: 2 (Japan, Europe, Middle East, South Africa).<br>\r\nSprachen: English, Deutsch.<br>\r\nUntertitel: English, Deutsch, Spanish.<br>\r\nAudio: Dolby Surround 5.1.<br>\r\nBildformat: 16:9 Wide-Screen.<br>\r\nDauer: (approx) 96 minuten.<br>\r\nAu�erdem: Interaktive Menus, Kapitelauswahl, Untertitel.<br><br>\r\nSie sind beide Cops in L.A.. Sie haben beide in Vietnam f�r eine Spezialeinheit gek�mpft. Und sie hassen es beide, mit einem Partner arbeiten zu m�ssen. Aber sie sind Partner: Martin Riggs, der Mann mit dem Todeswunsch, f�r wen auch immer. Und Roger Murtaugh, der besonnene Polizist. Gemeinsam enttarnen sie einen gigantischen Heroinschmuggel, hinter dem sich eine Gruppe ehemaliger CIA-S�ldner verbirgt. Eine Killerbande gegen zwei Profis ...','',0);
INSERT INTO products_description VALUES (14,3,'Labyrinth ohne Ausweg','Originaltitel: &quot;Red Corner&quot;<br><br>\r\nRegional Code: 2 (Japan, Europe, Middle East, South Africa).<br>\r\nSprachen: English, Deutsch.<br>\r\nUntertitel: English, Deutsch, Spanish.<br>\r\nAudio: Dolby Surround 5.1.<br>\r\nBildformat: 16:9 Wide-Screen.<br>\r\nDauer: (approx) 96 minuten.<br>\r\nAu�erdem: Interaktive Menus, Kapitelauswahl, Untertitel.<br><br>\r\nDem Amerikaner Jack Moore wird in China der bestialische Mord an einem Fotomodel angeh�ngt. Brutale Gef�ngnisschergen versuchen, ihn durch Folter zu einem Gest�ndnis zu zwingen. Vor Gericht fordert die Anklage die Todesstrafe - Moore\'s Schicksal scheint besiegelt. Durch einen Zufall gelingt es ihm, aus der Haft zu fliehen, doch aus der feindseligen chinesischen Hauptstadt gibt es praktisch kein Entkommen ...','',0);
INSERT INTO products_description VALUES (15,3,'Frantic','Originaltitel: &quot;Frantic&quot;<br><br>\r\nRegional Code: 2 (Japan, Europe, Middle East, South Africa).<br>\r\nSprachen: English, Deutsch.<br>\r\nUntertitel: English, Deutsch, Spanish.<br>\r\nAudio: Dolby Surround 5.1.<br>\r\nBildformat: 16:9 Wide-Screen.<br>\r\nDauer: (approx) 96 minuten.<br>\r\nAu�erdem: Interaktive Menus, Kapitelauswahl, Untertitel.<br><br>\r\nEin romantischer Urlaub in Paris, der sich in einen Alptraum verwandelt. Ein Mann auf der verzweifelten Suche nach seiner entf�hrten Frau. Ein d�ster-bedrohliches Paris, in dem nur ein Mensch Licht in die t�dliche Aff�re bringen kann.','',0);
INSERT INTO products_description VALUES (16,3,'Mut Zur Wahrheit','Originaltitel: &quot;Courage Under Fire&quot;<br><br>\r\nRegional Code: 2 (Japan, Europe, Middle East, South Africa).<br>\r\nSprachen: English, Deutsch.<br>\r\nUntertitel: English, Deutsch, Spanish.<br>\r\nAudio: Dolby Surround 5.1.<br>\r\nBildformat: 16:9 Wide-Screen.<br>\r\nDauer: (approx) 96 minuten.<br>\r\nAu�erdem: Interaktive Menus, Kapitelauswahl, Untertitel.<br><br>\r\nLieutenant Colonel Nathaniel Serling (Denzel Washington) l�sst w�hrend einer Schlacht im Golfkrieg versehentlich auf einen US-Panzer schie�en, dessen Mannschaft dabei ums Leben kommt. Ein Jahr nach diesem Vorfall wird Serling, der mittlerweile nach Washington D.C. versetzt wurde, die Aufgabe �bertragen, sich um einen Kandidaten zu k�mmern, der w�hrend des Krieges starb und dem der h�chste milit�rische Orden zuteil werden soll. Allerdings sind sowohl der Fall und als auch der betreffende Soldat ein politisch hei�es Eisen -- Captain Karen Walden (Meg Ryan) ist Amerikas erster weiblicher Soldat, der im Kampf get�tet wurde.<br><br>\r\nSerling findet schnell heraus, dass es im Fall des im felsigen Gebiet von Kuwait abgest�rzten Rettungshubschraubers Diskrepanzen gibt. In Flashbacks werden von unterschiedlichen Personen verschiedene Versionen von Waldens Taktik, die Soldaten zu retten und den Absturz zu �berleben, dargestellt (� la Kurosawas Rashomon). Genau wie in Glory erweist sich Regisseur Edward Zwicks Zusammenstellung von bekannten und unbekannten Schauspielern als die richtige Mischung. Waldens Crew ist besonders �berzeugend. Matt Damon als der Sanit�ter kommt gut als der leichtfertige Typ r�ber, als er Washington seine Geschichte erz�hlt. Im Kampf ist er ein mit Fehlern behafteter, humorvoller Soldat.<br><br>\r\nDie erstaunlichste Arbeit in Mut zur Wahrheit leistet Lou Diamond Phillips (als der Sch�tze der Gruppe), dessen Karriere sich auf dem Weg in die direkt f�r den Videomarkt produzierten Filme befand. Und dann ist da noch Ryan. Sie hat sich in dramatischen Filmen in der Vergangenheit gut behauptet (Eine fast perfekte Liebe, Ein blutiges Erbe), es aber nie geschafft, ihrem Image zu entfliehen, das sie in die Ecke der romantischen Kom�die steckte. Mit gef�rbtem Haar, einem leichten Akzent und der von ihr geforderten Darstellungskunst hat sie endlich einen langlebigen dramatischen Film. Obwohl sie nur halb so oft wie Washington im Film zu sehen ist, macht ihre mutige und beeindruckend nachhaltige Darstellung Mut zur Wahrheit zu einem speziellen Film bis hin zu dessen seltsamer, aber lohnender letzter Szene.','',0);
INSERT INTO products_description VALUES (17,3,'Speed','Originaltitel: &quot;Speed&quot;<br><br>\r\nRegional Code: 2 (Japan, Europe, Middle East, South Africa).<br>\r\nSprachen: English, Deutsch.<br>\r\nUntertitel: English, Deutsch, Spanish.<br>\r\nAudio: Dolby Surround 5.1.<br>\r\nBildformat: 16:9 Wide-Screen.<br>\r\nDauer: (approx) 96 minuten.<br>\r\nAu�erdem: Interaktive Menus, Kapitelauswahl, Untertitel.<br><br>\r\nEr ist ein Cop aus der Anti-Terror-Einheit von Los Angeles. Und so ist der Alarm f�r Jack Traven nichts Ungew�hnliches: Ein Terrorist will drei Millionen Dollar erpressen, oder die zuf�lligen Geiseln in einem Aufzug fallen 35 Stockwerke in die Tiefe. Doch Jack schafft das Unm�gliche - die Geiseln werden gerettet und der Terrorist stirbt an seiner eigenen Bombe. Scheinbar. Denn schon wenig sp�ter steht Jack (Keanu Reeves) dem Bombenexperten Payne erneut gegen�ber. Diesmal hat sich der Erpresser eine ganz perfide Mordwaffe ausgedacht: Er plaziert eine Bombe in einem �ffentlichen Bus. Der Mechanismus der Sprengladung schaltet sich automatisch ein, sobald der Bus schneller als 50 Meilen in der Stunde f�hrt und detoniert sofort, sobald die Geschwindigkeit sinkt. Pl�tzlich wird f�r eine Handvoll ahnungsloser Durchschnittsb�rger der Weg zur Arbeit zum H�llentrip - und nur Jack hat ihr Leben in der Hand. Als der Busfahrer verletzt wird, �bernimmt Fahrgast Annie (Sandra Bullock) das Steuer. Doch wohin mit einem Bus, der nicht bremsen kann in der Stadt der Staus? Doch es kommt noch schlimmer: Payne (Dennis Hopper) will jetzt nicht nur seine drei Millionen Dollar. Er will Jack. Um jeden Preis.','',0);
INSERT INTO products_description VALUES (18,3,'Speed 2: Cruise Control','Originaltitel: &quot;Speed 2 - Cruise Control&quot;<br><br>\r\nRegional Code: 2 (Japan, Europe, Middle East, South Africa).<br>\r\nSprachen: English, Deutsch.<br>\r\nUntertitel: English, Deutsch, Spanish.<br>\r\nAudio: Dolby Surround 5.1.<br>\r\nBildformat: 16:9 Wide-Screen.<br>\r\nDauer: (approx) 96 minuten.<br>\r\nAu�erdem: Interaktive Menus, Kapitelauswahl, Untertitel.<br><br>\r\nHalten Sie ihre Schwimmwesten bereit, denn die actiongeladene Fortsetzung von Speed begibt sich auf Hochseekurs. Erleben Sie Sandra Bullock erneut in ihrer Star-Rolle als Annie Porter. Die Karibik-Kreuzfahrt mit ihrem Freund Alex entwickelt sich unaufhaltsam zur rasenden Todesfahrt, als ein wahnsinniger Computer-Spezialist den Luxusliner in seine Gewalt bringt und auf einen m�rderischen Zerst�rungskurs programmiert. Eine hochexplosive Reise, bei der kein geringerer als Action-Spezialist Jan De Bont das Ruder in die Hand nimmt. Speed 2: Cruise Controll l��t ihre Adrenalin-Wellen in rasender Geschwindigkeit ganz nach oben schnellen.','',0);
INSERT INTO products_description VALUES (19,3,'Verr�ckt nach Mary','Originaltitel: &quot;There\'s Something About Mary&quot;<br><br>\r\nRegional Code: 2 (Japan, Europe, Middle East, South Africa).<br>\r\nSprachen: English, Deutsch.<br>\r\nUntertitel: English, Deutsch, Spanish.<br>\r\nAudio: Dolby Surround 5.1.<br>\r\nBildformat: 16:9 Wide-Screen.<br>\r\nDauer: (approx) 96 minuten.<br>\r\nAu�erdem: Interaktive Menus, Kapitelauswahl, Untertitel.<br><br>\r\n13 Jahre nachdem Teds Rendezvous mit seiner angebeteten Mary in einem peinlichen Fiasko endete, tr�umt er immer noch von ihr und engagiert den windigen Privatdetektiv Healy um sie aufzusp�ren. Der findet Mary in Florida und verliebt sich auf den ersten Blick in die atemberaubende Traumfrau. Um Ted als Nebenbuhler auszuschalten, tischt er ihm dicke L�gen �ber Mary auf. Ted l��t sich jedoch nicht abschrecken, eilt nach Miami und versucht nun alles, um Healy die Balztour zu vermasseln. Doch nicht nur Healy ist verr�ckt nach Mary und Ted bekommt es mit einer ganzen Legion liebeskranker Konkurrenten zu tun ...','',0);
INSERT INTO products_description VALUES (20,3,'Menschenkind','Originaltitel: &quot;Beloved&quot;<br><br>\r\nRegional Code: 2 (Japan, Europe, Middle East, South Africa).<br>\r\nSprachen: English, Deutsch.<br>\r\nUntertitel: English, Deutsch, Spanish.<br>\r\nAudio: Dolby Surround 5.1.<br>\r\nBildformat: 16:9 Wide-Screen.<br>\r\nDauer: (approx) 96 minuten.<br>\r\nAu�erdem: Interaktive Menus, Kapitelauswahl, Untertitel.<br><br>\r\nDieser vielschichtige Film ist eine Arbeit, die Regisseur Jonathan Demme und dem amerikanischen Talkshow-Star Oprah Winfrey sehr am Herzen lag. Der Film deckt im Verlauf seiner dreist�ndigen Spielzeit viele Bereiche ab. Menschenkind ist teils Sklavenepos, teils Mutter-Tochter-Drama und teils Geistergeschichte.<br><br>\r\nDer Film fordert vom Publikum h�chste Aufmerksamkeit, angefangen bei seiner dramatischen und etwas verwirrenden Eingangssequenz, in der die Bewohner eines Hauses von einem niedertr�chtigen �bersinnlichen Angriff heimgesucht werden. Aber Demme und seine talentierte Besetzung bereiten denen, die dabei bleiben ein unvergessliches Erlebnis. Der Film folgt den Spuren von Sethe (in ihren mittleren Jahren von Oprah Winfrey dargestellt), einer ehemaligen Sklavin, die sich scheinbar ein friedliches und produktives Leben in Ohio aufgebaut hat. Aber durch den erschreckenden und sparsamen Einsatz von R�ckblenden deckt Demme, genau wie das literarische Meisterwerk von Toni Morrison, auf dem der Film basiert, langsam die Schrecken von Sethes fr�herem Leben auf und das schreckliche Ereignis, dass dazu f�hrte, dass Sethes Haus von Geistern heimgesucht wird.<br><br>\r\nW�hrend die Gr�uel der Sklaverei und das blutige Ereignis in Sethes Familie unleugbar tief beeindrucken, ist die Qualit�t des Film auch in kleineren, genauso befriedigenden Details sichtbar. Die geistlich beeinflusste Musik von Rachel Portman ist gleichzeitig befreiend und bedr�ckend, und der Einblick in die afro-amerikanische Gemeinschaft nach der Sklaverei -- am Beispiel eines Familienausflugs zu einem Jahrmarkt, oder dem gospelsingenden N�hkr�nzchen -- machen diesen Film zu einem speziellen Vergn�gen sowohl f�r den Geist als auch f�r das Herz. Die Schauspieler, besonders Kimberley Elise als Sethes k�mpfende Tochter und Thandie Newton als der mysteri�se Titelcharakter, sind sehr r�hrend. Achten Sie auch auf Danny Glover (Lethal Weapon) als Paul D.','',0);
INSERT INTO products_description VALUES (21,3,'SWAT 3: Elite Edition','<b>KEINE KOMPROMISSE!</b><br><i>K�mpfen Sie Seite an Seite mit Ihren LAPD SWAT-Kameraden gegen das organisierte Verbrechen!</i><br><br>\r\nEine der realistischsten 3D-Taktiksimulationen der letzten Zeit jetzt mit Multiplayer-Modus, 5 neuen Missionen und jede Menge n�tzliche Tools!<br><br>\r\nLos Angeles, 2005. In wenigen Tagen steht die Unterzeichnung des Abkommens der Vereinten Nationen zur Atom-�chtung durch Vertreter aller Nationen der Welt an. Radikale terroristische Vereinigungen machen sich in der ganzen Stadt breit. Verantwortlich f�r die Sicherheit der Delegierten zeichnet sich eine Eliteeinheit der LAPD: das SWAT-Team. Das Schicksal der Stadt liegt in Ihren H�nden.<br><br>\r\n<b>Neue Features:</b>\r\n<ul>\r\n<li>Multiplayer-Modus (Co op-Modus, Deathmatch in den bekannten Variationen)</li>\r\n<li>5 neue Missionen an original �rtlichkeiten Las (U-Bahn, Whitman Airport, etc.)</li>\r\n<li>neue Charakter</li>\r\n<li>neue Skins</li>\r\n<li>neue Waffen</li>\r\n<li>neue Sounds</li>\r\n<li>verbesserte KI</li>\r\n<li>Tools-Package</li>\r\n<li>Scenario-Editor</li>\r\n<li>Level-Editor</li>\r\n</ul>\r\nDie dritte Folge der Bestseller-Reihe im Bereich der 3D-Echtzeit-Simulationen pr�sentiert sich mit einer neuen Spielengine mit extrem ausgepr�gtem Realismusgrad. Der Spieler �bernimmt das Kommando �ber eine der besten Polizei-Spezialeinheiten oder einer der �belsten Terroristen-Gangs der Welt. Er durchl�uft - als \"Guter\" oder \"B�ser\" - eine der h�rtesten und elit�rsten Kampfausbildungen, in der er lernt, mit jeder Art von Krisensituationen umzugehen. Bei diesem Action-Abenteuer geht es um das Leben prominenter Vertreter der Vereinten Nationen und bei 16 Missionen an Originalschaupl�tzen in LA gibt die \"lebensechte\" KI den Protagonisten jeder Seite so einige harte N�sse zu knacken.','www.swat3.com',0);
INSERT INTO products_description VALUES (22,3,'Unreal Tournament','2341: Die Gewalt ist eine Lebensweise, die sich ihren Weg durch die dunklen Risse der Gesellschaft bahnt. Sie bedroht die Macht und den Einfluss der regierenden Firmen, die schnellstens ein Mittel finden m�ssen, die tobenden Massen zu bes�nftigen - ein profitables Mittel ... Gladiatorenk�mpfe sind die L�sung. Sie sollen den Durst der Menschen nach Blut stillen und sind die perfekte Gelegenheit, die Aufst�ndischen, Kriminellen und Aliens zu beseitigen, die die Firmenelite bedrohen.<br><br>\r\nDas Turnier war geboren - ein Kampf auf Leben und Tod. Galaxisweit live und in Farbe! K�mpfen Sie f�r Freiheit, Ruhm und Ehre. Sie m�ssen stark, schnell und geschickt sein ... oder Sie bleiben auf der Strecke.<br><br>\r\nK�mpfen Sie allein oder kommandieren Sie ein Team gegen Armeen unbarmherziger Krieger, die alle nur ein Ziel vor Augen haben: Die Arenen lebend zu verlassen und sich dem Grand Champion zu stellen ... um ihn dann zu bezwingen!<br><br>\r\n<b>Features:</b>\r\n<ul>\r\n<li>Auf dem PC mehrfach als Spiel des Jahres ausgezeichnet!</li>\r\n<li>Mehr als 50 faszinierende Level - verlassene Raumstationen, gotische Kathedralen und graffitibedeckte Gro�st�dte.</li>\r\n<li>Vier actionreiche Spielmodi - Deathmatch, Capture the Flag, Assault und Domination werden Ihren Adrenalinpegel in die H�he schnellen lassen.</li>\r\n<li>Dramatische Mehrspieler-K�mpfe mit 2, 3 und 4 Spielern, auch �ber das Netzwerk</li>\r\n<li>Gnadenlos aggressive Computergegner verlangen Ihnen das �u�erste ab.</li>\r\n<li>Neuartiges Benutzerinterface und verbesserte Steuerung - auch mit USB-Maus und -Tastatur spielbar.</li>\r\n</ul>\r\nDer Nachfolger des Actionhits \"Unreal\" verspricht ein leichtes, intuitives Interface, um auch Einsteigern schnellen Zugang zu den Duellen gegen die Bots zu erm�glichen. Mit diesen KI-Kriegern kann man auch Teams bilden und im umfangreichen Multiplayermodus ohne Onlinekosten in den Kampf ziehen. 35 komplett neue Arenen und das erweiterte Waffenangebot bilden dazu den w�rdigen Rahmen.','www.unrealtournament.net',0);
INSERT INTO products_description VALUES (23,3,'The Wheel Of Time','<b><i>\"Wheel Of Time\"(Das Rad der Zeit)</i></b> basiert auf den Fantasy-Romanen von Kultautor Robert Jordan und stellt einen einzigartigen Mix aus Strategie-, Action- und Rollenspielelementen dar. Obwohl die Welt von \"Wheel of Time\" eng an die literarische Vorlage der Romane angelehnt ist, erz�hlt das Spiel keine lineare Geschichte. Die Story entwickelt sich abh�ngig von den Aktionen der Spieler, die jeweils die Rollen der Hauptcharaktere aus dem Roman �bernehmen. Jede Figur hat den Oberbefehl �ber eine gro�e Gefolgschaft, milit�rische Einheiten und L�ndereien. Die Spieler k�nnen ihre eigenen Festungen konstruieren, individuell ausbauen, von dort aus das umliegende Land erforschen, magische Gegenst�nde sammeln oder die gegnerischen Zitadellen erst�rmen. Selbstverst�ndlich kann man sich auch �ber LAN oder Internet gegenseitig Truppen auf den Hals hetzen und die Festungen seiner Mitspieler in Schutt und Asche legen. Dreh- und Anlegepunkt von \"Wheel of Time\" ist der Kampf um die finstere Macht \"The Dark One\", die vor langer Zeit die Menschheit beinahe ins Verderben st�rzte und nur mit Hilfe gewaltiger magischer Energie verbannt werden konnte. \"The Amyrlin Seat\" und \"The Children of the Night\" k�mpfen nur gegen \"The Forsaken\" und \"The Hound\" um den Besitz des Schl�ssels zu \"Shayol Ghul\" - dem magischen Siegel, mit dessen Hilfe \"The Dark One\" seinerzeit gebannt werden konnte.<br><br>\r\n<b>Features:</b> \r\n<ul>\r\n<li>Ego-Shooter mit Strategie-Elementen</li>\r\n<li>Spielumgebung in Echtzeit-3D</li>\r\n<li>Konstruktion aud Ausbau der eigenen Festung</li>\r\n<li>Einsatz von �ber 100 Artefakten und Zauberspr�chen</li>\r\n<li>Single- und Multiplayermodus</li>\r\n</ul>\r\nIm Mittelpunkt steht der Kampf gegen eine finstere Macht namens The Dark One. Deren Schergen m�ssen mit dem Einsatz von �ber 100 Artefakten und Zaubereien wie Blitzschlag oder Teleportation aus dem Weg ger�umt werden. Die opulente 3D-Grafik verbindet Strategie- und Rollenspielelemente. \r\n\r\n<b>Voraussetzungen</b>\r\nmind. P200, 32MB RAM, 4x CD-Rom, Win95/98, DirectX 5.0 komp.Grafikkarte und Soundkarte. ','www.wheeloftime.com',0);
INSERT INTO products_description VALUES (24,3,'Disciples: Sacred Land','Rundenbasierende Fantasy/RTS-Strategie mit gutem Design (vor allem die Levels, 4 versch. Rassen, tolle Einheiten), fantastischer Atmosph�re und exzellentem Soundtrack. Grafisch leider auf das Niveau von 1990.','www.strategyfirst.com/disciples/welcome.html',0);
INSERT INTO products_description VALUES (25,3,'Microsoft Internet Tastatur PS/2','<i>Microsoft Internet Keyboard,Windows-Tastatur mit 10 zus�tzl. Tasten,2 selbst programmierbar, abnehmbareHandgelenkauflage. Treiber im Lieferumfang.</i><br><br>\r\nEin-Klick-Zugriff auf das Internet und vieles mehr! Das Internet Keyboard verf�gt �ber 10 zus�tzliche Abk�rzungstasten auf einer benutzerfreundlichen Standardtastatur, die dar�ber hinaus eine abnehmbare Handballenauflage aufweist. �ber die Abk�rzungstasten k�nnen Sie durch das Internet surfen oder direkt von der Tastatur aus auf E-Mails zugreifen. Die IntelliType Pro-Software erm�glicht au�erdem das individuelle Belegen der Tasten.','',0);
INSERT INTO products_description VALUES (26,3,'Microsof IntelliMouse Explorer','Die IntelliMouse Explorer �berzeugt durch ihr modernes Design mit silberfarbenem Geh�use, sowie rot schimmernder Unter- und R�ckseite. Die neuartige IntelliEye-Technologie sorgt f�r eine noch nie dagewesene Pr�zision, da statt der beweglichen Teile (zum Abtasten der Bewegungs�nderungen an der Unterseite der Maus) ein optischer Sensor die Bewegungen der Maus erfa�t. Das Herzst�ck der Microsoft IntelliEye-Technologie ist ein kleiner Chip, der einen optischen Sensor und einen digitalen Signalprozessor (DSP) enth�lt.<br><br>\r\nDa auf bewegliche Teile, die Staub, Schmutz und Fett aufnehmen k�nnen, verzichtet wurde, mu� die IntelliMouse Explorer nicht mehr gereinigt werden. Dar�ber hinaus arbeitet die IntelliMouse Explorer auf nahezu jeder Arbeitsoberfl�che, so da� kein Mauspad mehr erforderlich ist. Mit dem Rad und zwei neuen zus�tzlichen Maustasten erm�glicht sie effizientes und komfortables Arbeiten am PC.<br><br>\r\n<b>Eigenschaften:</b>\r\n<ul>\r\n<li><b>ANSCHLUSS:</b> USB (PS/2-Adapter enthalten)</li>\r\n<li><b>FARBE:</b> metallic-grau</li>\r\n<li><b>TECHNIK:</b> Optisch (Akt.: ca. 1500 Bilder/s)</li>\r\n<li><b>TASTEN:</b> 5 (incl. Scrollrad)</li>\r\n<li><b>SCROLLRAD:</b> Ja</li>\r\n</ul>\r\n<i><b>BEMERKUNG:</b><br>Keine Reinigung bewegter Teile mehr notwendig, da statt der Mauskugel ein Fotoempf�nger benutzt wird.</i>','',0);
INSERT INTO products_description VALUES (27,3,'Hewlett-Packard LaserJet 1100Xi','<b>HP LaserJet f�r mehr Produktivit�t und Flexibilit�t am Arbeitsplatz</b><br><br>\r\nDer HP LaserJet 1100Xi Drucker verbindet exzellente Laserdruckqualit�t mit hoher Geschwindigkeit f�r mehr Effizienz.<br><br>\r\n<b>Zielkunden</b>\r\n<ul><li>Einzelanwender, die Wert auf professionelle Ausdrucke in Laserqualit�t legen und schnelle Ergebnisse auch bei komplexen Dokumenten erwarten.</li>\r\n<li>Der HP LaserJet 1100 sorgt mit gestochen scharfen Texten und Grafiken f�r ein professionelles Erscheinungsbild Ihrer Arbeit und Ihres Unternehmens. Selbst bei komplexen Dokumenten liefert er schnelle Ergebnisse. Andere Medien - wie z.B. Transparentfolien und Briefumschl�ge, etc. - lassen sich problemlos bedrucken. Somit ist der HP LaserJet 1100 ein Multifunktionstalent im B�roalltag.</li>\r\n</ul>\r\n<b>Eigenschaften</b>\r\n<ul>\r\n<li><b>Druckqualit�t</b> Schwarzwei�: 600 x 600 dpi</li>\r\n<li><b>Monatliche Druckleistung</b> Bis zu 7000 Seiten</li>\r\n<li><b>Speicher</b> 2 MB Standardspeicher, erweiterbar auf 18 MB</li>\r\n<li><b>Schnittstelle/gemeinsame Nutzung</b> Parallel, IEEE 1284-kompatibel</li>\r\n<li><b>Softwarekompatibilit�t</b> DOS/Win 3.1x/9x/NT 4.0</li>\r\n<li><b>Papierzuf�hrung</b> 125-Blatt-Papierzuf�hrung</li>\r\n<li><b>Druckmedien</b> Normalpapier, Briefumschl�ge, Transparentfolien, kartoniertes Papier, Postkarten und Etiketten</li>\r\n<li><b>Netzwerkf�hig</b> �ber HP JetDirect PrintServer</li>\r\n<li><b>Lieferumfang</b> HP LaserJet 1100Xi Drucker (Lieferumfang: Drucker, Tonerkassette, 2 m Parallelkabel, Netzkabel, Kurzbedienungsanleitung, Benutzerhandbuch, CD-ROM, 3,5\"-Disketten mit Windows� 3.1x, 9x, NT 4.0 Treibern und DOS-Dienstprogrammen)</li>\r\n<li><b>Gew�hrleistung</b> Ein Jahr</li>\r\n</ul>\r\n','www.hp.com',0);
INSERT INTO products_description VALUES (1,4,'Matrox G200 MMS','Reinforcing its position as a multi-monitor trailblazer, Matrox Graphics Inc. has once again developed the most flexible and highly advanced solution in the industry. Introducing the new Matrox G200 Multi-Monitor Series; the first graphics card ever to support up to four DVI digital flat panel displays on a single 8&quot; PCI board.<br><br>With continuing demand for digital flat panels in the financial workplace, the Matrox G200 MMS is the ultimate in flexible solutions. The Matrox G200 MMS also supports the new digital video interface (DVI) created by the Digital Display Working Group (DDWG) designed to ease the adoption of digital flat panels. Other configurations include composite video capture ability and onboard TV tuner, making the Matrox G200 MMS the complete solution for business needs.<br><br>Based on the award-winning MGA-G200 graphics chip, the Matrox G200 Multi-Monitor Series provides superior 2D/3D graphics acceleration to meet the demanding needs of business applications such as real-time stock quotes (Versus), live video feeds (Reuters & Bloombergs), multiple windows applications, word processing, spreadsheets and CAD.','www.matrox.com/mga/products/g200_mms/home.cfm',0);
INSERT INTO products_description VALUES (2,4,'Matrox G400 32MB','<b>Dramatically Different High Performance Graphics</b><br><br>Introducing the Millennium G400 Series - a dramatically different, high performance graphics experience. Armed with the industry\'s fastest graphics chip, the Millennium G400 Series takes explosive acceleration two steps further by adding unprecedented image quality, along with the most versatile display options for all your 3D, 2D and DVD applications. As the most powerful and innovative tools in your PC\'s arsenal, the Millennium G400 Series will not only change the way you see graphics, but will revolutionize the way you use your computer.<br><br><b>Key features:</b><ul><li>New Matrox G400 256-bit DualBus graphics chip</li><li>Explosive 3D, 2D and DVD performance</li><li>DualHead Display</li><li>Superior DVD and TV output</li><li>3D Environment-Mapped Bump Mapping</li><li>Vibrant Color Quality rendering </li><li>UltraSharp DAC of up to 360 MHz</li><li>3D Rendering Array Processor</li><li>Support for 16 or 32 MB of memory</li></ul>','www.matrox.com/mga/products/mill_g400/home.htm',0);
INSERT INTO products_description VALUES (3,4,'Microsoft IntelliMouse Pro','Every element of IntelliMouse Pro - from its unique arched shape to the texture of the rubber grip around its base - is the product of extensive customer and ergonomic research. Microsoft\'s popular wheel control, which now allows zooming and universal scrolling functions, gives IntelliMouse Pro outstanding comfort and efficiency.','www.microsoft.com/hardware/mouse/intellimouse.asp',0);
INSERT INTO products_description VALUES (4,4,'The Replacement Killers','Regional Code: 2 (Japan, Europe, Middle East, South Africa).<br>Languages: English, Deutsch.<br>Subtitles: English, Deutsch, Spanish.<br>Audio: Dolby Surround 5.1.<br>Picture Format: 16:9 Wide-Screen.<br>Length: (approx) 80 minutes.<br>Other: Interactive Menus, Chapter Selection, Subtitles (more languages).','www.replacement-killers.com',0);
INSERT INTO products_description VALUES (5,4,'Blade Runner - Director\'s Cut','Regional Code: 2 (Japan, Europe, Middle East, South Africa).<br>Languages: English, Deutsch.<br>Subtitles: English, Deutsch, Spanish.<br>Audio: Dolby Surround 5.1.<br>Picture Format: 16:9 Wide-Screen.<br>Length: (approx) 112 minutes.<br>Other: Interactive Menus, Chapter Selection, Subtitles (more languages).','www.bladerunner.com',0);
INSERT INTO products_description VALUES (6,4,'The Matrix','Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br>\nLanguages: English, Deutsch.\r<br>\nSubtitles: English, Deutsch.\r<br>\nAudio: Dolby Surround.\r<br>\nPicture Format: 16:9 Wide-Screen.\r<br>\nLength: (approx) 131 minutes.\r<br>\nOther: Interactive Menus, Chapter Selection, Making Of.','www.thematrix.com',0);
INSERT INTO products_description VALUES (7,4,'You\'ve Got Mail','Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br>\nLanguages: English, Deutsch, Spanish.\r<br>\nSubtitles: English, Deutsch, Spanish, French, Nordic, Polish.\r<br>\nAudio: Dolby Digital 5.1.\r<br>\nPicture Format: 16:9 Wide-Screen.\r<br>\nLength: (approx) 115 minutes.\r<br>\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).','www.youvegotmail.com',0);
INSERT INTO products_description VALUES (8,4,'A Bug\'s Life','Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br>\nLanguages: English, Deutsch.\r<br>\nSubtitles: English, Deutsch, Spanish.\r<br>\nAudio: Dolby Digital 5.1 / Dobly Surround Stereo.\r<br>\nPicture Format: 16:9 Wide-Screen.\r<br>\nLength: (approx) 91 minutes.\r<br>\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).','www.abugslife.com',0);
INSERT INTO products_description VALUES (9,4,'Under Siege','Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br>\nLanguages: English, Deutsch.\r<br>\nSubtitles: English, Deutsch, Spanish.\r<br>\nAudio: Dolby Surround 5.1.\r<br>\nPicture Format: 16:9 Wide-Screen.\r<br>\nLength: (approx) 98 minutes.\r<br>\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).','',0);
INSERT INTO products_description VALUES (10,4,'Under Siege 2 - Dark Territory','Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br>\nLanguages: English, Deutsch.\r<br>\nSubtitles: English, Deutsch, Spanish.\r<br>\nAudio: Dolby Surround 5.1.\r<br>\nPicture Format: 16:9 Wide-Screen.\r<br>\nLength: (approx) 98 minutes.\r<br>\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).','',0);
INSERT INTO products_description VALUES (11,4,'Fire Down Below','Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br>\nLanguages: English, Deutsch.\r<br>\nSubtitles: English, Deutsch, Spanish.\r<br>\nAudio: Dolby Surround 5.1.\r<br>\nPicture Format: 16:9 Wide-Screen.\r<br>\nLength: (approx) 100 minutes.\r<br>\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).','',0);
INSERT INTO products_description VALUES (12,4,'Die Hard With A Vengeance','Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br>\nLanguages: English, Deutsch.\r<br>\nSubtitles: English, Deutsch, Spanish.\r<br>\nAudio: Dolby Surround 5.1.\r<br>\nPicture Format: 16:9 Wide-Screen.\r<br>\nLength: (approx) 122 minutes.\r<br>\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).','',0);
INSERT INTO products_description VALUES (13,4,'Lethal Weapon','Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br>\nLanguages: English, Deutsch.\r<br>\nSubtitles: English, Deutsch, Spanish.\r<br>\nAudio: Dolby Surround 5.1.\r<br>\nPicture Format: 16:9 Wide-Screen.\r<br>\nLength: (approx) 100 minutes.\r<br>\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).','',0);
INSERT INTO products_description VALUES (14,4,'Red Corner','Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br>\nLanguages: English, Deutsch.\r<br>\nSubtitles: English, Deutsch, Spanish.\r<br>\nAudio: Dolby Surround 5.1.\r<br>\nPicture Format: 16:9 Wide-Screen.\r<br>\nLength: (approx) 117 minutes.\r<br>\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).','',0);
INSERT INTO products_description VALUES (15,4,'Frantic','Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br>\nLanguages: English, Deutsch.\r<br>\nSubtitles: English, Deutsch, Spanish.\r<br>\nAudio: Dolby Surround 5.1.\r<br>\nPicture Format: 16:9 Wide-Screen.\r<br>\nLength: (approx) 115 minutes.\r<br>\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).','',0);
INSERT INTO products_description VALUES (16,4,'Courage Under Fire','Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br>\nLanguages: English, Deutsch.\r<br>\nSubtitles: English, Deutsch, Spanish.\r<br>\nAudio: Dolby Surround 5.1.\r<br>\nPicture Format: 16:9 Wide-Screen.\r<br>\nLength: (approx) 112 minutes.\r<br>\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).','',0);
INSERT INTO products_description VALUES (17,4,'Speed','Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br>\nLanguages: English, Deutsch.\r<br>\nSubtitles: English, Deutsch, Spanish.\r<br>\nAudio: Dolby Surround 5.1.\r<br>\nPicture Format: 16:9 Wide-Screen.\r<br>\nLength: (approx) 112 minutes.\r<br>\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).','',0);
INSERT INTO products_description VALUES (18,4,'Speed 2: Cruise Control','Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br>\nLanguages: English, Deutsch.\r<br>\nSubtitles: English, Deutsch, Spanish.\r<br>\nAudio: Dolby Surround 5.1.\r<br>\nPicture Format: 16:9 Wide-Screen.\r<br>\nLength: (approx) 120 minutes.\r<br>\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).','',0);
INSERT INTO products_description VALUES (19,4,'There\'s Something About Mary','Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br>\nLanguages: English, Deutsch.\r<br>\nSubtitles: English, Deutsch, Spanish.\r<br>\nAudio: Dolby Surround 5.1.\r<br>\nPicture Format: 16:9 Wide-Screen.\r<br>\nLength: (approx) 114 minutes.\r<br>\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).','',0);
INSERT INTO products_description VALUES (20,4,'Beloved','Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br>\nLanguages: English, Deutsch.\r<br>\nSubtitles: English, Deutsch, Spanish.\r<br>\nAudio: Dolby Surround 5.1.\r<br>\nPicture Format: 16:9 Wide-Screen.\r<br>\nLength: (approx) 164 minutes.\r<br>\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).','',0);
INSERT INTO products_description VALUES (21,4,'SWAT 3: Close Quarters Battle','<b>Windows 95/98</b><br><br>211 in progress with shots fired. Officer down. Armed suspects with hostages. Respond Code 3! Los Angles, 2005, In the next seven days, representatives from every nation around the world will converge on Las Angles to witness the signing of the United Nations Nuclear Abolishment Treaty. The protection of these dignitaries falls on the shoulders of one organization, LAPD SWAT. As part of this elite tactical organization, you and your team have the weapons and all the training necessary to protect, to serve, and \"When needed\" to use deadly force to keep the peace. It takes more than weapons to make it through each mission. Your arsenal includes C2 charges, flashbangs, tactical grenades. opti-Wand mini-video cameras, and other devices critical to meeting your objectives and keeping your men free of injury. Uncompromised Duty, Honor and Valor!','www.swat3.com',0);
INSERT INTO products_description VALUES (22,4,'Unreal Tournament','From the creators of the best-selling Unreal, comes Unreal Tournament. A new kind of single player experience. A ruthless multiplayer revolution.<br><br>This stand-alone game showcases completely new team-based gameplay, groundbreaking multi-faceted single player action or dynamic multi-player mayhem. It\'s a fight to the finish for the title of Unreal Grand Master in the gladiatorial arena. A single player experience like no other! Guide your team of \'bots\' (virtual teamates) against the hardest criminals in the galaxy for the ultimate title - the Unreal Grand Master.','www.unrealtournament.net',0);
INSERT INTO products_description VALUES (23,4,'The Wheel Of Time','The world in which The Wheel of Time takes place is lifted directly out of Jordan\'s pages; it\'s huge and consists of many different environments. How you navigate the world will depend largely on which game - single player or multipayer - you\'re playing. The single player experience, with a few exceptions, will see Elayna traversing the world mainly by foot (with a couple notable exceptions). In the multiplayer experience, your character will have more access to travel via Ter\'angreal, Portal Stones, and the Ways. However you move around, though, you\'ll quickly discover that means of locomotion can easily become the least of the your worries...<br><br>During your travels, you quickly discover that four locations are crucial to your success in the game. Not surprisingly, these locations are the homes of The Wheel of Time\'s main characters. Some of these places are ripped directly from the pages of Jordan\'s books, made flesh with Legend\'s unparalleled pixel-pushing ways. Other places are specific to the game, conceived and executed with the intent of expanding this game world even further. Either way, they provide a backdrop for some of the most intense first person action and strategy you\'ll have this year.','www.wheeloftime.com',0);
INSERT INTO products_description VALUES (24,4,'Disciples: Sacred Lands','A new age is dawning...<br><br>Enter the realm of the Sacred Lands, where the dawn of a New Age has set in motion the most momentous of wars. As the prophecies long foretold, four races now clash with swords and sorcery in a desperate bid to control the destiny of their gods. Take on the quest as a champion of the Empire, the Mountain Clans, the Legions of the Damned, or the Undead Hordes and test your faith in battles of brute force, spellbinding magic and acts of guile. Slay demons, vanquish giants and combat merciless forces of the dead and undead. But to ensure the salvation of your god, the hero within must evolve.<br><br>The day of reckoning has come... and only the chosen will survive.','',0);
INSERT INTO products_description VALUES (25,4,'Microsoft Internet Keyboard PS/2','The Internet Keyboard has 10 Hot Keys on a comfortable standard keyboard design that also includes a detachable palm rest. The Hot Keys allow you to browse the web, or check e-mail directly from your keyboard. The IntelliType Pro software also allows you to customize your hot keys - make the Internet Keyboard work the way you want it to!','',0);
INSERT INTO products_description VALUES (26,4,'Microsoft IntelliMouse Explorer','Microsoft introduces its most advanced mouse, the IntelliMouse Explorer! IntelliMouse Explorer features a sleek design, an industrial-silver finish, a glowing red underside and taillight, creating a style and look unlike any other mouse. IntelliMouse Explorer combines the accuracy and reliability of Microsoft IntelliEye optical tracking technology, the convenience of two new customizable function buttons, the efficiency of the scrolling wheel and the comfort of expert ergonomic design. All these great features make this the best mouse for the PC!','www.microsoft.com/hardware/mouse/explorer.asp',0);
INSERT INTO products_description VALUES (27,4,'Hewlett Packard LaserJet 1100Xi','HP has always set the pace in laser printing technology. The new generation HP LaserJet 1100 series sets another impressive pace, delivering a stunning 8 pages per minute print speed. The 600 dpi print resolution with HP\'s Resolution Enhancement technology (REt) makes every document more professional.<br><br>Enhanced print speed and laser quality results are just the beginning. With 2MB standard memory, HP LaserJet 1100xi users will be able to print increasingly complex pages. Memory can be increased to 18MB to tackle even more complex documents with ease. The HP LaserJet 1100xi supports key operating systems including Windows 3.1, 3.11, 95, 98, NT 4.0, OS/2 and DOS. Network compatibility available via the optional HP JetDirect External Print Servers.<br><br>HP LaserJet 1100xi also features The Document Builder for the Web Era from Trellix Corp. (featuring software to create Web documents).','www.pandi.hp.com/pandi-db/prodinfo.main?product=laserjet1100',0);

INSERT INTO products_attributes VALUES (1,1,4,1,0.00,'+');
INSERT INTO products_attributes VALUES (2,1,4,2,50.00,'+');
INSERT INTO products_attributes VALUES (3,1,4,3,70.00,'+');
INSERT INTO products_attributes VALUES (4,1,3,5,0.00,'+');
INSERT INTO products_attributes VALUES (5,1,3,6,100.00,'+');
INSERT INTO products_attributes VALUES (6,2,4,3,10.00,'-');
INSERT INTO products_attributes VALUES (7,2,4,4,0.00,'+');
INSERT INTO products_attributes VALUES (8,2,3,6,0.00,'+');
INSERT INTO products_attributes VALUES (9,2,3,7,120.00,'+');
INSERT INTO products_attributes VALUES (10,26,3,8,0.00,'+');
INSERT INTO products_attributes VALUES (11,26,3,9,6.00,'+');
INSERT INTO products_attributes VALUES (26, 22, 5, 10, '0.00', '+');
INSERT INTO products_attributes VALUES (27, 22, 5, 13, '0.00', '+');

INSERT INTO products_attributes_download VALUES (26, 'unreal.zip', 7, 3);

INSERT INTO products_options VALUES (1,1,'Cor');
INSERT INTO products_options VALUES (2,1,'Tamanho');
INSERT INTO products_options VALUES (3,1,'Modelo');
INSERT INTO products_options VALUES (4,1,'Mem�ria');
INSERT INTO products_options VALUES (1,2,'Color');
INSERT INTO products_options VALUES (2,2,'Size');
INSERT INTO products_options VALUES (3,2,'Model');
INSERT INTO products_options VALUES (4,2,'Memory');
INSERT INTO products_options VALUES (1,3,'Farbe');
INSERT INTO products_options VALUES (2,3,'Gr��e');
INSERT INTO products_options VALUES (3,3,'Modell');
INSERT INTO products_options VALUES (4,3,'Speicher');
INSERT INTO products_options VALUES (1,4,'Color');
INSERT INTO products_options VALUES (2,4,'Talla');
INSERT INTO products_options VALUES (3,4,'Modelo');
INSERT INTO products_options VALUES (4,4,'Memoria');
INSERT INTO products_options VALUES (5, 4, 'Version');
INSERT INTO products_options VALUES (5, 3, 'Version');
INSERT INTO products_options VALUES (5, 2, 'Version');
INSERT INTO products_options VALUES (5, 1, 'Version');

INSERT INTO products_options_values VALUES (1,1,'4 mb');
INSERT INTO products_options_values VALUES (2,1,'8 mb');
INSERT INTO products_options_values VALUES (3,1,'16 mb');
INSERT INTO products_options_values VALUES (4,1,'32 mb');
INSERT INTO products_options_values VALUES (5,1,'Value');
INSERT INTO products_options_values VALUES (6,1,'Premium');
INSERT INTO products_options_values VALUES (7,1,'Deluxe');
INSERT INTO products_options_values VALUES (8,1,'PS/2');
INSERT INTO products_options_values VALUES (9,1,'USB');
INSERT INTO products_options_values VALUES (1,2,'4 mb');
INSERT INTO products_options_values VALUES (2,2,'8 mb');
INSERT INTO products_options_values VALUES (3,2,'16 mb');
INSERT INTO products_options_values VALUES (4,2,'32 mb');
INSERT INTO products_options_values VALUES (5,2,'Value');
INSERT INTO products_options_values VALUES (6,2,'Premium');
INSERT INTO products_options_values VALUES (7,2,'Deluxe');
INSERT INTO products_options_values VALUES (8,2,'PS/2');
INSERT INTO products_options_values VALUES (9,2,'USB');
INSERT INTO products_options_values VALUES (1,3,'4 MB');
INSERT INTO products_options_values VALUES (2,3,'8 MB');
INSERT INTO products_options_values VALUES (3,3,'16 MB');
INSERT INTO products_options_values VALUES (4,3,'32 MB');
INSERT INTO products_options_values VALUES (5,3,'Value Ausgabe');
INSERT INTO products_options_values VALUES (6,3,'Premium Ausgabe');
INSERT INTO products_options_values VALUES (7,3,'Deluxe Ausgabe');
INSERT INTO products_options_values VALUES (8,3,'PS/2 Anschluss');
INSERT INTO products_options_values VALUES (9,3,'USB Anschluss');
INSERT INTO products_options_values VALUES (1,4,'4 mb');
INSERT INTO products_options_values VALUES (2,4,'8 mb');
INSERT INTO products_options_values VALUES (3,4,'16 mb');
INSERT INTO products_options_values VALUES (4,4,'32 mb');
INSERT INTO products_options_values VALUES (5,4,'Value');
INSERT INTO products_options_values VALUES (6,4,'Premium');
INSERT INTO products_options_values VALUES (7,4,'Deluxe');
INSERT INTO products_options_values VALUES (8,4,'PS/2');
INSERT INTO products_options_values VALUES (9,4,'USB');
INSERT INTO products_options_values VALUES (10, 1, 'Download: Windows - English');
INSERT INTO products_options_values VALUES (10, 2, 'Download: Windows - English');
INSERT INTO products_options_values VALUES (10, 3, 'Download: Windows - Englisch');
INSERT INTO products_options_values VALUES (10, 4, 'Download: Windows - Inglese');
INSERT INTO products_options_values VALUES (13, 1, 'Box: Windows - English');
INSERT INTO products_options_values VALUES (13, 2, 'Box: Windows - English');
INSERT INTO products_options_values VALUES (13, 3, 'Box: Windows - Englisch');
INSERT INTO products_options_values VALUES (13, 4, 'Box: Windows - Inglese');

INSERT INTO products_options_values_to_products_options VALUES (1,4,1);
INSERT INTO products_options_values_to_products_options VALUES (2,4,2);
INSERT INTO products_options_values_to_products_options VALUES (3,4,3);
INSERT INTO products_options_values_to_products_options VALUES (4,4,4);
INSERT INTO products_options_values_to_products_options VALUES (5,3,5);
INSERT INTO products_options_values_to_products_options VALUES (6,3,6);
INSERT INTO products_options_values_to_products_options VALUES (7,3,7);
INSERT INTO products_options_values_to_products_options VALUES (8,3,8);
INSERT INTO products_options_values_to_products_options VALUES (9,3,9);
INSERT INTO products_options_values_to_products_options VALUES (10, 5, 10);
INSERT INTO products_options_values_to_products_options VALUES (13, 5, 13);

INSERT INTO products_to_categories VALUES (1,4);
INSERT INTO products_to_categories VALUES (2,4);
INSERT INTO products_to_categories VALUES (3,9);
INSERT INTO products_to_categories VALUES (4,10);
INSERT INTO products_to_categories VALUES (5,11);
INSERT INTO products_to_categories VALUES (6,10);
INSERT INTO products_to_categories VALUES (7,12);
INSERT INTO products_to_categories VALUES (8,13);
INSERT INTO products_to_categories VALUES (9,10);
INSERT INTO products_to_categories VALUES (10,10);
INSERT INTO products_to_categories VALUES (11,10);
INSERT INTO products_to_categories VALUES (12,10);
INSERT INTO products_to_categories VALUES (13,10);
INSERT INTO products_to_categories VALUES (14,15);
INSERT INTO products_to_categories VALUES (15,14);
INSERT INTO products_to_categories VALUES (16,15);
INSERT INTO products_to_categories VALUES (17,10);
INSERT INTO products_to_categories VALUES (18,10);
INSERT INTO products_to_categories VALUES (19,12);
INSERT INTO products_to_categories VALUES (20,15);
INSERT INTO products_to_categories VALUES (21,18);
INSERT INTO products_to_categories VALUES (22,19);
INSERT INTO products_to_categories VALUES (23,20);
INSERT INTO products_to_categories VALUES (24,20);
INSERT INTO products_to_categories VALUES (25,8);
INSERT INTO products_to_categories VALUES (26,9);
INSERT INTO products_to_categories VALUES (27,5);

INSERT INTO reviews VALUES (1,19,1,'osCommerce Brasil',5, now(),null,0);

INSERT INTO reviews_description VALUES (1,1, 'Sem d�vida um dos filmes mais engra�ados de 1999!');

INSERT INTO specials VALUES (1,3, 39.99, now(), null, null, null, '1');
INSERT INTO specials VALUES (2,5, 30.00, now(), null, null, null, '1');
INSERT INTO specials VALUES (3,6, 30.00, now(), null, null, null, '1');
INSERT INTO specials VALUES (4,16, 29.99, now(), null, null, null, '1');

INSERT INTO tax_class VALUES (1, 'Mercadorias Tribut�veis', 'The following types of products are included non-food, services, etc', now(), now());

# USA/Florida
INSERT INTO tax_rates VALUES (1, 1, 1, 1, 7.0, 'FL TAX 7.0%', now(), now());
INSERT INTO geo_zones (geo_zone_id,geo_zone_name,geo_zone_description,date_added) VALUES (1,"Florida","Florida local sales tax zone",now());
INSERT INTO zones_to_geo_zones (association_id,zone_country_id,zone_id,geo_zone_id,date_added) VALUES (1,223,18,1,now());

# USA
INSERT INTO zones VALUES (1,223,'AL','Alabama');
INSERT INTO zones VALUES (2,223,'AK','Alaska');
INSERT INTO zones VALUES (3,223,'AS','American Samoa');
INSERT INTO zones VALUES (4,223,'AZ','Arizona');
INSERT INTO zones VALUES (5,223,'AR','Arkansas');
INSERT INTO zones VALUES (6,223,'AF','Armed Forces Africa');
INSERT INTO zones VALUES (7,223,'AA','Armed Forces Americas');
INSERT INTO zones VALUES (8,223,'AC','Armed Forces Canada');
INSERT INTO zones VALUES (9,223,'AE','Armed Forces Europe');
INSERT INTO zones VALUES (10,223,'AM','Armed Forces Middle East');
INSERT INTO zones VALUES (11,223,'AP','Armed Forces Pacific');
INSERT INTO zones VALUES (12,223,'CA','California');
INSERT INTO zones VALUES (13,223,'CO','Colorado');
INSERT INTO zones VALUES (14,223,'CT','Connecticut');
INSERT INTO zones VALUES (15,223,'DE','Delaware');
INSERT INTO zones VALUES (16,223,'DC','District of Columbia');
INSERT INTO zones VALUES (17,223,'FM','Federated States Of Micronesia');
INSERT INTO zones VALUES (18,223,'FL','Florida');
INSERT INTO zones VALUES (19,223,'GA','Georgia');
INSERT INTO zones VALUES (20,223,'GU','Guam');
INSERT INTO zones VALUES (21,223,'HI','Hawaii');
INSERT INTO zones VALUES (22,223,'ID','Idaho');
INSERT INTO zones VALUES (23,223,'IL','Illinois');
INSERT INTO zones VALUES (24,223,'IN','Indiana');
INSERT INTO zones VALUES (25,223,'IA','Iowa');
INSERT INTO zones VALUES (26,223,'KS','Kansas');
INSERT INTO zones VALUES (27,223,'KY','Kentucky');
INSERT INTO zones VALUES (28,223,'LA','Louisiana');
INSERT INTO zones VALUES (29,223,'ME','Maine');
INSERT INTO zones VALUES (30,223,'MH','Marshall Islands');
INSERT INTO zones VALUES (31,223,'MD','Maryland');
INSERT INTO zones VALUES (32,223,'MA','Massachusetts');
INSERT INTO zones VALUES (33,223,'MI','Michigan');
INSERT INTO zones VALUES (34,223,'MN','Minnesota');
INSERT INTO zones VALUES (35,223,'MS','Mississippi');
INSERT INTO zones VALUES (36,223,'MO','Missouri');
INSERT INTO zones VALUES (37,223,'MT','Montana');
INSERT INTO zones VALUES (38,223,'NE','Nebraska');
INSERT INTO zones VALUES (39,223,'NV','Nevada');
INSERT INTO zones VALUES (40,223,'NH','New Hampshire');
INSERT INTO zones VALUES (41,223,'NJ','New Jersey');
INSERT INTO zones VALUES (42,223,'NM','New Mexico');
INSERT INTO zones VALUES (43,223,'NY','New York');
INSERT INTO zones VALUES (44,223,'NC','North Carolina');
INSERT INTO zones VALUES (45,223,'ND','North Dakota');
INSERT INTO zones VALUES (46,223,'MP','Northern Mariana Islands');
INSERT INTO zones VALUES (47,223,'OH','Ohio');
INSERT INTO zones VALUES (48,223,'OK','Oklahoma');
INSERT INTO zones VALUES (49,223,'OR','Oregon');
INSERT INTO zones VALUES (50,223,'PW','Palau');
INSERT INTO zones VALUES (51,223,'PA','Pennsylvania');
INSERT INTO zones VALUES (52,223,'PR','Puerto Rico');
INSERT INTO zones VALUES (53,223,'RI','Rhode Island');
INSERT INTO zones VALUES (54,223,'SC','South Carolina');
INSERT INTO zones VALUES (55,223,'SD','South Dakota');
INSERT INTO zones VALUES (56,223,'TN','Tennessee');
INSERT INTO zones VALUES (57,223,'TX','Texas');
INSERT INTO zones VALUES (58,223,'UT','Utah');
INSERT INTO zones VALUES (59,223,'VT','Vermont');
INSERT INTO zones VALUES (60,223,'VI','Virgin Islands');
INSERT INTO zones VALUES (61,223,'VA','Virginia');
INSERT INTO zones VALUES (62,223,'WA','Washington');
INSERT INTO zones VALUES (63,223,'WV','West Virginia');
INSERT INTO zones VALUES (64,223,'WI','Wisconsin');
INSERT INTO zones VALUES (65,223,'WY','Wyoming');

# Canada
INSERT INTO zones VALUES (66,38,'AB','Alberta');
INSERT INTO zones VALUES (67,38,'BC','British Columbia');
INSERT INTO zones VALUES (68,38,'MB','Manitoba');
INSERT INTO zones VALUES (69,38,'NF','Newfoundland');
INSERT INTO zones VALUES (70,38,'NB','New Brunswick');
INSERT INTO zones VALUES (71,38,'NS','Nova Scotia');
INSERT INTO zones VALUES (72,38,'NT','Northwest Territories');
INSERT INTO zones VALUES (73,38,'NU','Nunavut');
INSERT INTO zones VALUES (74,38,'ON','Ontario');
INSERT INTO zones VALUES (75,38,'PE','Prince Edward Island');
INSERT INTO zones VALUES (76,38,'QC','Quebec');
INSERT INTO zones VALUES (77,38,'SK','Saskatchewan');
INSERT INTO zones VALUES (78,38,'YT','Yukon Territory');

# Germany
INSERT INTO zones VALUES (79,81,'NDS','Niedersachsen');
INSERT INTO zones VALUES (80,81,'BAW','Baden-W�rttemberg');
INSERT INTO zones VALUES (81,81,'BAY','Bayern');
INSERT INTO zones VALUES (82,81,'BER','Berlin');
INSERT INTO zones VALUES (83,81,'BRG','Brandenburg');
INSERT INTO zones VALUES (84,81,'BRE','Bremen');
INSERT INTO zones VALUES (85,81,'HAM','Hamburg');
INSERT INTO zones VALUES (86,81,'HES','Hessen');
INSERT INTO zones VALUES (87,81,'MEC','Mecklenburg-Vorpommern');
INSERT INTO zones VALUES (88,81,'NRW','Nordrhein-Westfalen');
INSERT INTO zones VALUES (89,81,'RHE','Rheinland-Pfalz');
INSERT INTO zones VALUES (90,81,'SAR','Saarland');
INSERT INTO zones VALUES (91,81,'SAS','Sachsen');
INSERT INTO zones VALUES (92,81,'SAC','Sachsen-Anhalt');
INSERT INTO zones VALUES (93,81,'SCN','Schleswig-Holstein');
INSERT INTO zones VALUES (94,81,'THE','Th�ringen');

# Austria
INSERT INTO zones VALUES (95,14,'WI','Wien');
INSERT INTO zones VALUES (96,14,'NO','Nieder�sterreich');
INSERT INTO zones VALUES (97,14,'OO','Ober�sterreich');
INSERT INTO zones VALUES (98,14,'SB','Salzburg');
INSERT INTO zones VALUES (99,14,'KN','K�rnten');
INSERT INTO zones VALUES (100,14,'ST','Steiermark');
INSERT INTO zones VALUES (101,14,'TI','Tirol');
INSERT INTO zones VALUES (102,14,'BL','Burgenland');
INSERT INTO zones VALUES (103,14,'VB','Voralberg');

# Swizterland
INSERT INTO zones VALUES (104,204,'AG','Aargau');
INSERT INTO zones VALUES (105,204,'AI','Appenzell Innerrhoden');
INSERT INTO zones VALUES (106,204,'AR','Appenzell Ausserrhoden');
INSERT INTO zones VALUES (107,204,'BE','Bern');
INSERT INTO zones VALUES (108,204,'BL','Basel-Landschaft');
INSERT INTO zones VALUES (109,204,'BS','Basel-Stadt');
INSERT INTO zones VALUES (110,204,'FR','Freiburg');
INSERT INTO zones VALUES (111,204,'GE','Genf');
INSERT INTO zones VALUES (112,204,'GL','Glarus');
INSERT INTO zones VALUES (113,204,'JU','Graub�nden');
INSERT INTO zones VALUES (114,204,'JU','Jura');
INSERT INTO zones VALUES (115,204,'LU','Luzern');
INSERT INTO zones VALUES (116,204,'NE','Neuenburg');
INSERT INTO zones VALUES (117,204,'NW','Nidwalden');
INSERT INTO zones VALUES (118,204,'OW','Obwalden');
INSERT INTO zones VALUES (119,204,'SG','St. Gallen');
INSERT INTO zones VALUES (120,204,'SH','Schaffhausen');
INSERT INTO zones VALUES (121,204,'SO','Solothurn');
INSERT INTO zones VALUES (122,204,'SZ','Schwyz');
INSERT INTO zones VALUES (123,204,'TG','Thurgau');
INSERT INTO zones VALUES (124,204,'TI','Tessin');
INSERT INTO zones VALUES (125,204,'UR','Uri');
INSERT INTO zones VALUES (126,204,'VD','Waadt');
INSERT INTO zones VALUES (127,204,'VS','Wallis');
INSERT INTO zones VALUES (128,204,'ZG','Zug');
INSERT INTO zones VALUES (129,204,'ZH','Z�rich');

# Spain
INSERT INTO zones (zone_country_id, zone_code, zone_name) VALUES (195,'A Coru�a','A Coru�a');
INSERT INTO zones (zone_country_id, zone_code, zone_name) VALUES (195,'Alava','Alava');
INSERT INTO zones (zone_country_id, zone_code, zone_name) VALUES (195,'Albacete','Albacete');
INSERT INTO zones (zone_country_id, zone_code, zone_name) VALUES (195,'Alicante','Alicante');
INSERT INTO zones (zone_country_id, zone_code, zone_name) VALUES (195,'Almeria','Almeria');
INSERT INTO zones (zone_country_id, zone_code, zone_name) VALUES (195,'Asturias','Asturias');
INSERT INTO zones (zone_country_id, zone_code, zone_name) VALUES (195,'Avila','Avila');
INSERT INTO zones (zone_country_id, zone_code, zone_name) VALUES (195,'Badajoz','Badajoz');
INSERT INTO zones (zone_country_id, zone_code, zone_name) VALUES (195,'Baleares','Baleares');
INSERT INTO zones (zone_country_id, zone_code, zone_name) VALUES (195,'Barcelona','Barcelona');
INSERT INTO zones (zone_country_id, zone_code, zone_name) VALUES (195,'Burgos','Burgos');
INSERT INTO zones (zone_country_id, zone_code, zone_name) VALUES (195,'Caceres','Caceres');
INSERT INTO zones (zone_country_id, zone_code, zone_name) VALUES (195,'Cadiz','Cadiz');
INSERT INTO zones (zone_country_id, zone_code, zone_name) VALUES (195,'Cantabria','Cantabria');
INSERT INTO zones (zone_country_id, zone_code, zone_name) VALUES (195,'Castellon','Castellon');
INSERT INTO zones (zone_country_id, zone_code, zone_name) VALUES (195,'Ceuta','Ceuta');
INSERT INTO zones (zone_country_id, zone_code, zone_name) VALUES (195,'Ciudad Real','Ciudad Real');
INSERT INTO zones (zone_country_id, zone_code, zone_name) VALUES (195,'Cordoba','Cordoba');
INSERT INTO zones (zone_country_id, zone_code, zone_name) VALUES (195,'Cuenca','Cuenca');
INSERT INTO zones (zone_country_id, zone_code, zone_name) VALUES (195,'Girona','Girona');
INSERT INTO zones (zone_country_id, zone_code, zone_name) VALUES (195,'Granada','Granada');
INSERT INTO zones (zone_country_id, zone_code, zone_name) VALUES (195,'Guadalajara','Guadalajara');
INSERT INTO zones (zone_country_id, zone_code, zone_name) VALUES (195,'Guipuzcoa','Guipuzcoa');
INSERT INTO zones (zone_country_id, zone_code, zone_name) VALUES (195,'Huelva','Huelva');
INSERT INTO zones (zone_country_id, zone_code, zone_name) VALUES (195,'Huesca','Huesca');
INSERT INTO zones (zone_country_id, zone_code, zone_name) VALUES (195,'Jaen','Jaen');
INSERT INTO zones (zone_country_id, zone_code, zone_name) VALUES (195,'La Rioja','La Rioja');
INSERT INTO zones (zone_country_id, zone_code, zone_name) VALUES (195,'Las Palmas','Las Palmas');
INSERT INTO zones (zone_country_id, zone_code, zone_name) VALUES (195,'Leon','Leon');
INSERT INTO zones (zone_country_id, zone_code, zone_name) VALUES (195,'Lleida','Lleida');
INSERT INTO zones (zone_country_id, zone_code, zone_name) VALUES (195,'Lugo','Lugo');
INSERT INTO zones (zone_country_id, zone_code, zone_name) VALUES (195,'Madrid','Madrid');
INSERT INTO zones (zone_country_id, zone_code, zone_name) VALUES (195,'Malaga','Malaga');
INSERT INTO zones (zone_country_id, zone_code, zone_name) VALUES (195,'Melilla','Melilla');
INSERT INTO zones (zone_country_id, zone_code, zone_name) VALUES (195,'Murcia','Murcia');
INSERT INTO zones (zone_country_id, zone_code, zone_name) VALUES (195,'Navarra','Navarra');
INSERT INTO zones (zone_country_id, zone_code, zone_name) VALUES (195,'Ourense','Ourense');
INSERT INTO zones (zone_country_id, zone_code, zone_name) VALUES (195,'Palencia','Palencia');
INSERT INTO zones (zone_country_id, zone_code, zone_name) VALUES (195,'Pontevedra','Pontevedra');
INSERT INTO zones (zone_country_id, zone_code, zone_name) VALUES (195,'Salamanca','Salamanca');
INSERT INTO zones (zone_country_id, zone_code, zone_name) VALUES (195,'Santa Cruz de Tenerife','Santa Cruz de Tenerife');
INSERT INTO zones (zone_country_id, zone_code, zone_name) VALUES (195,'Segovia','Segovia');
INSERT INTO zones (zone_country_id, zone_code, zone_name) VALUES (195,'Sevilla','Sevilla');
INSERT INTO zones (zone_country_id, zone_code, zone_name) VALUES (195,'Soria','Soria');
INSERT INTO zones (zone_country_id, zone_code, zone_name) VALUES (195,'Tarragona','Tarragona');
INSERT INTO zones (zone_country_id, zone_code, zone_name) VALUES (195,'Teruel','Teruel');
INSERT INTO zones (zone_country_id, zone_code, zone_name) VALUES (195,'Toledo','Toledo');
INSERT INTO zones (zone_country_id, zone_code, zone_name) VALUES (195,'Valencia','Valencia');
INSERT INTO zones (zone_country_id, zone_code, zone_name) VALUES (195,'Valladolid','Valladolid');
INSERT INTO zones (zone_country_id, zone_code, zone_name) VALUES (195,'Vizcaya','Vizcaya');
INSERT INTO zones (zone_country_id, zone_code, zone_name) VALUES (195,'Zamora','Zamora');
INSERT INTO zones (zone_country_id, zone_code, zone_name) VALUES (195,'Zaragoza','Zaragoza');

# Brazil

INSERT INTO zones VALUES (182, 30, 'AC', 'Acre');
INSERT INTO zones VALUES (183, 30, 'AL', 'Alagoas');
INSERT INTO zones VALUES (184, 30, 'AP', 'Amapa');
INSERT INTO zones VALUES (185, 30, 'AM', 'Amazonas');
INSERT INTO zones VALUES (186, 30, 'BA', 'Bahia');
INSERT INTO zones VALUES (187, 30, 'CE', 'Ceara');
INSERT INTO zones VALUES (188, 30, 'DF', 'Distrito Federal');
INSERT INTO zones VALUES (189, 30, 'ES', 'Espirito Santo');
INSERT INTO zones VALUES (190, 30, 'GO', 'Goias');
INSERT INTO zones VALUES (191, 30, 'MA', 'Maranhao');
INSERT INTO zones VALUES (192, 30, 'MT', 'Mato Grosso');
INSERT INTO zones VALUES (193, 30, 'MS', 'Mato Grosso do Sul');
INSERT INTO zones VALUES (194, 30, 'MG', 'Minas Gerais');
INSERT INTO zones VALUES (195, 30, 'PA', 'Para');
INSERT INTO zones VALUES (196, 30, 'PB', 'Paraiba');
INSERT INTO zones VALUES (197, 30, 'PR', 'Parana');
INSERT INTO zones VALUES (198, 30, 'PE', 'Pernambuco');
INSERT INTO zones VALUES (199, 30, 'PI', 'Piaui');
INSERT INTO zones VALUES (201, 30, 'RJ', 'Rio de Janeiro');
INSERT INTO zones VALUES (202, 30, 'RN', 'Rio Grande do Norte');
INSERT INTO zones VALUES (203, 30, 'RS', 'Rio Grande do Sul');
INSERT INTO zones VALUES (204, 30, 'RO', 'Rondonia');
INSERT INTO zones VALUES (205, 30, 'RR', 'Roraima');
INSERT INTO zones VALUES (206, 30, 'SC', 'Santa Catarina');
INSERT INTO zones VALUES (207, 30, 'SP', 'Sao Paulo');
INSERT INTO zones VALUES (208, 30, 'SE', 'Sergipe');
INSERT INTO zones VALUES (209, 30, 'TO', 'Tocantins');
