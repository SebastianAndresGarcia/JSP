<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="net.javaguides.hibernate.model.*"%>
<%@page import="net.javaguides.hibernate.dao.*"%>
<%@page import="net.javaguides.hibernate.web.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<script
	src="https://cdn.tiny.cloud/1/470vl6oydu4y113xe2muphz55fln53vldzpewunxn0v858qz/tinymce/5/tinymce.min.js"
	referrerpolicy="origin"></script>
<script>
	tinymce.init({
		selector : 'textarea'
	});
</script>
<script>
	function verHTML() {
		var content = tinymce.get("editorHtml").getContent();
		alert(content);
	}
</script>

</head>


<body>
	<div class="container">
		<div class="row text-center" style="color: tomato;">
			<h2>Registro de Empresas y Noticias</h2>
		</div>
		<hr>
		<div class="row col-md-10 col-md-offset-3">

			<div class="card card-body">

				<h2>Registre empresa</h2>
				<div class="col-md-8 col-md-offset-3">

					<form action="<%=request.getContextPath()%>/register" method="post">

						<div class="form-group">
							<label for="uname">Denominación:</label> <input type="text"
								class="form-control" id="denominacion"
								placeholder="denominacion" name="denominacion" required>
						</div>
						<div class="form-group">
							<label for="uname">Horacio de atención:</label> <input
								type="text" class="form-control" id="horarioatencion"
								placeholder="horarioatencion" name="horarioatencion" required>
						</div>
						<div class="form-group">
							<label for="uname">Telefono:</label> <input type="text"
								class="form-control" id="telefono" placeholder="telefono"
								name="telefono" required>
						</div>

						<div class="form-group">
							<label for="uname">Quienes Somos:</label> <input type="text"
								class="form-control" id="quienessomos"
								placeholder="quienessomos" name="quienessomos" required>
						</div>

						<div class="form-group">
							<label for="uname">Domicilio:</label> <input type="text"
								class="form-control" id="domicilio" placeholder="domicilio"
								name="domicilio" required>
						</div>
						<div class="form-group">
							<label for="uname">Latitud:</label> <input type="text"
								class="form-control" id="latitud" placeholder="latitud"
								name="latitud" required>
						</div>
						<div class="form-group">
							<label for="uname">Longitud:</label> <input type="text"
								class="form-control" id="longitud" placeholder="longitud"
								name="longitud" required>
						</div>
						<div class="form-group">
							<label for="uname">Email:</label> <input type="text"
								class="form-control" id="email" placeholder="email" name="email"
								required>
						</div>
						<button type="submit" class="btn btn-primary">Grabar
							Empresa</button>

					</form>
				</div>

			</div>
		</div>
	</div>
	<br>
	<div>
		<div class="container">

			<div class="row col-md-10 col-md-offset-3">

				<div class="card card-body">
					<h2>Registre Noticia</h2>
					<div class="col-md-8 col-md-offset-3">


						<form name="select" action="noticia" method="post"
							onchange="this.form.submit()">
							<div class="form-group">
								<%
								EmpresaDao edao = new EmpresaDao();
								List<Empresa> listaempresas = edao.listar();
								System.out.println("tamaño lista: " + listaempresas.size());
								%>
								<select name="empresaId" id="empresaId"
									onchange="this.form.submit()" required>
									<%
									String mostrar = "Elija una empresa";

									if ((Integer) request.getAttribute("idEmp") != null) {
										int i = (Integer) request.getAttribute("idEmp");
										EmpresaController econt = new EmpresaController();
										mostrar = econt.nombreEmpresa(i);
										System.out.println("mostrar: " + mostrar + ". atributo idEmp " + i);
										
									}
									
									%>

									<option value="<%=(Integer) request.getAttribute("idEmp")%>"><%=mostrar%></option>

									<%
									for (Empresa e : listaempresas) {
									%>

									<option value="<%=e.getId()%>"><%=e.getDenominacion()%></option>

									<%
									}
									%>

								</select>

							</div>
							<div class="form-group">
								<%
								List<noticia> listanoticias = new ArrayList<>();
								if (listaempresas != null) {
									System.out.println("Entró al if");
									noticiaController not = new noticiaController();
									System.out.println("request.getAttributeidEmp" + request.getAttribute("idEmp"));
									if ((Integer) request.getAttribute("idEmp") != null) {
										int n = (Integer) request.getAttribute("idEmp");
										listanoticias = not.listarNoticias(n);
									}
									System.out.println("tamaño listanoti " + listanoticias.size());
								}
								%>
								
								<select id="noticiaId" name="noticiaId"
									onchange="this.form.submit()">
									<option value="">Elija una Noticia</option>
									<%
									for (noticia n : listanoticias) {
									%>
									<!-- <input type="hidden" hidden="hidden" id="gettitulonoticia" name="gettitulonoticia" value=<%=n.getTitulonoticia()%>> -->
									<option value="<%=n.getId()%>"><%=n.getTitulonoticia()%></option>
									<%
									}
									%>
								</select>



							</div>
						</form>

						<form name="noticia" action="noticia" method="post">

							<input type="hidden" id="empresaIdRequest"
								name="empresaIdRequest"
								value="<%=(Integer) request.getAttribute("idEmp")%>">
							<script type="text/javascript">
								var selectValue = document
										.getElementById("empresaIdRequest").value;
								document.getElementById("empresaId").value = selectValue;
							</script>
							<input type="hidden" id="noticiaIdRequest"
								name="noticiaIdRequest"
								value="<%=(Integer) request.getAttribute("idNoti")%>">
							<script type="text/javascript">
								var selectValue = document
										.getElementById("noticiaIdRequest").value;
								document.getElementById("noticiaId").value = selectValue;
							</script>
							<%
							System.out.println("valor de idEmp del request dps de ir y volver " + (Integer) request.getAttribute("idEmp"));
							%>

							<%
							noticia noticia = new noticia();
							noticiaController not = new noticiaController();
							if ((Integer) request.getAttribute("idNoti") != null) {
								noticia = not.noticiaporID((Integer) request.getAttribute("idNoti"), (Integer) request.getAttribute("idEmp"));
							}
							%>
							<div class="form-group">
								<label for="uname">Título de la Noticia:</label> <input
									type="text" class="form-control" id="titulonoticia"
									placeholder="titulonoticia" name="titulonoticia"
									value="<%=noticia.getTitulonoticia()%>" required>
							</div>

							<div class="form-group">
								<label for="uname">Resumen de la noticia:</label> <input
									type="text" class="form-control" id="resumennoticia"
									placeholder="resumennoticia" name="resumennoticia"
									value="<%=noticia.getResumennoticia()%>" required>
							</div>

							<div class="form-group">
								<label for="uname">Imagen de la noticia:</label> <input
									type="text" class="form-control" id="imagennoticia"
									placeholder="imagennoticia" name="imagennoticia"
									value="<%=noticia.getImagennoticia()%>" required>
							</div>

							<div class="form-group">
								<label for="uname">ContenidoHTML:</label>
								<textarea id="editorHtml" name="editorHtml" rows="10" cols="60"></textarea>
								<p></p>

								<button onclick="verHTML()">VER HTML</button>

							</div>
							<input type="hidden" id="contenidohtml" name="contenidohtml"
								value="<%=noticia.getContenidohtml()%>">
							<%
							System.out.println("contenidohtlm: " + noticia.getContenidohtml());
							%>
							<script type="text/javascript">
								var contenidohtml = document
										.getElementById("contenidohtml").value;
								document.getElementById("editorHtml").value = contenidohtml;
							</script>
							<div class="form-group">
								<label for="uname">Publicada(S/N):</label> <input type="text"
									class="form-control" id="publicada" placeholder="publicada"
									name="publicada" value="<%=noticia.getPublicada()%>" required>
							</div>
							<div class="form-group">
								<label for="uname">Fecha de Publicación:</label> <input
									type="text" class="form-control" id="fechapublicacion"
									placeholder="fechapublicacion" name="fechapublicacion"
									value="<%=noticia.getFechapublicacion()%>" required>
							</div>

							<button type="submit" name="accion" value="A"
								class="btn btn-primary" onclick="mySave()">Grabar
								Noticia</button>
							<button type="submit" name="accion" value="M"
								class="btn btn-primary" onclick="mySave()">Modificar
								Noticia</button>
							<button type="submit" name="accion" value="B"
								class="btn btn-primary">Eliminar Noticia</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<br>
</body>
</html>