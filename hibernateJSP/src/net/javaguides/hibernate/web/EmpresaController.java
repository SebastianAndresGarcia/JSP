package net.javaguides.hibernate.web;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.javaguides.hibernate.dao.*;

import net.javaguides.hibernate.model.Empresa;
import net.javaguides.hibernate.model.noticia;


@WebServlet("/register")
public class EmpresaController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private EmpresaDao empresaDao;
	private noticiaDao notiDao;
	public void init() {
		empresaDao = new EmpresaDao();
		notiDao = new noticiaDao();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		register(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.sendRedirect("register.jsp");
	}

	private void register(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String denominacion = request.getParameter("denominacion");
		String telefono = request.getParameter("telefono");
		String quienessomos = request.getParameter("quienessomos");
		String domicilio = request.getParameter("domicilio");

		Empresa empresa = new Empresa();
		empresa.setDenominacion(denominacion);
		empresa.setTelefono(telefono);
		empresa.setQuienessomos(quienessomos);
		empresa.setDomicilio(domicilio);

		/* esto se manda a noticiaController 
		String titulonoticia = "aca va el titulo";
		String resumennoticia = "aca va el resumen";
		noticia noticia = new noticia();
		noticia.setTitulonoticia(titulonoticia);
		noticia.setResumennoticia(resumennoticia);
		noticia.setEmpresa(empresa);
		List<noticia> noticias = new ArrayList<>();
		noticias.add(noticia);
		empresa.setNoticias(noticias);
		*/
		
		empresaDao.saveEmpresa(empresa);
		//empresa.setNoticias(noticias);
		//notiDao.saveNoticia(noticia);
		/*List<Empresa> listaempresas = empresaDao.listar();
		for(Empresa e : listaempresas) {
			System.out.println("Empresa número: "+e.getId()+", Nombre :"+e.getDenominacion());
		}
		 */
		//request.setAttribute("lista", listaempresas);
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("register.jsp");
		dispatcher.forward(request, response);
	}
}
