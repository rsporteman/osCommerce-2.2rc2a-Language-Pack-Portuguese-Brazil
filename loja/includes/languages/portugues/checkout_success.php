<?php
/*
  $Id: checkout_success.php 1739 2007-12-20 00:52:16Z hpdl $

  osCommerce, Open Source E-Commerce Solutions
  http://www.oscommerce.com

  Copyright (c) 2002 osCommerce

  Released under the GNU General Public License
*/

define('NAVBAR_TITLE_1', 'Pedido');
define('NAVBAR_TITLE_2', 'Realizado com �xito');

define('HEADING_TITLE', 'Seu pedido foi processado com sucesso!');

define('TEXT_SUCCESS', 'Seu pedido foi realizado com �xito! Assim que seu pagamento for processado sua compra ser� enviada. O tempo de de entrega demorar� de acordo com o met�do de envio escolhido.');
define('TEXT_NOTIFY_PRODUCTS', 'Por favor notifique-me de atualiza��es realizadas nos produtos:');
define('TEXT_SEE_ORDERS', 'Voc� pode ver seus pedido na p�gina <a href="' . tep_href_link(FILENAME_ACCOUNT, '', 'SSL') . '">\'Sua Conta\'</a> e clicando sobre <a href="' . tep_href_link(FILENAME_ACCOUNT_HISTORY, '', 'SSL') . '">\'Hist�rico\'</a>.');
define('TEXT_CONTACT_STORE_OWNER', 'Dirija suas perguntas para nossa <a href="' . tep_href_link(FILENAME_CONTACT_US) . '">administra��o</a>.');
define('TEXT_THANKS_FOR_SHOPPING', 'Obrigado por Comprar Conosco!');

define('TABLE_HEADING_COMMENTS', 'Escreva um coment�rio sobre sua compra');

define('TABLE_HEADING_DOWNLOAD_DATE', 'Data de Vencimento: ');
define('TABLE_HEADING_DOWNLOAD_COUNT', ' downloads restantes');
define('HEADING_DOWNLOAD', 'Baixe seus produtos aqui:');
define('FOOTER_DOWNLOAD', 'Pode baixar seus produtos mais tarde em \'%s\'');
?>
