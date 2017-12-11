<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="model.Candy"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>Candy information changes</title>

<script type="text/javascript">
	function validate() {
		var candyName = document.forms[0].candyName.value;
		var candyTaste = document.forms[0].candyTaste.value;
		var price = document.forms[0].price.value;
		var reg1 = new RegExp("^[0-9]*$");
		reg2=/^[-+]?\d*$/;
	    if (candyName.length <= 0) {
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
	<h2>糖果信息</h2>
	<hr>
	<br>
	<h3>要修改的信息如下</h3>
	<table width="496" border="100" cellSpacing=1
		style="border: 1pt dashed; font-size: 15pt;" height="31">
		<tr>
			<td>idCandy</td>
			<td>Candyname</td>
			<td>Candytaste</td>
			<td>price</td>
		</tr>
		<%
			int id = 0;
			ArrayList<Candy> result = new ArrayList<Candy>();
			result = (ArrayList<Candy>) request.getAttribute("result");
			if (!result.isEmpty()) {
				for (int i = 0; i < result.size(); i++) {
					Candy st = result.get(i);
					id = st.getId();
					out.print("<tr>");
					out.print("<tr>");
					out.print("<td>" + st.getId() + "</td>");
					out.print("<td>" + st.getCandyName() + "</td>");
					out.print("<td>" + st.getCandyTaste() + "</td>");
					out.print("<td>" + st.getPricae() + "</td>");
					out.print("</tr>");
				}
			}
		%>
	</table>
	<h3>将信息更改为：</h3>
	<form action="AllServlet" method="post">
		<input type="hidden" name="methodName" value="2" />
		<h4>
			idCandy：<input type="text" name="id" value="<%=id%>" title="id不能改变"></input><br>
		</h4>
		<h4>
			Candyname：<input type="text" name="candyName" title="名称不能为空" /><br>
		</h4>
		<h4>
			Candytaste：<input type="text" name="candyTaste" title="口味不能为空" /><br>
		</h4>
		<h4>
			price：<input type="text" name="price" title="口味不能为空" /><br>
		</h4>
		<input type="submit" value="修改" onclick="return validate()"/>
	</form>

	<br>
	<!-- <h3>
		<a href=putin.jsp>返回信息输入页面</a>
	</h3> -->
	<h3>
		<a href=AllServlet?methodName=<%=4%>&id=<%=""%> &name=<%=""%>>返回信息查询页面</a>
	</h3>
</body>
</html>
