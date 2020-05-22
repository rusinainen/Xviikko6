<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="CSS/main.css">
<title>Asiakkaiden listaus</title>
</head>
<body>
<form action="haeasiakkaat" method="get">
	<table id="listaus">
		<thead>	
			<tr>
				<th colspan="5" class="oikealle"><a href="lisaaasiakas.jsp">Lisää uusi asiakas</a></th>
			</tr>
			<tr>
				<th colspan="3" class="oikealle">Hakusana:</th>
				<th colspan="3"><input type="text" name="hakusana" id="hakusana" value="${param['hakusana']}"></th>
				<th><input type="submit" value="hae" id="hakunappi"></th>
			</tr>		
			<tr>
				<th>Etunimi</th>
				<th>Sukunimi</th>
				<th>Puhelin</th>
				<th>Sposti</th>	
				<th></th>				
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${asiakkaat}" var="listItem">
				<tr>
			        <td>${listItem.etunimi}</td>
			        <td>${listItem.sukunimi}</td>
			        <td>${listItem.puhelin}</td>
			        <td>${listItem.sposti}</td>
			        <td>
			        	<a href="muutaasiakas?asiakas_id=${listItem.asiakas_id}" class="muuta">muuta</a>
			        	<a onclick="varmista('${listItem.asiakas_id}')" class="poista">poista</a>			        	
			        </td>
		        </tr>
		    </c:forEach>	
		</tbody>
	</table>
<script>
function varmista(asiakas_id){
	if(confirm("Haluatko varmasti poistaa asiakkaan "+ asiakas_id + "?")){
		document.location="poistaasiakas?asiakas_id="+asiakas_id;
	}
}	
</script>
</form>
</body>
</html>