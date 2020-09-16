$('.timefont').change(function () {
				var dateA=document.getElementById("date");
				var date=dateA.value;
				var time=$('input[name=time]:checked').val();
				var my=document.getElementById("test1");
				
			    $.ajax({
			        type: "GET",
			        url: "/TestSpringMvc/bookingcontroller/bookingCheck2",
				     data:{
							'date':date,
							'time':time
						},

			        success: function (data) {
                       var z = data.D1.includes("Dumbbells1") ;
                       if(z){
                    	    $("#image1").attr("src","../images/ordered.jpg")
					        $("#Dumbbells1").attr("disabled","disabled")
					        $("#image1").attr('onclick','null').unbind('click');
                         }

                       var z = data.D2.includes("Dumbbells2") ;
                       if(z){
                    	    $("#image2").attr("src","../images/ordered.jpg")
					        $("#Dumbbells2").attr("disabled","disabled")
					        $("#image2").attr('onclick','null').unbind('click');
                         }

                       var z = data.D3.includes("Dumbbells3") ;
                       if(z){
                    	    $("#image3").attr("src","../images/ordered.jpg")
					        $("#Dumbbells3").attr("disabled","disabled")
					        $("#image3").attr('onclick','null').unbind('click');
                         }

                       var z = data.D4.includes("Dumbbells4") ;
                       if(z){
                    	    $("#image4").attr("src","../images/ordered.jpg")
					        $("#Dumbbells4").attr("disabled","disabled")
					        $("#image4").attr('onclick','null').unbind('click');
                         }

                       var z = data.D5.includes("Dumbbells5") ;
                       if(z){
                    	    $("#image5").attr("src","../images/ordered.jpg")
					        $("#Dumbbells5").attr("disabled","disabled")
					        $("#image5").attr('onclick','null').unbind('click');
                         }

                       var z = data.D6.includes("Dumbbells6") ;
                       if(z){
                    	    $("#image6").attr("src","../images/ordered.jpg")
					        $("#Dumbbells6").attr("disabled","disabled")
					        $("#image6").attr('onclick','null').unbind('click');
                         }

                       var z = data.D7.includes("Dumbbells7") ;
                       if(z){
                    	    $("#image7").attr("src","../images/ordered.jpg")
					        $("#Dumbbells7").attr("disabled","disabled")
					        $("#image7").attr('onclick','null').unbind('click');
                         }

                       var z = data.D8.includes("Dumbbells8") ;
                       if(z){
                    	    $("#image8").attr("src","../images/ordered.jpg")
					        $("#Dumbbells8").attr("disabled","disabled")
					        $("#image8").attr('onclick','null').unbind('click');
                         }

                       var z = data.D9.includes("Dumbbells9") ;
                       if(z){
                    	    $("#image9").attr("src","../images/ordered.jpg")
					        $("#Dumbbells9").attr("disabled","disabled")
					        $("#image9").attr('onclick','null').unbind('click');
                         }

                       var z = data.D10.includes("Dumbbells10") ;
                       if(z){
                    	    $("#image10").attr("src","../images/ordered.jpg")
					        $("#Dumbbells10").attr("disabled","disabled")
					        $("#image10").attr('onclick','null').unbind('click');
                         }

                       var z = data.D11.includes("Dumbbells11") ;
                       if(z){
                    	    $("#image11").attr("src","../images/ordered.jpg")
					        $("#Dumbbells11").attr("disabled","disabled")
					        $("#image11").attr('onclick','null').unbind('click');
                         }

                       var z = data.D12.includes("Dumbbells12") ;
                       if(z){
                    	    $("#image12").attr("src","../images/ordered.jpg")
					        $("#Dumbbells12").attr("disabled","disabled")
					        $("#image12").attr('onclick','null').unbind('click');
                         }
						

						
				


                    
			            
			                   
			        }
			    });         
			}); 