<?php
/*
  $Id: portugues.php 1743 2007-12-20 18:02:36Z hpdl $

  osCommerce, Open Source E-Commerce Solutions
  http://www.oscommerce.com

  Copyright (c) 2007 osCommerce

  Released under the GNU General Public License
*/

// look in your $PATH_LOCALE/locale directory for available locales
// or type locale -a on the server.
// Examples:
// on RedHat try 'pt_BR'
// on FreeBSD try 'pr_BR.ISO_8859-1'
// on Windows try 'br', or 'Portugu�s'
@setlocale(LC_TIME, 'pt_BR.ISO_8859-1');

define('DATE_FORMAT_SHORT', '%d/%m/%Y');  // this is used for strftime()
define('DATE_FORMAT_LONG', '%A %d %B, %Y'); // this is used for strftime()
define('DATE_FORMAT', 'd/m/Y');  // this is used for date()
define('DATE_TIME_FORMAT', DATE_FORMAT_SHORT . ' %H:%M:%S');

////
// Return date in raw format
// $date should be in format mm/dd/yyyy
// raw date is in format YYYYMMDD, or DDMMYYYY
function tep_date_raw($date, $reverse = false) {
  if ($reverse) {
    return substr($date, 0, 2) . substr($date, 3, 2) . substr($date, 6, 4);
  } else {
    return substr($date, 6, 4) . substr($date, 3, 2) . substr($date, 0, 2);
  }
}

// if USE_DEFAULT_LANGUAGE_CURRENCY is true, use the following currency, instead of the applications default currency (used when changing language)
define('LANGUAGE_CURRENCY', 'R$');

// Global entries for the <html> tag
define('HTML_PARAMS','dir="LTR" lang="br"');

// charset for web pages and emails
define('CHARSET', 'iso-8859-1');

// page title
define('TITLE', STORE_NAME);

// header text in includes/header.php
define('HEADER_TITLE_CREATE_ACCOUNT', 'Criar Conta');
define('HEADER_TITLE_MY_ACCOUNT', 'Minha Conta');
define('HEADER_TITLE_CART_CONTENTS', 'Meu Carrinho');
define('HEADER_TITLE_CHECKOUT', 'Realizar Pedido');
define('HEADER_TITLE_TOP', 'In�cio');
define('HEADER_TITLE_CATALOG', 'Loja');
define('HEADER_TITLE_LOGOFF', 'Sair');
define('HEADER_TITLE_LOGIN', 'Entrar');

// footer text in includes/footer.php
define('FOOTER_TEXT_REQUESTS_SINCE', 'visitas desde');

// text for gender
define('MALE', 'Masculino');
define('FEMALE', 'Feminino');
define('MALE_ADDRESS', 'Sr.');
define('FEMALE_ADDRESS', 'Sra.');

// text for date of birth example
define('DOB_FORMAT_STRING', 'dd/mm/aaaa');

// categories box text in includes/boxes/categories.php
define('BOX_HEADING_CATEGORIES', 'Categorias');

// manufacturers box text in includes/boxes/manufacturers.php
define('BOX_HEADING_MANUFACTURERS', 'Fabricantes');

// whats_new box text in includes/boxes/whats_new.php
define('BOX_HEADING_WHATS_NEW', 'Novidades');

// quick_find box text in includes/boxes/quick_find.php
define('BOX_HEADING_SEARCH', 'Busca R�pida');
define('BOX_SEARCH_TEXT', 'Use palavras chave para encontrar o produto que procura.');
define('BOX_SEARCH_ADVANCED_SEARCH', 'Busca Avan�ada');

// specials box text in includes/boxes/specials.php
define('BOX_HEADING_SPECIALS', 'Ofertas');

// reviews box text in includes/boxes/reviews.php
define('BOX_HEADING_REVIEWS', 'Coment�rios');
define('BOX_REVIEWS_WRITE_REVIEW', 'Escreva um coment�rio sobre esse produto');
define('BOX_REVIEWS_NO_REVIEWS', 'Nenhum coment�rio ainda');
define('BOX_REVIEWS_TEXT_OF_5_STARS', '%s de 5 Estrelas!');

