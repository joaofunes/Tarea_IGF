package sv.edu.ues.igf115.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import sv.edu.ues.igf115.dao.AsMetodoPKDao;
import sv.edu.ues.igf115.model.AsMetodo;
import sv.edu.ues.igf115.model.AsMetodoPK;


@Transactional
@Service
public class AsMetodoPKController {
	@Autowired
	private AsMetodoPKDao asMetodoPKDao;

	@Autowired
	public AsMetodoPKController(AsMetodoPKDao asMetodoPKDao) {
		this.asMetodoPKDao = asMetodoPKDao;
	}
	
	
	public boolean update(AsMetodoPK asMetodo) {
		try {
			asMetodoPKDao.guardar(asMetodo);
			return true;
		} catch (Exception e) {
			System.out.println("Error  AsMetodoController Update");
		}
		return false;
	}
	
	
	
	public boolean crear(AsMetodoPK asMetodo) {
		try {
			if (asMetodoPKDao.findByIdAsMetodoPK(asMetodo.getCMetodo()) == null) {							
				asMetodoPKDao.guardar(asMetodo);
				return true;
			} else
				return false;
		} catch (Exception e) {
			System.out.println("error crear AsMetodoPKController "+e );
		}
		return false;
	}
	
	  public AsMetodoPK daAsMetodoPkId(Integer id){
			return asMetodoPKDao.findByIdAsMetodoPK(id);
		}
	
	public boolean eliminar(AsMetodoPK asMetodo) {

		try {
			asMetodoPKDao.eliminar(asMetodo);
			return true;
		} catch (Exception e) {
			System.out.println("error crear TbTipoMetodoController " + e);
			return false;
		}

	}

}
