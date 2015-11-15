package sv.edu.ues.igf115.dao;


import java.util.List;


import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import sv.edu.ues.igf115.model.TbTipoMetodo;
import sv.edu.ues.igf115.utilidades.HibernateUtils;
@Repository
public class TbTipoMetodoDao {
	private HibernateUtils hibernateUtil ;
	
	
	@Autowired
	public TbTipoMetodoDao(HibernateUtils hibernateUtil) {
		this.hibernateUtil = hibernateUtil;
	}

	private SessionFactory sessionFactory = hibernateUtil.getSessionFactory();
	private Session sesion;
	private Transaction tx;
	
	private void iniciaOperacion() throws HibernateException {
		sesion = sessionFactory.openSession() ;
		tx = sesion.beginTransaction() ;
		}
	
	private void manejaExcepcion(HibernateException he)
			throws HibernateException {
		tx.rollback();
		throw new HibernateException("Ocurri� un error en la capa DAO", he);
	} 
	
	
	


		public void guardar(TbTipoMetodo tbTipoMetodo) {
			try {
				iniciaOperacion();
				sesion.saveOrUpdate(tbTipoMetodo);
				tx.commit();
				sesion.flush();
			} catch (HibernateException he) {
				manejaExcepcion(he);
				throw he;
			} finally {
				sesion.close();
			}
		}


			
		public void eliminar(TbTipoMetodo tbTipoMetodo) {
			try {
				iniciaOperacion();
				sesion.delete(tbTipoMetodo);
				tx.commit();
				sesion.flush();
			} catch (HibernateException he) {
				manejaExcepcion(he);
				throw he;
			} finally {
				sesion.close();
			}
		}

	public TbTipoMetodo daDepartamentoById(short idDep) {
		try {
			sesion = sessionFactory.openSession();
			// Retorna la instancia persistente de la clase por medio del
			// atributo identidad
			TbTipoMetodo id = (TbTipoMetodo) sesion.get(TbTipoMetodo.class,
					new Short(idDep));
			return id;
		} catch (HibernateException he) {
			manejaExcepcion(he);
			throw he;
		} finally {
			sesion.close();
		}
	}
		
	public List<TbTipoMetodo> findByAll() {
		try {
			sesion = sessionFactory.openSession();
			// Query query = sesion.getNamedQuery("Departamentos.findAll");
			Query query = sesion.createQuery("Select u From TbTipoMetodo u");
			List<TbTipoMetodo> tbTipoMetodo = query.list();
			return tbTipoMetodo;
		} catch (HibernateException he) {
			manejaExcepcion(he);
			throw he;
		} finally {
			sesion.close();
		}
	}
		
	public TbTipoMetodo findByIdTbTipoMetodo(String nombre) {
		try {
			sesion = sessionFactory.openSession();
			// Query query =
			// sesion.getNamedQuery("Departamentos.findByNombreDep");
			// query.setParameter("nombreDep", nombre);
			Query query = sesion
					.createQuery("Select u from TbTipoMetodo u where u.cTipoMetodo =:idTipo");
			query.setParameter("idTipo", nombre);
			TbTipoMetodo tbTipoMetodo = (TbTipoMetodo) query.uniqueResult();
			return tbTipoMetodo;
		} catch (HibernateException he) {
			manejaExcepcion(he);
			throw he;
		} finally {
			sesion.close();
		}
	}
}
