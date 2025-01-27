<html>
	<head>
		<title>
			GabbyMail - Nueva Cuenta
		</title>
	  <link href = "Cold.css" rel="stylesheet" type="text/css">
		<%
			dim myAlias
			dim myPassword
			dim myName
			dim myFirstName
			dim myLastName
			dim myId
			dim mySex
			dim myAdress
			myAlias = request.form("tAlias")
			myPassword = request.form("tPassword")
			myName = request.form("tName_1")
			myFirstName = request.form("tName_2")
			myLastName = request.form("tName_3")
			myId = request.form("tIdNumber")
			mySex = request.form("sSex")
			myAdress = request.form("tAdress")
			dim connect
			dim rs
		  set connect = server.createObject ("ADODB.Connection")
      set rs = server.createObject("ADODB.Recordset")
			connect.open("Provider = SQLOLEDB.1; Password = ; Persist Security Info = True; User ID = sa; Initial Catalog = GabbyBase; Data Source = localhost")
			if myAlias <> "" and myPassword <> "" and myName <> "" and myFirstName <> "" and myLastName <> "" and myId <> "" and mySex <> "" and myAdress <> "" then
				set rs = connect.execute("Insert Into Ussers(alias, password, name, firstName, lastName, id, male, adress) Values('"& myAlias &"', '"& myPassword &"', '"& myName &"', '"& myFirstName &"', '"& myLastName &"', '"& myId &"', '"& mySex &"', '"& myAdress &"')")
				session("alias") = myAlias
				response.redirect("Messenger.asp")
			end if
			connect.close()
		%>
	</head>
	<body>
		<center>
			<br>
			<form name="fNew" method="POST">
				<span class="title">
					Bienvenido a GabbyMail!
					<br>
				</span>
				<span class="text">
					Debes llenar todos los espacios
				</span>
				<br>
				<br>
				<table width="300" border="0" cellspacing="2" cellpadding="2">
					<tr>
						<td>&nbsp;
						</td>
						<td>&nbsp;
						</td>
					</tr>
					<tr>
						<td align="right" height="30">
							ID: &nbsp;
						</td>
						<td height="30">
							&nbsp; <input name="tAlias" type="text" size="15">
							@gabby.com
						</td>
					</tr>
					<tr>
						<td align="right" height="30">
							Contraseña: &nbsp;
						</td>
						<td height="30">
							&nbsp; <input name="tPassword" type="password" size="30">
						</td>
					</tr>
					<tr>
						<td align="right" height="90">
							Nombre: &nbsp;
							<br><br><br><br><br><br>
						</td>
						<td height="30">
							&nbsp; <input name="tName_1" type="text" size="30">
							<br>
							&nbsp; <input name="tName_2" type="text" size="30">
							<br>
							&nbsp; <input name="tName_3" type="text" size="30">
						</td>
					</tr>
					<tr>
						<td align="right" height="30">
							Cédula: &nbsp;
						</td>
						<td height="30">
							&nbsp; <input name="tIdNumber" type="text" size="30">
						</td>
					</tr>
					<tr>
						<td align="right" height="30">
							Sexo: &nbsp;
						</td>
						<td height="30">
							&nbsp;
							<select name="sSex">
							  <option value="1">masculino
							  <option value="0">femenino
						  </select>
						</td>
					</tr>
					<tr>
						<td align="right" height="30">
							Dirección: &nbsp;
						</td>
						<td height="30">
							&nbsp; <input name="tAdress" type="text" size="30">
						</td>
					</tr>
					<tr>
						<td>&nbsp;
						</td>
						<td>&nbsp;
						</td>
					</tr>
				</table>
				<input type="submit" name="Submit" value="Enviar">
			</form>
		</center>
	</body>
</html>