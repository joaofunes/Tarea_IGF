package sv.edu.ues.igf115.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import sv.edu.ues.igf115.model.Usuarios;
import sv.edu.ues.igf115.utilidades.HibernateUtils;

@Repository
public class UsuariosDAO {

	private HibernateUtils hibernateUtil;
	private SessionFactory sessionFactory = hibernateUtil.getSessionFactory();
	private Session sesion;
	private Transaction tx;

	@Autowired
	public UsuariosDAO(HibernateUtils hibernateUtil) {
		this.hibernateUtil = hibernateUtil;
	}

	private void iniciaOperacion() throws HibernateException {
		sesion = sessionFactory.openSession();
		tx = sesion.beginTransaction();
	}

	private void manejaExcepcion(HibernateException he)
			throws HibernateException {
		tx.rollback();
		throw new HibernateException("Ocurrió un error en la AsAtributoDao ",
				he);
	}

	public void guardar(Usuarios usuarios) {
		try {
			iniciaOperacion();
			sesion.saveOrUpdate(usuarios);
			tx.commit();
			sesion.flush();
		} catch (HibernateException he) {
			manejaExcepcion(he);
			throw he;
		} finally {
			sesion.close();
		}
	}

	public void borrar(Usuarios usuarios) {
		try {
			iniciaOperacion();
			sesion.delete(usuarios);
			tx.commit();
			sesion.flush();
		} catch (HibernateException he) {
			manejaExcepcion(he);
			throw he;
		} finally {
			sesion.close();
		}
	}

	public Usuarios findById(int ident) {
		try {
			sesion = sessionFactory.openSession();
			Query query = sesion
					.createQuery("Select u From Usuarios u where u.Id=: id");
			query.setParameter("id", ident);
			Usuarios usuarios = (Usuarios) query.uniqueResult();
			return usuarios;
		} catch (HibernateException he) {
			manejaExcepcion(he);
			throw he;
		} finally {
			sesion.close();
		}
	}

	public List<Usuarios> findByAll() {
		sesion = sessionFactory.openSession();
		// Query query = sesion.getNamedQuery("Departamentos.findAll");
		Query query = sesion.createQuery("Select u From Usuarios u");
		List<Usuarios> usuarios = query.list();
		sesion.close();
		return usuarios;
	}

	public Usuarios findByUsuarioPassword(String usuario, String password) {
		try {
			sesion = sessionFactory.openSession();
			Query query = sesion
					.createQuery("Select u From Usuarios u where u.usuario =: usuario and u.password =: password");
			query.setParameter("usuario", usuario);
			query.setParameter("pass", password);
			Usuarios usuarios = (Usuarios) query.uniqueResult();
			return usuarios;
		} catch (HibernateException he) {
			manejaExcepcion(he);
			throw he;
		} finally {
			sesion.close();
		}

	}

}
