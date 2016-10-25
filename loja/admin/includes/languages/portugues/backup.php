<?php
/*
  $Id: backup.php 1739 2007-12-20 00:52:16Z hpdl $

  osCommerce, Open Source E-Commerce Solutions
  http://www.oscommerce.com

  Copyright (c) 2003 osCommerce

  Released under the GNU General Public License
*/

define('HEADING_TITLE', 'Backup do Banco de Dados');

define('TABLE_HEADING_TITLE', 'T�tulo');
define('TABLE_HEADING_FILE_DATE', 'Data');
define('TABLE_HEADING_FILE_SIZE', 'Tamanho');
define('TABLE_HEADING_ACTION', 'A��o');

define('TEXT_INFO_HEADING_NEW_BACKUP', 'Nova C�pia de Seguran�a');
define('TEXT_INFO_HEADING_RESTORE_LOCAL', 'Restaurar Localmente');
define('TEXT_INFO_NEW_BACKUP', 'O processo de c�pia que deve levar alguns minutos, n�o interrompa-o. ');
define('TEXT_INFO_UNPACK', '<br><br>(Ap�s descompactar o arquivo)');
define('TEXT_INFO_RESTORE', 'N�o interrompa o processo de restaura��o.<br><br>Quanto maior a c�pia de seguran�a mais demorado ser� esse processo!<br><br>Se poss�vel, usar o cliente mysql.<br><br>Por exemplo:<br><br><b>mysql -h' . DB_SERVER . ' -u' . DB_SERVER_USERNAME . ' -p ' . DB_DATABASE . ' < %s </b> %s');
define('TEXT_INFO_RESTORE_LOCAL', 'N�o interrompa o processo de restaura��o.<br><br>Quanto maior a c�pia de seguran�a mais demorar� esse processo!');
define('TEXT_INFO_RESTORE_LOCAL_RAW_FILE', 'Deve ser uma arquivo de texto.');
define('TEXT_INFO_DATE', 'Data:');
define('TEXT_INFO_SIZE', 'Tamanho:');
define('TEXT_INFO_COMPRESSION', 'Compress�o:');
define('TEXT_INFO_USE_GZIP', 'Usar GZIP');
define('TEXT_INFO_USE_ZIP', 'Usar ZIP');
define('TEXT_INFO_USE_NO_COMPRESSION', 'Sem compress�o (SQL diretamente)');
define('TEXT_INFO_DOWNLOAD_ONLY', 'Download apenas (n�o guardar no servidor)');
define('TEXT_INFO_BEST_THROUGH_HTTPS', 'De prefer�ncia com uma conex�o segura');
define('TEXT_NO_EXTENSION', 'Nenhum');
define('TEXT_BACKUP_DIRECTORY', 'Diret�rio para Copias de Seguran�a:');
define('TEXT_LAST_RESTORATION', 'Ultima Restaura��o:');
define('TEXT_FORGET', '(<u>esquecer</u>)');
define('TEXT_DELETE_INTRO', 'Tem certeza de que deseja excluir esta c�pia?');

define('ERROR_BACKUP_DIRECTORY_DOES_NOT_EXIST', 'Erro: O diret�rio de c�pias de seguran�a n�o existe.');
define('ERROR_BACKUP_DIRECTORY_NOT_WRITEABLE', 'Erro: N�o tenho permiss�o para salvar no diret�rio de c�pias de seguran�a.');
define('ERROR_DOWNLOAD_LINK_NOT_ACCEPTABLE', 'Erro: N�o � aceito links.');

define('SUCCESS_LAST_RESTORE_CLEARED', 'Sucesso: A data da �ltima restaura��o foi apagada.');
define('SUCCESS_DATABASE_SAVED', 'Sucesso: A base de dados foi salva.');
define('SUCCESS_DATABASE_RESTORED', 'Sucesso: A base de dados foi restaurada.');
define('SUCCESS_BACKUP_DELETED', 'Sucesso: a c�pia de seguran�a foi apagada.');
?>
