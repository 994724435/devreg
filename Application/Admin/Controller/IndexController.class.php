<?php

namespace Admin\Controller;
use Think\Controller;
header('content-type:text/html;charset=utf-8');
class IndexController extends CommonController {
    public function editecontent(){
        $product =M('index')->where(array('id'=>$_GET['id']))->find();
        $type =$_GET['type'];
        if($type==1){
            $res =$product['meetintro'];
        }elseif ($type==2){
            $res =$product['meetbase'];
        }elseif ($type==3){
            $res =$product['tougao'];
        }elseif ($type==4){
            $res =$product['content'];
        }elseif ($type==5){
            $res =$product['reg'];
        }elseif ($type==6){
            $res =$product['hotel'];
        }elseif ($type==7){
            $res =$product['contact'];
        }
        if($_POST['content1']){
            $content =$_POST['content1'];
            if($type==1){
               $data['meetintro'] =$content;
            }elseif ($type==2){
                $data['meetbase'] =$content;
            }elseif ($type==3){
                $data['tougao']=$content;
            }elseif ($type==4){
                $data['content']=$content;
            }elseif ($type==5){
                $data['reg']=$content;
            }elseif ($type==6){
                $data['hotel']=$content;
            }elseif ($type==7){
                $data['contact']=$content;
            }
            M('index')->where(array('id'=>$_GET['id']))->save($data);
            echo "<script>window.location.href = '".__ROOT__."/index.php/Admin/Index/productlist';</script>";
            exit;
        }
        $this->assign('res',$res);
        $this->display();
    }


	public function comproduct(){
	    M("orderlog")->where(array('logid'=>$_GET['id']))->save(array('state'=>2));
        echo "<script>alert('修改成功');window.location.href = '".__ROOT__."/index.php/Admin/Index/select';</script>";
        exit();
    }

    public function main(){
        $user = M('user');
//        if($_SESSION['manager']==2){
            $user_res= $user->select();
//        }
        $this->assign('re',$user_res);
        $this->display();
    }

    // 密码修改
    public function userpwd(){
        $user = M('user');
        if($_POST){
            $data['password'] =$_POST['psd1'];
            $data['manager'] =$_POST['manager'];
            $result = $user->where(array('id'=>$_GET['id']))->save($data);
            if($result){
                echo "<script>alert('修改成功');window.location.href = '".__ROOT__."/index.php/Admin/Index/main';</script>";
            }
        }
        $res= $user->where(array('id'=>$_GET['id']))->select();
        $this->assign('re',$res[0]);
        $this->display();
    }

    public function addproduct(){
        if($_POST){
            $pic='';
            if($_FILES['thumb']['name']){   // 上传文件
                $thumb = imgFile();
                $info = $thumb['info'];
                if(!$info) {// 上传错误提示错误信息

                }else{// 上传成功
                    $path = $info['thumb']['savepath'];
                    $p = ltrim($path,'.');
                    $img = $info['thumb']['savename'];
                    $pic=$p.$img;
                }
            }

            if($_FILES['thumb1']['name']){   // 上传文件
                $thumb = imgFile();
                $info = $thumb['info'];
                if(!$info) {// 上传错误提示错误信息

                }else{// 上传成功
                    $path = $info['thumb1']['savepath'];
                    $p = ltrim($path,'.');
                    $img = $info['thumb1']['savename'];
                    $pic1=$p.$img;
                }
            }

            $data =$_POST;
            $data['addtime'] =date('Y-m-d H:i:s',time());
            $product =M('index');
            $result = $product->add($data);
            if($pic || $pic1){
                $product->where(array('id'=>$result))->save(array('wxpic'=>$pic,'banpic'=>$pic1));
            }
            if($result){
                echo "<script>window.location.href = '".__ROOT__."/index.php/Admin/Index/addproduct';</script>";
            }else{
                echo "<script>alert('添加失败');window.location.href = '".__ROOT__."/index.php/Admin/Index/addproduct';</script>";
            }

        }
        $this->display();
    }

