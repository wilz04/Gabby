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
			set rs = server.createobject("ADODB.Recordset")
			from = request.QueryString("from")
			connect.open("Provider = SQLOLEDB.1; Password = ; Persist Security Info = True ; User ID = sa; Initial Catalog = GabbyBase; Data Source = localhost")
			set rs = connect.execute("Select * From Messages Where receiver = '"& session("alias") &"' and number = '"& from &"'")
			on error resume next
		%>
	</head>
	<body>
		<br>
		<div align="right">
			<label>
				Bienvenido <%=session("alias")%>!
			</label>
		</div>
		<form class="input" name="fMenu" method="post">
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
			&nbsp;
      <a class="input" href="Delete.asp?from=<%=from%>">
				&nbsp; Eliminar &nbsp;
			</a>
		</form>
		<center>
			<form name="fMail" method="post" action="">
				<fieldset>
					<legend>
						Correo
					</legend>
					<br>
					<table width="385" border="0" cellspacing="2" cellpadding="2">
						<tr>
							<td align="right" width="25%">
								De: &nbsp;
							</td>
							<td>
								&nbsp;
									<%
										= rs("originator")
									%>
							</td>
						</tr>
						<tr>
							<td align="right" width="25%">
								Asunto: &nbsp;
							</td>
							<td>
								&nbsp;
								<%
									= rs("matter")
								%>
							</td>
						</tr>
					</table>
					<table width="385" border="0" cellspacing="2" cellpadding="2">
						<tr>
							<td>
								<%
									= rs("message")
								%>
							</td>
						</tr>
					</table>
					<br>
					<hr width="380" size="10">
				</fieldset>
			</form>
		</center>
		<%
			connect.close()
		%>
	</body>
</html>