$('#checkboxGroup input').click(function(){         //只能選取一個時間段
	 if($(this).prop('checked')){
	   $('#checkboxGroup input:checkbox').prop('checked',false);
	   $(this).prop('checked',true);
	   }
	  });

$("#button").click(function(){
	var check=$("input[name='time']:checked").length;//判斷有多少個方框被勾選
	if(check==0){
		alert("您尚未選取時間");
		return false;//不要提交表單
	}else{

		return true;//提交表單
	}
})

$("#reset").click(function(){                                 //click事件 之後 重製所有圖片
            $("#image1").attr("src","images/star.gif");      
            $("#image2").attr("src","images/star.gif");      
            $("#image3").attr("src","images/star.gif");      
            $("#image4").attr("src","images/star.gif");      
});
