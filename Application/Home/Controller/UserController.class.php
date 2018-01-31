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
        if($_POST['OldPassWord']){
            $bool =0;
            if ($_POST['NewPassWord'] !=$_POST['PassWord']){
                $bool =1;
                echo "<script>alert('密码输入不一致');</script>";
            }
            if ( !$_POST['NewPassWord']){
                $bool =2;
                echo "<script>alert('新密码输不为空');</script>";
            }
            $myuserinfo = M("menber")->where(array('uid'=>session('uid')))->find();
            if($myuserinfo['pwd'] != $_POST['OldPassWord']){
                $bool =3;
                echo "<script>alert('旧密码输入错误');</script>";
            }
            if( !$bool ){
                M("menber")->where(array('uid'=>session('uid')))->save(array('pwd'=>$_POST['NewPassWord']));
                echo "<script>alert('密码修改完成');</script>";
            }
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
        if($_POST){
            $data = $_POST ;
            if($_FILES['thumb']['name']){   // 上传文件
                $thumb = imgFile();
                $info = $thumb['info'];
                if(!$info) {// 上传错误提示错误信息

                }else{// 上传成功
                    $path = $info['thumb']['savepath'];
                    $p = ltrim($path,'.');
                    $img = $info['thumb']['savename'];
                    $pic=$p.$img;
                    $pic=__ROOT__.$pic;
                    $data['userface'] = $pic;
                }
            }
            $bool = M("menber")->where(array('uid'=>session('uid')))->save($data);
            if($bool){
                echo "<script>alert('修改完成');window.location.reload();</script>";
            }
        }
        $data = M("Index")->where(array('id'=>$id))->find();
        $this->assign("data",$data);
        $this->display('./Public/Home/One/edtuser.html');
    }

}