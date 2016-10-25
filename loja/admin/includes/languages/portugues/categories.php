<?php
/*
  $Id: categories.php 1739 2007-12-20 00:52:16Z hpdl $

  osCommerce, Open Source E-Commerce Solutions
  http://www.oscommerce.com

  Copyright (c) 2003 osCommerce

  Released under the GNU General Public License
*/

define('HEADING_TITLE', 'Categorias / Produtos');
define('HEADING_TITLE_SEARCH', 'Buscar:');
define('HEADING_TITLE_GOTO', 'Ir A:');

define('TABLE_HEADING_ID', 'ID');
define('TABLE_HEADING_CATEGORIES_PRODUCTS', 'Categorias / Produtos');
define('TABLE_HEADING_ACTION', 'A��o');
define('TABLE_HEADING_STATUS', 'Status');

define('TEXT_NEW_PRODUCT', 'Novo Produto em &quot;%s&quot;');
define('TEXT_CATEGORIES', 'Categorias:');
define('TEXT_SUBCATEGORIES', 'Sub-categorias:');
define('TEXT_PRODUCTS', 'Produtos:');
define('TEXT_PRODUCTS_PRICE_INFO', 'Pre�o:');
define('TEXT_PRODUCTS_TAX_CLASS', 'Tipo de Taxa:');
define('TEXT_PRODUCTS_AVERAGE_RATING', 'M�dia das Avalia��es:');
define('TEXT_PRODUCTS_QUANTITY_INFO', 'Quantidade:');
define('TEXT_DATE_ADDED', 'Adicionado:');
define('TEXT_DATE_AVAILABLE', 'Data dispon�vel:');
define('TEXT_LAST_MODIFIED', 'Modificado em:');
define('TEXT_IMAGE_NONEXISTENT', 'N�O EXISTE IMAGEM');
define('TEXT_NO_CHILD_CATEGORIES_OR_PRODUCTS', 'Insirar uma nova categoria de produto.');
define('TEXT_PRODUCT_MORE_INFORMATION', 'Ser desejar mais informa��es visite a <a href="http://%s" target="blank"><u>p�gina</u></a> deste produto.');
define('TEXT_PRODUCT_DATE_ADDED', 'Este produto foi adicionado em %s.');
define('TEXT_PRODUCT_DATE_AVAILABLE', 'Este produto est� dispon�vel em %s.');

define('TEXT_EDIT_INTRO', 'Fa�a as altera��es necess�rias');
define('TEXT_EDIT_CATEGORIES_ID', 'ID da Categoria:');
define('TEXT_EDIT_CATEGORIES_NAME', 'Nome da Categoria:');
define('TEXT_EDIT_CATEGORIES_IMAGE', 'Imagem da Categoria:');
define('TEXT_EDIT_SORT_ORDER', 'Ordenamento:');

define('TEXT_INFO_COPY_TO_INTRO', 'Escolhe a categoria de onde voc� deseja copiar este produto');
define('TEXT_INFO_CURRENT_CATEGORIES', 'Categorias:');

define('TEXT_INFO_HEADING_NEW_CATEGORY', 'Nova Categoria');
define('TEXT_INFO_HEADING_EDIT_CATEGORY', 'Editar Categoria');
define('TEXT_INFO_HEADING_DELETE_CATEGORY', 'Apagar Categoria');
define('TEXT_INFO_HEADING_MOVE_CATEGORY', 'Mover Categoria');
define('TEXT_INFO_HEADING_DELETE_PRODUCT', 'Apagar Produto');
define('TEXT_INFO_HEADING_MOVE_PRODUCT', 'Mover Produto');
define('TEXT_INFO_HEADING_COPY_TO', 'Copiar A');

define('TEXT_DELETE_CATEGORY_INTRO', 'Tem certeza que deseja apagar esta categoria?');
define('TEXT_DELETE_PRODUCT_INTRO', 'Tem certeza que deseja apagar este produto?');

define('TEXT_DELETE_WARNING_CHILDS', '<b>ADVERT�NCIA:</b> Existem %s categorias dentro desta categoria!');
define('TEXT_DELETE_WARNING_PRODUCTS', '<b>ADVERT�NCIA:</b> Existem %s produtos dentro desta categoria!');

define('TEXT_MOVE_PRODUCTS_INTRO', 'Selecione a categoria que voc� desejar <b>%s</b>');
define('TEXT_MOVE_CATEGORIES_INTRO', 'Selecione a categoria que voc� desejar <b>%s</b>');
define('TEXT_MOVE', 'Mover <b>%s</b> a:');

define('TEXT_NEW_CATEGORY_INTRO', 'Complete a seguinte informa��o para a nova categoria');
define('TEXT_CATEGORIES_NAME', 'Nome da Categoria:');
define('TEXT_CATEGORIES_IMAGE', 'Imagem da Categoria:');
define('TEXT_SORT_ORDER', 'Ordem:');

define('TEXT_PRODUCTS_STATUS', 'Status dos Produtos:');
define('TEXT_PRODUCTS_DATE_AVAILABLE', 'Data dispon�vel:');
define('TEXT_PRODUCT_AVAILABLE', 'Dispon�vel');
define('TEXT_PRODUCT_NOT_AVAILABLE', 'Esgotado');
define('TEXT_PRODUCTS_MANUFACTURER', 'Fabricante do produto:');
define('TEXT_PRODUCTS_NAME', 'Nome do Produto:');
define('TEXT_PRODUCTS_DESCRIPTION', 'Descri��o do produto:');
define('TEXT_PRODUCTS_QUANTITY', 'Quantidade:');
define('TEXT_PRODUCTS_MODEL', 'Modelo:');
define('TEXT_PRODUCTS_IMAGE', 'Imagem:');
define('TEXT_PRODUCTS_URL', 'URL do Produto:');
define('TEXT_PRODUCTS_URL_WITHOUT_HTTP', '<small>(sem http://)</small>');
define('TEXT_PRODUCTS_PRICE_NET', 'Pre�o dos Produtos (L�quido):');
define('TEXT_PRODUCTS_PRICE_GROSS', 'Pre�o dos Produtos (Bruto):');
define('TEXT_PRODUCTS_WEIGHT', 'Peso:');

define('EMPTY_CATEGORY', 'Categoria Vazia');

define('TEXT_HOW_TO_COPY', 'Met�do de Copia:');
define('TEXT_COPY_AS_LINK', 'Copiar link produto');
define('TEXT_COPY_AS_DUPLICATE', 'Duplicar produto');

define('ERROR_CANNOT_LINK_TO_SAME_CATEGORY', 'Erro: N�o � poss�vel vincular os produtos na mesma categoria.');
define('ERROR_CATALOG_IMAGE_DIRECTORY_NOT_WRITEABLE', 'Erro:: N�o foi poss�vel salvar no diret�rio de imagens do cat�logo ' . DIR_FS_CATALOG_IMAGES);
define('ERROR_CATALOG_IMAGE_DIRECTORY_DOES_NOT_EXIST', 'Erro: N�o h� imagens diret�rio cat�logo: ' . DIR_FS_CATALOG_IMAGES);
define('ERROR_CANNOT_MOVE_CATEGORY_TO_PARENT', 'Erro: A categoria n�o pode ser movida para uma categoria filha.');
?>
