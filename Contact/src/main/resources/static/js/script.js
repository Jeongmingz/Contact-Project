// signup PW 일치 여부 JS
$(function(){
    $("#pwd_right").hide();
    $("#pwd_wrong").hide();
    $("input").keyup(function(){
        var pwd1=$("#nuserpw").val();
        var pwd2=$("#renuserpw").val();
        if(pwd1 != "" || pwd2 != ""){
            if(pwd1 == pwd2){
                $("#pwd_right").show();
                $("#pwd_wrong").hide();
                $("#submit").removeAttr("disabled");
            }else{
                $("#pwd_right").hide();
                $("#pwd_wrong").show();
                $("#submit").attr("disabled", "disabled");
            }    
        }
       if(pwd1==""||pwd2==""){
               $("#pwd_wrong").hide();
               $("#pwd_right").hide();  
               $("#submit").attr("disabled", "disabled");      	   
       }
    })
})



$(document).ready(function() {
  $("#failure-alert").hide();
  $("#add_cont").click(function showAlert() {
	    
   	if($("#contactnm").val() == ''){
		$("#failure-alert").fadeTo(2000, 500).slideUp(500, function() {
	      $("#failure-alert").slideUp(500);
	    });
	  	document.getElementById("contactnm").focus();
		return;
	} else if($("#contacttel").val() == ''){
		$("#failure-alert").fadeTo(2000, 500).slideUp(500, function() {
	      $("#failure-alert").slideUp(500);
	    });
	    document.getElementById("contacttel").focus();
		return;
	} else if($("#contactaddr").val() == ''){
		$("#failure-alert").fadeTo(2000, 500).slideUp(500, function() {
	      $("#failure-alert").slideUp(500);
	    });
	    document.getElementById("contactaddr").focus();
		return;
	} else if($("#contactdiv").val() == ''){
		$("#failure-alert").fadeTo(2000, 500).slideUp(500, function() {
	      $("#failure-alert").slideUp(500);
	    });
	    document.getElementById("contactdiv").focus();
		return;
		}
	});
});