// shopping_cart box text in includes/boxes/shopping_cart.php
define('BOX_HEADING_SHOPPING_CART', 'Compras');
define('BOX_SHOPPING_CART_EMPTY', '0 produtos');

// order_history box text in includes/boxes/order_history.php
define('BOX_HEADING_CUSTOMER_ORDERS', 'Meus Pedidos');

// best_sellers box text in includes/boxes/best_sellers.php
define('BOX_HEADING_BESTSELLERS', 'Top Mais Vendidos');
define('BOX_HEADING_BESTSELLERS_IN', 'Top Mais Vendidos em <br>&nbsp;&nbsp;');

// notifications box text in includes/boxes/products_notifications.php
define('BOX_HEADING_NOTIFICATIONS', 'Notifica��es');
define('BOX_NOTIFICATIONS_NOTIFY', 'Notifique-me de atualiza��es para <b>%s</b>');
define('BOX_NOTIFICATIONS_NOTIFY_REMOVE', 'N�o me notifique de atualiza��es para <b>%s</b>');

// manufacturer box text
define('BOX_HEADING_MANUFACTURER_INFO', 'Fabricante');
define('BOX_MANUFACTURER_INFO_HOMEPAGE', 'P�gina de %s');
define('BOX_MANUFACTURER_INFO_OTHER_PRODUCTS', 'Outros produtos');

// languages box text in includes/boxes/languages.php
define('BOX_HEADING_LANGUAGES', 'Idioma');

// currencies box text in includes/boxes/currencies.php
define('BOX_HEADING_CURRENCIES', 'Moeda');

// information box text in includes/boxes/information.php
define('BOX_HEADING_INFORMATION', 'Informa��es');
define('BOX_INFORMATION_PRIVACY', 'Pol�tica de Privacidade');
define('BOX_INFORMATION_CONDITIONS', 'Condi��es de uso');
define('BOX_INFORMATION_SHIPPING', 'Fretes e Devolu��es');
define('BOX_INFORMATION_CONTACT', 'Contato');

// tell a friend box text in includes/boxes/tell_a_friend.php
define('BOX_HEADING_TELL_A_FRIEND', 'Indique a um amigo');
define('BOX_TELL_A_FRIEND_TEXT', 'Fale sobre este produto para algu�m que voc� conhe�a.');

// checkout procedure text
define('CHECKOUT_BAR_DELIVERY', 'Entrega');
define('CHECKOUT_BAR_PAYMENT', 'Pagamento');
define('CHECKOUT_BAR_CONFIRMATION', 'Confirma��o');
define('CHECKOUT_BAR_FINISHED', 'Terminado!');

// pull down default text
define('PULL_DOWN_DEFAULT', 'Selecione');
define('TYPE_BELOW', 'Escreva um Desejo');

// javascript messages
define('JS_ERROR', 'Existem erros em seu formul�rio!\nPor favor, fa�a as seguintes corre��es:\n\n');

define('JS_REVIEW_TEXT', '* Seu \'Coment�rio\' deve ter pelo menos ' . REVIEW_TEXT_MIN_LENGTH . ' caracteres.\n');
define('JS_REVIEW_RATING', '* Deve avaliar o produto.\n');

define('JS_ERROR_NO_PAYMENT_MODULE_SELECTED', '* Por favor, selecione um m�todo de pagamento para seu pedido.\n');

define('JS_ERROR_SUBMITTED', 'Voc� j� enviou o formul�rio. Por favor, pressione "aceitar" e aguarde at� que este processo seja conclu�do.');

define('ERROR_NO_PAYMENT_MODULE_SELECTED', 'Por favor, selecione um m�todo de pagamento para seu pedido.');

