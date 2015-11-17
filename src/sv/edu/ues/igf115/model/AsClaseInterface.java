/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package sv.edu.ues.igf115.model;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author lu1$
 */
@Entity
@Table(name = "as_clase_interface")
@XmlRootElement
public class AsClaseInterface implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "c_clase_interface")
    private Integer cClaseInterface;
    @Basic(optional = false)
    @Column(name = "c_clase")
    private int cClase;
    @Basic(optional = false)
    @Column(name = "c_interface")
    private int cInterface;

    public AsClaseInterface() {
    }

    public AsClaseInterface(Integer cClaseInterface) {
        this.cClaseInterface = cClaseInterface;
    }

    public AsClaseInterface(Integer cClaseInterface, int cClase, int cInterface) {
        this.cClaseInterface = cClaseInterface;
        this.cClase = cClase;
        this.cInterface = cInterface;
    }
    public Integer getCClaseInterface() {
        return cClaseInterface;
    }

    public void setCClaseInterface(Integer cClaseInterface) {
        this.cClaseInterface = cClaseInterface;
    }

    public int getCClase() {
        return cClase;
    }

    public void setCClase(int cClase) {
        this.cClase = cClase;
    }

    public int getCInterface() {
        return cInterface;
    }

    public void setCInterface(int cInterface) {
        this.cInterface = cInterface;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (cClaseInterface != null ? cClaseInterface.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof AsClaseInterface)) {
            return false;
        }
        AsClaseInterface other = (AsClaseInterface) object;
        if ((this.cClaseInterface == null && other.cClaseInterface != null) || (this.cClaseInterface != null && !this.cClaseInterface.equals(other.cClaseInterface))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "sv.edu.ues.igf115.model.AsClaseInterface[ cClaseInterface=" + cClaseInterface + " ]";
    }
    
}
