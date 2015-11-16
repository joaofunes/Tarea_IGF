package sv.edu.ues.igf115.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import sv.edu.ues.igf115.dao.AsClaseDao;
import sv.edu.ues.igf115.dao.AsMetodoDao;
import sv.edu.ues.igf115.dao.AsMetodoPKDao;
import sv.edu.ues.igf115.dao.TbTipoMetodoDao;
import sv.edu.ues.igf115.model.AsClase;
import sv.edu.ues.igf115.model.AsMetodo;
import sv.edu.ues.igf115.model.AsMetodoPK;
import sv.edu.ues.igf115.model.TbTipoMetodo;
@Transactional
@Service
public class AsMetodoController {

	@Autowired
	private AsMetodoDao dao;
	@Autowired
	private AsClaseDao asClaseDao;
	@Autowired
	private TbTipoMetodoDao tbTipoMetodoDao;
	@Autowired
	private AsMetodoPKDao asMetodoPKDao;
	
	

	@Autowired
	public AsMetodoController(AsMetodoDao dao, AsClaseDao asClaseDao,
			TbTipoMetodoDao tbTipoMetodoDao, AsMetodoPKDao asMetodoPKDao) {
		this.dao = dao;
		this.asClaseDao = asClaseDao;
		this.tbTipoMetodoDao = tbTipoMetodoDao;
		this.asMetodoPKDao = asMetodoPKDao;
	}

	
	
	public List<AsMetodo> daAsMetodo() {
		return dao.findByAll();
	}
	
	
	public List<AsClase> daAsClase() {
		return asClaseDao.findByAll();
	}
	
	
	public AsClase daAsClaseEntidad(Integer id) {
		return asClaseDao.findByIdAsClase(id);
	}
	
	
	public TbTipoMetodo daTbTipoMetodoEntidad(String id) {
		return tbTipoMetodoDao.findByIdTbTipoMetodo(id);
	}
	
	public List<TbTipoMetodo> daTipoMetodo() {
		return tbTipoMetodoDao.findByAll();
	}
		

	
	public boolean update(AsMetodo asMetodo) {
		try {
			dao.update(asMetodo);
			return true;
		} catch (Exception e) {
			System.out.println("Error  AsMetodoController Update" +e);
		    e.printStackTrace();
		}
		return false;
	}
	
	
	
	public boolean crearMetodoPk(AsMetodoPK asMetodoPK) {
		try {
			if (asMetodoPKDao.findByIdAsMetodoPK(asMetodoPK.getCMetodo()) == null) {
				asMetodoPKDao.guardar(asMetodoPK);
				return true;
			} else
				return false;
		} catch (Exception e) {
			System.out.println("error crear AsMetodoController " + e);
		}
		return false;
	}

	public boolean eliminarMetodoPk(AsMetodoPK asMetodoPK) {

		try {
			asMetodoPKDao.eliminar(asMetodoPK);
			return true;
		} catch (Exception e) {
			System.out.println("error crear TbTipoMetodoController " + e);
			   e.printStackTrace();
			return false;
		}

	}

	
	public boolean crear(AsMetodo asMetodo) {
		try {
			if (dao.findByIdAsMetodo(asMetodo.getAsMetodoPK().getCMetodo()) == null) {							
				dao.guardar(asMetodo);
				return true;
			} else
				return false;
		} catch (Exception e) {
			System.out.println("error crear AsMetodoController "+e );
			   e.printStackTrace();
		}
		return false;
	}
	
	  public AsMetodo findByIdAsMetodo(Integer id){
			return dao.findByIdAsMetodo(id);
		}
	
	public boolean eliminar(AsMetodo asMetodo) {

		try {
			dao.eliminar(asMetodo);
			return true;
		} catch (Exception e) {
			System.out.println("error crear TbTipoMetodoController " + e);
			e.printStackTrace();
			return false;
		}

	}
	
	
}