define('CATEGORY_COMPANY', 'Empresa');
define('CATEGORY_PERSONAL', 'Dados Pessoais');
define('CATEGORY_ADDRESS', 'Endere�o');
define('CATEGORY_CONTACT', 'Contato');
define('CATEGORY_OPTIONS', 'Op��es');
define('CATEGORY_PASSWORD', 'Senha');

define('ENTRY_COMPANY', 'Empresa:');
define('ENTRY_COMPANY_ERROR', '');
define('ENTRY_COMPANY_TEXT', '');
define('ENTRY_GENDER', 'Sexo:');
define('ENTRY_GENDER_ERROR', 'Por favor selecione "Masculino" ou "Feminino".');
define('ENTRY_GENDER_TEXT', '*');
define('ENTRY_FIRST_NAME', 'Nome:');
define('ENTRY_FIRST_NAME_ERROR', 'Seu nome deve ter pelo menos ' . ENTRY_FIRST_NAME_MIN_LENGTH . ' caracteres.');
define('ENTRY_FIRST_NAME_TEXT', '*');
define('ENTRY_LAST_NAME', 'Sobrenome:');
define('ENTRY_LAST_NAME_ERROR', 'Seu Sobrenome deve ter pelo menos ' . ENTRY_LAST_NAME_MIN_LENGTH . ' caracteres.');
define('ENTRY_LAST_NAME_TEXT', '*');
define('ENTRY_DATE_OF_BIRTH', 'Data de Nascimento:');
define('ENTRY_DATE_OF_BIRTH_ERROR', 'Sua data de nascimento deve ter esse formato: DD/MM/AAAA (p.ex. 21/05/1970)');
define('ENTRY_DATE_OF_BIRTH_TEXT', '* (Ex: 21/05/1970)');
define('ENTRY_EMAIL_ADDRESS', 'E-Mail:');
define('ENTRY_EMAIL_ADDRESS_ERROR', 'Seu endere�o de email deve ter pelo menos ' . ENTRY_EMAIL_ADDRESS_MIN_LENGTH . ' caracteres.');
define('ENTRY_EMAIL_ADDRESS_CHECK_ERROR', 'Seu E-Mail n�o � v�lido - fa�a as mudan�as necess�rias.');
define('ENTRY_EMAIL_ADDRESS_ERROR_EXISTS', 'Este endere�o de E-Mail j� est� cadastrado, voc� pode fazer o login na sua conta usando ele ou criar uma nova conta com outro endere�o de E-mail');
define('ENTRY_EMAIL_ADDRESS_TEXT', '*');
define('ENTRY_STREET_ADDRESS', 'Endere�o:');
define('ENTRY_STREET_ADDRESS_ERROR', 'Seu endere�o deve ter pelo menos ' . ENTRY_STREET_ADDRESS_MIN_LENGTH . ' caracteres.');
define('ENTRY_STREET_ADDRESS_TEXT', '*(rua, n�mero, complemento, apartamento)');
define('ENTRY_SUBURB', 'Bairro:');
define('ENTRY_SUBURB_ERROR', '');
define('ENTRY_SUBURB_TEXT', '');
define('ENTRY_POST_CODE', 'CEP:');
define('ENTRY_POST_CODE_ERROR', 'Seu CEP deve ter pelo menos ' . ENTRY_POSTCODE_MIN_LENGTH . ' caracteres.');
define('ENTRY_POST_CODE_TEXT', '*');
define('ENTRY_CITY', 'Cidade:');
define('ENTRY_CITY_ERROR', 'O nome de sua cidade deve ter pelo menos ' . ENTRY_CITY_MIN_LENGTH . ' caracteres.');
define('ENTRY_CITY_TEXT', '*');
define('ENTRY_STATE', 'Estado:');
define('ENTRY_STATE_ERROR', 'O nome do seu estado deve ter pelo menos' . ENTRY_STATE_MIN_LENGTH . ' caracteres.');
define('ENTRY_STATE_ERROR_SELECT', 'Por favor selecione seu estado na lista .');
define('ENTRY_STATE_TEXT', '*');
define('ENTRY_COUNTRY', 'Pa�s:');
define('ENTRY_COUNTRY_ERROR', 'Por favor selecione seu pa�s.');
define('ENTRY_COUNTRY_TEXT', '*');
define('ENTRY_TELEPHONE_NUMBER', 'Telefone (com DDD):');
define('ENTRY_TELEPHONE_NUMBER_ERROR', 'Seu n�mero de telefone deve ter pelo menos ' . ENTRY_TELEPHONE_MIN_LENGTH . ' caracteres.');
define('ENTRY_TELEPHONE_NUMBER_TEXT', '*');
define('ENTRY_FAX_NUMBER', 'Fax (com DDD):');
define('ENTRY_FAX_NUMBER_ERROR', '');
define('ENTRY_FAX_NUMBER_TEXT', '');
define('ENTRY_NEWSLETTER', 'Receber Boletins de Not�cias');
define('ENTRY_NEWSLETTER_TEXT', '');
define('ENTRY_NEWSLETTER_YES', 'assinar');
define('ENTRY_NEWSLETTER_NO', 'n�o assinar');
define('ENTRY_NEWSLETTER_ERROR', '');
define('ENTRY_PASSWORD', 'Senha:');
define('ENTRY_PASSWORD_ERROR', 'Sua senha dever conter pelo menos ' . ENTRY_PASSWORD_MIN_LENGTH . ' caracteres.');
define('ENTRY_PASSWORD_ERROR_NOT_MATCHING', 'A confirma��o de senha e a senha n�o correspondem');
define('ENTRY_PASSWORD_TEXT', '*');
define('ENTRY_PASSWORD_CONFIRMATION', 'Confirme sua senha:');
define('ENTRY_PASSWORD_CONFIRMATION_TEXT', '*');
define('ENTRY_PASSWORD_CURRENT', 'Senha atual:');
define('ENTRY_PASSWORD_CURRENT_TEXT', '*');
define('ENTRY_PASSWORD_CURRENT_ERROR', 'Sua senha dever ter pelo menos ' . ENTRY_PASSWORD_MIN_LENGTH . ' caracteres.');
define('ENTRY_PASSWORD_NEW', 'Nova Senha:');
define('ENTRY_PASSWORD_NEW_TEXT', '*');
define('ENTRY_PASSWORD_NEW_ERROR', 'Sua nova senha de ter pelo menos ' . ENTRY_PASSWORD_MIN_LENGTH . ' caracteres.');
define('ENTRY_PASSWORD_NEW_ERROR_NOT_MATCHING', 'A confirma��o de senha e a senha n�o correspondem');
define('PASSWORD_HIDDEN', '--OCULTO--');

