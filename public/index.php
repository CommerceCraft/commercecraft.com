<?php

use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Silex\Provider\TwigServiceProvider;

require_once __DIR__ . '/../vendor/autoload.php';

$app = new Silex\Application();
$app->register(new TwigServiceProvider(), array(
  'twig.path' => __DIR__ . '/../views',
));

$app->get('/', function(Request $request) use ($app) {
  return $app['twig']->render('scripts/index.twig', array());
});

$app->run();
