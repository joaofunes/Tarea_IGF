package sv.edu.ues.igf115.model;



import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


@Entity
@Table(name = "as_atributo", catalog = "mydb", schema = "")
public class AsAtributo implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "c_clase", nullable = false)
    private Integer cClase;
    @Basic(optional = false)
    @Column(name = "c_atributo", nullable = false)
    private int cAtributo;
    @Column(name = "c_metodo")
    private Integer cMetodo;
    @Column(name = "d_atributo", length = 50)
    private String dAtributo;
    @Column(name = "d_tipo_dato_atributo", length = 50)
    private String dTipoDatoAtributo;
    @Column(name = "c_usuario", length = 30)
    private String cUsuario;
    @Column(name = "f_ingreso")
    @Temporal(TemporalType.DATE)
    private Date fIngreso;
    @Basic(optional = false)
    @Column(name = "c_tipo_atributo", nullable = false, length = 1)
    private String cTipoAtributo;

    public AsAtributo() {
    }

    public AsAtributo(Integer cClase) {
        this.cClase = cClase;
    }

    public AsAtributo(Integer cClase, int cAtributo, String cTipoAtributo) {
        this.cClase = cClase;
        this.cAtributo = cAtributo;
        this.cTipoAtributo = cTipoAtributo;
    }

    public Integer getCClase() {
        return cClase;
    }

    public void setCClase(Integer cClase) {
        this.cClase = cClase;
    }

    public int getCAtributo() {
        return cAtributo;
    }

    public void setCAtributo(int cAtributo) {
        this.cAtributo = cAtributo;
    }

    public Integer getCMetodo() {
        return cMetodo;
    }

    public void setCMetodo(Integer cMetodo) {
        this.cMetodo = cMetodo;
    }

    public String getDAtributo() {
        return dAtributo;
    }

    public void setDAtributo(String dAtributo) {
        this.dAtributo = dAtributo;
    }

    public String getDTipoDatoAtributo() {
        return dTipoDatoAtributo;
    }

    public void setDTipoDatoAtributo(String dTipoDatoAtributo) {
        this.dTipoDatoAtributo = dTipoDatoAtributo;
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

    public String getCTipoAtributo() {
        return cTipoAtributo;
    }

    public void setCTipoAtributo(String cTipoAtributo) {
        this.cTipoAtributo = cTipoAtributo;
    }

    
    
}
