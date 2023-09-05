package com.empresa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.empresa.entity.Cliente;
import com.empresa.entity.Jugador;
import com.empresa.repository.JugadorRepository;

@Service
public class JugadorServiceImpl implements JugadorService{
	
	@Autowired
	private JugadorRepository repository;

	@Override
	public Jugador insertaJugador(Jugador obj) {
		return repository.save(obj);
	}

	@Override
	public List<Jugador> listaPorAlias(String alias) {
		return repository.findByAlias(alias);
	}

	@Override
	public List<Jugador> listaPorNombre(String nombre) {
		return repository.findByNombre(nombre);
	}


}