package com.empresa.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.empresa.entity.Cliente;
import com.empresa.entity.Jugador;

public interface JugadorRepository extends JpaRepository<Jugador, Integer> {
	
	public List<Jugador> findByAlias(String alias);
	public List<Jugador> findByNombre(String nombre);
	
	
}