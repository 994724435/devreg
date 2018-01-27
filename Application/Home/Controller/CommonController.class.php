<?php
namespace Home\Controller;
use Think\Controller;
class CommonController extends Controller {
	public function _initialize(){
//		session('uid',35);
        $id =1;
        if($_GET['id']){
            $id =$_GET['id'];
        }
		if(!session('uid')){
			echo "<script>";
            echo "<script>window.location.href='".__ROOT__."/index.php/Home/Login/login/id/".$id." ';</script>";
			echo "</script>";
			exit;
		}
		$menber =M('menber');
		$res_user =$menber->where(array('uid'=>session('uid')))->select();
		if($res_user[0]['isdelete']){
            echo "<script>alert('账号已被禁用');";
            echo "<script>window.location.href='".__ROOT__."/index.php/Home/Login/login/id/".$id." ';</script>";
            echo "</script>";
            exit;
        }
		$this->assign('username',$res_user[0]);
	}


}