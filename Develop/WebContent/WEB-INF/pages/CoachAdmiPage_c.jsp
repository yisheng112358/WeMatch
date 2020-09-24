<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Coach Introduction</title>
<%@ include file="CSSsetting.jsp"%>
<style>
.notice {
 color: #ff0000;
 font-size: small;
}

#memo {
 position: absolute;
 right: 0;
 color: #ff0000;
 font-size: small;
 text-align: right;
 padding-right: 50px;
}

h3 {
 display: inline;
}

h3:hover {
 cursor: pointer;
 background: rgba(255, 255, 255, .4);
}

h3:active {
 background: rgba(255, 255, 255, .8);
}

.coachTitle {
 text-align: center;
}
.whitecolor {
 width: 600px;
}
.inputDiv {
 margin-left: 250px;
 text-align: left;
}

.retrunDiv {
 margin-left: 50px;
}

#return,#return1,#return2,#return3 {
 display: inline-block;
 padding: 8px 15px;
 font-size: 24px;
 cursor: pointer;
 text-align: center;
 text-decoration: none;
 outline: none;
 color: #fff;
 background-color: #46A3FF;
 border: none;
 border-radius: 15px;
 box-shadow: 0 5px #999;
 font-family: 微軟正黑體;
}

#return:hover {
 background-color: #FF7575
}

#return:active {
 background-color: #FF7575;
 box-shadow: 0 2px #666;
 transform: translateY(4px);
}
#return1:hover {
 background-color: #FF7575
}

#return1:active {
 background-color: #FF7575;
 box-shadow: 0 2px #666;
 transform: translateY(4px);
}
#return2:hover {
 background-color: #FF7575
}

#return2:active {
 background-color: #FF7575;
 box-shadow: 0 2px #666;
 transform: translateY(4px);
}
#return3:hover {
 background-color: #FF7575
}

#return3:active {
 background-color: #FF7575;
 box-shadow: 0 2px #666;
 transform: translateY(4px);
}
</style>
<script>
function insertCoach(){
 document.getElementById("coachName").value="古阿莫";
 document.getElementById("coachNickname").value="Jhon";
 document.getElementById("coachAge").value="34";
 document.getElementById("courseName").value="有氧體操";
 document.getElementById("courseType").value="有氧運動類";
 document.getElementById("license").value="S級教練證照";
}
</script>
</head>
<body data-spy="scroll" data-target=".site-navbar-target"
 data-offset="300">

<%@ include file="header.jsp"%>
 

 <section class="ftco-section ftco-schedule" id="schedule-section">
  <div class="container">
   <div class="row justify-content-center pb-5">
    <div class="col-md-12 heading-section text-center ftco-animate">
     <span class="subheading">Coach</span>
     <h2 class="mb-4">Coach Introduction</h2>
     <p>Choose us, we help you go further.</p>
    </div>
   </div>
   <div align="center">
    <h2 class="coachTitle">新增教練資料</h2>
    <form action="<c:url value="saveCoach" />" method="POST"  enctype="multipart/form-data" >
     <div class="inputDiv">
      <label class='koTitle'>照片:</label><br /> 
      <input name="coachPic" type="file"/>
     </div><br />
     <div class="inputDiv">
      <label class='koTitle'>教練姓名:</label><br /> 
      <input class="whitecolor" name="coachName" type="text" id="coachName"/>
     </div><br />
     <div class="inputDiv">
      <label class='koTitle'>教練暱稱:</label><br /> 
      <input class="whitecolor" name="coachNickname" type="text" id="coachNickname"/>
     </div><br />
     <div class="inputDiv">
      <label class='koTitle'>年齡:</label><br /> 
      <input class="whitecolor" name="coachAge" type="text" id="coachAge"/>
     </div><br />
     <div class="inputDiv">
      <label class='koTitle'>授課名稱:</label><br /> 
      <input class="whitecolor" name="courseName" type="text" id="courseName"/>
     </div><br />
     <div class="inputDiv">
      <label class='koTitle'>授課類別:</label><br /> 
      <input class="whitecolor" name="courseType" type="text" id="courseType"/>
     </div><br />
     <div class="inputDiv">
      <label class='koTitle'>相關證照:</label><br /> 
      <input class="whitecolor" name="license" type="text" id="license"/>
     </div><br />
     <div class="retrunDiv">
      <input type="submit" id="return" value="確認新增">
      <input type="reset"  id="return1" value="重新輸入">
      <input type="button" id="return2"value="返回教練系統" onclick="location.href='/WeMatch_dev/coachAdminPage'">
      <input type="button" id="return3"value="一鍵新增" onclick="insertCoach()">
     </div>
    </form>
    
   </div>
  </div>
 </section>

 <%@ include file="footer.jsp"%>
 <%@ include file="JSsetting.jsp"%>


</body>
</html>