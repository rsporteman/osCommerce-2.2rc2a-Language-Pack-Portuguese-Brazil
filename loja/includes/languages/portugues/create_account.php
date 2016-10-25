<?php
/*
  $Id: create_account.php 1739 2007-12-20 00:52:16Z hpdl $

  osCommerce, Open Source E-Commerce Solutions
  http://www.oscommerce.com

  Copyright (c) 2002 osCommerce

  Released under the GNU General Public License
*/

define('NAVBAR_TITLE', 'Criar uma Conta');

define('HEADING_TITLE', 'Dados da Minha Conta');

define('TEXT_ORIGIN_LOGIN', '<font color="#FF0000"><small><b>NOTA:</b></font></small> Se voc� j� possui uma conta por favor <a href="%s"><u>acesse-a</u></a>.');

define('EMAIL_SUBJECT', 'Bem Vindo � ' . STORE_NAME);
define('EMAIL_GREET_MR', 'Estimado ' . stripslashes($HTTP_POST_VARS['firstname']) . ',' . "\n\n");
define('EMAIL_GREET_MS', 'Estimada ' . stripslashes($HTTP_POST_VARS['firstname']) . ',' . "\n\n");
define('EMAIL_GREET_NONE', 'Estimado ' . stripslashes($HTTP_POST_VARS['firstname']) . ',' . "\n\n");
define('EMAIL_WELCOME', 'Bem Vindo � <b>' . STORE_NAME . '</b>.' . "\n\n");
define('EMAIL_TEXT', 'Agradecemos seu cadastro, agora voc� poder� desfrutar de uma forma melhor nossa loja. Alguns dos servi�os que voc� disp�e:' . "\n\n" . '<li><b>Carrinho Permanente</b> - Qualquer produto adicionado ao seu carrinho permanecer� neste at� que voc� o apague ou realize a compra.' . "\n" . '<li><b>Livro de Endere�os</b> - Podemos entregar suas compras em outros endere�os diferentes do seu. Isto � perfeito, por exemplo, para enviar o presente diretamente para a casa do aniversariante.' . "\n" . '<li><b>Hist�rico de Compras</b> - Veja a rela��o de todas suas compra realizadas em nossa loja.' . "\n" . '<li><b>Coment�rios</b> - Compartilhe sua opini�o com outros clientes.' . "\n\n");
define('EMAIL_CONTACT', 'Para qualquer duvida sobre nossos servi�os por favor envie um e-mail para: ' . STORE_OWNER_EMAIL_ADDRESS . '.' . "\n\n");
define('EMAIL_WARNING', '<b>Nota:</b> seu endere�o de e-mail foi dado a n�s por um dos nossos clientes. Se seu email foi cadastrado sem sua autoriza��o por favor nos comunique:  ' . STORE_OWNER_EMAIL_ADDRESS . '.' . "\n");
?>
