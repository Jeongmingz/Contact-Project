<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link rel="stylesheet" href="../css/mainStyle.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="../js/script.js"></script>

<script type="text/javascript">
	var bookmarks = document.getElementsByClassName("Y");

	for (var i = 0; i < bookmarks.length; i++) {
		var bookmark = document.getElementByClassName("Y")[i].childNodes.childNodes;

		bookmark.firstChild.style.display = "none";
	}
	
	$(function() {
		$("#error-msg").hide();
		$("#success-msg").hide();
		var errormsg = '<c:out value="${error}"/>';
		var successmsg = '<c:out value="${success}"/>';

		if (!(successmsg == '')) {
			$("#success-msg").fadeTo(2000, 500).slideUp(500, function() {
				$("#success-msg").slideUp(500);
			});
			return;
		}

		if (!(errormsg == '')) {
			$("#error-msg").fadeTo(2000, 500).slideUp(500, function() {
				$("#error-msg").slideUp(500);
			});
			return;
		}
	});
	</script>
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
	<div id="header" class="container align-items-center">
		<div id="logo">
			<a href="/contact/main"> ${user.usernm}'s Contact Page </a>
		</div>

		<div id="logout">
			<form action="logout" name="logoutForm" method="post" id="logoutForm">
				<button class="btn" type="submit">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
						fill="currentColor" class="bi bi-door-closed-fill"
						viewBox="0 0 16 16">
	  					<path
							d="M12 1a1 1 0 0 1 1 1v13h1.5a.5.5 0 0 1 0 1h-13a.5.5 0 0 1 0-1H3V2a1 1 0 0 1 1-1h8zm-2 9a1 1 0 1 0 0-2 1 1 0 0 0 0 2z" />
					</svg>
					&nbsp;Logout
				</button>
			</form>
		</div>



		<div id="menu">
			<ul class="nav nav-tabs clearfix" id="myTab" role="tablist">
				<li class="nav-item" role="presentation">
					<button class="nav-link active" id="home-tab" data-bs-toggle="tab"
						data-bs-target="#userContact" type="button" role="tab"
						aria-controls="userContact" aria-selected="true">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
							fill="currentColor" class="bi bi-person-lines-fill"
							viewBox="0 0 16 16">
	 						<path
								d="M6 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm-5 6s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H1zM11 3.5a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4a.5.5 0 0 1-.5-.5zm.5 2.5a.5.5 0 0 0 0 1h4a.5.5 0 0 0 0-1h-4zm2 3a.5.5 0 0 0 0 1h2a.5.5 0 0 0 0-1h-2zm0 3a.5.5 0 0 0 0 1h2a.5.5 0 0 0 0-1h-2z" />
						</svg>
						&nbsp;내 연락처  <span class="badge bg-primary"> ${fn:length(listContact)}</span>
					</button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="profile-tab" data-bs-toggle="tab"
						data-bs-target="#addContact" type="button" role="tab"
						aria-controls="addContact" aria-selected="false">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
							fill="currentColor" class="bi bi-person-plus-fill"
							viewBox="0 0 16 16">
						  <path
								d="M1 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z" />
						  <path fill-rule="evenodd"
								d="M13.5 5a.5.5 0 0 1 .5.5V7h1.5a.5.5 0 0 1 0 1H14v1.5a.5.5 0 0 1-1 0V8h-1.5a.5.5 0 0 1 0-1H13V5.5a.5.5 0 0 1 .5-.5z" />
						</svg>
						&nbsp;연락처 추가
					</button>
				</li>
			</ul>
		</div>

	</div>

	<div class="container" id="contants">
		<div class="tab-content" id="myTabContent">
			<div class="tab-pane fade show active" id="userContact"
				role="tabpanel" aria-labelledby="home-tab">

				<h2 id="contactlogo">내 연락처</h2>

				<div class="alert alert-danger container" id="error-msg" style="width: 468px">
					<div>
					<svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Danger:">
						<use xlink:href="#exclamation-triangle-fill" />
					</svg>
						&nbsp; ${error}
					</div>
				</div>
				<div class="alert alert-success container" id="success-msg" style="width: 468px">
					<div>
						<svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Success:">
							<use xlink:href="#check-circle-fill" />
						</svg>
						&nbsp; ${success}
					</div>
				</div>

				<div class="table-responsive" id="table">
					<table class="table table-hover table-bordered" id="contactTable">
						<caption>${user.usernm}의&nbsp;연락처</caption>
						<thead>
							<tr>
								<th scope="col" class="col-md-1"><svg
										xmlns="http://www.w3.org/2000/svg" width="16" height="16"
										fill="currentColor" class="bi bi-bookmarks-fill"
										viewBox="0 0 16 16">
								  <path
											d="M2 4a2 2 0 0 1 2-2h6a2 2 0 0 1 2 2v11.5a.5.5 0 0 1-.777.416L7 13.101l-4.223 2.815A.5.5 0 0 1 2 15.5V4z" />
								  <path
											d="M4.268 1A2 2 0 0 1 6 0h6a2 2 0 0 1 2 2v11.5a.5.5 0 0 1-.777.416L13 13.768V2a1 1 0 0 0-1-1H4.268z" />
							  </svg></th>
								<th scope="col" class="col-md-2">Name</th>
								<th scope="col" class="col-md-2">Tel</th>
								<th scope="col" class="col-md-5">Addr</th>
								<th scope="col" class="col-md-1">Division</th>
								<th scope="col" class="col-md-1">Edit</th>
							</tr>
						</thead>
						<tbody id="cont_tbody">
							<c:forEach items="${listContact}" var="contact"
								varStatus="status">
								<tr>
									<td scope="col" class="bookmarktd col-md-1 fw-bold"><a
										href="/contact/bookmark/${contact.contactid}"> <span>
												<i class="bi bi-bookmark${contact.bookmark}"></i>
										</span>
									</a></td>
									<td scope="col" class="col-md-2">${contact.contactnm}</td>
									<td scope="col" class="col-md-2">${contact.contacttel}</td>
									<td scope="col" class="col-md-5">${contact.contactaddr}</td>
									<td scope="col" class="col-md-1">${contact.contactdiv_nm}
									</td>
									<td scope="col" class="col-md-1"><a href="#"
										class="edit_btns" data-bs-toggle="modal"
										data-bs-target="#editModal${status.count}"
										data-bs-whatever="@mdo"> <svg
												xmlns="http://www.w3.org/2000/svg" width="16" height="16"
												fill="currentColor" class="bi bi-pencil-fill"
												viewBox="0 0 16 16">
									  <path
													d="M12.854.146a.5.5 0 0 0-.707 0L10.5 1.793 14.207 5.5l1.647-1.646a.5.5 0 0 0 0-.708l-3-3zm.646 6.061L9.793 2.5 3.293 9H3.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.207l6.5-6.5zm-7.468 7.468A.5.5 0 0 1 6 13.5V13h-.5a.5.5 0 0 1-.5-.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.5-.5V10h-.5a.499.499 0 0 1-.175-.032l-.179.178a.5.5 0 0 0-.11.168l-2 5a.5.5 0 0 0 .65.65l5-2a.5.5 0 0 0 .168-.11l.178-.178z" />
									</svg>
									</a> <span> | </span> <a class="edit_btns"
										href="/contact/delete/${contact.contactid}"> <svg
												xmlns="http://www.w3.org/2000/svg" width="16" height="16"
												fill="currentColor" class="bi bi-trash-fill"
												viewBox="0 0 16 16">
									  <path
													d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0z" />
									</svg>
									</a>


										<form action="edit/${contact.contactid}" name="editForm"
											method="post" id="editForm${status.count}" class="editForm">
											<div class="modal fade" id="editModal${status.count}"
												tabindex="-1" aria-labelledby="editModalLabel"
												aria-hidden="true">
												<div class="modal-dialog modal-dialog-centered">
													<div class="modal-content">
														<div class="modal-header mx-3">
															<h3 class="modal-title" id="editeModalLabel">EDIT</h3>
															<button type="button" class="btn-close"
																data-bs-dismiss="modal" aria-label="Close"></button>
														</div>

														<div class="modal-body mx-3">
															<div class="row mb-3">
																<label for="contactnm"
																	class="col-form-label col-sm-3 col-form-label">NAME</label>
																<div class="col-sm-9">
																	<input type="text" class="form-control"
																		name="contactnm" id="contactnm" autocomplete="off"
																		placeholder="홍길동" required>
																</div>
															</div>


															<div class="row mb-3">
																<label for="contacttel"
																	class="col-form-label col-sm-3 col-form-label">TEL</label>
																<div class="col-sm-9">
																	<input type="text" class="form-control"
																		name="contacttel" id="contacttel" autocomplete="off"
																		required>
																</div>
															</div>

															<div class="row mb-3">
																<label for="contactaddr"
																	class="col-form-label col-sm-3 col-form-label">ADDRESS</label>
																<div class="col-sm-9">
																	<input type="text" class="form-control"
																		name="contactaddr" id="contactaddr" autocomplete="off"
																		required>
																</div>
															</div>

															<div class="row mb-3">
																<label for="contactdiv"
																	class="col-form-label col-sm-3 col-form-label">DIVISION</label>
																<div class="col-sm-9">
																	<select class="form-select" name='contactdiv_id'
																		id="contactdiv">
																		<option value="1">친구</option>
																		<option value="2">가족</option>
																		<option value="3">회사</option>
																		<option value="0">기타</option>
																	</select>
																</div>
															</div>
															<input style="display: none;" type="text"
																class="form-control" name="userid" id="userid"
																autocomplete="off" value="${listContact[0].userid}">
															<input style="display: none;" type="text"
																class="form-control" name="contactid" id="contactid"
																autocomplete="off" value="${contact.contactid}">
															<input style="display: none;" type="text"
																class="form-control" name="bookmark" id="bookmark"
																autocomplete="off" value="${contact.bookmark}">
															<input style="display: none;" type="text"
																class="form-control" name="bookmark" id="bookmark"
																autocomplete="off" value="${contact.bookmark}">
														</div>
														<div class="modal-footer mx-3">
															<button type="submit" id="submit"
																class="btn btn-secondary">EDIT</button>
														</div>
													</div>
												</div>
											</div>
										</form></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>

				</div>
				<div id="contact-footer">
					<form action="main" method="post" name="searchForm" id="search">
						<div class="input-group d-flax justify-content-center">
							<select class="me-2 rounded" name="search">
								<option value="contactnm">NAME</option>
								<option value="contacttel">TEL</option>
								<option value="contactaddr">ADDRESS</option>
								<option value="contactdiv_nm">DIVISION</option>
							</select>
							<div class="form-outline">
								<input type="text" name="searchVal" class="form-control rounded"
									placeholder="Search" />
							</div>
							<button type="submit" class="btn btn-primary">
								<i class="bi bi-search"></i>
							</button>
						</div>
					</form>
					
					<a href="/contact/leaveUser" class="btn btn-primary" style="float: right; margin: 30px">탈퇴하기</a>
				</div>
			</div>

			<div class="tab-pane fade" id="addContact" role="tabpanel"
				aria-labelledby="profile-tab">
				<div class="container shadow p-3 mb-5 bg-body rounded" id="inputDiv">
					<h2>연락처 추가</h2>
					<div class="alert alert-danger" id="failure-alert">
						<div>
							<svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Danger:">
								<use xlink:href="#exclamation-triangle-fill" />
							</svg>
							&nbsp; 누락된 부분을 입력해주세요.
						</div>
					</div>


					<form action="/contact/add" name="newContactForm" method="post">
						<div class="modal-body">
							<div class="row mb-3">
								<label for="contactnm" class="col-sm-2 col-form-label">NAME</label>
								<div class="col-sm-9">
									<input type="text" name="contactnm" class="form-control"
										id="contactnm" placeholder="홍길동" autocomplete="off" required>
								</div>
							</div>
							<div class="row mb-3">
								<label for="contacttel" class="col-sm-2 col-form-label">TEL</label>
								<div class="col-sm-9">
									<input type="text" name="contacttel" class="form-control"
										id="contacttel" placeholder="01000000000" autocomplete="off"
										required>
								</div>
							</div>
							<div class="row mb-3">
								<label for="contactaddr" class="col-sm-2 col-form-label">ADDRESS</label>
								<div class="col-sm-9">
									<input type="text" name="contactaddr" class="form-control"
										id="contactaddr" placeholder="서울시 서초구" autocomplete="off"
										required>
								</div>
							</div>
							<div class="row mb-3">
								<label for="contactdiv" class="col-sm-2 col-form-label">DIVISION</label>
								<div class="col-sm-9">
									<select class="form-select" name="contactdiv_id"
										id="contactdiv">
										<option selected value="">Open this select menu</option>
										<option value="1">친구</option>
										<option value="2">가족</option>
										<option value="3">회사</option>
										<option value="0">기타</option>
									</select>
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<button type="submit" class="btn btn-outline-primary"
								id="add_cont">연락처 추가</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>





</body>
</html>