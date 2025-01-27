<html>
	<head>
		<title>
			GabbyMail - Mensajes
		</title>
		<link href="Cold.css" rel="stylesheet" type="text/css">
		<%
			dim i
			i = 0
			dim connect
			dim rs
		 	set connect = server.createObject("ADODB.Connection")
     	set rs = server.createObject("ADODB.Recordset")
			connect.open("Provider = SQLOLEDB.1; Password = ; Persist Security Info = True; User ID = sa; Initial Catalog = GabbyBase; Data Source = localhost")
		%>
	</head>
	<body>
		<br>
		<div align="right">
			<label>
				Bienvenido <%=session("alias")%>!
			</label>
		</div>
		<form class="input" name="fMenu" method="POST" action="Edit.asp">
			&nbsp;
			<a href="../Main.asp">
				<span class="input">
					&nbsp; < &nbsp;
				</span>
			</a>
			&nbsp;
			<input name="bEdit" type="submit" value="Redactar">
		</form>
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td>
					<center>
						<br>
						<table width="75%" border="0" cellspacing="2" cellpadding="2">
							<tr>
								<th scope="col" align="right" width="25%" height="30">
									Emisor &nbsp;
								</th>
								<th scope="col" align="left" height="30">
									&nbsp; Mensaje
								</th>
							</tr>
							<%
								set rs = connect.execute("Select * From Messages Where receiver = '"& session("alias") &"'")
								while not rs.EOF
									i = i + 1
									%>
										<tr>
											<td align="right" height="30">
												<%=rs("originator")%>
												&nbsp;
											</td>
											<td height="30">
												&nbsp;
												<a href="Mail.asp?from=<%=rs("number")%>">
													<%=rs("matter")%>
												</a>
											</td>
										</tr>
									<%
									rs.moveNext
								wend
								connect.close()
							%>
						</table>
						<%
							if i = 0 then
								%>
									<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
									<label>
										No tienes ningun mensaje
									</label>
									<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
								<%
							end if
						%>
						<hr width="75%" size="10">
						<br>
					</center>
				</td>
			</tr>
		</table>
	</body>
</html>