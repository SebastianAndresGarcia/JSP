package net.javaguides.hibernate.model;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.*;
import javax.persistence.AccessType;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
public class Empresa implements Serializable{
	
	public Empresa() {}
	//private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id; 
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}

	//@Column(name = "denominacion")
	private String denominacion;
	
	//@Column(name = "telefono")
	private String telefono;
	
	//@Column(name = "horarioatencion")
	private String horarioatencion;
	
	//@Column(name = "quienessomos")
	private String quienessomos;
	
	//@Column(name = "latitud")
	private Double latitud;
	
	//@Column(name = "longitud")
	private Double longitud;
	
	//@Column(name = "domicilio")
	private String domicilio;
	
	//@Column(name = "email")
	private String email;
	
	//@ElementCollection
	@OneToMany(mappedBy = "empresa", cascade = CascadeType.ALL, orphanRemoval = true)
	private List<noticia> noticias=new ArrayList<noticia>();
	
	public String getDenominacion() {
		return denominacion;
	}
	public void setDenominacion(String denominacion) {
		this.denominacion = denominacion;
	}
	public String getTelefono() {
		return telefono;
	}
	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}
	public String getHorarioatencion() {
		return horarioatencion;
	}
	public void setHorarioatencion(String horarioatencion) {
		this.horarioatencion = horarioatencion;
	}
	public String getQuienessomos() {
		return quienessomos;
	}
	public void setQuienessomos(String quienessomos) {
		this.quienessomos = quienessomos;
	}
	public Double getLatitud() {
		return latitud;
	}
	public void setLatitud(Double latitud) {
		this.latitud = latitud;
	}
	public Double getLongitud() {
		return longitud;
	}
	public void setLongitud(Double longitud) {
		this.longitud = longitud;
	}
	public String getDomicilio() {
		return domicilio;
	}
	public void setDomicilio(String domicilio) {
		this.domicilio = domicilio;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	
	//@OneToMany(targetEntity=noticia.class, mappedBy = "empresa", cascade = CascadeType.ALL)
	//@OneToMany(mappedBy="empresa", fetch = FetchType.LAZY, cascade = CascadeType.PERSIST)
	
	public List<noticia> getNoticias() {
		return noticias;
	}
	public void setNoticias(List<noticia> noticias) {
		this.noticias = noticias;
	}
	
}
