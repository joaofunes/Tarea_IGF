/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sv.edu.ues.igf115.model;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Beatriz
 */
@Entity
@Table(name = "as_interface")
@XmlRootElement

public class AsInterface implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "c_interface")
    private Integer cInterface;
    @Column(name = "d_interface")
    private String dInterface;
    @Column(name = "c_usuario")
    private String cUsuario;
    @Column(name = "f_ingreso")
    @Temporal(TemporalType.DATE)
    private Date fIngreso;

    public AsInterface() {
    }

    public AsInterface(Integer cInterface) {
        this.cInterface = cInterface;
    }

    public Integer getCInterface() {
        return cInterface;
    }

    public void setCInterface(Integer cInterface) {
        this.cInterface = cInterface;
    }

    public String getDInterface() {
        return dInterface;
    }

    public void setDInterface(String dInterface) {
        this.dInterface = dInterface;
    }

    public String getCUsuario() {
        return cUsuario;
    }

    public void setCUsuario(String cUsuario) {
        this.cUsuario = cUsuario;
    }

    public Date getFIngreso() {
        return fIngreso;
    }

    public void setFIngreso(Date fIngreso) {
        this.fIngreso = fIngreso;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (cInterface != null ? cInterface.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof AsInterface)) {
            return false;
        }
        AsInterface other = (AsInterface) object;
        if ((this.cInterface == null && other.cInterface != null) || (this.cInterface != null && !this.cInterface.equals(other.cInterface))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "sv.edu.ues.igf115.AsInterface[ cInterface=" + cInterface + " ]";
    }
    
}
