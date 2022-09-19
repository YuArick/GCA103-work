<%@page import="com.manager_authfunc.model.Manager_authfunc_VO"%>
<%@page import="com.manager_authfunc.model.Manager_authfunc_Service"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新增管理員權限</title>

<style>
table {
/* 	background-color: white; */
	margin-bottom: 5px;
	font-size: 13px;
	color:black;
}

table, th, td {
	border-bottom: 1px solid #CCC;
	font-weight:bold;
}

th, td {
	padding: 5px;
	text-align: left;
}
.uploadedImg{
padding: 10px
}

h3{
font-weight: bold;
color: #547492;
}
</style>

</head>
<body>
<section id="main-content">
	<section class="wrapper">


	<div id="bid-content">

		<table id="table-1">
			<tr>
				<td>
			 		<h3>新增管理員權限</h3>
				</td>
			</tr>
		</table>


		
<!-- 		主要修改資訊區 -->

		<form method="post"
			action="<%=request.getContextPath()%>/mngAuthFuncServlet"
			name="form1" enctype="multipart/form-data">
			<table>
				<tr>
					<td>管理員權限</td>
					<td><input type="text" name="mng_authfunc_name" size="20"
						value="${manager_authfunc_VO.mng_authfunc_name}" /></td>
				</tr>
				<tr>
					<td>
			<input type="hidden" name="action" value="insert">
			<input type="submit" value="新增">
			<input type="reset" value="重設">
					</td>
				</tr>
<!-- 	上傳圖片區 
				<tr>
					<td>
	        		<input type="file" name="upfile1" onclick="previewImage()" multiple id="upfile"
	        		style="position: relative; left:480px ;bottom: 530px;">
					</td>
				</tr> -->
			</table>
		</form>
		<div id="picPreview" style="display: flex; width: 400px ;flex-wrap:wrap;
		position: relative; left:480px ;bottom: 530px"></div>

	</div>

	</section>

	<!--main content end-->

</section>
	<!-- 為了要去除下面從資料庫取 timestamp 資料會有 nano 小數點的問題 -->



	<script type="text/javascript">

		var filereader_support = typeof FileReader != 'undefined';

		if (!filereader_support) {
			alert("No FileReader support");
		}

		acceptedTypes = {
				'image/png' : true,
				'image/jpeg' : true,
				'image/gif' : true
		};
		
		
		function previewImage() {
			var upfile = document.getElementById("upfile");
			upfile.addEventListener("change", function(event) {
				var files = event.target.files || event.dataTransfer.files;
				for (var i = 0; i < files.length; i++) {
					previewfile(files[i])
				}
			}, false);
		}
		
		function previewfile(file) {
			if (filereader_support === true && acceptedTypes[file.type] === true) {
				var reader = new FileReader();
				reader.onload = function(event) {
					var image = new Image();
					image.src = event.target.result;
					image.width = 128;
					picPreview.appendChild(image);
				};
				reader.readAsDataURL(file);
			} else {
				picPreview.innerHTML += "<p>" + "filename: <strong>" + file.name
						+ "</strong><br>" + "ContentTyp: <strong>" + file.type
						+ "</strong><br>" + "size: <strong>" + file.size
						+ "</strong> bytes</p>";
			}
		}
		// 當upload重新選擇 清空舊有資料
		$("#upload").change(function(){
		    $("#picPreview").empty() // 清空當下預覽
		    previewfile(this.files) // this即為<input>元素
		})
	</script>
</body>
</html>