<html>
	<head>
		<title>
			GabbyMail - Correo
		</title>
		<link href="Cold.css" rel="stylesheet" type="text/css">
		<%
			dim connect
			dim rs
			dim from
			set connect = server.createObject ("ADODB.Connection")
			set rs = server.createObject("ADODB.Recordset")
			from = request.queryString("from")
			connect.open("Provider = SQLOLEDB.1; Password = ; Persist Security Info = True; User ID = sa; Initial Catalog = GabbyBase; Data Source = localhost")
			set rs = connect.execute("Delete From Messages Where receiver = '"& session("alias") &"' and number = '"& from &"'")
			connect.close()
		%>
	</head>
	<body>
		<br>
		<div align="right">
			<label>
				Bienvenido <%=session("alias")%>!
			</label>
		</div>
		<form class="input" name="fMenu" method="POST">
			&nbsp;
			<a class="input" href="../Main.asp">
				&nbsp; < &nbsp;
			</a>
			&nbsp;
			<a class="input" href="Edit.asp">
				&nbsp; Redactar &nbsp;
			</a>
			&nbsp;
			<a class="input" href="Messenger.asp">
				&nbsp; Revisar &nbsp;
			</a>
		</form>
		<center>
			<br><br><br><br><br><br><br><br>
			<fieldset>
				<legend>
					Correo
				</legend>
				<br>
				<table width="385" border="0" cellspacing="2" cellpadding="2">
					<tr align="center">
						<td>
							El mensaje ha sido eliminado
						</td>
					</tr>
				</table>
				<br>
				<hr width="380" size="10">
			</fieldset>
		</center>
	</body>
</html>