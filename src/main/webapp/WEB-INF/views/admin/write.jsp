<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@include file="header.jsp"%>

<style>
select {
   background: #F0F0E9;
   border: medium none;
   color: #696763;
   display: block;
   font-family: 'Roboto', sans-serif;
   font-size: 14px;
   font-weight: 300;
   height: 40px;
   margin-bottom: 10px;
   outline: medium none;
   padding-left: 10px;
   width: 100%;
}
#area {
   color: black;
   height: 200px;
}
.colorInfo{
   border: 1px;
   border-color: black;
}

.pop-layer .pop-container {
  padding: 20px 25px;
}

.pop-layer p.ctxt {
  color: #666;
  line-height: 25px;
}

.pop-layer .btn-r {
  width: 100%;
  margin: 10px 0 20px;
  padding-top: 10px;
  border-top: 1px solid #DDD;
  text-align: right;
}

.pop-layer {
  display: none;
  position: absolute;
  top: 50%;
  left: 50%;
  width: 410px;
  height: auto;
  background-color: #fff;
  border: 5px solid #3571B5;
  z-index: 10;
}

.dim-layer {
  display: none;
  position: fixed;
  _position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  z-index: 100;
}

.dim-layer .dimBg {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: #000;
  opacity: .5;
  filter: alpha(opacity=50);
}

.dim-layer .pop-layer {
  display: block;
}

a.btn-layerClose {
  display: inline-block;
  height: 25px;
  padding: 0 14px 0;
  border: 1px solid #304a8a;
  background-color: #3f5a9d;
  font-size: 13px;
  color: #fff;
  line-height: 25px;
}

a.btn-layerClose:hover {
  border: 1px solid #091940;
  background-color: #1f326a;
  color: #fff;
}
</style>
   <!-- write -->
 <div id="page-wrapper">
   <div class="container">
      <div>
         <div class="col-sm-10 col-sm-offset-1">
            <div class="login-form">
               <h2>상품을 등록해 주세요</h2>
               
               <form method="post" action="productWrite" id ='writeForm'>
                   <div class='has-success' >
                   		<input style='width:74%; margin-bottom:2%;' type="text" id="inputSuccess" class='form-control col-md-6 pname' name="pname" placeholder="상품명"/>
                   </div>
                   
                  <div class="has-success row" style='width:76%; margin-bottom:1%;' >
                  	<input style='width:32%; margin-left:2%;' type="text" id="inputSuccess" class="form-control col-md-4 price" name="price" placeholder="가격">
				    <select style='width:31%; margin-left:2%;' id="disabledSelect" name="pgender" class='col-md-4 form-control pgender' >
                    	<option selected>성별</option>
                     	<option>남성</option>
                     	<option>여성</option>
                     	<option>남녀공용</option>
                    </select>
                  	<select style='width:31%; margin-left:2%;' id="disabledSelect" name="pkind" class='col-md-4 form-control pkind'>
                    	 <option selected>종류</option>
                     	<option>상의</option>
                     	<option>하의</option>
                     	<option>아우터</option>
                     	<option>신발 및 악세사리</option>
                     	<option>기타</option>
                  	</select>
                  </div>
                  
                  <div id='pinfo' style='margin-bottom:2%;'>
                     <div class='row' style='border-bottom: 0;'>
                     
                        <div class="col-sm-16" style="padding: 0em; margin-left: 1em;">
                           <i class="fa fa-plus addBtn">&nbsp;&nbsp;추가하기</i>&nbsp;&nbsp;
                           
                              <image src='/resources/admin/images/color_info/red.jpg' class='colorInfo' id='red'/>
                              <image src='/resources/admin/images/color_info/orange.jpg' class='colorInfo' id='orange'/>
                              <image src='/resources/admin/images/color_info/yellow.jpg' class='colorInfo' id='yellow'/>
                              <image src='/resources/admin/images/color_info/green.jpg' class='colorInfo' id='green'/>
                              <image src='/resources/admin/images/color_info/blue.jpg' class='colorInfo' id='blue'/>
                              <image src='/resources/admin/images/color_info/navy.jpg' class='colorInfo' id='navy'/>
                              <image src='/resources/admin/images/color_info/purple.jpg' class='colorInfo' id='purple'/>
                              <image src='/resources/admin/images/color_info/pink.jpg' class='colorInfo' id='pink'/>
                              <image src='/resources/admin/images/color_info/beige.jpg' class='colorInfo' id='beige'/>
                              <image src='/resources/admin/images/color_info/brown.jpg' class='colorInfo' id='brown'/>
                              <image src='/resources/admin/images/color_info/gray.jpg' class='colorInfo' id='gray'/>
                              <image src='/resources/admin/images/color_info/white.jpg' class='colorInfo' id='white'/>
                              <image src='/resources/admin/images/color_info/black.jpg' class='colorInfo' id='black'/>
                              <image src='/resources/admin/images/color_info/etc.jpg' class='colorInfo' id='etc'/>
                              <br>
                        </div>                     
                     </div>
                  </div>
                
                  
                  <div id="sample">
                     <!--  TextEditor -->
                     <textarea cols="40" style=" height: 300px; width:75%;"></textarea>
                     <input type='hidden' id='pcontent' name='pcontent'>
                  </div>
                  <input type="text" class='form-control fileDrop' name="content" placeholder="사진을 넣어주세요" id="area" readonly="readonly" style='width: 75%; '>
                  <div class="field half first" id="uploaded">
                     <input type="hidden" id="photo" name="pphoto" class='content'/>
                  </div>
                  <br>
                  <div style='float: left; width: 100%; padding-bottom: 12px;'>
                     <button class='reBtn btn btn-outline btn-default' style='float: left; width: 20%'>다시 선택하기</button>
                  </div>
                  <br>
                  <div style='float: left; width: 100%; padding-bottom: 12px;'>
                      <button class ="btn btn-success"  style='float: left; width: 20%' id='submitBtn'>등록</button>
                      <button id="cancelBtn" type="button" class="btn btn-danger" style='margin-left: 23em; width: 20%''>취소</button>      
                  </div>
               </form>
               
            </div>


            <!--/login form-->
         </div>
      </div>
   </div>
   <!-- write end -->


   </div>

   <div class="dim-layer">
    <div class="dimBg"></div>
    <div id="layer2" class="pop-layer">
        <div class="pop-container">
            <div class="pop-conts">

                <input id='uploadFile' type="file">
              <button id='uploadBtn'>파일 전송</button>

                <div class="btn-r">
                    <a href="#" class="btn-layerClose">Close</a>
                </div>
                
            </div>
        </div>
    </div>
</div> 
 
 
<script src="/resources/admin/js/admin/editorJs.js"></script>
<script src="/resources/admin/js/admin/writeJs.js"></script>
<%@include file="footer.jsp"%>