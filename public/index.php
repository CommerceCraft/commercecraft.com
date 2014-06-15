<?php

use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Silex\Provider\TwigServiceProvider;

require_once __DIR__ . '/../vendor/autoload.php';

$app = new Silex\Application();
$app->register(new TwigServiceProvider(), array(
  'twig.path' => __DIR__ . '/../views',
));

// web/index.php

$filename = __DIR__.preg_replace('#(\?.*)$#', '', $_SERVER['REQUEST_URI']);
if (php_sapi_name() === 'cli-server' && is_file($filename)) {
    return false;
}

$app->get('/', function(Request $request) use ($app) {
  return $app['twig']->render('scripts/index.twig', array());
});

$app->run();
