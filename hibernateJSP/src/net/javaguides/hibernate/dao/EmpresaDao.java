package net.javaguides.hibernate.dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.Transaction;

import net.javaguides.hibernate.model.Empresa;
import net.javaguides.hibernate.model.noticia;
import net.javaguides.hibernate.util.HibernateUtil;

public class EmpresaDao {
	public void saveEmpresa(Object o) {
		Transaction transaction = null;
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			// start a transaction
			transaction = session.beginTransaction();
			// save the student object
			session.saveOrUpdate(o); // hay variantes con save, saveorupdate, persist

			// commit transaction
			transaction.commit();
			session.close();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}

	}

	public List<Empresa> listar() {
		/*
		 * Esto no funciona, se usaba para los prácticos viejos de magni con versiones
		 * anteriores de Hibernate Session session =
		 * HibernateUtil.getSessionFactory().openSession(); Query consulta =
		 * session.createQuery("SELECT a FROM empresa a"); List<Empresa> lista; try {
		 * lista = consulta.getResultList(); return lista; } catch (Exception e) {
		 * e.printStackTrace(); return null; }
		 */
		try {
			Session session = HibernateUtil.getSessionFactory().openSession();
			List<Empresa> lista = session.createQuery("select a from Empresa a", Empresa.class).getResultList();
			session.close();
			return lista;
		} catch (Exception e) {
			e.printStackTrace();

		}
		return null;
	}

	public void addNoticiaToEmpresa(noticia noticia, int idempresa) {
		// TODO Auto-generated method stub
		Empresa e1 = new Empresa();
		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			Transaction transaction = session.beginTransaction();
			Query consulta = session.createQuery("FROM Empresa WHERE id = :idParam");
			consulta.setParameter("idParam", idempresa);
			e1 = (Empresa) consulta.getSingleResult();

			System.out.println(
					"Estoy en empreDao fc addNoticiaToEmpresa, empresa ID: " + e1.getId() + ", Denominacion; " + e1.getDenominacion());
			noticia.setEmpresa(e1);
			List<noticia> noticias = e1.getNoticias();
			noticias.add(noticia);
			e1.setNoticias(noticias);

			transaction.commit();
			session.close();
			System.out.println("ya cerré sesión, ahora entra a actualizar empresa");
			saveEmpresa(e1);
		} catch (Exception e) {
			e.printStackTrace();

		}

	}

}
