package com.empresa.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.empresa.entity.Jugador;
import com.empresa.entity.Jugador;
import com.empresa.entity.Pais;
import com.empresa.service.JugadorService;
import com.empresa.service.PaisService;

@Controller
public class RegistraJugadorController {

	@Autowired
	private JugadorService jugadorService;
	@Autowired
	private PaisService paisService;
	
	@GetMapping(value = "/verRegistraJugador" )
	public String verJugador() {return "registraJugador";}
	
	@GetMapping(value = "/listaPais")
	@ResponseBody
	public List<Pais> cargaPais(){
		return paisService.listarPais();
	}
	
	@PostMapping("/registraJugador")
	@ResponseBody
	public Map<?, ?> registra(Jugador obj) {
		HashMap<String, String> map = new HashMap<String, String>();
		Jugador objSalida = jugadorService.insertaJugador(obj);
		if (objSalida == null) {
			map.put("MENSAJE", "Error en el registro");
		} else {
			map.put("MENSAJE", "Registro exitoso");
		}
		return map;
	}
	
	@GetMapping("/buscaPorAlias")
	@ResponseBody
	public String validaAlias(String alias) {
		List<Jugador> lstJugador = jugadorService.listaPorAlias(alias);
		if(CollectionUtils.isEmpty(lstJugador)) {
			return "{\"valid\":true}";
		}else {
			return "{\"valid\":false}";
		}
	}
	
	@GetMapping("/buscaPorNombreJugador")
	@ResponseBody
	public String validaNombre(String nombre) {
		List<Jugador> lstJugador = jugadorService.listaPorNombre(nombre);
		if(CollectionUtils.isEmpty(lstJugador)) {
			return "{\"valid\":true}";
		}else {
			return "{\"valid\":false}";
		}
	}
}