<?php
//url获取
function urlget(){
    $url=$_SERVER['SERVER_NAME'].':'.$_SERVER['SERVER_PORT'].$_SERVER['REQUEST_URI'];//print_r($_SERVER['REQUEST_URI']);
    $urlstrs=parse_url($url);
    return $urlstrs;
}


/**解析url
 * @param $app
 * @param $controller
 * @param $method
 */
function urlpaser(&$app,&$controller,&$method,&$parms){

    $urlinfo=urlget();

    //将querystring 的值拼接入path
    $querys = explode('&',$urlinfo['query']);
    foreach ($querys as $qstr){
        $sq = explode('=',$qstr);
        if(!empty($sq[1])){
            $urlinfo['path'].='/'.$sq[1];
        }
    }

    //清除多余字符
    while (strpos($urlinfo['path'],"//")>-1){
        $urlinfo['path'] = str_replace("//","/",$urlinfo['path']);
    }

    //检测路由是否存在 如果存在则替换为实际控制器方法
    $route = \heephp\route::get($urlinfo['path']);
    if($route){ $urlinfo['path'] = $route; }

    $urlinfos = explode('/', $urlinfo['path']);

    //过滤page等参数
    //-----------------------
    $pagetags = \heephp\route::get_pagetag();
    if(is_array($pagetags)) {
        foreach ($pagetags as $p) {
            for ($i = 3; $i > 0; $i--) {
                if (strstr($urlinfos[$i], $p . '_') == $urlinfos[$i]) {
                    unset($urlinfos[$i]);
                }
            }
        }
    }
    //-------------------------

    if(APPS) {
        $app=$urlinfos[1]; $controller=$urlinfos[2]; $method=$urlinfos[3];
        for($i=4;$i<count($urlinfos);$i++){
            array_push($parms,$urlinfos[$i]);
        }
    }else {
        $controller=$urlinfos[1]; $method=$urlinfos[2];
        for($i=3;$i<count($urlinfos);$i++){
            array_push($parms,$urlinfos[$i]);
        }
    }

    //如果为空则选择默认的控制器方法
    $app = APPS?(empty($app)?config('default_app'):$app):'';
    $controller = empty($controller)?config('default_controller'):$controller;
    $method = empty($method)?config('default_method'):$method;


    /*echo $app.'|';
    echo $controller.'|';
    echo $method;*/
    if(!PATHINFO) {
        //获取参数为数组
        if (isset($urlinfo['query']) && !empty($urlinfo['query'])) {
            $query = $urlinfo['query'];
            $arr = explode('&', $query);
            foreach ($arr as $k => $v) {
                $arr = explode('=', $v);
                $parms[$arr[0]] = $arr[1];
            }
        }
    }

}

/***
从get或Post中获取数据
 ***/
function request($name,$value=''){
    $gets = $_GET;
    $posts = $_POST;
    if(strpos($name,'.')>-1){
        $action = '';
        $var = '';
        //$value = '';

        list($action,$var/*,$value*/)=explode('.',$name);
        if($action=='get'||$action=='g'||$action=="GET"||$action=='G'){
            if(empty($var))
                return inputfilter($gets);
            return inputfilter($gets[$var] ?? '');
        }else if($action=='post'||$action=='p'||$action=="POST"||$action=='P'){
            if(empty($var))
                return inputfilter($posts);
            return inputfilter($posts[$var] ?? '');
        }else if($action=='server'||$action=='ser'){
            return $_SERVER[strtoupper($var)];
        }else if($action=='session'){
            if(empty($value)) {
                return $_SESSION[$var];
            }else {
                $_SESSION[$var] = $value;
                return $_SESSION[$var];
            }
        }
        else if($action=='cookie'){
            if(empty($value))
                return $_COOKIE[$var];
            else {
                $_COOKIE[$var] = $value;
                return $_COOKIE[$var];
            }
        }
    }else{
        return $gets[$name] ?? '';
    }
}

