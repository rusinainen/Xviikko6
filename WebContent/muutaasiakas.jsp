<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="scripts/main.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.15.0/jquery.validate.min.js"></script>
<link rel="stylesheet" type="text/css" href="CSS/main.css">
<title>Muuta asiakkaan tietoja</title>
</head>
<body>
<form id="tiedot">
	<table class="table">
		<thead>
			<tr>
				<th colspan="5" class="oikealle"><span id="takaisin">Takaisin listaukseen</span></th>
			</tr>
			<tr>
				<th>Etunimi</th>
				<th>Sukunimi</th>
				<th>Puhelin</th>
				<th>Sposti</th>	
				<th>&nbsp;</th>			
			</tr>
		</thead>
			<tr>
				<td><input type="text" name="etunimi" id="etunimi"></td>
				<td><input type="text" name="sukunimi" id="sukunimi"></td>
				<td><input type="text" name="puhelin" id="puhelin"></td>	
				<td><input type="text" name="sposti" id="sposti"></td>			
				<td><input type="submit" value="Tallenna" id="tallenna"></td>
			</tr>
		<tbody>
		</tbody>
	</table>
	<input type="hidden" name="asiakas_id" id="asiakas_id">
</form>
<span id="ilmo"></span>
<script>
$(document).ready(function(){
	
	$("#asiakas_id").focus();
	
	//Haetaan muutettavan asiakkaan tiedot
	var asiakas_id = requestURLParam("asiakas_id"); //Funktio löytyy scripts/main.js 	    
	$.ajax({url:"asiakkaat/etsiasiakas/"+asiakas_id, type:"GET", dataType:"json", success:function(result){	
		$("#etunimi").val(result.etunimi);
		$("#sukunimi").val(result.sukunimi);
		$("#puhelin").val(result.puhelin);
		$("#sposti").val(result.sposti);	
		$("#asiakas_id").val(result.asiakas_id);	
    }});
		
	$("#takaisin").click(function(){
		document.location="listaaasiakkaat.jsp";
	});
		
	$("#tiedot").validate({						
		rules: {
			etunimi:  {
				required: true,
				minlength: 2,
				maxlength: 50
			},
			sukunimi:  {
				required: true,
				minlength: 2,
				maxlength: 50
			},	
			puhelin:  {
				required: true,
				minlength: 5,
				maxlength: 20
			},
			sposti:  {
				required: true,
				minlength: 5,
				maxlength: 100
			}	
		},
		messages: {
			etunimi: {
				required: "Puuttuu",
				minlength: "Liian lyhyt",
				maxlength: "Liian pitkä"
			},
			sukunimi: {
				required: "Puuttuu",
				minlength: "Liian lyhyt",
				maxlength: "Liian pitkä"
			},
			puhelin: {
				required: "Puuttuu",
				minlength: "Liian lyhyt",
				maxlength: "Liian pitkä"
			},
			sposti: {
				required: "Puuttuu",
				minlength: "Liian lyhyt",
				maxlength: "Liian pitkä"
			}
		},			
		submitHandler: function (form) {	
			vieTiedot();
		}		
	});   

function vieTiedot(){
	var formJsonStr = formDataJsonStr($("#tiedot").serializeArray());
	$.ajax({url:"asiakkaat", data:formJsonStr, type:"PUT", success:function(result){
        if(result.response==0){
        	$("#ilmo").html("Tietojen muutos epäonnistui.");
        }else if(result.response==1){
        	$("#ilmo").html("Tietojen muutos onnistui.");
				}
		}});
	}
	
});
</script>
</body>
</html>