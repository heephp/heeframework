<?php
namespace heephp;
use mysql_xdevapi\Exception;

class model{

    protected $autotimespan=false;
    protected $softdel=false;
    protected $field_createtime='create_time';
    protected $field_updatetime='update_time';
    protected $field_deletetime='delete_time';

    /*验证字段*/
    /*格式：字段|规则，字段|规则，字段|规则。。。*/
    protected $insert_validata="";
    protected $update_validata="";
    protected $insert_message_validata="";
    protected $update_message_validata="";


    protected $db;
    protected $table_prefix;
    protected $table;
    protected $key='';
    protected $pager='';
    protected $data=[];

    public function __construct($tablname)
    {
        $this->db=db();

        //获取表前缀
        $this->table_prefix=config('db.table_prefix');
        //获取当前表名
        $tn = explode('\\',$tablname);
        $this->table=empty($this->table)?$tn[count($tn)-1]:$this->table;
        //获取主键字段
        $this->key=empty($this->key)?$this->db->getKeyFiled($this->table):$this->key;



        aop('model_init');
    }
/**
 *
 * 设置表名
 */
    /*public function table($name){
        $this->table = $name;
    }*/

    public function insert($data){
        if(!$this->validata($data,'insert')){
            validata::showerror();
            return false;
        }
        if($this->autotimespan)
            $data[$this->field_createtime]=time();

        $this->set_autofield($data);
        return $this->db->insert($this->table,$data);
    }

    public function delete($id,$soft=true)
    {

        if ($this->softdel) {

            if ($soft) {
                if ($this->softdel) {
                    $data[$this->field_deletetime] = time();
                    return $this->db->update($this->table, $data, "`$this->key`='$id'");
                } else {
                    throw new sysExcption('没有开启软删除');
                }
            }

        }

        return $this->db->delete($this->table, "`$this->key`='$id'");
    }

    public function deleteByWhere($where){

        return $this->db->delete($this->table, $where);

    }

    public function update($data,$where=''){
        if(!$this->validata($data,'update')){
            validata::showerror();
            return false;
        }
        if(empty($where)){
            $where='`'.$this->key.'` = \''.$data[$this->key].'\'';
        }
        $this->set_autofield($data);
        return $this->db->update($this->table,$data,$where);
    }

    public function select($where='1=1',$order='',$fields='*',$onlySoftDel=false,$pname='page',$page=0){
        //路由中注册pagetag
        //echo $pname;
        route::reg_pagetag($pname);
        $where=$this->softdelwhere($where,$onlySoftDel);

        if($page==0){
            $re = $this->db->select($this->table,$where,$fields,$order);
            $this->get_autofield($re);
        }else{
            //获取某一页的内容
            $pagesize=config('pagesize');
            $re = $this->db->select($this->table,$where,$fields,$order,($page-1)*$pagesize,$pagesize);
            $this->get_autofield($re);
        }

        $this->data=$re;
        $this->pager=null;
        return $re;

    }