function cache($name='',$value='',$exp_time=1){

    $cache = null;
    $diver = config('cache.diver');

    if($diver=='redis'){

        $cache = new \heephp\cache\redis($exp_time);

    }
    else if($diver=='memcache'){

        $cache = new \heephp\cache\memcache($exp_time);
    }
    else {

        $cache = new \heephp\cache\file($exp_time);
    }

    if(empty($name)&&empty($value))
        return $cache;

    if(empty($value)){
        return $cache->get($name);
    }else{
        return $cache->set($name,$value);
    }
}

/*
 * 上传文件
 */
function uploadfile($fname,$allowedExts,$allowfilesize,$dir,$nametype='md5'){
    $info = [];
    // 允许上传的图片后缀
    //$allowedExts = array("gif", "jpeg", "jpg", "png");
    $temp = explode(".", $_FILES[$fname]["name"]);
    //echo $_FILES["file"]["size"];
    $extension = end($temp);     // 获取文件后缀名
    if (($_FILES[$fname]["size"] < $allowfilesize)   // 小于 200 kb
        && in_array($extension, $allowedExts))
    {
        if ($_FILES[$fname]["error"] > 0)
        {
            $info['error']= $_FILES[$fname]["error"];
        }
        else {
            $info['source_name'] = $_FILES[$fname]["name"];
            $info['type'] = $_FILES[$fname]["type"];
            $info['size'] = ($_FILES[$fname]["size"] / 1024);
            $info['temp_name'] = $_FILES[$fname]["tmp_name"];

            // 判断当期目录下的 dir 目录是否存在该文件
            if (!is_dir($dir)) {
                $res = mkdir($dir, 0777, true);
                if (!$res) {
                    $info['error'] = "目录 $dir 创建失败";
                }
            }
            // 如果没有 dir 目录，你需要创建它，upload 目录权限为 777
            if (file_exists($dir . $_FILES[$fname]["name"])) {
                $info['error'] = $_FILES[$fname]["name"] . " 文件已经存在。 ";
            }

            //生成文件名 默认 md5
            $filename = md5(time() . rand(1, 999999)) . '.' . $extension;

            if ($nametype == 'timespan')
                $filename = time() . rand(1, 999999) . '.' . $extension;
            else if ($nametype == 'guid')
                $filename = guid() . '.' . $extension;

            $info['name']= $filename;
            $info['ext']=$extension;

            move_uploaded_file($_FILES[$fname]["tmp_name"], $dir .'\\'.$filename);
            return $info;

        }
    }
    else
    {
        $info['error']= "非法的文件格式或文件大小不符合要求";
    }
    return $info;
}

function guid() {
    $charid = strtoupper(md5(uniqid(mt_rand(), true)));
    $hyphen = chr(45);// "-"
    $uuid = chr(123)// "{"
        .substr($charid, 0, 8).$hyphen
        .substr($charid, 8, 4).$hyphen
        .substr($charid,12, 4).$hyphen
        .substr($charid,16, 4).$hyphen
        .substr($charid,20,12)
        .chr(125);// "}"
    return $uuid;
}


function inputfilter($content){

   return escapeString($content);
}

/**
 * 防sql注入字符串转义
 * @param $content 要转义内容
 * @return array|string
 */
 function escapeString($content)
 {
     $pattern = "/(select[\s])|(insert[\s])|(update[\s])|(delete[\s])|(from[\s])|(where[\s])|(drop[\s])/i";
     if (is_array($content)) {
         foreach ($content as $key => $value) {

             if(is_array($value)){

                 for($i=0;$i<count($value);$i++){
                     //$content[$key][$i] = htmlencode(addslashes(trim($value[$i])));
                     $content[$key][$i] = htmlentities(addslashes(trim($value[$i])),ENT_QUOTES,"UTF-8");
                     if (preg_match($pattern, $content[$key][$i])) {
                         $content[$key][$i] = '';
                     }
                 }

             }else {

                 //$content[$key] = htmlencode(addslashes(trim($value)));
                 $content[$key] = htmlentities(addslashes(trim($value)),ENT_QUOTES,"UTF-8");
                 if (preg_match($pattern, $content[$key])) {
                     $content[$key] = '';
                 }

             }

         }
     } else {
         //$content = htmlencode(addslashes(trim($content)));
         $content = htmlentities(addslashes(trim($content)),ENT_QUOTES,"UTF-8");
         if (preg_match($pattern, $content)) {
             $content = '';
         }
     }
     return $content;
 }