define('FORM_REQUIRED_INFORMATION', '* Dados Obrigat�rios');

// constants for use in tep_prev_next_display function
define('TEXT_RESULT_PAGE', 'P�gina de Resultados:');
define('TEXT_DISPLAY_NUMBER_OF_PRODUCTS', 'Mostrando de <b>%d</b> at� <b>%d</b> do total de <b>%d</b> produtos');
define('TEXT_DISPLAY_NUMBER_OF_ORDERS', 'Mostrando de <b>%d</b> at� <b>%d</b> do total de <b>%d</b> pedidos');
define('TEXT_DISPLAY_NUMBER_OF_REVIEWS', 'Mostrando de  <b>%d</b> at� <b>%d</b> do total de <b>%d</b> coment�rios');
define('TEXT_DISPLAY_NUMBER_OF_PRODUCTS_NEW', 'Mostrando de <b>%d</b> at� <b>%d</b> do total de <b>%d</b> produtos novos');
define('TEXT_DISPLAY_NUMBER_OF_SPECIALS', 'Mostrando de <b>%d</b> at� <b>%d</b> do total de <b>%d</b> ofertas');

define('PREVNEXT_TITLE_FIRST_PAGE', 'Principal');
define('PREVNEXT_TITLE_PREVIOUS_PAGE', 'Anterior');
define('PREVNEXT_TITLE_NEXT_PAGE', 'Siguiente');
define('PREVNEXT_TITLE_LAST_PAGE', 'Final');
define('PREVNEXT_TITLE_PAGE_NO', 'P�gina %d');
define('PREVNEXT_TITLE_PREV_SET_OF_NO_PAGE', 'Anteriores %d P�ginas');
define('PREVNEXT_TITLE_NEXT_SET_OF_NO_PAGE', 'Seguientes %d P�ginas');
define('PREVNEXT_BUTTON_FIRST', '&lt;&lt;In�c�o');
define('PREVNEXT_BUTTON_PREV', '[&lt;&lt;&nbsp;Anterior]');
define('PREVNEXT_BUTTON_NEXT', '[Siguiente&nbsp;&gt;&gt;]');
define('PREVNEXT_BUTTON_LAST', 'Final&gt;&gt;');

