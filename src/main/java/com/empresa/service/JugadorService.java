package com.empresa.service;

import java.util.List;

import com.empresa.entity.Cliente;
import com.empresa.entity.Jugador;

public interface JugadorService {
	public abstract Jugador insertaJugador(Jugador obj);
	public abstract List<Jugador> listaPorAlias(String dni);
	public abstract List<Jugador> listaPorNombre(String nombre);
}