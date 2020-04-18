<?php
function conf($name,$value=''){
    $db = db();
    //设置配置
    if(!empty($value)){
        return $db->update('config',["`value`='$value'"],"`name`='$name'")>0;
    }
    //获取配置
    $all = cache(config('customer_config_name'));
    if(!$all){
        $all = $db->select('config','1=1');
        cache(config('customer_config_name'),$all);
    }
    foreach ($all as $row){
        if($row['name']==$name)
            return $row['value'];
    }
    return '';
}

/*
 * 从数组中读出指定键值 返回数组
 * */
function get_arr_val($arr,$key){
    $rearr = [];
    foreach ($arr as $k=>$v){
        if($k==$key)
            $rearr[]=$v;
    }
    return $rearr;
}