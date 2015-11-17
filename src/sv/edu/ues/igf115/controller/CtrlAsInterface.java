package sv.edu.ues.igf115.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServlet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import sv.edu.ues.igf115.dao.AsInterfaceDao;
import sv.edu.ues.igf115.model.AsInterface;

@Transactional
@Service
public class CtrlAsInterface {


	private AsInterfaceDao daoAsInterface;
	private AsInterface asInterfaceImplementa;
	
	@Autowired
	public CtrlAsInterface(AsInterfaceDao daoAsInterImplemCont) {
		this.daoAsInterface = daoAsInterImplemCont;
	}
	
	public boolean crearAsInterface(Integer cInterface, String dInterface, String cUsuario, Date fIngreso) {
		try {

			if (daoAsInterface.daAsInterfaceByID(cInterface) == null) {
				
				AsInterface asInterface = new AsInterface();
				asInterface.setCInterface(cInterface);
				asInterface.setDInterface(dInterface);
				asInterface.setCUsuario(cUsuario);
				asInterface.setFIngreso(fIngreso);
				
				daoAsInterface.guardaActualiza(asInterface);
				return true;
			} else
				return false;
		} catch (Exception e) {
			System.out.println("error "+e);
		}
		return false;
	}
	
	public boolean eliminar(AsInterface asInterface) {

		try {
			daoAsInterface.eliminar(asInterface);
			return true;
		} catch (Exception e) {
			System.out.println("error crear AsInterfaceController " + e);
			return false;
		}

	}
	
	public boolean update(AsInterface asInterface) {
		try {
			daoAsInterface.guardaActualiza(asInterface);
			return true;
		} catch (Exception e) {
			System.out.println("Error  AsInterfaceController Update");
		}
		return false;
	}
	
	
	public List<AsInterface> daAsInterface() {
		return daoAsInterface.daAsInterface();
	}

	public AsInterface daAsInterfaceById(Integer c_interface) {
		return daoAsInterface.daAsInterfaceByID(c_interface);
	}

	public AsInterface daAsInterfaceImplementaByNombre(String d_interface) {
		return daoAsInterface.daAsInterfaceByNombre(d_interface);
	}

}