    /** 分页获取数据
     * @param $table
     * @param $where
     * @param string $order
     * @param string $fields
     * @param string $pname 分页的url参数  格式:page_1
     * @return array 仅返回获取到的数据   分页使用$this->>pager获取
     */
    public function page($where='1=1',$order='',$fields='*',$onlySoftDel=false,$pname='page'){

        if(empty($where))$where='1=1';
        $where=$this->softdelwhere($where,$onlySoftDel);

        $pagesize=config('pagesize')??20;

        //$url = request('ser.REQUEST_URI');
        $url='/'.APP.'/'.CONTROLLER.'/'.METHOD.'/'.implode('/',PARMS);

        //下划线分隔取出page数值
        preg_match('/'.$pname.'_\d+/',$url,$match);
        $pinfo=explode('_',$match[0]);
        //如果存在多个下划线分隔符
        if(count($pinfo)===2) $page=$pinfo[1];
        else $page=$pinfo[count($pinfo)-1];

        if(intval($page)<1)
            $page=1;

        //如果URL没有分页参数，那么加上
        if(!strstr($url,$pname.'_')){
            $url.=(substr($url,-1)=='/'?'':'/').$pname.'_'.$page;
            //echo $url;
        }

        //$page=request('g.'.$pname);
        $re=[];//print_r($where);
        $count=$this->db->getRow("select count(*) c from `$this->table_prefix$this->table` where $where");
        $count=$count['c'];
        $re['count'] = $count;
        $re['pagesize']=$pagesize;
        $re['page']=$page;
        $re['pagecount']=ceil($count / $pagesize);

        $data=$this->db->select($this->table,$where,$fields,$order,$skip=$page==1?0:(($page-1)*$pagesize),$limit=$pagesize);
        $this->get_autofield($data);

        //构造url
        $url = strpos($url,$pname.'_')>0?$url:($url.'/'.$pname.'_0');
        $firstpage=preg_replace('/'.$pname.'_\d+/',$pname.'_1',$url);
        $prvpage=preg_replace('/'.$pname.'_\d+/',$pname.'_'.(intval($page)-1),$url);
        $nextpage=preg_replace('/'.$pname.'_\d+/',$pname.'_'.(intval($page)+1),$url);
        $endpage=preg_replace('/'.$pname.'_\d+/',$pname.'_'.$re['pagecount'],$url);

        //echo $prvpage;

        $pagerclass=' class="'.config('pagination.class').'"';
        $pageritemclass=' class="'.config('pagination.item_class').'"';
        $pagerlinkclass=' class="'.config('pagination.link_class').'"';
        $pagercurrtclass=' class="'.config('pagination.item_class').' '.config('pagination.currt_class').'"';


        $pager="<ul$pagerclass>";
        $pager.=($page!=1)?"<li$pageritemclass><a$pagerlinkclass href=\"$firstpage\">首页</a></li>":'';
        $pager.=($page!=1)?"<li$pageritemclass><a$pagerlinkclass href=\"$prvpage\">上一页</a></li>":'';
        $pager.=($page>1&&$re['pagecount']>1)?"<li$pageritemclass><a$pagerlinkclass href=\"$prvpage\">".($page-1).'</a></li>':'';
        $pager.="<li$pagercurrtclass><a$pagerlinkclass href=\"#\">$page</a></li>";
        $pager.=$re['pagecount']>$page?"<li$pageritemclass><a$pagerlinkclass href=\"$nextpage\">".($page+1).'</a></li>':'';
        $pager.=$re['pagecount']>$page&&$page<$re['pagecount']?"<li$pageritemclass><a$pagerlinkclass href=\"$nextpage\">下一页</a></li>":'';
        $pager.=$re['pagecount']>$page?"<li$pageritemclass><a$pagerlinkclass href=\"$endpage\">尾页</a></li>":'';
        $pager.='第'.$page.'/'.$re['pagecount'].'页';
        $pager.='</ul>';

        $re['show']=$pager;

        $this->pager = $re;
        $this->data = $data;
        return $data;

        //return $this->select($where,$order,$fields,-1,$onlySoftDel,$pname);
    }

    /**
     * 根据软删除获取sql 条件 where
     * @onlySoftDel true只查找已被软删除的  False只查找未被软删除的
     */
    private function softdelwhere($where,$onlySoftDel){

        if($this->softdel){

            if($onlySoftDel){
                if(empty($where)){
                    $where=' '.$this->field_deletetime.'>0 ';
                }else{
                    $where='('.$where.') and '.$this->field_deletetime.'>0 ';
                }

            }else {

                if (empty($where)) {
                    $where = ' (' . $this->field_deletetime . ' IS NULL or ' . $this->field_deletetime . ' <=0 or ' . $this->field_deletetime . '=\'\')';
                } else {
                    $where = '(' . $where . ') and (' . $this->field_deletetime . ' IS NULL or ' . $this->field_deletetime . ' <=0 or ' . $this->field_deletetime . '=\'\')';
                }

            }

        }

        return $where;

    }

