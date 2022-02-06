package net.javaguides.hibernate.model;
import java.io.Serializable;

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
import javax.persistence.Table;

@Entity
public class noticia implements Serializable {
	
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id; 
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	private String titulonoticia;
	private String resumennoticia;
	private String imagennoticia;
	private String contenidohtml;
	private String publicada;
	private String fechapublicacion;
	
	
	//private int idempresa;
	
	//@Access(AccessType.PROPERTY)
	@ManyToOne(cascade = CascadeType.PERSIST) //hubo que cambiar esta línea respecto a la usada en netbeans, sino no funcionaba, no hacía los insert por error object references an unsaved transient instance - save the transient instance before flushing
    @JoinColumn(name = "idempresa")
	private Empresa empresa;
	
	public noticia() {}
	
	public String getTitulonoticia() {
		return titulonoticia;
	}
	public void setTitulonoticia(String titulonoticia) {
		this.titulonoticia = titulonoticia;
	}
	public String getResumennoticia() {
		return resumennoticia;
	}
	public void setResumennoticia(String resumennoticia) {
		this.resumennoticia = resumennoticia;
	}
	public String getImagennoticia() {
		return imagennoticia;
	}
	public void setImagennoticia(String imagennoticia) {
		this.imagennoticia = imagennoticia;
	}
	public String getContenidohtml() {
		return contenidohtml;
	}
	public void setContenidohtml(String contenidohtml) {
		this.contenidohtml = contenidohtml;
	}
	public String getPublicada() {
		return publicada;
	}
	public void setPublicada(String publicada) {
		this.publicada = publicada;
	}
	public String getFechapublicacion() {
		return fechapublicacion;
	}
	public void setFechapublicacion(String fechapublicacion) {
		this.fechapublicacion = fechapublicacion;
	}
	
	/*@Access(AccessType.PROPERTY)
	@ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "idempresa")*/
	public Empresa getEmpresa() {
		return empresa;
	}
	public void setEmpresa(Empresa empresa) {
		this.empresa = empresa;
	}

	
	
	
}
