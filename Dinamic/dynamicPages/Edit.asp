<html>
	<head>
		<title>
			GabbyMail - Redactar
		</title>
		<link href="Cold.css" rel="stylesheet" type="text/css">
		<%
			dim connect
			dim rs
			dim originator
			dim receiver
			dim matter
			dim message
			originator = session("alias")
			receiver = request.form("tfTo")
			matter = request.form("tfMatter")
			message = request.form("taMessage") 
		  set connect = server.createObject ("ADODB.Connection")
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
		<form class="input" name="fMenu" method="POST">
			&nbsp;
			<a href="../Main.asp">
				<span class="input">
					&nbsp; < &nbsp;
				</span>
			</a>
			&nbsp;
			<a class="input" href="Messenger.asp">
				&nbsp; Revisar &nbsp;
			</a>
		</form>
		<center>
			<form name="fEdit" method="POST" action="">
			<fieldset>
				<legend>
					Redactar
				</legend>
				<br>
			  <table width="385" border="0" cellspacing="2" cellpadding="2">
          <tr>
            <td align="right">
							Para: &nbsp;
						</td>
            <td>
							&nbsp; <input name="tfTo" type="text">
						</td>
          </tr>
					<tr>
            <td align="right">
							Asunto: &nbsp;
						</td>
            <td>
							&nbsp; <input name="tfMatter" type="text">
						</td>
          </tr>
        </table>
				<textarea name="taMessage" cols="60" rows="20"></textarea>
				<br>
				<table width="385" border="0" cellspacing="2" cellpadding="2">
					<tr>
						<td>
							&nbsp; <input type="submit" name="Submit" value="Enviar">
						</td>
					</tr>
				</table>
				<hr width="380" size="10">
				</fieldset>
			</form>
		</center>
		<%
			if originator <> "" and receiver <> "" and matter <> "" and message <> "" then
				set rs = connect.execute("Insert into Messages(originator, receiver, matter, message) Values('"& originator &"', '"& receiver &"', '"& matter &"','"& message &"')")
				connect.close()
				%>
					<script language="vbscript">
						msgBox("Tu mensaje ha sido enviado")
					</script>
				<%
				originator = ""
				receiver = ""
				matter = ""
				message = ""
			end if
		%>
	</body>
</html>