/**
 * 安全过滤函数
 *
 * @param $string
 * @return string
 */
function safe_replace($string) {
    $string = str_replace('%20','',$string);
    $string = str_replace('%27','',$string);
    $string = str_replace('%2527','',$string);
    $string = str_replace('*','',$string);
    $string = str_replace('"','&quot;',$string);
    $string = str_replace("'",'',$string);
    $string = str_replace('"','',$string);
    $string = str_replace(';','',$string);
    $string = str_replace('<','&lt;',$string);
    $string = str_replace('>','&gt;',$string);
    $string = str_replace("{",'',$string);
    $string = str_replace('}','',$string);
    $string = str_replace('\\','',$string);
    return $string;
}



    /**生成随机数字
 * @param int $size
 * @return string
 */
function randChar($len = 4,$format='all')
{
    switch($format){
        case 'all'://生成包含数字和字母的验证码
            $chars='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789'; break;
        case 'char'://仅生成包含字母的验证码
            $chars='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz'; break;
        case 'upper':
            $chars='ABCDEFGHIJKLMNOPQRSTUVWXYZ';break;
        case 'lower':
            $chars='abcdefghijklmnopqrstuvwxyz';break;
        case 'number'://仅生成包含数字的验证码
            $chars='0123456789'; break;
        default :
            $chars='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789'; break;
    }
    $string='';
    while(strlen($string)<$len)
        $string.=substr($chars,(mt_rand()%strlen($chars)),1);
    return $string;

}

/**生成验证码图片
 * @param string $code
 * @param int $width
 * @param int $height
 * @param int $linecount
 * @return bool
 */
function vercode($code = '',$fontsize=20,$width = 80,$height = 25,$linecount=12)
{
    if(empty($code) || !isset($code))
    {
        return false;
    }

    request('session.vcode',$code);

    $img = imagecreatetruecolor($width, $height);
    $black = imagecolorallocate($img, 0x00, 0x00, 0x00);
    $green = imagecolorallocate($img, 0x00, 0xFF, 0x00);
    $white = imagecolorallocate($img, 0xFF, 0xFF, 0xFF);
    $red = imagecolorallocate($img, 0xFF, 0x00, 0x00);
    $blue = imagecolorallocate($img, 0x00, 0x00, 0xFF);

    $crand = rand(0,4);
    $bgcolor = $crand==1?$white:($crand==2?$green:($crand==3?$black:($crand==4?$blue:$red)));
    $fontcolor = $crand==1?$red:($crand==2?$black:($crand==3?$white:($crand==4?$white:$white)));
    $lincolor = $crand==1?$white:($crand==2?$blue:($crand==3?$green:($crand==4?$black:$red)));
    imagefill($img,0,0,$bgcolor);

    imagettftext($img,$fontsize,rand(-10,10),rand(0,$width/3),rand(0,$height/3)+20,$fontcolor,ROOT.'/public/assets/fonts/arial.ttf',$code);
    //imagestring($img, 5, rand(0,$width/3), rand(0,$height/3), $code, $fontcolor);
    //加入噪点干扰
    for($i=0;$i<$linecount;$i++) {
        imagesetpixel($img, rand(0, $width) , rand(0, $height) , $black);  //imagesetpixel — 画一个单一像素，语法: bool imagesetpixel ( resource $image , int $x , int $y , int $color )
        imagesetpixel($img, rand(0, $width) , rand(0, $height) , $green);
        imagesetpixel($img, rand(0, $width) , rand(0, $height) , $white);
        imagesetpixel($img, rand(0, $width) , rand(0, $height) , $red);
        imageline($img, rand(0, $width) , rand(0, $height), rand(0, $width) , rand(0, $height),$lincolor);
    }

    //输出验证码
    header("content-type: image/png");
    imagepng($img);  //保存图片
    imagedestroy($img);  //图像处理完成后，使用 imagedestroy() 指令销毁图像资源以释放内存，虽然该函数不是必须的，但使用它是一个好习惯。

    //return $domain_name;
}

