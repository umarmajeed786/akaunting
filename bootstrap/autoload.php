<?php

// Define minimum supported PHP version
define('AKAUNTING_PHP', '7.3.0');

// Check PHP version
if (version_compare(PHP_VERSION, AKAUNTING_PHP, '<')) {
    $message = 'Error: Ask your hosting provider to use PHP ' . AKAUNTING_PHP . ' or higher for HTTP, CLI, and php command.' . PHP_EOL . PHP_EOL . 'Current PHP version: ' . PHP_VERSION . PHP_EOL;

    if (defined('STDOUT')) {
        fwrite(STDOUT, $message);
    } else {
        echo($message);
    }

    die(1);
}

define('LARAVEL_START', microtime(true));

// Load composer for core
require __DIR__ . '/../vendor/autoload.php';

// require_once __DIR__ . '/composer/autoload_real.php';

// return ComposerAutoloaderInit5f1508f879f7ea4de9b4a7a4df717770::getLoader();
// Load composer for modules
foreach (glob(__DIR__ . '/../modules/*') as $folder) {
    $autoload = $folder . '/vendor/autoload.php';

    if (!is_file($autoload)) {
        continue;
    }

    require $autoload;
}
