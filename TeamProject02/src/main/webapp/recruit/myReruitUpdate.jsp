<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정하기</title>
<style type="text/css">
 	*{
 		
 		margin: 5px;
 	}
 	.afile{
 		display: none;
 	}
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#btnadd").click(function(){
			$("#link").append($('<input type="text" class="mylink form-control" id="links" name="links"><br class="linkbr">'));
		});
		$("#btnremove").click(function(){
			$('.mylink').last().remove(); 
			$('.linkbr').last().remove(); 
		});
		
		$.ajax({
			url:"getMyResume",
			data:{"name":"${name}","type":${type},"info":"${info}"},
			success:function(data){
	
				var info = JSON.parse(data.info);
				var links = JSON.parse(data.links);
				var file = JSON.parse(data.file);
			
				console.log(links.length);
				
				$("#aname").val(info.aName);
				$("#aphone").val(info.aPhone);
				$("#aemail").val(info.aEmail);
				
				$("#markn").val(info.aName);
				$("#markp").val(info.aPhone);
				
				
				$.each(links,function(key,value){
					var linkInput = $('<input type="text" class="mylink form-control" id="links" name="links"><br class="linkbr">').val(value.links);
					$("#link").append(linkInput);
					console.log(value);
				});
				
				$("#oldfilename").html(file.aFilepath);
			}
		});
		$("#btnuploadfile").click(function(){
			$("#afile").click();
		})
		
		$('#afile').change(function(ev) {
			$(".uploadbtn").addClass("afile");
			$(".files").removeClass("afile");
		   
		});
		
		
	});
</script>
</head>
<body>
<h1>2022 개발팀 지원</h1>
<div class="insert">
	<form action="updateResumeOK.do" method="post" enctype="multipart/form-data">
		<div class="form-group">
		<label for="aname">이름</label>
		<input type="text" id="aname" name="aname" class="form-control"><br>
		</div>
		<div class="form-group">
		<label for="aphone">전화번호</label>
		<input type="text" id="aphone" name="aphone" class="form-control"><br>
		</div>
		<div class="form-group">
		<label for="aemail">이메일</label>
		<input type="text" id="aemail" name="aemail" class="form-control"><br>
		</div>
		<div class="form-group" id ="link">
		<lable for ="links">블로그 및 GITHUB링크</lable>
		<button type="button" class="btn btn-primary" id="btnadd">+</button>
		<button type="button" class="btn btn-primary" id="btnremove">-</button>
		<br>
		<!--<input type="text" class="mylink form-control" id="links" name="links"><br class="linkbr"> -->
		</div>
		<div class="uploadbtn">
		<input type="hidden" name="oldFname" id="oldFile">
		<button type="button" id="btnuploadfile">파일선택</button><label id="oldfilename"></label>
		</div>
		<div class="files afile">
		<input type="file" id="afile" name="afile" multiple="multiple"/><br>
		</div>
		<input type="submit" class="btn btn-primary" id="submit"value="제출">
		<input type="text" name="markn" id="markn">
		<input type="text" name="markp" id="markp">
	</form>
</div>
</body>


</html>