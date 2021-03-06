<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style type="text/css">
.main-data {
	height: 81vh;
	width: 100%;
	background-image: linear-gradient(111deg, rgb(64, 151, 147),
		rgb(164, 70, 215), rgb(64, 151, 147));
	box-shadow: inset 0px 0px 10px -3px black;
}

.form-outter {
	max-width: 70%;
	width: 60%;
	min-height: 70%;
	min-width: 300px;
	padding: 10px;
	background-image: linear-gradient(252deg, rgb(218 172 243),
		rgb(113, 223, 218));
	box-shadow: inset 0px 0px 10px -3px black;
	box-shadow: inset 0px 0px 10px -3px black;
	/*border: 1px solid black;*/
	display: flex;
	flex-direction: column;
	justify-content: center;
}

.form-outter>h2 {
	font-weight: 300;
	text-align: center;
}

section {
	display: block;
	width: 100%;
}

section>label {
	max-width: 40%;
	font-weight: lighter;
	margin-left: 20px;
	font-style: oblique;
}

section>input {
	width: 100%;
	border: none;
	outline: none;
	padding: 3px 13px;
	border-bottom: 1px solid blue;
}

section>input:focus {
	border-bottom: 2px solid blue
}

input[type="submit"] {
	text-align: center;
	align-self: center;
	width: 40%;
	background-color: #c9d0fc;
	/*border: 1px solid lime;*/
	box-shadow: 0 0 4px lime;
	padding: 4px 15px;
	font-size: 1.15rem;
	border-radius: 20px;
	margin-left: 50%;
	transform: translate(-50%, -50%);
}

input[type="submit"]:hover {
	background-color: lime;
	color: black;
}

input[type="submit"]:focu {
	background-color: #00ff0075;
}

.hidden {
	display: none;
}
</style>
<title>Register | ENotes</title>
</head>

<body>
	<%@ include file="common_content/navbar.jsp"%>
	<div class="main-data d-flex justify-content-center align-items-center">
		<div class="form-outter">
			<h2>
				<i class="fa fa-user-plus"></i> Register and enjoy for free.
			</h2>

			<%
			String regMsg = (String) session.getAttribute("reg-sucess");
			if (regMsg != null) {
			%>
			<div class="alert alert-success" role="alert">
				<%=regMsg%>
				Login: <a href="login.jsp">Click Here...</a>
			</div>
			<%
			session.removeAttribute("reg-sucess");
			}
			String FailedMsg = (String) session.getAttribute("reg-failed");
			if (FailedMsg != null) {
			%>
			<div class="alert alert-danger" role="alert">
				<%=FailedMsg%>
			</div>
			<%
			session.removeAttribute("reg-failed");
			}
			%>

			<form method="post" action="UserServlet">
				<section>
					<label>Name:</label> <br> <input type="text"
						placeholder="Your name" required name="uName">
				</section>
				<br>
				<section>
					<label>E-mail:</label> <br> <input type="email"
						placeholder="E-mail Address" required name="uEmail">
				</section>
				<br>
				<section>
					<label>Password:</label> <br> <input type="password" min="8"
						max="16" placeholder="8-16 character long" name="uPassword"
						required onkeyup="CheckCount()"> <label class="hidden"
						id="alert_custom" style="color: #ff0000;"><b>Password
							must be between 8-16 character long!!<b/></label>
				</section>
				<br> <br> <input type="submit" class="btn btn-pill"
					value="Submit" id="submitMe">
			</form>
		</div>
	</div>
	<%@ include file="common_content/footer.jsp"%>

	<script>
		function CheckCount() {
			var len = document.getElementsByName("uPassword")[0].value.length;
			console.log(len);
			if ((len < 8) || (len > 16)) {
				if (document.getElementById("alert_custom").classList
						.contains("hidden")) {
					document.getElementById("alert_custom").classList
							.remove('hidden');
					document.getElementById("submitMe").setAttribute(
							"disabled", "true");
				}
			} else {
				if (!document.getElementById("alert_custom").classList
						.contains('hidden')) {
					document.getElementById("alert_custom").classList
							.add('hidden');
					document.getElementById("submitMe").removeAttributeNode(
							document.getElementById("submitMe")
									.getAttributeNode("disabled"));
				}
			}
		}
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>