<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 


<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script>

	$(function() {
		$("#error-msg").hide();
		$("#success-msg").hide();
		$("#out-msg").hide();
		$("#find-msg").hide();
		var errormsg = '<c:out value="${error}"/>';
		var successmsg = '<c:out value="${success}"/>';
		var outmsg = '<c:out value="${out}"/>';
		var findmsg = '<c:out value="${find}"/>'.substr(2);
		var findidpw = '<c:out value="${find}"/>'.substr(0, 2);
		var findid = '<c:out value="${user.userid}"/>';

		if (!(successmsg == '')) {
			$("#success-msg").fadeTo(2000, 500).slideUp(500, function() {
				$("#success-msg").slideUp(500);
			});
			document.getElementById("userid").value = successmsg;
			document.getElementById("userpw").focus();
			return;
		}
		
		if (!(findmsg == '')) {
			$("#find-msg").fadeTo(2000, 500).slideUp(500, function() {
				$("#find-msg").slideUp(500);
			});
			
			if(findidpw =="ID"){
				document.getElementById("userid").value = findmsg;
			}else{
				document.getElementById("userid").value = findid;
				document.getElementById("userpw").value = findmsg;
			}
			return;
		}

		if (!(errormsg == '')) {
			$("#error-msg").fadeTo(2000, 500).slideUp(500, function() {
				$("#error-msg").slideUp(500);
			});
			document.getElementById("userid").focus();
			return;
		}
		
		if (!(outmsg == '')) {
			$("#out-msg").fadeTo(2000, 500).slideUp(500, function() {
				$("#out-msg").slideUp(500);
			});
			document.getElementById("userid").focus();
			return;
		}
	});
	
	
	$(function() {
		$("#finduserid").attr("disabled",true); 
		$("#finduserid").hide(); 
		
		$("#findID").click(function(){
			$("#finduserid").attr("disabled",true); 
			$("#finduserid").hide(); 
		});

		$("#findPW").click(function(){
			$("#finduserid").attr("disabled"); 
			document.getElementById("fuserid").value = document.getElementById("userid").value;
			$("#finduserid").show(); 
		});
	})
	
</script>

<script src="../js/script.js"></script>
<link rel="stylesheet" href="../css/style.css">
<title>login</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap"
	rel="stylesheet">
<svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
  <symbol id="exclamation-triangle-fill" fill="currentColor"
		viewBox="0 0 16 16">
    <path
		d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z" />
  </symbol>
  <symbol id="check-circle-fill" viewBox="0 0 16 16">
    <path
		d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z" />
  </symbol>
</svg>

</head>