define('IMAGE_BUTTON_ADD_ADDRESS', 'Adicionar Endere�os');
define('IMAGE_BUTTON_ADDRESS_BOOK', 'Endere�os');
define('IMAGE_BUTTON_BACK', 'Voltar');
define('IMAGE_BUTTON_BUY_NOW', 'Compre Agora');
define('IMAGE_BUTTON_CHANGE_ADDRESS', 'Mudar Endere�o');
define('IMAGE_BUTTON_CHECKOUT', 'Realizar Pedido');
define('IMAGE_BUTTON_CONFIRM_ORDER', 'Confirmar Pedido');
define('IMAGE_BUTTON_CONTINUE', 'Continuar');
define('IMAGE_BUTTON_CONTINUE_SHOPPING', 'Seguir Comprando');
define('IMAGE_BUTTON_DELETE', 'Deletar');
define('IMAGE_BUTTON_EDIT_ACCOUNT', 'Editar Conta');
define('IMAGE_BUTTON_HISTORY', 'Hist�rico de Pedidos');
define('IMAGE_BUTTON_LOGIN', 'Entrar');
define('IMAGE_BUTTON_IN_CART', 'Adicionar ao carrinho');
define('IMAGE_BUTTON_NOTIFICATIONS', 'Notifica��es');
define('IMAGE_BUTTON_QUICK_FIND', 'Busca R�pida');
define('IMAGE_BUTTON_REMOVE_NOTIFICATIONS', 'Remover Notifica��es');
define('IMAGE_BUTTON_REVIEWS', 'Coment�rios');
define('IMAGE_BUTTON_SEARCH', 'Buscar');
define('IMAGE_BUTTON_SHIPPING_OPTIONS', 'Op��es de Envio');
define('IMAGE_BUTTON_TELL_A_FRIEND', 'Indique para um amigo');
define('IMAGE_BUTTON_UPDATE', 'Atualizar');
define('IMAGE_BUTTON_UPDATE_CART', 'Atualizar Carrinho');
define('IMAGE_BUTTON_WRITE_REVIEW', 'Escrever Coment�rio');

define('SMALL_IMAGE_BUTTON_DELETE', 'Deletar');
define('SMALL_IMAGE_BUTTON_EDIT', 'Modificar');
define('SMALL_IMAGE_BUTTON_VIEW', 'Ver');

define('ICON_ARROW_RIGHT', 'Adicionar');
define('ICON_CART', 'No Carrinho');
define('ICON_ERROR', 'Erro');
define('ICON_SUCCESS', 'Correto');
define('ICON_WARNING', 'Advert�ncia');

define('TEXT_GREETING_PERSONAL', 'Bem Vindo Novamente <span class="greetUser">%s!</span> Gostaria de ver os <a href="%s"><u>novos produtos</u></a> dispon�veis?');
define('TEXT_GREETING_PERSONAL_RELOGON', '<small>Se voc� n�o � %s, por favor <a href="%s"><u>click aqui</u></a> e coloque seus dados.</small>');
define('TEXT_GREETING_GUEST', 'Bem Vindo <span class="greetUser">Convidado!</span> Gostaria de <a href="%s"><u>fazer o login</u></a> ou prefere <a href="%s"><u>criar uma conta</u></a>?');

