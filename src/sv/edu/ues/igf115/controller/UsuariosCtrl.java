package sv.edu.ues.igf115.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import sv.edu.ues.igf115.dao.UsuariosDAO;
import sv.edu.ues.igf115.model.Usuarios;

@Transactional
@Service
public class UsuariosCtrl {
	
	@Autowired
	private UsuariosDAO usuariosDAO;
	
	@Autowired
	public UsuariosCtrl(UsuariosDAO usuariosDAO) {
		this.usuariosDAO = usuariosDAO;
	}

	public void guardar(Usuarios usuarios){
		usuariosDAO.guardar(usuarios);
	}
	
	public void borrar(int ident){
		Usuarios usuario= usuariosDAO.findById(ident);
		usuariosDAO.borrar(usuario);
	}
	
	public Usuarios findById(int ident){
		Usuarios usuarios = usuariosDAO.findById(ident);
		return usuarios;
	}
	
	public List<Usuarios> findByAll(){
		List<Usuarios> lst = usuariosDAO.findByAll();
		return lst;
	}
	
	public Boolean validaUsuario(String usuario, String password){
		Usuarios usuarios = usuariosDAO.findByUsuarioPassword(usuario, password);
		if (usuarios==null) return false;
		return true;
	}
}

