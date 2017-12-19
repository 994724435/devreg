 


$(function(){

// 商城开关
  $("#shopMask .buySpan").click(function() {
    var money=$(this).attr('data-money');
    var id=$(this).attr('data-id');
   $("#goodsMoney").val(money);
   $("#goodsId").val(id);
   $("#shopMask").addClass('hidden');
   $("#shopMask1").removeClass('hidden');
  });
  $("#shopMask1 .returnImg").click(function() {
      $("#shopMask").removeClass('hidden');
     $("#shopMask1").addClass('hidden');
  });
  $("#shopShow .closeImg").click(function() {
       $("#shopShow").hide();
  });
  $("#store").click(function() {
       $("#shopShow").show();
  });
// 商城开关
   $(".shippAddress").click(function() {
       $("#kucun1").val($("#kucun").val());
       $("#buy_num1").val($("#buy_num").val());
       $("#goodsMoney1").val($("#goodsMoney").val());
       $("#goodsId1").val($("#goodsId").val());
       $("#adressMask").show();
   });
    $("#adressMask .returnImg").click(function() {
       $("#adressMask").hide();
   });


    $("#open_shop").click(function() {
        $("#shopShow").show();
    });


  // 申请耗牛
    $("#open_apply").click(function() {
         $("#apply_mask").show();
    });
     $("#apply_mask .closeImg").click(function() {
         $("#apply_mask").hide();
    });



// 资金明细
     $("#open_detail").click(function() {
           $("#detail_mask").show();
     });
      $("#detail_mask .closeImg").click(function() {
         $("#detail_mask").hide();
    });

// 我的下级
    $("#open_group").click(function() {
           $("#group_mask").show();
    });
    $("#group_mask .closeImg").click(function() {
         $("#group_mask").hide();
    });
   
    $(".look_xiaji").click(function() {
        $("#group_mask1").hide();
        $("#lowLevel_Mask").show();
    });
    $("#lowLevel_Mask .returnImg").click(function() {
        $("#group_mask1").show();
        $("#lowLevel_Mask").hide();
    });
    $("#group_mask .closeImg").click(function() {
         $("#group_mask").hide();
    });




// 仓库开关
   $(".cangku").click(function() {
        $("#houseShow").show();
   });
   $("#houseShow .closeImg").click(function() {
       $("#houseShow").hide();
   });

// 仓库开关

$(".oxen img").click(function(event) {
    event.stopPropagation();
    var that=$(this).parents(".oxen");
    $(that).find("span").animate({
        "opacity":1
    },2000,function(){
       $(that).find("span").animate({
        "opacity":0
      },2000);
    });
});




 



  
 })
 