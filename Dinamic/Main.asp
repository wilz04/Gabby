<html>
	<head>
		<title>
			Gabby
		</title>
		<link href="dynamicPages/Cold.css" rel="stylesheet" type="text/css">
		<%
			dim message
			dim alias
			dim password
			message = ""
			alias = request.form("tAlias")
			password = request.form("tPassword")
			session("alias") = alias
			dim connect
			dim rs
		  set connect = server.createObject ("ADODB.Connection")
      set rs = server.createobject("ADODB.Recordset")
			connect.open("Provider = SQLOLEDB.1; Password = ; Persist Security Info = True; User ID = sa; Initial Catalog = GabbyBase; Data Source = localhost")
			if request.form <> "" then
				set rs = connect.execute("Select * From Ussers Where alias = '" & alias & "' And password = '" & password & "'")
				if not rs.EOF then
					response.redirect("dynamicPages/Messenger.asp")
				else
					message = "Usuario inexistente"
				end if
			end if
			connect.close()
		%>
	</head>
	<body>
		<center>
			<br><br><br><br>
			<fieldset>
				<br>
				<img src="images/logo.jpg"> <br>
				<span class="comment">
					La cuenta de E-mail más <br>
					segura de toda la red, y <br>
					como siempre ofreciéndote <br>
					espacio ilimitado
				</span>			
				<form name="fMain" method="POST">
					<table width="300" border="0" cellspacing="2" cellpadding="2">
						<tr>
							<td align="right" height="30">
								ID: &nbsp;
							</td>
							<td height="30">
								&nbsp; <input name="tAlias" type="text" size="15"> @gabby.com
							</td>
						</tr>
						<tr>
							<td align="right" height="30">
								contraseña: &nbsp;
							</td>
							<td height="30">
								&nbsp; <input name="tPassword" type="password" size="15">
							</td>
						</tr>
					</table>
					<input type="submit" name="bSubmit" value="Entrar">
					<br><br><br><br>
					<label class="text">
						<%
							= message
						%>
					</label>
					<br><br><br><br>
					<table width="300" border="0" cellspacing="2" cellpadding="2">
						<tr>
							<td align="center" height="30">
								<br>
								Si aún no tienes cuenta as click aquí
								<br><br>
								<a href="dynamicPages/New.asp" class="input">
									Crear cuenta
								</a>
								<br><br>
							</td>
						</tr>
					</table>
				</form>	
			</fieldset>
			<br><br><br><br>
			<span class="comment">
				Code and design by wilz04
			</span>		
		</center>
	</body>
</html>