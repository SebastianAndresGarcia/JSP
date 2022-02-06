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

import org.hibernate.Session;

import net.javaguides.hibernate.dao.*;
import net.javaguides.hibernate.model.*;
import net.javaguides.hibernate.util.HibernateUtil;

@WebServlet("/noticia")
public class noticiaController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private noticiaDao noticiaDao;
	private EmpresaDao empresaDao;
	int idempresa;
	int idnoticia;
	public void init() {
		empresaDao = new EmpresaDao();
		noticiaDao = new noticiaDao();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		idempresa = Integer.parseInt(request.getParameter("empresaId"));
		request.setAttribute("idEmp", new Integer(idempresa));

		RequestDispatcher dispatcher = request.getRequestDispatcher("register.jsp");
		dispatcher.forward(request, response);
	}

	private void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String accion = request.getParameter("accion");
		String titulonoticia = request.getParameter("titulonoticia");
		String resumennoticia = request.getParameter("resumennoticia");
		String contenidohtml = request.getParameter("editorHtml");
		
		if (request.getParameter("empresaId") != null) {
			idempresa = Integer.parseInt(request.getParameter("empresaId"));
		} else {
			idempresa = Integer.parseInt(request.getParameter("empresaIdRequest"));
		}
		
		if (request.getParameter("empresaId") != null&&request.getParameter("noticiaId") != ""&&request.getParameter("noticiaId") != null) {
			idnoticia = Integer.parseInt(request.getParameter("noticiaId"));
		} else if (request.getParameter("noticiaIdRequest") != ""&&request.getParameter("noticiaIdRequest") != null){
			idnoticia = Integer.parseInt(request.getParameter("noticiaIdRequest"));
		}
		System.out.println("Estoy en notiControl, valor id empresa elegida: " + idempresa);
		noticia noticia = new noticia();
		noticia.setTitulonoticia(titulonoticia);
		noticia.setResumennoticia(resumennoticia);
		noticia.setContenidohtml(contenidohtml);
		// noticia.setIdempresa(idempresa);
		while (accion != null) {
			switch (accion) {
			case "A": // alta
				empresaDao.addNoticiaToEmpresa(noticia, idempresa);
				break;
			case "B": // baja
				noticia.setId(idnoticia);
				try {
					noticiaDao.DeleteNoticia(noticia);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				break;
			case "M": // modificacion
				noticia.setId(idnoticia);
				//Empresa e=new Empresa();
				//e.setId(idempresa);
				
				System.out.println("idnoticia en el switch M: "+idnoticia);
				//empresaDao.addNoticiaToEmpresa(noticia, idempresa);
				noticiaDao.saveNoticia(noticia);
				break;
			default:
				break;
			}
			accion = null;
		}

		request.setAttribute("idEmp", new Integer(idempresa));
		request.setAttribute("idNoti", new Integer(idnoticia));

		// noticia=new noticia(); //esta linea no funciona, la idea era borrar el objeto
		// para que no vuelva a insertarlo, probé haciendo nula a idempresa pero tampoco
		// funciona, al presionar f5 en la pág. ppal me reinserta una noticia y no
		// quiero eso
		// https://www.generacodice.com/es/articolo/355752/%C2%BFC%C3%B3mo-evitar-volver-a-ejecutar-la-actualizaci%C3%B3n-en-JSP-cuando
		RequestDispatcher dispatcher = request.getRequestDispatcher("register.jsp");
		dispatcher.forward(request, response);

	}

	public List<noticia> listarNoticias(int idempresa) {
		noticiaDao noti = new noticiaDao();
		/*
		 * Esto no funciona, se usaba para los prácticos viejos de magni con versiones
		 * anteriores de Hibernate Session session =
		 * HibernateUtil.getSessionFactory().openSession(); Query consulta =
		 * session.createQuery("SELECT a FROM empresa a"); List<Empresa> lista; try {
		 * lista = consulta.getResultList(); return lista; } catch (Exception e) {
		 * e.printStackTrace(); return null; }
		 */

		// List<noticia> lista = noticiaDao.listarNoticiasDao(42);
		System.out.println("en el controller, valor idempresa: " + idempresa);
		return noti.listarNoticiasDao(idempresa);
		// return null;
	}

	public noticia noticiaporID(int idnoticia, int idempresa) {
		noticia noticia = new noticia();
		noticiaDao noti = new noticiaDao();
		List<noticia> listanoticias = noti.listarNoticiasDao(idempresa);
		for (int i = 0; i < listanoticias.size(); i++) {
			if (idnoticia == listanoticias.get(i).getId()) {
				noticia = listanoticias.get(i);
			}
		}
		return noticia;
	}
}
