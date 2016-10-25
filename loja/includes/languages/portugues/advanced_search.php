<?php
/*
  $Id: advanced_search.php 1739 2007-12-20 00:52:16Z hpdl $

  osCommerce, Open Source E-Commerce Solutions
  http://www.oscommerce.com

  Copyright (c) 2003 osCommerce

  Released under the GNU General Public License
*/

define('NAVBAR_TITLE_1', 'Busca Avan�ada');
define('NAVBAR_TITLE_2', 'Resultados da Busca Avan�ada');

define('HEADING_TITLE_1', 'Busca Avan�ada');
define('HEADING_TITLE_2', 'Produtos que satisfazem os crit�rios de sua busca');

define('HEADING_SEARCH_CRITERIA', 'Busca Avan�ada');

define('TEXT_SEARCH_IN_DESCRIPTION', 'Pesquisar tamb�m na descri��o dos produtos');
define('ENTRY_CATEGORIES', 'Categorias:');
define('ENTRY_INCLUDE_SUBCATEGORIES', 'Incluir Sub-categorias');
define('ENTRY_MANUFACTURERS', 'Fabricante:');
define('ENTRY_PRICE_FROM', 'Pre�o M�nimo:');
define('ENTRY_PRICE_TO', 'Pre�o M�ximo:');
define('ENTRY_DATE_FROM', 'Desta Data:');
define('ENTRY_DATE_TO', 'At� Est� Data:');

define('TEXT_SEARCH_HELP_LINK', '<u>Ajuda</u> [?]');

define('TEXT_ALL_CATEGORIES', 'Todas');
define('TEXT_ALL_MANUFACTURERS', 'Todos');

define('HEADING_SEARCH_HELP', 'Dicas de pesquisa avan�ada');
define('TEXT_SEARCH_HELP', 'O motor de busca permite que voc� fa�a uma pesquisa por palavras-chave no modelo, nome, descri��o e fabricante dos produtos.<br><br>Quando voc� fizer uma pesquisa por palavras-chave ou frases, pode separ�-las com operadores l�gicos AND e OR. Por exemplo: pode fazer uma busca por <u>microsoft AND mouse</u>. Esta busca daria como resultado os produtos que carregam ambas as palavras. J� a pesquisa usando  <u>microsoft OR mouse</u>, mostrar� como resultado qualquer produto que contenha apenas uma das palavras. Se voc� n�o separar as palavras por padr�o a pesquisa ser� feita utilizando o operador l�gico AND, <br><br>Voc� pode pesquisar palavras exatas entre aspas. Por exemplo, buscar <u>"computador intel"</u>, procura nos produtos a correspond�ncia exata da busca.<br><br>Voc� pode utilizar par�ntesis para controlar a ordem das opera��oes l�gicas. Por exemplo: Pode introduzir <u>microsoft and (teclado or mouse or "visual basic")</u>.');
define('TEXT_CLOSE_WINDOW', '<u>Fechar Janela</u> [x]');

define('TABLE_HEADING_IMAGE', '');
define('TABLE_HEADING_MODEL', 'Modelo');
define('TABLE_HEADING_PRODUCTS', 'Descri��o');
define('TABLE_HEADING_MANUFACTURER', 'Fabricante');
define('TABLE_HEADING_QUANTITY', 'Unidades');
define('TABLE_HEADING_PRICE', 'Pre�o');
define('TABLE_HEADING_WEIGHT', 'Peso');
define('TABLE_HEADING_BUY_NOW', 'Compre Agora');

define('TEXT_NO_PRODUCTS', 'N�o h� nenhum produto que corresponda aos crit�rios de pesquisa.');

define('ERROR_AT_LEAST_ONE_INPUT', 'Utilize pelo menos um crit�rio para a pesquisa');
define('ERROR_INVALID_FROM_DATE', 'Data de In�cio inv�lida');
define('ERROR_INVALID_TO_DATE', 'Data Final Inv�lida');
define('ERROR_TO_DATE_LESS_THAN_FROM_DATE', 'a data final deve ser maior que a data inicial');
define('ERROR_PRICE_FROM_MUST_BE_NUM', 'O pre�o min�mo deve ser num�rico');
define('ERROR_PRICE_TO_MUST_BE_NUM', 'O pre�o m�ximo deve ser num�rico');
define('ERROR_PRICE_TO_LESS_THAN_PRICE_FROM', 'Pre�o m�ximo deve ser igual ou superior ao Pre�o M�nimo');
define('ERROR_INVALID_KEYWORDS', 'Palavra-Chave Inv�lida');
?>
