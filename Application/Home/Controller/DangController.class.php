<?php

namespace Home\Controller;
use Think\Controller;
header('content-type:text/html;charset=utf-8');
class DangController extends Controller{
    public function index()
    {
        if (!session('userid')) {
            echo "<script>window.location.href='".__ROOT__."/index.php/Home/Dang/login/ ';</script>";
            exit();
        }else{
            $this->display();
        }
    }

    public function my(){
        $menber =M('dang');
        $res = $menber->where(array('id'=>session('userid')))->find();
        if($_POST){
            $data=$_POST;
            $menber->where(array('id'=>session('userid')))->save($data);
            echo "<script>alert('保存成功');</script>";
            echo "<script>window.location.href='".__ROOT__."/index.php/Home/Dang/my/ ';</script>";
            exit();
        }
        $this->assign('userinfo',$res);
        $this->display();
    }


    public function login(){

        if($_POST['name']){
            if(strlen($_POST['id'])==18 or strlen($_POST['id'])==15){

            }else{
                echo "<script>alert('身份证账号不正确');</script>";
                echo "<script>window.location.href='".__ROOT__."/index.php/Home/Dang/login/ ';</script>";
                exit();
            }

            $menber =M('dang');
            $res = $menber->where(array('id_card'=>$_POST['id']))->select();
//            if(!$res[0]['id']){
//                echo "<script>alert('用户名或密码错误');</script>";
//                $this->display();
//                exit();
//            }
            if($res[0] && $res[0]['name']==$_POST['name'] ){
                session_start();
                session('uname',$_POST['name']);
                session('userid',$res[0]['id']);
                echo "<script>window.location.href='".__ROOT__."/index.php/Home/Dang/index ';</script>";
            }else{
                $data['name']= $_POST['name'];
                $data['id_card']=$_POST['id'];
                $data['sex'] =$this->get_sex($_POST['id']);
                $userid= $menber->add($data);
                session_start();
                session('uname',$_POST['name']);
                session('userid',$userid);
                echo "<script>window.location.href='".__ROOT__."/index.php/Home/Dang/index ';</script>";
            }
        }

        $this->display();
    }


     public function excel(){
        //导入PHPExcel类库，因为PHPExcel没有用命名空间，只能inport导入
         import("Org.Util.PHPExcel");
         import("Org.Util.PHPExcel.Writer.Excel5");
         import("Org.Util.PHPExcel.IOFactory.php");

         $result = M('dang')->select();
         $filename="excel";

         $headArr=array("编号","姓名","身份证","性别","民族","籍贯","电话","组织","入党日期","转正日期","通讯地址","学位");
         $this->getExcel($filename,$headArr,$result);
     }


    private    function getExcel($fileName,$headArr,$data){
        //对数据进行检验
        if(empty($data) || !is_array($data)){
            die("data must be a array");
        }
        //检查文件名
        if(empty($fileName)){
            exit;
        }
        $date = date("Y_m_d",time());
        $fileName .= "_{$date}.xls";
        //创建PHPExcel对象，注意，不能少了\
        $objPHPExcel = new \PHPExcel();
        $objProps = $objPHPExcel->getProperties();

        //设置表头
        $key = ord("A");
        foreach($headArr as $v){
            $colum = chr($key);
            $objPHPExcel->setActiveSheetIndex(0) ->setCellValue($colum.'1', $v);
            $key += 1;
        }
        $column = 2;
        $objActSheet = $objPHPExcel->getActiveSheet();
        foreach($data as $key => $rows){ //行写入
            $span = ord("A");
            foreach($rows as $keyName=>$value){// 列写入
                $j = chr($span);
                $objActSheet->setCellValue($j.$column, $value);
                $span++;
            }
            $column++;
        }
        $fileName = iconv("utf-8", "gb2312", $fileName);
        //重命名表
        // $objPHPExcel->getActiveSheet()->setTitle('test');
        //设置活动单指数到第一个表,所以Excel打开这是第一个表
        $objPHPExcel->setActiveSheetIndex(0);
        ob_end_clean();
        ob_start();
        header('Content-Type: application/vnd.ms-excel');
        header("Content-Disposition: attachment;filename=\"$fileName\"");
        header('Cache-Control: max-age=0');
        $objWriter = \PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
        $objWriter->save('php://output'); //文件通过浏览器下载
        exit;

    }

    /**
     *  根据身份证号码获取性别
     *  author:xiaochuan
     *  @param string $idcard    身份证号码
     *  @return int $sex 性别 1男 2女 0未知
     */
    function get_sex($idcard) {
        if(empty($idcard)) return null;
        $sexint = (int) substr($idcard, 16, 1);
        return $sexint % 2 === 0 ? '女' : '男';
    }


}