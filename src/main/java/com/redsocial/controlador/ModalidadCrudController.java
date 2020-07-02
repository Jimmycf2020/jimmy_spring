package com.redsocial.controlador;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.redsocial.entidad.Modalidad;
import com.redsocial.servicio.ModalidadServicio;

@Controller
public class ModalidadCrudController {

	@Autowired
	private ModalidadServicio servicio;
	
	@RequestMapping("/verCrudTrabajador")
	public String ver() {
		return "crudModalidad";
	}
	
	@RequestMapping("/consultaCrudTrabajador")
	public String lista(String filtro, Model m) {
		List<Modalidad> lista =  servicio.listaModalidadPorNombre(filtro+"%");
		m.addAttribute("modalidades", lista);
		return "crudModalidad";
	}
	
	@RequestMapping("/registraActualizaCrudTrabajador")
	public String Modalidad(Modalidad obj, Model m) {
		servicio.insertaActualizaModalidad(obj);
		List<Modalidad> lista =  servicio.listaModalidad();
		m.addAttribute("modalidades", lista);
		return "crudModalidad";
	}
	
	@RequestMapping("/eliminaCrudTrabajador")
	public String elimina(int id, Model m) {
		servicio.eliminaModalidad(id);
		List<Modalidad> lista =  servicio.listaModalidad();
		m.addAttribute("modalidades", lista);
		return "crudModalidad";
	}
}
