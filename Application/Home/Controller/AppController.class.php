<?php
namespace Home\Controller;
use Think\Controller;
header('content-type:text/html;charset=utf-8');
class AppController extends Controller {
//	public function _initialize(){
//		if($_GET['openid']){
//			$menber =M('menber');
//			$user=$menber->where(array('openid'=>$_GET['openid']))->select();
//			S('name',$user[0]['name']);
//			S('userid',$user[0]['id']);
//			S('nickname',$user[0]['nickname']);
//		}
//	}
   //主页
	public function index(){
        $id =1;
	    if($_GET['id']){
            $id =$_GET['id'];
        }
	    $data = M("Index")->where(array('id'=>$id))->find();
	    $article =M("article")->where(array('type'=>$id))->select();
        $this->assign("article",$article);
	    $this->assign("data",$data);
		$this->display('./Public/APP/One/index.html');
	}


    //基本信息
    public function base(){
        $id =1;
        if($_GET['id']){
            $id =$_GET['id'];
        }
        $data = M("Index")->where(array('id'=>$id))->find();
        $this->assign("data",$data);
        $this->display('./Public/APP/One/base.html');
    }


    public function tougao(){
        $id =1;
        if($_GET['id']){
            $id =$_GET['id'];
        }
        $data = M("Index")->where(array('id'=>$id))->find();
        $this->assign("data",$data);
        $this->display('./Public/APP/One/tougao.html');
    }


    public function content(){
        $id =1;
        if($_GET['id']){
            $id =$_GET['id'];
        }
        $data = M("Index")->where(array('id'=>$id))->find();
        $this->assign("data",$data);
        $this->display('./Public/APP/One/content.html');
    }

    public function hotel(){
        $id =1;
        if($_GET['id']){
            $id =$_GET['id'];
        }
        $data = M("Index")->where(array('id'=>$id))->find();
        $this->assign("data",$data);
        $this->display('./Public/APP/One/hotel.html');
    }

    public function comereg(){
        $id =1;
        if($_GET['id']){
            $id =$_GET['id'];
        }
        $data = M("Index")->where(array('id'=>$id))->find();
        $this->assign("data",$data);
        $this->display('./Public/Home/One/comereg.html');
    }

    public function contact(){
        $id =1;
        if($_GET['id']){
            $id =$_GET['id'];
        }
        $data = M("Index")->where(array('id'=>$id))->find();
        $this->assign("data",$data);
        $this->display('./Public/APP/One/contact.html');
    }

    public function weixin(){
        $id =1;
        if($_GET['id']){
            $id =$_GET['id'];
        }
        $data = M("Index")->where(array('id'=>$id))->find();
        $this->assign("data",$data);
        $this->display('./Public/APP/One/weixin.html');
    }

    public function article(){
        $id =1;
        if($_GET['id']){
            $id =$_GET['id'];
        }
        $data = M("Index")->where(array('id'=>$id))->find();
        $this->assign("data",$data);

        $dataart = M("article")->where(array('id'=>$_GET['aid']))->find();
        $this->assign("article",$dataart);
        $this->display('./Public/Home/One/article.html');
    }
    /**
	 * 获取当前页面完整URL地址
	 */
	private function get_url() {
		$sys_protocal = isset($_SERVER['SERVER_PORT']) && $_SERVER['SERVER_PORT'] == '443' ? 'https://' : 'http://';
		$php_self = $_SERVER['PHP_SELF'] ? $_SERVER['PHP_SELF'] : $_SERVER['SCRIPT_NAME'];
		$path_info = isset($_SERVER['PATH_INFO']) ? $_SERVER['PATH_INFO'] : '';
		$relate_url = isset($_SERVER['REQUEST_URI']) ? $_SERVER['REQUEST_URI'] : $php_self.(isset($_SERVER['QUERY_STRING']) ? '?'.$_SERVER['QUERY_STRING'] : $path_info);
		return $sys_protocal.(isset($_SERVER['HTTP_HOST']) ? $_SERVER['HTTP_HOST'] : '').$relate_url;
	}


	private function curlpost($url)
	{
		$ch = curl_init();
		curl_setopt($ch, CURLOPT_POST, 1);
		curl_setopt($ch, CURLOPT_HEADER, 0);
		curl_setopt($ch, CURLOPT_URL, $url);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
		$result = curl_exec($ch);
		curl_close($ch);
		return json_decode($result, true);
	}

	private function curlget($url){
		$ch = curl_init();
		curl_setopt($ch, CURLOPT_URL,$url);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
		curl_setopt($ch, CURLOPT_HEADER, 0);
//		执行并获取HTML文档内容
		$output = curl_exec($ch);
		//释放curl句柄
		curl_close($ch);
		return json_decode($output, true);
	}
}