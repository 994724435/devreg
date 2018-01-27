<?php

namespace Home\Controller;
use Think\Controller;
header('content-type:text/html;charset=utf-8');
class UserController extends CommonController{

    public function usermian(){
        $id =1;
        if($_GET['id']){
            $id =$_GET['id'];
        }
        $data = M("Index")->where(array('id'=>$id))->find();
        $this->assign("data",$data);
        $this->display('./Public/Home/One/usermian.html');
    }

    public function userpwd(){
        $id =1;
        if($_GET['id']){
            $id =$_GET['id'];
        }
        $data = M("Index")->where(array('id'=>$id))->find();
        $this->assign("data",$data);
        $this->display('./Public/Home/One/userpwd.html');
    }

    public function edtuser(){
        $id =1;
        if($_GET['id']){
            $id =$_GET['id'];
        }
        $data = M("Index")->where(array('id'=>$id))->find();
        $this->assign("data",$data);
        $this->display('./Public/Home/One/edtuser.html');
    }

}