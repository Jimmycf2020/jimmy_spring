package com.redsocial.servicio;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.redsocial.entidad.Modalidad;
import com.redsocial.repositorio.ModalidadRepositorio;

@Service
public class ModalidadServicioImpl implements ModalidadServicio{

	@Autowired
	private ModalidadRepositorio repositorio;

	@Override
	public Modalidad insertaActualizaModalidad(Modalidad obj) {
		return repositorio.insertaActualizaModalidad(obj);
	}

	@Override
	public void eliminaModalidad(int idModalidad) {
		repositorio.eliminaModalidad(idModalidad);
	}

	@Override
	public List<Modalidad> listaModalidad() {
		return repositorio.listaModalidad();
	}

	@Override
	public List<Modalidad> listaModalidadPorNombre(String nom) {
		return repositorio.listaModalidadPorNombre(nom);
	}

	@Override
	public List<Modalidad> listaMoldalidad(int idDeporte, String nombre, int edad) {
		return repositorio.listaMoldalidad(idDeporte, nombre, edad);
	} 
	


}


