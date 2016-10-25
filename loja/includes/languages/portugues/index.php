<?php
/*
  $Id: index.php 1739 2007-12-20 00:52:16Z hpdl $

  osCommerce, Open Source E-Commerce Solutions
  http://www.oscommerce.com

  Copyright (c) 2003 osCommerce

  Released under the GNU General Public License
*/

define('TEXT_MAIN', 'Esta é a configuração padrão em que a loja osCommerce é instalada, os produtos apresentados são apenas para demonstração. <b>Os produtos adquiridos não serão cobrados e nem enviados ao cliente</b>. Qualquer informação sobre estes produtos deve ser tratada como ficção.<br><br><table border="0" width="100%" cellspacing="5" cellpadding="2"><tr><td class="main" valign="top">' . tep_image(DIR_WS_IMAGES . 'default/1.gif') . '</td><td class="main" valign="top"><b>Mensagens de Erro</b><br><br>Se ocorrer alguma mensagem de erro, favor corrigi-la antes de continuar.<br><br>As mensagens de erro são exibidas no topo das páginas com esta <span class="messageStackError">cor de fundo</span>.<br><br>São feitas verificações para garantir que não houve problemas na instalação de sua loja virtual - estas verificações podem ser desativadas editando os parâmetros adequados no arquivo includes/application_top.php .</td></tr><td class="main" valign="top">' . tep_image(DIR_WS_IMAGES . 'default/2.gif') . '</td><td class="main" valign="top"><b>Editando os Textos das Páginas</b><br><br>Este texto pode ser alterado editando o seguinte arquivo, de acordo com o idioma:<br><br><nobr class="messageStackSuccess">[caminho para o catálogo]/includes/languages/' . $language . '/' . FILENAME_DEFAULT . '</nobr><br><br>Pode-se editá-lo, também através do menu da administração na opção <nobr class="messageStackSuccess">Ferramentas->Escolher Idiomas->' . ucfirst($language) . '->Definir Linguagem</nobr> <br><br>O texto aparecerá como abaixo:<br><br><nobr>define(\'TEXT_MAIN\', \'<span class="messageStackSuccess">Esta é a configuração padrão em que a loja...</span>\');</nobr><br><br>Somente o texto destacado em verde pode ser modificado - É importante manter o "define()" e o "TEXT_MAIN". Se não quer nenhum texto nesta página deixe o conteudo entra as aspas simples vazia como no exemplo abaixo: <br><br><nobr>define(\'TEXT_MAIN\', \'\');</nobr><br><br>Mais informações sobre a constante PHP define() <a href="http://www.php.net/define" target="_blank"><u>aqui</u></a>.</td></tr><tr><td class="main" valign="top">' . tep_image(DIR_WS_IMAGES . 'default/3.gif') . '</td><td class="main" valign="top"><b>Documentação Online</b><br><br>	Consulte a documentação online no site <a href="http://www.oscommerce.info" target="_blank"><u>osCommerce Knowledge Base</u></a>.<br><br>Suporte está disponível em <a href="http://www.oscommerce.com/support" target="_blank"><u>osCommerce Support Site</u></a>.</td></tr></table><br>Se você deseja fazer o download de soluções para sua loja, ou se deseja contribuir para o projeto osCommerce visite-nos em  <a href="http://www.oscommerce.com" target="_blank"><u>osCommerce.com</u></a>. Loja rodando na versão: <font color="#f0000"><b>' . PROJECT_VERSION . '</b></font>.');
define('TABLE_HEADING_NEW_PRODUCTS', 'Novos Produto para %s');
define('TABLE_HEADING_UPCOMING_PRODUCTS', 'Em Breve');
define('TABLE_HEADING_DATE_EXPECTED', 'Lançamentos');

if ( ($category_depth == 'products') || (isset($HTTP_GET_VARS['manufacturers_id'])) ) {
  define('HEADING_TITLE', 'Produtos');
  define('TABLE_HEADING_IMAGE', '');
  define('TABLE_HEADING_MODEL', 'Modelo');
  define('TABLE_HEADING_PRODUCTS', 'Produtos');
  define('TABLE_HEADING_MANUFACTURER', 'Fabricante');
  define('TABLE_HEADING_QUANTITY', 'Quantidade');
  define('TABLE_HEADING_PRICE', 'Preço');
  define('TABLE_HEADING_WEIGHT', 'Peso');
  define('TABLE_HEADING_BUY_NOW', 'Compre Agora');
  define('TEXT_NO_PRODUCTS', 'Não há produtos nessa categoria.');
  define('TEXT_NO_PRODUCTS2', 'Não há produtos deste fabricante.');
  define('TEXT_NUMBER_OF_PRODUCTS', 'Número de Produtos: ');
  define('TEXT_SHOW', '<b>Mostrar:</b>');
  define('TEXT_BUY', 'Compre 1 \'');
  define('TEXT_NOW', '\' agora');
  define('TEXT_ALL_CATEGORIES', 'Todas');
  define('TEXT_ALL_MANUFACTURERS', 'Todos');
} elseif ($category_depth == 'top') {
  define('HEADING_TITLE', 'O Que Há de Novo?');
} elseif ($category_depth == 'nested') {
  define('HEADING_TITLE', 'Categorias');
}
?>
