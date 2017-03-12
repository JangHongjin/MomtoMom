
$(document).ready(function(){
	var grant = "<c:out value='${sessionScope.usrGrant}'/>";
	/*var grant = "<%=(String)session.getAttribute('usrGrant')%>";*/
	if(grant == "관리자"){
		$("#admin").show();	
	}else{
		$("#admin").hide();
	}
});


