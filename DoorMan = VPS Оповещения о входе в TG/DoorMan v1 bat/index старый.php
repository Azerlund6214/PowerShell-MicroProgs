<?php
	
	
	$data = $_GET['data'];
	
	$validToken = '123234';
	
	
	
	if( strpos($data, $validToken.'_') === false)
	{
		header('Location: https://natribu.org/');
		exit;
	}

	
	
	$msg = explode('_',$data)[1];

	if( empty($msg) )
		exit('Empty msg');


	# - ######
	
	#exit('exit=line-'.__LINE__);
	
	$chatId = '123'; # 2(4) телега
	$tokenBot = '123:123123123';

	$url = "https://api.telegram.org/bot" . $tokenBot . "/sendMessage?chat_id=" . $chatId;
    $url = $url . "&text=" . urlencode($msg);

	$result = @file_get_contents($url);

	

	echo $msg ?? 'Msg empty';
	echo $result;





?>