/**
 * 返回验证码是否验证成功
 * @param string $vcodename
 * @return bool
 */
function checkvcode($vcodename = 'vcode'){

    $vcodename= empty($vcodename)?'vcode':$vcodename;

    $vcode =request('session.'.config('validata_code_session'));
    $data = request('post.');

    return $data[$vcodename]==$vcode;
}

/**
*@$originalImage => 原始图片
*@$waterPos => 水印位置
*@$waterImage => 水印图片
*@$waterText => 水印文字
*@$textFont => 文字大小
*@$textColor => 文字顔色
*/
function imageWaterMark($originalImage, $waterPos = 5, $waterImage = '', $waterText = '', $textFont = 5, $textColor = '#FFFFFF',$fontFile=ROOT.'/public/assets/fonts/arial.ttf')
{
    $isWaterImage = FALSE;

//从水印图片文件新建一幅图像
    if (!empty($waterImage) && file_exists($waterImage)) {
        $isWaterImage = TRUE;
        $waterImageInfo = getimagesize($waterImage);
        $waterImageWidth = $waterImageInfo[0];
        $waterImageHeight = $waterImageInfo[1];
        switch ($waterImageInfo[2]) {
            case 1:
                $waterIm = @imagecreatefromgif($waterImage);
                break;
            case 2:
                $waterIm = @imagecreatefromjpeg($waterImage);
                break;
            case 3:
                $waterIm = @imagecreatefrompng($waterImage);
                break;
            default:
                ;
        }
    }

//从源图片文件新建一幅图像
    if (!empty($originalImage) && file_exists($originalImage)) {
        $originalImageInfo = getimagesize($originalImage);
        $originalImageWidth = $originalImageInfo[0];
        $originalImageHeight = $originalImageInfo[1];
        switch ($originalImageInfo[2]) {
            case 1:
                $originalIm = @imagecreatefromgif($originalImage);
                break;
            case 2:
                $originalIm = @imagecreatefromjpeg($originalImage);
                break;
            case 3:
                $originalIm = @imagecreatefrompng($originalImage);
                break;
            default:
                ;
        }
    }
//$w、$h是水印图片或水印文字的宽高度
    if ($isWaterImage) {
        $w = $waterImageWidth;
        $h = $waterImageHeight;
        $label = "图片的";
    } else {
        $temp = imagettfbbox(ceil($textFont * 2.5), 0, $fontFile, $waterText);
        $w = $temp[2] - $temp[6];
        $h = $temp[3] - $temp[7];
        $label = "文字区域";
        unset($temp);
    }
    if (($originalImageWidth < $w) || ($originalImageHeight < $h)) {
        return;
    }
    switch ($waterPos) {
        case 0://随机
            $posX = rand(0, ($originalImageWidth - $w));
            $posY = rand(0, ($originalImageHeight - $h));
            break;
        case 1://1为顶端居左
            $posX = 0;
            $posY = 0;
            break;
        case 2://2为顶端居中
            $posX = ($originalImageWidth - $w) / 2;
            $posY = 0;
            break;
        case 3://3为顶端居右
            $posX = $originalImageWidth - $w;
            $posY = 0;
            break;
        case 4://4为中部居左
            $posX = 0;
            $posY = ($originalImageHeight - $h) / 2;
            break;
        case 5://5为中部居中
            $posX = ($originalImageWidth - $w) / 2;
            $posY = ($originalImageHeight - $h) / 2;
            break;
        case 6://6为中部居右
            $posX = $originalImageWidth - $w;
            $posY = ($originalImageHeight - $h) / 2;
            break;
        case 7://7为底端居左
            $posX = 0;
            $posY = $originalImageHeight - $h;
            break;
        case 8://8为底端居中
            $posX = ($originalImageWidth - $w) / 2;
            $posY = $originalImageHeight - $h;
            break;
        case 9://9为底端居右
            $posX = $originalImageWidth - $w;
            $posY = $originalImageHeight - $h;
            break;
        default://随机
            $posX = rand(0, ($originalImageWidth - $w));
            $posY = rand(0, ($originalImageHeight - $h));
            break;
    }

//将水印图片或文字画到源图上
    if ($isWaterImage) {
        imagecopy($originalIm, $waterIm, $posX, $posY, 0, 0, $waterImageWidth, $waterImageHeight);
    } else {
        if (!empty($textColor) && (strlen($textColor) == 7)) {
            $r = hexdec(substr($textColor, 1, 2));
            $g = hexdec(substr($textColor, 3, 2));
            $b = hexdec(substr($textColor, 5));
        } else {
            $r = 255;
            $g = 255;
            $b = 255;
        }
        imagestring($originalIm, $textFont, $posX, $posY, $waterText, imagecolorallocate($originalIm, $r, $g, $b));
    }
//生成水印后的图片
    //@unlink($originalImage);
    switch ($originalImageInfo[2]) {
        case 1:
            imagegif($originalIm, $originalImage);
            break;
        case 2:
            imagejpeg($originalIm, $originalImage);
            break;
        case 3:
            imagepng($originalIm, $originalImage);
            break;
        default:
            ;
    }
//销毁图像

    $waterIm==null?'':imagedestroy($waterIm);
    $originalIm==null?'':imagedestroy($originalIm);
}



