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

<title>糖果信息</title>
<!-- 
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page"> -->
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript">
	function confirmdialog() {
		if (window.confirm("您确定要删除此条信息？")) {
			return true;
		} else {
			return false;
		}
	}
</script>

<style type="text/css">
div#container {
	width: 1270px
}


/* div#menu {
	background-color: #F0F8FF;
	height: 350px;
	width: 630px;
	float: left;
}

div#content {
	background-color: #F5F5DC;
	height: 350px;
	width: 630px;
	float: left;
} */

</style>

</head>

<body>
	<div id="container">
		<!-- <div id="header">
			<br>
			<h1>糖果信息</h1>
			<br>
			<hr>
		</div> -->
		<br>
		<div id="menu">
			<h3>全部糖果信息如下</h3>
			<table width="510" border="100" cellSpacing=1
				style="border: 1pt dashed; font-size: 15pt;" height="31">
				<tr>
					<td>idCandy</td>
					<td>Candyname</td>
					<td>Candytaste</td>
					<td>price</td>
					<td colspan="2">Action</td>
				</tr>
				<%
					response.setCharacterEncoding("UTF-8");
					request.setCharacterEncoding("UTF-8");
					List<Candy> subResult = (List<Candy>) request.getAttribute("subResult");
					if (!subResult.isEmpty()) {
						for (int i = 0; i < subResult.size(); i++) {
							Candy st = subResult.get(i);
							out.print("<tr>");
							out.print("<td>" + st.getId() + "</td>");
							out.print("<td>" + st.getCandyName() + "</td>");
							out.print("<td>" + st.getCandyTaste() + "</td>");
							out.print("<td>" + st.getPricae() + "</td>");
				%>
				<td><a href="AllServlet?id=<%=st.getId()%>&methodName=<%=1%>"
					onclick="return confirmdialog()">删除</a></td>

				<td><a
					href="AllServlet?id=<%=st.getId()%>&name=<%=""%>&methodName=<%=3%>">修改</a>
				</td>
				<%
					out.print("</tr>");
						}
					}
				%>
			</table>
			<br>
		</div>
		<div id="content">
			<form action="AllServlet" method="post">
				<input type="hidden" name="methodName" value="5" />
				<h3>按糖果名查询:</h3>
				名称： <input type="text" name="CandyName" title=""></input> 
				<input type="submit" value="查询" />
			</form>
			<br>
			<h3>
				新增糖果信息： <input type="button" value="输入" style="margin-left: 10px"
					onClick="javascript:window.location.href='putin.jsp';" />
			</h3>
		</div>
		<br>
	</div>

</body>

</html>
