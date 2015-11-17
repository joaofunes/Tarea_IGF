package sv.edu.ues.igf115.controller;

import java.util.List;
import java.util.Date;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import sv.edu.ues.igf115.dao.AsClaseDao;
import sv.edu.ues.igf115.dao.TbAplicativoDao;
import sv.edu.ues.igf115.dao.TbTipoClaseDao;
import sv.edu.ues.igf115.model.AsAtributo;
import sv.edu.ues.igf115.model.AsClase;
import sv.edu.ues.igf115.model.TbAplicativo;
import sv.edu.ues.igf115.model.TbTipoClase;

@Transactional
@Service
public class AsClaseController {

	
	private AsClaseDao asClaseDao;
	private TbTipoClaseDao daoDepto;
	private TbAplicativoDao daoApli;


	@Autowired
	public AsClaseController(AsClaseDao asClaseDao, TbTipoClaseDao daoDepto,
			TbAplicativoDao daoApli) {
		this.asClaseDao = asClaseDao;
		this.daoDepto = daoDepto;
		this.daoApli= daoApli;
	}
	
	public List<AsClase> daAsClase() {
		return asClaseDao.findByAll();
	}
	
	public List<TbTipoClase> daTbTipoClase() {
		return daoDepto.daDepartamentos();
	}
	
	public List<TbAplicativo> daTbAplicativo() {
		return daoApli.daDepartamentos();
	}
	
	
	//BUSCA ID
	public TbTipoClase daTbTipoById(String id){
		return daoDepto.daDepartamentoByID(id);
	}
	
	public TbAplicativo daTbApliById(String id){
		return daoApli.daDepartamentoByID(id);
	}
	
	public AsClase daAsClaseById(int id){
		return asClaseDao.findByIdAsClase(id);
	}
	
	
	//Crear
	public boolean crear(AsClase asClase) {
		try{
			//if (asClaseDao.findByIdAsClase(asClase.getCClase()) == null) {				
				//asClase.setFIngreso(new Date());				
				asClaseDao.guardar(asClase);
				return true;
			//} else
				//return false;
		} catch (Exception e) {
			System.out.println("error crear AsClaseController "+e );
			e.printStackTrace();
		}
		return false;
	}	
	
	public boolean update(AsClase asClase) {
		try {
			asClaseDao.guardar(asClase);
			return true;
		} catch (Exception e) {
			System.out.println("Error  AsAtributoController Update");
		}
		return false;
	}	
	public boolean eliminar(AsClase asClase) {

		try {
			asClaseDao.eliminar(asClase);
			return true;
		} catch (Exception e) {
			System.out.println("error crear AsAtributoController " + e);
			return false;
		}

	}
}
