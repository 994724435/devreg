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
        $gaojian = M("gaojian")->where(array('uid'=>session('uid')))->select();
        foreach ($gaojian as $k=>$v){
            if($v['uid']){
                $userinfo = $this->getuserinfo($v['uid']);
                $gaojian[$k]['auth'] =$userinfo['name'] ;
            }
        }
        $userinfo = M("menber")->where(array('uid'=>session('uid')))->find();
        $manager =$userinfo['manager'];
        $in  = substr($manager,0,strlen($manager)-1);
        $con['uid'] =array('in',$in);
        $managerList = M("menber")->where($con)->select();
        $data = M("Index")->where(array('id'=>$id))->find();
        $this->assign("data",$data);
        $this->assign("managerList",$managerList);
        $this->assign("gaojian",$gaojian);
        $this->display('./Public/Home/One/usermian.html');
    }

    public function usertougaoList(){
        $id =1;
        if($_GET['id']){
            $id =$_GET['id'];
        }
        $gaojian = M("gaojian")->where(array('uid'=>session('uid')))->select();
        foreach ($gaojian as $k=>$v){
            if($v['uid']){
                $userinfo = $this->getuserinfo($v['uid']);
                $gaojian[$k]['auth'] =$userinfo['name'] ;
            }
        }
        $data = M("Index")->where(array('id'=>$id))->find();
        $this->assign("data",$data);
        $this->assign("gaojian",$gaojian);
        $this->display('./Public/Home/One/usertougaoList.html');
    }

    public function usertougaodelete(){
        $id =1;
        if($_GET['id']){
            $id =$_GET['id'];
        }
        $gaojian = M("gaojian")->where(array('id'=>$_GET['tid']))->find();
        if($gaojian['uid'] != session('uid')){
            echo "<script>alert('稿件发布人不是自己');window.location.href = '".__ROOT__."/index.php/Home/User/usermian/id/".$id."';</script>";exit();
        }
        M("gaojian")->where(array('id'=>$_GET['tid']))->delete();
        echo "<script>alert('稿件删除成功');window.location.href = '".__ROOT__."/index.php/Home/User/usermian/id/".$id."';</script>";exit();

    }

    private function getuserinfo($uid){
        return M("menber")->where(array('uid'=>$uid))->find();
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
    public function usertougaoedt(){
        $id =1;
        if($_GET['id']){
            $id =$_GET['id'];
        }
        $type = M("tougaotype")->select();
        $gaojian = M("gaojian")->where(array('id'=>$_GET['tid']))->find();
        if($_POST){
            $bool =0;
            if (!$_POST['type']){
                $bool =1;
                echo "<script>alert('论文分类必填');</script>";
            }
            if ( !$_POST['title']){
                $bool =2;
                echo "<script>alert('论文题目不为空');</script>";
            }
            if ( !$_POST['cont']){
                $bool =2;
                echo "<script>alert('论文内容不为空');</script>";
            }

            if( !$bool ){
                $datas =$_POST;
                $datas['relation_id'] =$id;
                $typename = M("tougaotype")->where(array('id'=>$_POST['type']))->find();
                $datas['typename'] =$typename['name'];
                $datas['uid'] =session('uid');
                $datas['addtime'] =date("Y-m-d H:i:s",time());
                $datas['state'] =2;
                M("gaojian")->where(array('id'=>$_GET['tid']))->save($datas);
                echo "<script>alert('修改完成');window.location.href = '".__ROOT__."/index.php/Home/User/usertougaoedt/id/".$id."/tid/".$_GET['tid']."';</script></script>";exit();
            }
        }
        $data = M("Index")->where(array('id'=>$id))->find();
        $this->assign("data",$data);
        $this->assign("type",$type);
        $this->assign("gaojian",$gaojian);

        $this->display('./Public/Home/One/usertougaoedt.html');
    }

    public function usertougao(){
        $id =1;
        if($_GET['id']){
            $id =$_GET['id'];
        }
        $type = M("tougaotype")->select();
        if($_POST){
            $bool =0;
            if (!$_POST['type']){
                $bool =1;
                echo "<script>alert('论文分类必填');</script>";
            }
            if ( !$_POST['title']){
                $bool =2;
                echo "<script>alert('论文题目不为空');</script>";
            }
            if ( !$_POST['cont']){
                $bool =2;
                echo "<script>alert('论文内容不为空');</script>";
            }
            if( !$bool ){
                $datas =$_POST;
                $datas['relation_id'] =$id;
                $typename = M("tougaotype")->where(array('id'=>$_POST['type']))->find();
                $datas['typename'] =$typename['name'];
                $datas['uid'] =session('uid');
                $datas['addymd'] =date("Y-m-d",time());
                $datas['addtime'] =date("Y-m-d H:i:s",time());
                $datas['state'] =2;
                M("gaojian")->add($datas);
                echo "<script>alert('投稿完成');</script>";
            }
        }
        $data = M("Index")->where(array('id'=>$id))->find();
        $this->assign("data",$data);
        $this->assign("type",$type);

        $this->display('./Public/Home/One/usertougao.html');
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

    public function edtteam(){
        $id =1;
        if($_GET['id']){
            $id =$_GET['id'];
        }
        $menber = M("menber");
        $userinfo = $menber->where(array('uid'=>session('uid')))->find();
        $minearray =explode(',',$userinfo['manager']);
        if(in_array($_GET['uid'],$minearray) && $_GET['uid']){

        }else{
            echo "<script>alert('用户不合法');window.location.href = '".__ROOT__."/index.php/Home/User/usermian/id/".$id."';</script>";exit();
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

            $bool =$menber->where(array('uid'=>$_GET['uid']))->save($data);
            if($bool){
                 echo "<script>alert('修改完成');window.location.href = '".__ROOT__."/index.php/Home/User/edtteam/id/".$id."/uid/".$_GET['uid']."';</script>";exit();
//                echo "<script>alert('修改完成');window.location.reload();</script>";exit();
            }
        }
        $data = M("Index")->where(array('id'=>$id))->find();
        $this->assign("data",$data);
        $user = $menber->where(array('uid'=>$_GET['uid']))->find();
        $this->assign("userinfo",$user);
        $this->display('./Public/Home/One/edtteam.html');
    }

    public function useradd(){
        $id =1;
        if($_GET['id']){
            $id =$_GET['id'];
        }
        $menber = M("menber");
        $userinfo = $menber->where(array('uid'=>session('uid')))->find();
        if($_POST){
            $bools =0;
            if (!$_POST['tel']){
                $bools =1;
                echo "<script>alert('手机必填');</script>";
            }else{
                if( !$this->funcmtel($_POST['tel'])){
                    $bools =2;
                    echo "<script>alert('手机格式');</script>";
                }
            }
            if ( !$_POST['pwd']){
                $bools =2;
                echo "<script>alert('密码不为空');</script>";
            }

            if ( !$_POST['sex']){
                $bools =2;
                echo "<script>alert('性别不为空');</script>";
            }

            if ( !$_POST['email']){
                $bools =2;
                echo "<script>alert('邮箱不为空');</script>";
            }

            if ( !$_POST['orgname']){
                $bools =2;
                echo "<script>alert('邮箱不为空');</script>";
            }

            if(!$bools){
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

                $bool =$menber->add($data);
                if($bool){
                    $manager['manager'] = $userinfo['manager'].$bool.',';
                    $menber->where(array('uid'=>session('uid')))->save($manager);
                    $menber->where(array('uid'=>$bool))->save(array('manager'=>$bool.','));
                    echo "<script>alert('添加完成');window.location.href = '".__ROOT__."/index.php/Home/User/usermian/id/".$id."';</script>";exit();
                }
            }
        }
        $data = M("Index")->where(array('id'=>$id))->find();
        $this->assign("data",$data);
        $user = $menber->where(array('uid'=>$_GET['uid']))->find();
//        $this->assign("userinfo",$user);
        $this->display('./Public/Home/One/useradd.html');
    }
    function funcmtel($str)//手机号码正则表达试
    {
        return (preg_match("/(?:13d{1}|15[03689])d{8}$/",$str))?true:false;
    }

    public function userlist(){
        $id =1;
        if($_GET['id']){
            $id =$_GET['id'];
        }
        $gaojian = M("gaojian")->where(array('uid'=>session('uid')))->select();
        foreach ($gaojian as $k=>$v){
            if($v['uid']){
                $userinfo = $this->getuserinfo($v['uid']);
                $gaojian[$k]['auth'] =$userinfo['name'] ;
            }
        }
        $userinfo = M("menber")->where(array('uid'=>session('uid')))->find();
        $manager =$userinfo['manager'];
        $in  = substr($manager,0,strlen($manager)-1);
        $con['uid'] =array('in',$in);
        $managerList = M("menber")->where($con)->select();
        $data = M("Index")->where(array('id'=>$id))->find();
        $this->assign("data",$data);
        $this->assign("managerList",$managerList);
        $this->assign("gaojian",$gaojian);
        $this->display('./Public/Home/One/userlist.html');
    }
}