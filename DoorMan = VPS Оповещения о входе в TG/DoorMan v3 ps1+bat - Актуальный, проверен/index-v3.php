<?php
	# - ###
	
	#echo '<pre>'; var_dump($_GET); echo '</pre>'; exit('Exit '.__LINE__);
	
	# - ###
	
	$validToken = '123123';
	
	$chatId = '123'; # 2(4) телега
	$tokenBot = '123123:123123-123123123123'; # На хостинге, 2 бот.
	
	# - ###
	
	/*
		Ожидаемые параметры
		token   обяз
		dedic + action       Login  Logout  Alive  RebootTimer  RebootAbort  ?RebootNow
		user
		client
	*/
	
	# - ###
	
	if( count($_GET) === 0 ) # Заход без параметров
	{
		header('Location: https://natribu.org/');
		exit('No GET Data');
	}
	
	if( ! isset($_GET['token']) ) # Нет поля токена
	{
		header('Location: https://natribu.org/');
		exit('Token isset');
	}
	
	if( $_GET['token'] !== $validToken ) # Токен неверный
	{
		header('Location: https://natribu.org/');
		exit('Token invalid');
	}
	
	# - ######
	
	$msg = '';
	
	
	#if( isset($_GET['dedic'],$_GET['action']) )
	$msg .= $_GET['dedic'].' => '.$_GET['action'];
	
	
	switch($_GET['action'])
	{
		case 'Login' : $msg .= " | \u{1F340}\u{1F340}\u{1F340}"; break; # Fin Клевер  Ключ=1F511
		case 'Logout': $msg .= " | \u{1F353}\u{1F353}\u{1F353}"; break; # Fin Клубника   Клен=1F341  Замок=1F512
		case 'Alive' : $msg .= " | \u{1F48E}\u{1F48E}\u{1F48E}"; break; # Fin Алмаз  ПалкиСвязи=1F4F6
		case 'RebootTimer': $msg .= " | \u{1F551}\u{1F551}\u{1F551}"; break;
		case 'RebootAbort': $msg .= " | \u{1F504}\u{1F504}\u{1F504}"; break;
		case '':  break;
	}
	
	$msg .= PHP_EOL;
	
	
	# Юзер отправится только если он не дефолтный
	if( isset($_GET['user']) && ! empty($_GET['user']))
		if( ! in_array( $_GET['user'], ['Administrator','Администратор']) )
			$msg .= 'User: '.$_GET['user'].PHP_EOL;
	
	# Клиент отправится только если удалось его получить в винде
	if( isset($_GET['client']) && ! empty($_GET['client']) )
		$msg .= 'Client: '.$_GET['client'].PHP_EOL;
	
	
	# Юзлесс но робит  $msg .= PHP_EOL.PHP_EOL.'SenderIP: '.@$_SERVER['REMOTE_ADDR'];
	
	# - ######
	
	#exit('exit=line-'.__LINE__);
	
	$url = "https://api.telegram.org/bot" . $tokenBot . "/sendMessage?chat_id=" . $chatId;
    $url = $url . "&text=" . urlencode($msg);
	$url = $url . "&parse_mode=html"; # Что бы работало форматирование через html-теги
	
	#var_dump($msg);
	#var_dump($url);
	
	#exit($msg);
	
	$result = @file_get_contents($url);
	
	#echo $result;
	exit('End')




?>