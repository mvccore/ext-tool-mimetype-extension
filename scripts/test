#!/bin/env php
<?php

	include_once(__DIR__ . '/../src/MvcCore/Ext/Tools/MimeTypesExtensions.php');
	
	use \MvcCore\Ext\Tools;
	
	class Test
	{
		protected static $extsMimes = [
			'doc'	=> ['application/msword'],
			'pdf'	=> ['application/pdf'],
			'php'	=> ['application/x-httpd-php'],
			'dmg'	=> ['application/x-apple-diskimage', 'application/octet-stream'],
			'ogg'	=> ['audio/ogg',],
		];
		
		protected static $mimesExts = [
			'application/pdf'		=> ['pdf',],
			'text/plain'			=> ['txt','text','conf','def','list','log','in','ini','c','c++','cc','com','cxx','f','f90','for','g','h','hh','idc','jav','java','lst','m','mar','pl','sdml',],
			'application/msword'	=> ['doc','dot','w6w','wiz','word',],
			'application/ogg'		=> ['ogx'],
		];
		
		public static function TestMimeTypesByExtensions () {
			echo "Testing mime types by extensions:\n";
			foreach (self::$extsMimes as $ext => $mimes) {
				$validatorMimes = Tools\MimeTypesExtensions::GetMimeTypesByExtension($ext);
				if (json_encode($validatorMimes) === json_encode($mimes)) {
					echo '.';
				} else {
					echo 'E';
					//print_r($validatorMimes);
				}
			}
		}
		
		public static function TestExtensionsByMimeTypes () {
			echo "\n\nTesting extensions by mime types:\n";
			foreach (self::$mimesExts as $mime => $exts) {
				$validatorExts = Tools\MimeTypesExtensions::GetExtensionsByMimeType($mime);
				if (json_encode($validatorExts) === json_encode($exts)) {
					echo '.';
				} else {
					echo 'E';
					//echo "'" . $mime . "'\t\t=> ['" . implode("','", $validatorExts) . "']," . PHP_EOL;
				}
			}
		}
	}
	
	if (php_sapi_name() !== 'cli')
		header('Content-Type: text/plain');
	
	echo PHP_EOL.PHP_EOL.PHP_EOL;
	Test::TestMimeTypesByExtensions();
	Test::TestExtensionsByMimeTypes();
	echo PHP_EOL.PHP_EOL.PHP_EOL;