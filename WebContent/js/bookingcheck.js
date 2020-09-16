$("#button").click(function(){
	var Dumbbells1=$("input[name='Dumbbells1']:checked").length;   
	var Dumbbells2=$("input[name='Dumbbells2']:checked").length;
	var Dumbbells3=$("input[name='Dumbbells3']:checked").length;
	var Dumbbells4=$("input[name='Dumbbells4']:checked").length;
	var Dumbbells5=$("input[name='Dumbbells5']:checked").length;   
	var Dumbbells6=$("input[name='Dumbbells6']:checked").length;
	var Dumbbells7=$("input[name='Dumbbells7']:checked").length;
	var Dumbbells8=$("input[name='Dumbbells8']:checked").length;
	var Dumbbells9=$("input[name='Dumbbells9']:checked").length;   
	var Dumbbells10=$("input[name='Dumbbells10']:checked").length;
	var Dumbbells11=$("input[name='Dumbbells11']:checked").length;
	var Dumbbells12=$("input[name='Dumbbells12']:checked").length;
	if(Dumbbells1==0 && Dumbbells2==0 && Dumbbells3==0 && Dumbbells4==0 && Dumbbells5==0 && Dumbbells6==0 && Dumbbells7==0 && Dumbbells8==0 && Dumbbells9==0 && Dumbbells10==0 && Dumbbells11==0 && Dumbbells12==0){
		alert("您尚未選取器材位置");
		return false;//不要提交表單
	}else{
		 alert("您已預約成功")
		return true;//提交表單
		 
	}
})

//判斷有多少個方框被勾選






$(document).ready(function() {
	var x=document.getElementById("test1")
	var y=x.value;
	
    var z=y.includes("Dumbbells1")   
                                                                // 當VALUE有值時候  設置不可預定
	if(z){                                           
        $("#image1").attr("src","../images/ordered.jpg")
        $("#Dumbbells1").attr("disabled","disabled")
        $("#image1").attr('onclick','null').unbind('click');
		}
	});

$(document).ready(function() {
	var x=document.getElementById("test2")
	var y=x.value;
	
	var z=y.includes("Dumbbells2")  

	if(z){                                               
        $("#image2").attr("src","../images/ordered.jpg")
        $("#Dumbbells2").attr("disabled","disabled")
        $("#image2").attr('onclick','null').unbind('click');
		}
	});


$(document).ready(function() {
	var x=document.getElementById("test3")
	var y=x.value;

	var z=y.includes("Dumbbells3") 
	
	if(z){                                               
        $("#image3").attr("src","../images/ordered.jpg")
        $("#Dumbbells3").attr("disabled","disabled")
        $("#image3").attr('onclick','null').unbind('click');
		}
	});


$(document).ready(function() {
	var x=document.getElementById("test4")
	var y=x.value;

	var z=y.includes("Dumbbells4") 
	
	if(z){                                               
        $("#image4").attr("src","../images/ordered.jpg")
        $("#Dumbbells4").attr("disabled","disabled")
        $("#image4").attr('onclick','null').unbind('click');
		}
	});
	
	$(document).ready(function() {
	var x=document.getElementById("test5")
	var y=x.value;

	var z=y.includes("Dumbbells5") 
	
	if(z){                                               
        $("#image5").attr("src","../images/ordered.jpg")
        $("#Dumbbells5").attr("disabled","disabled")
        $("#image5").attr('onclick','null').unbind('click');
		}
	});
	
	$(document).ready(function() {
	var x=document.getElementById("test6")
	var y=x.value;

	var z=y.includes("Dumbbells6") 
	
	if(z){                                               
        $("#image6").attr("src","../images/ordered.jpg")
        $("#Dumbbells6").attr("disabled","disabled")
        $("#image6").attr('onclick','null').unbind('click');
		}
	});
	
	$(document).ready(function() {
	var x=document.getElementById("test7")
	var y=x.value;

	var z=y.includes("Dumbbells7") 
	
	if(z){                                               
        $("#image7").attr("src","../images/ordered.jpg")
        $("#Dumbbells7").attr("disabled","disabled")
        $("#image7").attr('onclick','null').unbind('click');
		}
	});
	
	$(document).ready(function() {
	var x=document.getElementById("test8")
	var y=x.value;

	var z=y.includes("Dumbbells8") 
	
	if(z){                                               
        $("#image8").attr("src","../images/ordered.jpg")
        $("#Dumbbells8").attr("disabled","disabled")
        $("#image8").attr('onclick','null').unbind('click');
		}
	});
	
	$(document).ready(function() {
	var x=document.getElementById("test9")
	var y=x.value;

	var z=y.includes("Dumbbells9") 
	
	if(z){                                               
        $("#image9").attr("src","../images/ordered.jpg")
        $("#Dumbbells9").attr("disabled","disabled")
        $("#image9").attr('onclick','null').unbind('click');
		}
	});
	
	$(document).ready(function() {
	var x=document.getElementById("test10")
	var y=x.value;

	var z=y.includes("Dumbbells10") 
	
	if(z){                                               
        $("#image10").attr("src","../images/ordered.jpg")
        $("#Dumbbells10").attr("disabled","disabled")
        $("#image10").attr('onclick','null').unbind('click');
		}
	});
	
	$(document).ready(function() {
	var x=document.getElementById("test11")
	var y=x.value;

	var z=y.includes("Dumbbells11") 
	
	if(z){                                               
        $("#image11").attr("src","../images/ordered.jpg")
        $("#Dumbbells11").attr("disabled","disabled")
        $("#image11").attr('onclick','null').unbind('click');
		}
	});
	
	$(document).ready(function() {
	var x=document.getElementById("test12")
	var y=x.value;

	var z=y.includes("Dumbbells12") 
	
	if(z){                                               
        $("#image12").attr("src","../images/ordered.jpg")
        $("#Dumbbells12").attr("disabled","disabled")
        $("#image12").attr('onclick','null').unbind('click');
		}
	});
	
		
	
	

	
	
	// $("#reset").click(function(){                                 //click事件 之後 重製所有圖片
//             $("#image1").attr("src","../images/star.gif");      
//             $("#image2").attr("src","../images/star.gif");      
//             $("#image3").attr("src","../images/star.gif");      
//             $("#image4").attr("src","../images/star.gif");      
// });