/**
 * 发送邮件
 *
 * */
function sendmail($server,$username,$password,$form,$to,$subject,$body,$attachment='')
{
    $mail = new sendmail();
    $mail->setServer($server, $username, $password);
    $mail->setFrom($form);
    $mail->setReceiver($to);
    $mail->setMailInfo($subject, $body, $attachment);
    $mail->sendMail();
}

/**
 * 生成URL路径
 * @path 路径
 */
function url($path){

    //清除多余字符
    while (strpos($path,"//")>-1){
        $path = str_replace("//","/",$path);
    }


    $allpath = explode('/',$path);

    if(strstr($path,'/')==$path){

        return $path;

    }else{

        if(APPS){
            return '/'.APP.'/'.CONTROLLER.'/'.$path;
        }else
            return '/'.CONTROLLER.'/'.$path;
    }
}

function config($name=''){
     $config = \heephp\config::get($name);
     return $config;
}

function db(){
    $config= config();
    $dbconfig =$config['db'];

    $db=null;
    if($dbconfig['diver']=='mysqli')
        $db = new \heephp\database\mysqli($dbconfig['db_host'],$dbconfig['db_port'],$dbconfig['db_username'],$dbconfig['db_password'],$dbconfig['db_name'],$dbconfig['charset'],$config['pagesize']);
    else
        $db = new \heephp\database\pdo('mysql:host='.$dbconfig['db_host'].';database='.$dbconfig['db_name'].';', $dbconfig['db_username'], $dbconfig['db_password']);

    return $db;
}

function model($table){
    include_once 'model.php';
    $modelINSTANCE = null;
    //$modelNAME = 'heephp\\';
    if(APPS){
        $fname='./../app/'.APP.'/model/'.$table.'.php';
        if(is_file($fname)) {
            include_once $fname;
            $modelNAME = '\\app\\'.APP . '\\model\\' . $table;
        }else{
            $modelNAME = '\\heephp\\model';
        }
    }else{
        $fname = './../app/model/'.$table.'.php';
        if(is_file($fname)) {
            include_once $fname;
            $modelNAME = '\\app\model\\' . $table;
        }else{
            $modelNAME = '\\heephp\\model';
        }
    }

    $modelINSTANCE = new $modelNAME($table);
    return $modelINSTANCE;
}