<body>
	<div class="container shadow p-3 mb-5 bg-body rounded" id="header">

		<h2>Login Page</h2>

		<form action="/contact/login" name="loginForm" method="post">

			<div class="modal-body">
				<div class="row mb-3">
					<label for="userid" class="col-sm-2 col-form-label">ID</label>
					<div class="col-sm-9">
						<input type="text" name="userid" class="form-control" id="userid"
							placeholder="ID" autocomplete="off" required>
					</div>
				</div>

				<div class="row mb-3">
					<label for="userpw" class="col-sm-2 col-form-label">PASSWORD</label>
					<div class="col-sm-9">
						<input type="password" name="userpw" class="form-control"
							id="userpw" placeholder="PW" autocomplete="off" required>
					</div>
				</div>
			</div>

			<div class="modal-footer">
				<div style=" float:left;">
				<button type="button" class="btn" data-bs-toggle="modal" style="color: #e1e1e1;"
					data-bs-target="#findUserModal" data-bs-whatever="@mdo">아이디/비밀번호 찾기</button>
				</div>
				<div style=" float:right;">
				<button type="submit" class="btn btn-outline-success">Login</button>
				<button type="button" class="btn btn-primary" data-bs-toggle="modal"
					data-bs-target="#signupModal" data-bs-whatever="@mdo">Signup</button>
				</div>
			</div>
		</form>
		<div class="alert alert-danger align-items-center" id="error-msg"
			role="alert">
			<svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img"
				aria-label="Danger:">
				<use xlink:href="#exclamation-triangle-fill" /></svg>
			${error}
		</div>

		<div class="alert alert-success align-items-center" id="success-msg"
			role="alert">
			<svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Success:">
				<use xlink:href="#check-circle-fill" /></svg>
			회원가입 성공 ! ID : ${success}
		</div>
		<div class="alert alert-primary align-items-center" id="out-msg"
			role="alert">
			<svg class="bi flex-shrink-0 me-2" xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-person-x-fill" viewBox="0 0 16 16">
			  <path fill-rule="evenodd" d="M1 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm6.146-2.854a.5.5 0 0 1 .708 0L14 6.293l1.146-1.147a.5.5 0 0 1 .708.708L14.707 7l1.147 1.146a.5.5 0 0 1-.708.708L14 7.707l-1.146 1.147a.5.5 0 0 1-.708-.708L13.293 7l-1.147-1.146a.5.5 0 0 1 0-.708z"/>
			</svg>
			${out}
		</div>
		<div class="alert alert-dark align-items-center" id="find-msg"
			role="alert">
			<svg class="bi flex-shrink-0 me-2"  xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-check-all" viewBox="0 0 16 16">
			  <path d="M8.97 4.97a.75.75 0 0 1 1.07 1.05l-3.99 4.99a.75.75 0 0 1-1.08.02L2.324 8.384a.75.75 0 1 1 1.06-1.06l2.094 2.093L8.95 4.992a.252.252 0 0 1 .02-.022zm-.92 5.14.92.92a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 1 0-1.091-1.028L9.477 9.417l-.485-.486-.943 1.179z"/>
			</svg>
			${fn:substring(find,0,2)}&nbsp;를 찾았습니다&nbsp;:&nbsp;${fn:substring(find,2,fn:length(find))}
			
		</div>
	</div>

	<form action="/contact/signup" name="signupForm" method="post"
		id="signupModel">
		<div class="modal fade" id="signupModal" tabindex="-1"
			aria-labelledby="signupModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-header mx-3">
						<h3 class="modal-title" id="signupModalLabel">Signup</h3>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>

					<div class="modal-body mx-3">
						<div class="row mb-3" >
							<label for="usernm"
								class="col-form-label col-sm-3 col-form-label">NAME</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" name="usernm"
									id="usernm" autocomplete="off" placeholder="홍길동" required>
							</div>
						</div>


						<div class="row mb-3">
							<label for="userid"
								class="col-form-label col-sm-3 col-form-label">ID</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" name="userid"
									id="userid" autocomplete="off" required>
							</div>
						</div>

						<div class="row mb-3">
							<label for="nuserpw"
								class="col-form-label col-sm-3 col-form-label">PW</label>
							<div class="col-sm-9">
								<input type="password" class="form-control" name="userpw"
									id="nuserpw" autocomplete="off" required>
							</div>
						</div>

						<div class="row mb-3">
							<label for="renuserpw"
								class="col-form-label col-sm-3 col-form-label">PW 재입력</label>
							<div class="col-sm-9">
								<input type="password" class="form-control" id="renuserpw"
									autocomplete="off" required>
							</div>
						</div>
						<div class="row">
							<div class="alert alert-primary mb-3" id="pwd_right">비밀번호가
								일치합니다.</div>
							<div class="alert alert-primary mb-3" id="pwd_wrong">비밀번호가
								일치하지 않습니다.</div>
						</div>


						<div class="row mb-3">
							<label for="usertel"
								class="col-form-label col-sm-3 col-form-label">TEL</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" name="usertel"
									id="usertel" autocomplete="off" placeholder="01000000000"
									required>
							</div>
						</div>

					</div>

					<div class="modal-footer mx-3">
						<button type="submit" id="submit" class="btn btn-secondary">Signup</button>
					</div>
				</div>
			</div>
		</div>
	</form>
	
	<form action="/contact/findUser" name="findUserForm" method="post" id="signupModel">
		<div class="modal fade" id="findUserModal" tabindex="-1"
			aria-labelledby="findUserModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-header mx-3">
						<h3 class="modal-title" id="findUserModalLabel">회원 정보 찾기</h3>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					
					<div class="btn-group btn-group-toggle" data-toggle="buttons">
						<label class="btn">
							<input type="radio" name="jb-radio" id="findID" style="display: none;" data-bs-toggle="button"> 아이디 찾기
						</label>
						<label class="btn">
							<input type="radio" name="jb-radio" id="findPW" style="display: none;"> 비밀번호 찾기
						</label>
					</div>

					<div class="modal-body mx-3">
						<div class="row mb-3" id="finduserid">
							<label for="userid" class="col-form-label col-sm-3 col-form-label">ID</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" name="userid"
									id="fuserid" autocomplete="off">
							</div>
						</div>

						<div class="row mb-3">
							<label for="usernm"
								class="col-form-label col-sm-3 col-form-label">NAME</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" name="usernm"
									id="usernm" autocomplete="off" placeholder="홍길동" required>
							</div>
						</div>

						<div class="row mb-3">
							<label for="usertel"
								class="col-form-label col-sm-3 col-form-label">TEL</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" name="usertel"
									id="usertel" autocomplete="off" placeholder="01000000000"
									required>
							</div>
						</div>
					</div>

					<div class="modal-footer mx-3">
						<button type="submit" id="submit" class="btn btn-secondary">찾기</button>
					</div>
				</div>
			</div>
		</div>
	</form>

</body>
</html>

