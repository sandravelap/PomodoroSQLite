package DAOs;

public class PuestoRiesgo {
    private Integer idPuesto;
    private Integer idRiesgo;
    private String nivelIncidencia;
    private RolPuesto puesto;
    private RiesgoErgonomico riesgo;

    public PuestoRiesgo() {
    }

    public Integer getIdPuesto() {
        return idPuesto;
    }

    public void setIdPuesto(Integer nuevoIdPuesto) {
        idPuesto = nuevoIdPuesto;
    }

    public Integer getIdRiesgo() {
        return idRiesgo;
    }

    public void setIdRiesgo(Integer nuevoIdRiesgo) {
        idRiesgo = nuevoIdRiesgo;
    }

    public String getNivelIncidencia() {
        return nivelIncidencia;
    }

    public void setNivelIncidencia(String nuevoNivelIncidencia) {
        nivelIncidencia = nuevoNivelIncidencia;
    }

    public RolPuesto getPuesto() {
        return puesto;
    }

    public void setPuesto(RolPuesto nuevoPuesto) {
        puesto = nuevoPuesto;
    }

    public RiesgoErgonomico getRiesgo() {
        return riesgo;
    }

    public void setRiesgo(RiesgoErgonomico nuevoRiesgo) {
        riesgo = nuevoRiesgo;
    }
}