//多语言
function lang($tag){

    if(config('lang.on')==false){
        return '';
    }

    $langcach = cache('lang_'.config('lang.default'));

    if(!$langcach) {
        $lang = new \heephp\lang();
        $langcach = $lang->get();
        cache('lang_'.config('lang.default'),$langcach,31104000);
    }

    return $langcach[$tag] ?? '';

}

//切面
function aop($name,&$parms=array()){
    $aop=new \heephp\aop();
    $aop->invoke($name,$parms);
}


//视图中导入
function import($file,$vars=[]){
    //传递变量
    foreach($vars as $k=>$v){
        $$k = $v;
    }

    $backtrace=debug_backtrace(); //print_r($backtrace);//if($file=='sidebar.php'){var_dump($backtrace);}
    //获取引用页面的变量
    for ($i=0;$i<count($backtrace);$i++){

        if($backtrace[$i]['function']=='fetch'&&$backtrace[$i]['class']=='heephp\controller') {

            $pagevars = $backtrace[$i]['object']->pagevar;
            foreach ($pagevars as $item) {
                $k = array_key_first($item);
                $v = array_values($item);

                $$k = $v[0];
            }
            break;
        }

    }

    $fname = '';
    if(APPS) {
        if(strstr($file, '/') == $file) {
            $fname = './../app/' . APP . '/view/' . $file;
            include $fname;
        }else {
            $currtfile = $backtrace[0]['file'];
            include dirname($currtfile) . '/' . $file;
        }
    }else{
        if(strstr($file, '/') == $file) {
            $fname = './../app/view/' . CONTROLLER . '/' . $file;
            include $fname;
        }else/*if (strpos($file,'/')>0)*/{
            $currtfile = $backtrace[0]['file'];
            include dirname($currtfile).'/'.$file;
        }/*
        else {
            include $file;
            return;
        }*/
    }



}

/**
 * 将时间解析为 分钟 小时 前
 * @param $time
 * @return false|string
 *
 */
function transfer_time($time)
{
    $rtime = date("m-d H:i",$time);
    $htime = date("H:i",$time);
    $time = time() - $time;
    if ($time < 60)
    {
        $str = '刚刚';
    }
    elseif ($time < 60 * 60)
    {
        $min = floor($time/60);
        $str = $min.'分钟前';
    }
    elseif ($time < 60 * 60 * 24)
    {
        $h = floor($time/(60*60));
        $str = $h.'小时前 '.$htime;
    }
    elseif ($time < 60 * 60 * 24 * 3)
    {
        $d = floor($time/(60*60*24));
        if($d==1)
            $str = '昨天 '.$rtime;
        else
            $str = '前天 '.$rtime;
    }
    else
    {
        $str = $rtime;
    }
    return $str;
}

//截取字符串
function sstr($str,$max){
    if(mb_strlen($str)>$max-2){
        return mb_substr($str,0,$max-2).'..';
    }else
        return $str;
}


function htmlencode($fString)
{
    if($fString!="")
    {
        $fString = str_replace( '>', '&gt;',$fString);
        $fString = str_replace( '<', '&lt;',$fString);
        $fString = str_replace( chr(32), '&nbsp;',$fString);
        $fString = str_replace( chr(13), ' ',$fString);
        $fString = str_replace( chr(10) & chr(10), '<br>',$fString);
        $fString = str_replace( chr(10), '<BR>',$fString);
    }
    return $fString;
}
function htmldecode($fString)
{
    if($fString!="")
    {
        $fString = str_replace("&gt;" , ">", $fString);
        $fString = str_replace("&lt;", "<", $fString);
        $fString = str_replace("&nbsp;",chr(32),$fString);
        $fString = str_replace("",chr(13),$fString);
        $fString = str_replace("<br>",chr(10) & chr(10),$fString);
        $fString = str_replace("<BR>",chr(10),$fString);
    }
    return $fString;
}

spl_autoload_register(function ($class_name) {

    $backtrace=debug_backtrace();
    \heephp\logger::warn('自动加载类：'.$class_name);

    $class_name = str_replace('\\','/',$class_name);
    require_once './../'.$class_name . '.php';
});