
<%@ page language="java" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>糖果信息输入</title>
<script type="text/javascript">
	function validate() {
		var id = document.forms[0].id.value;
		var candyName = document.forms[0].candyName.value;
		var candyTaste = document.forms[0].candyTaste.value;
		var price = document.forms[0].price.value;
		var reg1 = new RegExp("^[0-9]*$");
		reg2=/^[-+]?\d*$/;
		if (id=="" || !reg1.test(id)) {
			alert("id不能为空且为数字，请输入id！");
			return false;
		} else if (candyName.length <= 0) {
			alert("糖果名称不能为空，请输入糖果名称!");
			return false;
		}else if (candyTaste.length <= 0) {
			alert("糖果口味不能为空，请输入口味！");
			return false;
		}else if (price <= 0 || !reg2.test(price)) {
			alert("请输入合法价格！");
			return false;
		}
		else {
			return true;
		}
	}
</script>
</head>

<body>
	<br>
	<center>
		<h2>糖果信息输入</h2>
		<hr>
		<form action="AllServlet" method="post" id="form"
			onSubmit="return validate()">

			<input type="hidden" name="methodName" value="0" />

			<h4>
				idCandy：<input type="text" name="id" class="{required:true}"title="id必须为数字"></input><br>
			</h4>
			<h4>
				Candyname：<input type="text" name="candyName" class="{required:true}" title="名称不能为空" /><br>
			</h4>
			<h4>
				CandyTaste：<input type="text" name="candyTaste" class="{required:true}" title="口味不能为空" /><br>
			</h4>
			<h4>
				price：<input type="text" name="price" class="{required:true}" title="价格不能为空" /><br>
			</h4>

			<input type="submit" value="提交" style="margin-left: 30px" onclick="return validate()" /> <input
				type="button" value="取消" style="margin-left: 30px"
				onclick="javascript:window.location.href='AllServlet?methodName=<%=4%>&id=<%=""%>&name=<%=""%>';"/>

		</form>
		<br>

	</center>
</body>
</html>
