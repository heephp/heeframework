<?php

namespace app\admin\controller;

use heephp\config;
use heephp\sysExcption;

class index extends adminBase {

    protected $passauth = true;

    function index(){

        $this->passauth=false;

        parent::__construct();

        return $this->fetch();
    }

    function login(){

        return $this->fetch();
    }

    function action()
    {
        if (conf('is_vcode') == 1 && !checkvcode()) {
            return $this->error('验证码错误！');
        }

        $data = request('post.');
        $username = $data['username'];
        $password = $data['password'];

        $users = model('users');
        $m = $users->find("`username`='$username' and `password`='" . md5($password) . "'");
        if ($m != false) {
            $users->users_group();
            if(empty($users->data['users_group']['isadmin'])){
                return $this->error('您不是管理员，无法登录！');
            }
            request($this->session_id_str, $m['users_id']);
            request($this->session_name_str, $m['username']);
            request($this->session_users_group_id_str, $m['users_group_id']);
            request($this->session_users_group_name_str, $users->data['users_group']['name']);
            request($this->session_users_email_str, $m['email']);
            request($this->session_users_header_str, $m['header']);
            return $this->rediect('index');
        } else {
            return $this->error('用户名或密码错误！');
        }

    }

    function logout(){
        session_destroy();
        return $this->rediect('login');

    }

    function setting(){

        $this->passauth=false;
        parent::__construct();

        $cof = \model('config');
        $cof->select();

        $m=[];
        foreach ($cof->data as $item){
            $m[$item['name']]=$item['value'];
        }

        $this->assign('m',$m);
        return $this->fetch();
    }

    function save_setting()
    {

        $this->passauth = false;
        parent::__construct();

        $data = request('post.');
        $cof = \model('config');
        foreach ($data as $k => $v) {
            $result = $cof->update(['value' => $v], "`name`='$k'");
        }

        cache()->remove(config('customer_config_name'));

        return $this->rediect('setting');

    }

    function vcode(){

        $is_vcdoe=conf('is_vcode');
        $vcode_width=conf('vcode_width');
        $vcode_heigh=conf('vcode_heigh');
        $vcode_fontsize=conf('vcode_fontsize');
        $vcode_line =conf('vcode_line_count');
        $vcode_char=conf('vcode_char');
        $vcode_num=conf('vcode_num');

        $vcode = randChar($vcode_num,$vcode_char);
        request('session.'.config('validata_code_session'),$vcode);
        vercode($vcode,$vcode_fontsize,$vcode_width,$vcode_heigh,$vcode_line);

    }

    public function search($val){

        $this->passauth=false;
        parent::__construct();

        $searcher = config('searcher');
        foreach ($searcher as $tb=>$fields){

            $sql = '';
            foreach ($fields as $k=>$v){
                if($k==='alias'){

                    $this->assign($tb.'_title',$v);
                }else{

                    $sql.=" (`$v`='$val' or `$v` like '%$val%') or ";
                }
            }

            if(!empty($sql))
                $sql = substr($sql,0,strlen($sql)-4);

            $model = model($tb);

            $model->page($sql,$model->key.' desc','*',false,'p'.$tb);
            $this->assign($tb.'_list',$model->data);//var_dump($model->pager);
            $this->assign($tb.'_pager',$model->pager['show']);

        }

        $this->assign('keyword',$val);
        return $this->fetch();
    }

    function cache_clear(){

        $this->passauth=false;
        parent::__construct();

        if(cache()->clear()){
            return $this->success('成功清空缓存！',url('index'));

        }else
            return $this->error('清空缓存失败！');

    }

    function test(){
        //header('Content-type:image/jpg');
        //waterMark(ROOT.'/public/assets/img/blogpost.jpg','','ABCDEFGH','0,0,0',6,ROOT.'/public/assets/fonts/arial.ttf');
        //imageWaterMark(ROOT.'/public/assets/img/blogpost.jpg',8,false,"ABDEFG");
        echo phpinfo();
        //连接本地的 Redis 服务
        $redis = new \Redis();
        $redis->connect('127.0.0.1', 6379);
        //echo "Connection to server successfully";
        //$users=model('users');
        //$users->select();
        //设置 redis 字符串数据
        //$redis->set("tutorial-name", json_encode($users->data,false));
        // 获取存储的数据并输出
        //echo "Stored string in redis:: " ;
        //$result = json_decode($redis->get("tutorial-name"),true);
        //var_dump($result[0]);
        // 获取数据并输出
        //$arList = $redis->get("heeframework_config");
        //echo "Stored keys in redis:: ";
        //print_r($arList);
        cache()->clear();
        $keys = $redis->keys('*');
        foreach ($keys as $k){
            echo $k.':'.$redis->get($k).'<br>';
        }

        //throw new sysExcption('测试错误信息ABCDE efgh');
    }

}

