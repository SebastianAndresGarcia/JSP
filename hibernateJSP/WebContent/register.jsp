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
	tinymce
			.init({
				selector : 'textarea#editorHtml',
				plugins : 'print preview fullpage paste importcss searchreplace autolink autosave save directionality code visualblocks visualchars fullscreen image link media template codesample table charmap hr pagebreak nonbreaking anchor toc insertdatetime advlist lists wordcount imagetools textpattern noneditable help charmap quickbars emoticons',
				imagetools_cors_hosts : [ 'picsum.photos' ],
				menubar : 'file edit view insert format tools table help',
				toolbar : 'undo redo | bold italic underline strikethrough | fontselect fontsizeselect formatselect | alignleft aligncenter alignright alignjustify | outdent indent |  numlist bullist | forecolor backcolor removeformat | pagebreak | charmap emoticons | fullscreen  preview save print | insertfile image media template link anchor codesample | ltr rtl',
				toolbar_sticky : true,
				autosave_ask_before_unload : true,
				autosave_interval : "30s",
				autosave_prefix : "{path}{query}-{id}-",
				autosave_restore_when_empty : false,
				autosave_retention : "2m",
				image_advtab : true,
				content_css : [
						'//fonts.googleapis.com/css?family=Lato:300,300i,400,400i',
						'//www.tiny.cloud/css/codepen.min.css' ],
				link_list : [ {
					title : 'My page 1',
					value : 'http://www.tinymce.com'
				}, {
					title : 'My page 2',
					value : 'http://www.moxiecode.com'
				} ],
				image_list : [ {
					title : 'My page 1',
					value : 'http://www.tinymce.com'
				}, {
					title : 'My page 2',
					value : 'http://www.moxiecode.com'
				} ],
				image_class_list : [ {
					title : 'None',
					value : ''
				}, {
					title : 'Some class',
					value : 'class-name'
				} ],
				importcss_append : true,
				height : 400,
				file_picker_callback : function(callback, value, meta) {
					/* Provide file and text for the link dialog */
					if (meta.filetype === 'file') {
						callback('https://www.google.com/logos/google.jpg', {
							text : 'My text'
						});
					}

					/* Provide image and alt text for the image dialog */
					if (meta.filetype === 'image') {
						callback('https://www.google.com/logos/google.jpg', {
							alt : 'My alt text'
						});
					}

					/* Provide alternative source and posted for the media dialog */
					if (meta.filetype === 'media') {
						callback('movie.mp4', {
							source2 : 'alt.ogg',
							poster : 'https://www.google.com/logos/google.jpg'
						});
					}
				},
				templates : [
						{
							title : 'New Table',
							description : 'creates a new table',
							content : '<div class="mceTmpl"><table width="98%%"  border="0" cellspacing="0" cellpadding="0"><tr><th scope="col"> </th><th scope="col"> </th></tr><tr><td> </td><td> </td></tr></table></div>'
						},
						{
							title : 'Starting my story',
							description : 'A cure for writers block',
							content : 'Once upon a time...'
						},
						{
							title : 'New list with dates',
							description : 'New List with dates',
							content : '<div class="mceTmpl"><span class="cdate">cdate</span><br /><span class="mdate">mdate</span><h2>My List</h2><ul><li></li><li></li></ul></div>'
						} ],
				template_cdate_format : '[Date Created (CDATE): %m/%d/%Y : %H:%M:%S]',
				template_mdate_format : '[Date Modified (MDATE): %m/%d/%Y : %H:%M:%S]',
				height : 600,
				image_caption : true,
				quickbars_selection_toolbar : 'bold italic | quicklink h2 h3 blockquote quickimage quicktable',
				noneditable_noneditable_class : "mceNonEditable",
				toolbar_drawer : 'sliding',
				contextmenu : "link image imagetools table",
			});
</script>
<script>
	var idempresa = document.getElementById("empresaId");
	document.getElementById("noticiaId").value = idempresa;
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
									String mostrar="Elija una empresa";
									if ((Integer) request.getAttribute("idEmp") != null) {
										mostrar=listaempresas.get((Integer) request.getAttribute("idEmp")).getDenominacion();
										System.out.println("mostrar: "+mostrar+". atributo idEmp "+request.getAttribute("idEmp"));
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
								<select name="noticiaId">
									<option value="">Elija una Noticia</option>
									<%
									for (noticia n : listanoticias) {
									%>

									<option value="<%=n.getId()%>"><%=n.getTitulonoticia()%></option>

									<%
									}
									%>
								</select>

							</div>
						</form>

						<form name="noticia" action="noticia" method="post">
							<div class="form-group">
								<label for="uname">Título de la Noticia:</label> <input
									type="text" class="form-control" id="titulonoticia"
									placeholder="titulonoticia" name="titulonoticia" required>
							</div>

							<div class="form-group">
								<label for="uname">Resumen de la noticia:</label> <input
									type="text" class="form-control" id="resumennoticia"
									placeholder="resumennoticia" name="resumennoticia" required>
							</div>

							<div class="form-group">
								<label for="uname">Imagen de la noticia:</label> <input
									type="text" class="form-control" id="imagennoticia"
									placeholder="imagennoticia" name="imagennoticia" required>
							</div>

							<div class="form-group">
								<textarea id="editorHtml" name="editorHtml" rows="10" cols="60"></textarea>
								<p></p>
								<!-- 	<button onclick="mySave()">Save</button>
								<button onclick="myLoad()">Load</button>   -->
								<button onclick="verHTML()">VER HTML</button>
								<script>
									/*function mySave() {
										var myContent = document
												.getElementById("editorHtml").value;
										localStorage.setItem("myContent",
												myContent);
									}
									function myLoad() {
										var myContent = localStorage
												.getItem("myContent");
										document.getElementById("editorHtml").value = myContent;
									} */
									function verHTML() {
										var content = tinymce.get("editorHtml")
												.getContent();
										alert(content);
									}
								</script>
							</div>

							<div class="form-group">
								<label for="uname">Publicada(S/N):</label> <input type="text"
									class="form-control" id="publicada" placeholder="publicada"
									name="publicada" required>
							</div>
							<div class="form-group">
								<label for="uname">Fecha de Publicación:</label> <input
									type="text" class="form-control" id="fechapublicacion"
									placeholder="fechapublicacion" name="fechapublicacion" required>
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