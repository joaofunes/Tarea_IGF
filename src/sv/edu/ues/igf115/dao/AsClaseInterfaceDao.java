package sv.edu.ues.igf115.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import sv.edu.ues.igf115.model.AsClaseInterface;
import sv.edu.ues.igf115.utilidades.HibernateUtils;

@Repository
public class AsClaseInterfaceDao {
	
	@Autowired	
private HibernateUtils hibernateUtil;
	
	
	@Autowired
	public AsClaseInterfaceDao(HibernateUtils hibernateUtil) {
		super();
		this.hibernateUtil = hibernateUtil;
	}

	private SessionFactory sessionFactory = hibernateUtil.getSessionFactory();
	private Session sesion;
	private Transaction tx;

	private void iniciaOperacion() throws HibernateException {
		sesion = sessionFactory.openSession();
		tx = sesion.beginTransaction();
	}

	private void manejaExcepcion(HibernateException he)
			throws HibernateException {
		tx.rollback();
		throw new HibernateException("Ocurrió un error en la capa DAO", he);
	}
	
	public List<AsClaseInterface> daAsClaseInterface() {
		sesion = sessionFactory.openSession();
		Query query = sesion.createQuery("Select d from  AsClaseInterface d");
		List<AsClaseInterface> asClaseInterface = query.list();
		sesion.close();
		return asClaseInterface;
	}
	
	public void guardaActualiza(AsClaseInterface asClaseInterface) {
		try {
			iniciaOperacion();
			sesion.saveOrUpdate(asClaseInterface);
			tx.commit();
			sesion.flush();
		} catch (HibernateException he) {
			manejaExcepcion(he);
			throw he;
		} finally {
			sesion.close();
		}
	}
	
	public void eliminar(AsClaseInterface asClaseInterface) {
		try {
			iniciaOperacion();
			sesion.delete(asClaseInterface);
			tx.commit();
			sesion.flush();
		} catch (HibernateException he) {
			manejaExcepcion(he);
			throw he;
		} finally {
			sesion.close();
		}
}
	public AsClaseInterface daAsClaseInterfaceByNombre(Integer nombre) {
		try {

			sesion = sessionFactory.openSession();
			Query query= sesion.createQuery("Select dep from AsClaseInterface dep where dep.cClaseInterface=:cClaseInterface");
			query.setParameter("cClaseInterface", nombre);
			AsClaseInterface asClaseInterface = (AsClaseInterface) query.uniqueResult();
			sesion.close();
			return asClaseInterface;	
		} catch (Exception e) {
			System.out.println("error DAO daAsClaseInterfaceByNombre"+e);
		}
		return null;
	}
	
	
	public AsClaseInterface daAsClaseInterfaceByID(Integer id) {
		try {

			sesion = sessionFactory.openSession();
			Query query= sesion.createQuery("Select asinter from AsClaseInterface asinter where asinter.cClaseInterface=:id");
			query.setParameter("id", id);
			AsClaseInterface asClaseInterface= (AsClaseInterface) query.uniqueResult();
			sesion.close();
			return asClaseInterface;	
		} catch (Exception e) {
			System.out.println("error DAO dasClaseInterfaceByID"+e);
		}
		return null;
	}

	public boolean update(AsClaseInterface asClaseInterface) {
		try {
			iniciaOperacion();
			sesion.update(asClaseInterface);
			tx.commit();
			sesion.flush();
		} catch (HibernateException he) {
			manejaExcepcion(he);
			throw he;
		} finally {
			sesion.close();
		}
		return false;
	}

}
