<?php
$mysql_server      = getenv('DB_HOST');
$mysql_username    = getenv('DB_USER');
$mysql_password    = getenv('DB_PASSWORD');
$mysql_db          = getenv('DB_NAME');

$baseurl = getenv('BASE_URL');
$email_from = getenv('SYSTEM_EMAIL');
$email_notify = getenv('SYSTEM_EMAIL');
$spider_password = getenv('SPIDER_PASSWORD');
$scramble_key = getenv('SCRAMBLE_KEY');

$archiver_path = '/usr/bin';
$archiver_executable = 'zip';
$archiver_listfile_argument = "-@ <";

$use_zip_extension=true;
$collection_download_tar_size = 1024;

$storagedir="/storage/filestore";

$ffmpeg_path='/usr/bin';
$exiftool_path='/usr/bin';
$imagemagick_path='/usr/bin';
$ghostscript_path='/usr/bin';