define('TEXT_SORT_PRODUCTS', 'Ordenar Produtos ');
define('TEXT_DESCENDINGLY', 'Ordem Decrescente');
define('TEXT_ASCENDINGLY', 'Ordem Crescente');
define('TEXT_BY', ' por ');

define('TEXT_REVIEW_BY', 'por %s');
define('TEXT_REVIEW_WORD_COUNT', '%s palavras');
define('TEXT_REVIEW_RATING', 'Taxa: %s [%s]');
define('TEXT_REVIEW_DATE_ADDED', 'Data Adicionada: %s');
define('TEXT_NO_REVIEWS', 'N�o existem coment�rios');

define('TEXT_NO_NEW_PRODUCTS', 'No momento n�o h� novidades');

define('TEXT_UNKNOWN_TAX_RATE', 'Imposto desconhecido');

define('TEXT_REQUIRED', '<span class="errorText">Obrigat�rio</span>');

define('ERROR_TEP_MAIL', '<font face="Verdana, Arial" size="2" color="#ff0000"><b><small>TEP ERROR:</small> N�o foi possiv�l enviar o email com SMTP especificado. Configure seu servidor SMTP.</b></font>');
define('WARNING_INSTALL_DIRECTORY_EXISTS', 'Aten��o: Por favor, remova o diret�rio de instala��o por raz�es de seguran�a. "' . dirname($HTTP_SERVER_VARS['SCRIPT_FILENAME']) . '/install."');
define('WARNING_CONFIG_FILE_WRITEABLE', 'Aten��o: Modifique as permiss�es do arquivo "' . dirname($HTTP_SERVER_VARS['SCRIPT_FILENAME']) . '/includes/configure.php" para somente leitura (CHMOD 444)');
define('WARNING_SESSION_DIRECTORY_NON_EXISTENT', 'Aten��o: a pasta para guardar dados dessas sess�es n�o existe ' . tep_session_save_path() . '. As se��es n�o funcionaram enquanto este erro n�o for corrigido.');
define('WARNING_SESSION_DIRECTORY_NOT_WRITEABLE', 'Aten��o: Sem permiss�o para escrever no diret�rio das sess�es: ' . tep_session_save_path() . '. As se��es n�o funcionaram enquanto este erro n�o for corrigido.');
define('WARNING_SESSION_AUTO_START', 'Aten��o: A linha session.auto_start est� ativada - desative esta caracter�stica do PHP em php.ini e reinicie seu servidor. ');
define('WARNING_DOWNLOAD_DIRECTORY_NON_EXISTENT', 'Aten��o: o diret�rio onde ficam os produtos para download n�o existe ' . DIR_FS_DOWNLOAD . '. Os produtos para download n�o funcionaram enquanto este erro n�o for corrigido.');

define('TEXT_CCVAL_ERROR_INVALID_DATE', 'A data do cart�o de cr�dito est� incorreta. Por favor tente novamente');
define('TEXT_CCVAL_ERROR_INVALID_NUMBER', 'O n�mero do cart�o de credito est� incorreto. Por favor tente novamente.');
define('TEXT_CCVAL_ERROR_UNKNOWN_CARD', 'Os primeiros quatro d�gitos do seu cart�o de cr�dito s�o: %s. Se este n�mero est� correto n�o podemos aceitar se cart�o de credito. Se est� errado por favor tente novamente.');

define('FOOTER_TEXT_BODY', 'Copyright &copy; ' . date('Y') . ' <a href="' . tep_href_link(FILENAME_DEFAULT) . '">' . STORE_NAME . '</a><br>Powered by <a href="http://www.oscommerce.com" target="_blank">osCommerce</a> <br>Traduzido por <a href="http://www.oscommerce.raonibs.com" target="_blank">osCommerce Brasil</a>');
?>
