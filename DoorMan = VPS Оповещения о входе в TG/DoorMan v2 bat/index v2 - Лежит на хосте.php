<?php
	
	# - ###
	
	$validToken = 'tok321';
	
	$chatId = '123123'; # 2(4) телега
	$tokenBot = '123123:123-123123'; # На хостинге, 2 бот.
	
	# - ###
	
	if( ! isset($_GET['data']) )
	{
		header('Location: https://natribu.org/');
		exit('Data isset');
	}
	
	$data = $_GET['data'];
	
	if( strpos($data, $validToken.'_') === false)
	{
		header('Location: https://natribu.org/');
		exit('Нет _');
	}

	
	if( count(explode('_',$data)) !== 2 )
	{
		header('Location: https://natribu.org/');
		exit('_ != 2');
	}
	
	
	$msg = explode('_',$data)[1];
	
	if( empty($msg) )
		exit('Empty msg');
	
	# - ######
	
	
	$msg = str_replace('@',PHP_EOL,$msg);
	$msg = str_replace(':',': ',$msg);
	
	$msg .= PHP_EOL.PHP_EOL.'SenderIP: '.@$_SERVER['REMOTE_ADDR'];
	
	
	
	# - ######
	
	#exit('exit=line-'.__LINE__);
	
	$url = "https://api.telegram.org/bot" . $tokenBot . "/sendMessage?chat_id=" . $chatId;
    $url = $url . "&text=" . urlencode($msg);
	$url = $url . "&parse_mode=html"; # Что бы работало форматирование через html-теги
	
	#var_dump($msg);
	#var_dump($url);
	
	#exit($msg);
	
	
	
	$result = @file_get_contents($url);
	
	#var_dump($result);
	#exit('123');
	
	#echo $msg ?? 'Msg empty';
	#echo $result;
	exit('End')




?>