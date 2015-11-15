/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sv.edu.ues.igf115.model;
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.UniqueConstraint;
import javax.validation.constraints.Size;

/**
 *
 * @author Joao
 */
@Entity
@Table(name = "as_metodo", catalog = "mydb", schema = "", uniqueConstraints = {
    @UniqueConstraint(columnNames = {"c_clase", "c_metodo"})})

public class AsMetodo implements Serializable {
    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected AsMetodoPK asMetodoPK;
    @Size(max = 50)
    @Column(name = "d_metodo", length = 50)
    private String dMetodo;
    @Size(max = 50)
    @Column(name = "d_tipo_retorno", length = 50)
    private String dTipoRetorno;
    @Size(max = 30)
    @Column(name = "c_usuario", length = 30)
    private String cUsuario;
    @Column(name = "f_ingreso")
    @Temporal(TemporalType.DATE)
    private Date fIngreso;
    @Column(name = "b_activo")
    private Integer bActivo;
    @Column(name = "n_parametros")
    private Integer nParametros;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "asMetodo")
    private List<AsParametro> asParametroList;
    @JoinColumn(name = "c_tipo_metodo", referencedColumnName = "c_tipo_metodo", nullable = false)
    @ManyToOne(optional = false)
    private TbTipoMetodo cTipoMetodo;
    @JoinColumn(name = "c_clase", referencedColumnName = "c_clase", nullable = false, insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private AsClase asClase;

    public AsMetodo() {
    }

    public AsMetodo(AsMetodoPK asMetodoPK) {
        this.asMetodoPK = asMetodoPK;
    }

    public AsMetodo(int cClase, int cMetodo) {
        this.asMetodoPK = new AsMetodoPK(cClase, cMetodo);
    }

    public AsMetodoPK getAsMetodoPK() {
        return asMetodoPK;
    }

    public void setAsMetodoPK(AsMetodoPK asMetodoPK) {
        this.asMetodoPK = asMetodoPK;
    }

    public String getDMetodo() {
        return dMetodo;
    }

    public void setDMetodo(String dMetodo) {
        this.dMetodo = dMetodo;
    }

    public String getDTipoRetorno() {
        return dTipoRetorno;
    }

    public void setDTipoRetorno(String dTipoRetorno) {
        this.dTipoRetorno = dTipoRetorno;
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

    public Integer getBActivo() {
        return bActivo;
    }

    public void setBActivo(Integer bActivo) {
        this.bActivo = bActivo;
    }

    public Integer getNParametros() {
        return nParametros;
    }

    public void setNParametros(Integer nParametros) {
        this.nParametros = nParametros;
    }

    public List<AsParametro> getAsParametroList() {
        return asParametroList;
    }

    public void setAsParametroList(List<AsParametro> asParametroList) {
        this.asParametroList = asParametroList;
    }

    public TbTipoMetodo getCTipoMetodo() {
        return cTipoMetodo;
    }

    public void setCTipoMetodo(TbTipoMetodo cTipoMetodo) {
        this.cTipoMetodo = cTipoMetodo;
    }

    public AsClase getAsClase() {
        return asClase;
    }

    public void setAsClase(AsClase asClase) {
        this.asClase = asClase;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (asMetodoPK != null ? asMetodoPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof AsMetodo)) {
            return false;
        }
        AsMetodo other = (AsMetodo) object;
        if ((this.asMetodoPK == null && other.asMetodoPK != null) || (this.asMetodoPK != null && !this.asMetodoPK.equals(other.asMetodoPK))) {
            return false;
        }
        return true;
    }

    
}