    public function productlist(){
        $product =M('index');
        $result = $product->select();
        $this->assign('res',$result);
        $this->display();
    }

    public function editeproduct(){
        $product =M('index');
        if($_POST){
            $pic='';
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
                }
            }

            if($_FILES['thumb1']['name']){   // 上传文件
                $thumb = imgFile();
                $info = $thumb['info'];
                if(!$info) {// 上传错误提示错误信息

                }else{// 上传成功
                    $path = $info['thumb1']['savepath'];
                    $p = ltrim($path,'.');
                    $img = $info['thumb1']['savename'];
                    $pic1=$p.$img;
                }
            }

            $data =$_POST;
            if($pic){
                $data['wxpic'] =$pic;
            }
            if($pic1){
                $data['banpic'] =$pic1;
            }

            $result = $product->where(array('id'=>$_GET['id']))->save($data);
            if($result){
                echo "<script>window.location.href = '".__ROOT__."/index.php/Admin/Index/productlist';</script>";
            }else{
                echo "<script>alert('修改失败');window.location.href = '".__ROOT__."/index.php/Admin/Index/productlist';</script>";
            }

        }
        $result = $product->where(array('id'=>$_GET['id']))->select();
        $this->assign('res',$result[0]);
        $this->display();
    }

    public function deleteproduct(){
        $product =M('product');
        $result = $product->where(array('id'=>$_GET['id']))->select();
        if($result[0]){
            $state =$result[0]['state'];
        }else{
            echo "<script>alert('产品不存在');window.location.href = '".__ROOT__."/index.php/Admin/Index/productlist';</script>";
        }
        if($state==1){
            $state=2;
        }else{
            $state=1;
        }
        $res= $product->where(array('id'=>$_GET['id']))->save(array('state'=>$state));
        if($res){
            echo "<script>window.location.href = '".__ROOT__."/index.php/Admin/Index/productlist';</script>";
        }else{
            echo "<script>alert('修改失败');window.location.href = '".__ROOT__."/index.php/Admin/Index/productlist';</script>";
        }
    }

    public function select(){
        $orderlog = M('orderlog');
        if($_GET['state']){
//            $map['name']=array('like','%'.$_GET['name'].'%');
            $map['state'] =$_GET['state'];
        }
        if($_GET['uid']){
            $map['userid'] =$_GET['uid'];
        }
        if($_GET['orderid']){
            $map['orderid'] =$_GET['orderid'];
        }
        $map['type'] =10;
        $users= $orderlog->where($map)->order('logid DESC')->select();

        $this->assign('users',$users);
        $this->display();
    }

    // 添加管理员
    public function useradd(){
        if ($_POST) {
            $user = M('user');
            $data['password'] =$_POST['psd1'];
            $data['name']   = $_POST['name'];
            $data['manager']   = $_POST['manager'];
            $data['addtime']  = date('Y-m-d H:i:s',time());
            $user_res= $user->where(array('name'=>$data['name']))->select();
            if($user_res[0]['id']){
                echo "<script>alert('用户名已存在');window.location.href = '".__ROOT__."/index.php/Admin/Index/main';</script>";exit();
            }
            $res= $user->add($data);
            if ($res) {
                echo "<script>alert('添加成功');window.location.href = '".__ROOT__."/index.php/Admin/Index/main';</script>";
            }else{
                echo "<script>alert('添加失败');window.location.href = '".__ROOT__."/index.php/Admin/Index/main';</script>";
            }

        }
        $this->display();
    }

    public function userdelete(){
        $user = M('user');
        $res = $user->where(array('id'=>$_GET['id']))->delete();
        if ($res) {
            echo "<script>alert('删除成功');window.location.href = '".__ROOT__."/index.php/Admin/Index/main';</script>";
        }else{
            echo "<script>alert('删除失败');window.location.href = '".__ROOT__."/index.php/Admin/Index/main';</script>";
        }
    }
}