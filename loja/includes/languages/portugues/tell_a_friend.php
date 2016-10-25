<?php
/*
  $Id: tell_a_friend.php 1739 2007-12-20 00:52:16Z hpdl $

  osCommerce, Open Source E-Commerce Solutions
  http://www.oscommerce.com

  Copyright (c) 2003 osCommerce

  Released under the GNU General Public License
*/

define('NAVBAR_TITLE', 'Enviar para um Amigo');

define('HEADING_TITLE', 'Enviar informa��es sobre \'%s\' para um amigo');

define('FORM_TITLE_CUSTOMER_DETAILS', 'Seus Dados');
define('FORM_TITLE_FRIEND_DETAILS', 'Dados do seu amigo');
define('FORM_TITLE_FRIEND_MESSAGE', 'Sua mensagem');

define('FORM_FIELD_CUSTOMER_NAME', 'Seu Nome:');
define('FORM_FIELD_CUSTOMER_EMAIL', 'Seu Email:');
define('FORM_FIELD_FRIEND_NAME', 'Nome do Seu amigo:');
define('FORM_FIELD_FRIEND_EMAIL', 'Email do Seu Amigo:');

define('TEXT_EMAIL_SUCCESSFUL_SENT', 'Seu email sobre <b>%s</b> foi enviado com sucesso para <b>%s</b>.');

define('TEXT_EMAIL_SUBJECT', 'Seu amigo %s lhe recomendou "%s"');
define('TEXT_EMAIL_INTRO', 'Ol� %s!' . "\n\n" . 'Seu amigo %s, pensou que voc� estaria interessado em %s de %s.');
define('TEXT_EMAIL_LINK', 'Para ver o produto use o seguinte link:' . "\n\n" . '%s');
define('TEXT_EMAIL_SIGNATURE', 'Atenciosamente,' . "\n\n" . '%s');

define('ERROR_TO_NAME', 'Erro: O nome do seu amigo n�o deve estar vazio.');
define('ERROR_TO_ADDRESS', 'Erro: O Email de seu amigo deve ser v�lido.');
define('ERROR_FROM_NAME', 'Erro: Seu nome n�o deve estar vazio.');
define('ERROR_FROM_ADDRESS', 'Erro: Seu Email deve ser v�lido.');
?>