    public function find($where,$onlysoftdel=false){
        $where = $this->softdelwhere($where,$onlysoftdel);

        $re = $this->db->getRow('select * from '.$this->table_prefix.$this->table.' where '.$where);
        $res=[$re];
        $this->get_autofield($res);
        $this->data = $res[0];
        $this->pager=null;
        return $this->data;
    }

    public function get($value,$onlysoftdel=false){

        $where="$this->key = $value";
        $where = $this->softdelwhere($where,$onlysoftdel);

        $re = $this->db->getRow('select * from '.$this->table_prefix.$this->table.' where '.$where);
        $res=[$re];
        $this->get_autofield($res);
        $this->data = $res[0];
        $this->pager=null;
        return $this->data;
    }

    /*
     * 根据某字段获取数据
     */
    private function getby($field,$where='',$ord='',$page=0,$onlysoftdel=false,$pname='page'){
        //路由中注册pagetag
        route::reg_pagetag($pname);

        $where=$this->softdelwhere($where,$onlysoftdel);
        if($page==0)
            $re = $this->db->select($this->table, $where, $field,$ord);
        else
            $re = $this->page($where, $ord, $field,$onlysoftdel, $pname);


        $this->get_autofield($re);

        if(count($re)==0)
            return null;

        else if(count($re)==1)
            return $re[0][$field];

        else {

            $rearr = [];
            for ($i = 0; $i < count($re); $i++) {
                $rearr[] = $re[$i][$field];
            }

            return $rearr;
        }
    }

    public function __call($name, $arguments)
    {
        $argcount = count($arguments);
        if(strstr($name,'getBy')==$name){
            $field = substr($name,5);
            $re = [];
            if($argcount<1)
                $re = $this->getby($field);
            else if($argcount==1)
                $re = $this->getby($field,$arguments[0]);
            else if($argcount==2)
                $re = $this->getby($field,$arguments[0],$arguments[1]);
            else if($argcount==3)
                $re = $this->getby($field,$arguments[0],$arguments[1],$arguments[2]);
            else if($argcount==4)
                $re = $this->getby($field,$arguments[0],$arguments[1],$arguments[2],$arguments[3]);
            else if($argcount==5)
                $re = $this->getby($field,$arguments[0],$arguments[1],$arguments[2],$arguments[3],$arguments[4]);
            else
                throw new sysExcption($name.'方法参数数量不正确。');

            return $re;
        }

        throw  new sysExcption('model\\'.$this->table.'\\'.$name.'方法未定义');

    }

    /*将数据结果的值  自动转换字段的值*/
    private function get_autofield(&$values){

        if(!is_array($values)||empty($values))
            return;

        for($i=0;$i<count($values);$i++){

            if(empty($values[$i]))
                continue;

            //遍历所有数据行
            $line=$values[$i];
            foreach ($line as $k=>$v) {
                $timeformat = config('db.timeformat');
                if(!empty($timeformat)&&($k==$this->field_createtime||$k==$this->field_deletetime||$k==$this->field_updatetime)){
                    $values[$i][$k]=date($timeformat,$values[$i][$k]);
                }elseif (method_exists($this, 'get_' .$k)){
                    //自动数据处理
                    $mname = 'get_'.$k;
                    $values[$i][$k]=$this->$mname($values[$i][$k]);

                }
            }

        }
    }

    /*将数据结果的值  自动转换字段的值*/
    private function set_autofield(&$values){

        if(!is_array($values)||empty($values))
            return;

            foreach ($values as $k=>$v) {
                if($k==$this->field_createtime||$k==$this->field_deletetime||$k==$this->field_updatetime) {
                    $values[$k]=time();
                }elseif (method_exists($this, 'set_' .$k)){
                    $mname = 'set_'.$k;
                    $values[$k]=$this->$mname($values[$k]);
                }
            }

    }

