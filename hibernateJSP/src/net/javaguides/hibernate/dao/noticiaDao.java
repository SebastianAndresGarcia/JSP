package net.javaguides.hibernate.dao;

import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.Transaction;

import net.javaguides.hibernate.model.Empresa;
import net.javaguides.hibernate.model.noticia;
import net.javaguides.hibernate.util.HibernateUtil;

public class noticiaDao {
	public void saveNoticia(noticia noti) {
		Transaction transaction = null;
		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			// start a transaction
			transaction = session.beginTransaction();
			// save the student object
			noticia noticia=session.get(noticia.class, noti.getId());
			noticia.setContenidohtml(noti.getContenidohtml());
			noticia.setFechapublicacion(noti.getFechapublicacion());
			noticia.setImagennoticia(noti.getImagennoticia());
			noticia.setPublicada(noti.getPublicada());
			noticia.setResumennoticia(noti.getResumennoticia());
			noticia.setTitulonoticia(noti.getTitulonoticia());
			session.update(noticia);
			// commit transaction
			
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
		transaction.commit();
		session.close();
	}

	public void DeleteNoticia(Object o) throws Exception {
		boolean eliminar = false;
		Transaction tx = null;
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			if (!session.getTransaction().isActive()) {
				tx = session.beginTransaction();
				eliminar = true;
			}
			session.delete(o);
			if (eliminar) {
				tx.commit();
			}
			System.out.println("objeto eliminado.");
		} catch (Exception e) {
			if (eliminar) {
				tx.rollback();
			}
			throw new Exception(e.getMessage());
		}
	}

	public List<noticia> listarNoticiasDao(int idempresa) {
		/*
		 * Esto no funciona, se usaba para los prácticos viejos de magni con versiones
		 * anteriores de Hibernate Session session =
		 * HibernateUtil.getSessionFactory().openSession(); Query consulta =
		 * session.createQuery("SELECT a FROM empresa a"); List<Empresa> lista; try {
		 * lista = consulta.getResultList(); return lista; } catch (Exception e) {
		 * e.printStackTrace(); return null; }
		 */
		Session session = HibernateUtil.getSessionFactory().openSession();
		System.out.println("llegó a listarNoticiasDao");
		try {
			
			// List<noticia> lista = session.createQuery("select a from noticia a",
			// noticia.class).getResultList();
			// session.close();

			//Transaction transaction = session.beginTransaction();
			Query consulta = session.createQuery("FROM noticia WHERE idempresa = :idParam");
			consulta.setParameter("idParam", idempresa);
			List<noticia> lista = consulta.getResultList();
			for(noticia n : lista) {
				System.out.println("lista "+ n.getTitulonoticia());
			}
			session.close();
			return lista;
		} catch (Exception e) {
			e.printStackTrace();
			session.close();
		}
		return null;
	}
}
