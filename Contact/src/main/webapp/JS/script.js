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
  $("#success-alert").hide();
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
	
	var my_tbody = document.getElementById('cont_tbody');
    // var row = my_tbody.insertRow(0); // 상단에 추가
    var row = my_tbody.insertRow(cont_tbody.rows.length); // 하단에 추가
    var cell1 = row.insertCell(0);
    var cell2 = row.insertCell(1);
    var cell3 = row.insertCell(2);
    var cell4 = row.insertCell(3);
    var cell5 = row.insertCell(4);
    
    
    cell1.innerHTML = cont_tbody.rows.length;
    cell2.innerHTML = $("#contactnm").val();
    cell3.innerHTML = $("#contacttel").val();
    cell4.innerHTML = $("#contactaddr").val();
    cell5.innerHTML = $("#contactdiv").val();
    
    contactnm.value = "";
    contacttel.value = "";
    contactaddr.value = "";
    contactdiv.value = "";
    
    $("#success-alert").fadeTo(2000, 500).slideUp(500, function() {
	      $("#success-alert").slideUp(500);
	    });
	});
});

 $(document).ready(function() {
        var result = '<c:out value="${error}"/>';
        if(!(result==''))
            alert("게시물이 등록되었습니다!");
    });