    /*
     * 左右内连接 获取数据
     * $table 表
     * $fk 表的外键
     * $type 左右内
     * $where 条件语句
     * $fields 要select的字段
     * $join_field 如果为空则使用本表主键连接
     * $order 排序
     *
     * @return 返回连接后的数据
     */
    public function join($table,$fk,$type='left',$where='1=1',$fields='*',$join_field='',$order=''){

        $tbc=$this->table_prefix.$this->table;
        $tbj= $this->table_prefix.$table;

        $sql="select $fields from $tbc $type join $tbj on $tbj.".(empty($join_field)?$this->key:$join_field).'='.$tbc.'.'.$fk.' where'.$where.(empty($order)?'':' order by '.$order);
        $result = $this->db->getAll($sql);
        if(count($result)==1)
            return $result[0];
        return $result;
    }

    public function __get($name)
    {
        if($name=='pager')
            return $this->pager;
        if($name=='data')
            return $this->data;
        if($name=='key')
            return $this->key;
        if($name=='table')
            return $this->table;

        //$model=model($name);
        //return $model;
    }

    public function __set($name, $value)
    {
        if($name=='data'){
            $this->data=$value;
        }
    }

    /*
     * 验证，成功返回true
     * $data数据
     * $action  insert|update
     * */
    public function validata($data,$action='insert'){
        $isvalidata = false;

        $this->insert_validata = trim($this->insert_validata,';');
        $this->update_validata = trim($this->update_validata,';');
        $this->insert_message_validata=trim($this->insert_message_validata,';');
        $this->update_message_validata=trim($this->update_message_validata,';');


        //错误消息的数组
        $msgs = array();
        //验证规则的数组
        $vs=array();

        if($action=='insert'){
            if(empty($this->insert_validata))
                return true;

            $vs = explode(';',$this->insert_validata);
            $msgs = explode(';',$this->insert_message_validata);

        }else if($action=='update'){
            if(empty($this->update_validata))
                return true;

            $vs = explode(';',$this->update_validata);
            $msgs = explode(';',$this->update_message_validata);

        }

        $num=0;
        foreach ($vs as $v){

            list($field,$rules)=explode('|',$v);
            if(empty($field)){
                throw new sysExcption('验证规则出错：'.var_export($v,true).'缺少字段');
            }
            if(empty($rules)){
                throw new sysExcption('验证规则出错：'.var_export($v,true).'缺少规则');
            }
            $rarr = explode('+',$rules);
            $num_rule = 0;
            foreach ($rarr as $r){
                list($rname,$rparm)=explode('=',$r);
                $rparms=explode(',',$rparm);

                $vali =new validata($data[$field]);
                if(!method_exists($vali,$rname)){
                    throw new sysExcption('验证规则：'.$rname.'不存在！');
                }
                //调用验证
                $reval=false;
                if($rname=='unique'){
                    $reval = $vali->$rname($data[$field], $this->table, $field,$this->key,$data[$this->key]??null);
                }
                else if($rname=='equal'||$rname=='notequal'){
                    $reval=$vali->$rname($data[$field]);
                }else if(count($rparms)<2&&empty($rparms[0])){
                    $reval=$vali->$rname();
                }else
                    $reval = call_user_func_array(array($vali,$rname),$rparms);

                if(!$reval){
                    $rinfo = explode('|',$msgs[$num]);
                    $currtmsg = explode('+',$rinfo[1]);
                    $v_error['message']=$rinfo[0].$currtmsg[$num_rule];
                    $v_error['field']=$field;
                    $v_error['title']=$rinfo[0];
                    $v_error['rulename']=$rname;
                    $v_error['errmsg']=$currtmsg[$num_rule];
                    validata::set_error($v_error);
                    return false;
                }
                $num_rule++;
            }
            $num++;
        }

        return true;
    }


    public function __toString()
    {
        // TODO: Implement __toString() method.
        return $this->table;
    }
}