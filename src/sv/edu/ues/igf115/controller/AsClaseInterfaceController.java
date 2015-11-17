package sv.edu.ues.igf115.controller;

import java.util.List;

import javax.servlet.http.HttpServlet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import sv.edu.ues.igf115.dao.AsClaseInterfaceDao;
import sv.edu.ues.igf115.model.AsClaseInterface;

@Transactional
@Service

public class AsClaseInterfaceController {
	
	private AsClaseInterfaceDao daoAsClaseInterface;
	private AsClaseInterface asClaseInterface;
	
	@Autowired
	public AsClaseInterfaceController(AsClaseInterfaceDao daoAsClaseInterface) {
		this.daoAsClaseInterface = daoAsClaseInterface;
	}
	
	public boolean crearAsClaseInterface(Integer cClaseInterface, int cClase, int cInterface) {
		try {

			if (daoAsClaseInterface.daAsClaseInterfaceByNombre(cClaseInterface) == null) {
				
				AsClaseInterface asClaseInterface = new AsClaseInterface();
				asClaseInterface.setCClaseInterface(cClaseInterface);
				asClaseInterface.setCClase(cClase);
				asClaseInterface.setCInterface(cInterface);
				
				daoAsClaseInterface.guardaActualiza(asClaseInterface);
				return true;
			} else
				return false;
		} catch (Exception e) {
			System.out.println("error "+e);
		}
		return false;
	}
	
	public boolean eliminar(AsClaseInterface asClaseInterface) {

		try {
			daoAsClaseInterface.eliminar(asClaseInterface);
			return true;
		} catch (Exception e) {
			System.out.println("error crear AsClaseInterfaceController " + e);
			return false;
		}

	}
	
	public boolean update(AsClaseInterface asClaseInterface) {
		try {
			daoAsClaseInterface.guardaActualiza(asClaseInterface);
			return true;
		} catch (Exception e) {
			System.out.println("Error  AsClaseInterfaceController Update");
		}
		return false;
	}
	
	
	public List<AsClaseInterface> daAsClaseInterface() {
		return daoAsClaseInterface.daAsClaseInterface();
	}

	public AsClaseInterface daAsClaseInterfaceById(Integer c_interfaceImplementa) {
		return daoAsClaseInterface.daAsClaseInterfaceByID(c_interfaceImplementa);
	}

	public AsClaseInterface daAsClaseInterfaceByNombre(Integer d_interface) {
		return daoAsClaseInterface.daAsClaseInterfaceByNombre(d_interface);
	}

}
