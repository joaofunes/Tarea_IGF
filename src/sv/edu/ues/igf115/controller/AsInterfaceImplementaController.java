package sv.edu.ues.igf115.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import sv.edu.ues.igf115.dao.AsInterfaceImplementaDao;
import sv.edu.ues.igf115.model.AsInterfaceImplementa;

@Transactional
@Service

public class AsInterfaceImplementaController{
	
	private AsInterfaceImplementaDao daoAsInterImplemCont;
	private AsInterfaceImplementa asInterfaceImplementa;
	
	@Autowired
	public AsInterfaceImplementaController(AsInterfaceImplementaDao daoAsInterImplemCont) {
		this.daoAsInterImplemCont = daoAsInterImplemCont;
	}
	
	public boolean crearAsInterfaceImplementa(Integer cInterfaceImplementa, int cInterfacePadre, int cInterfaceHijo) {
		try {

			if (daoAsInterImplemCont.daAsInterfaceImplementaByNombre(cInterfaceImplementa) == null) {
				
				AsInterfaceImplementa asInterfaceImplementa = new AsInterfaceImplementa();
				asInterfaceImplementa.setCInterfaceImplementa(cInterfaceImplementa);
				asInterfaceImplementa.setCInterfaceHijo(cInterfaceHijo);
				asInterfaceImplementa.setCInterfacePadre(cInterfacePadre);
				
				daoAsInterImplemCont.guardaActualiza(asInterfaceImplementa);
				return true;
			} else
				return false;
		} catch (Exception e) {
			System.out.println("error "+e);
		}
		return false;
	}
	
	public boolean eliminar(AsInterfaceImplementa asInterfaceImplementa) {

		try {
			daoAsInterImplemCont.eliminar(asInterfaceImplementa);
			return true;
		} catch (Exception e) {
			System.out.println("error crear AsInterfaceController " + e);
			return false;
		}

	}
	
	public boolean update(AsInterfaceImplementa asInterfaceImplementa) {
		try {
			daoAsInterImplemCont.guardaActualiza(asInterfaceImplementa);
			return true;
		} catch (Exception e) {
			System.out.println("Error  TbTipoAtributoController Update");
		}
		return false;
	}
	
	
	public List<AsInterfaceImplementa> daAsInterfaceImplementa() {
		return daoAsInterImplemCont.daAsInterfaceImplementa();
	}

	public AsInterfaceImplementa daAsInterfaceImplementaById(Integer c_interfaceImplementa) {
		return daoAsInterImplemCont.daAsInterfaceImplementaByID(c_interfaceImplementa);
	}

	public AsInterfaceImplementa daAsInterfaceImplementaByNombre(Integer d_interface) {
		return daoAsInterImplemCont.daAsInterfaceImplementaByNombre(d_interface);
	}

}
