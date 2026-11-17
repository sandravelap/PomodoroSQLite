package DAOs;

import java.util.ArrayList;
import java.util.List;

public class RolPuesto {
    private Integer idPuesto;
    private String nombrePuesto;
    private Integer idNivelSedentarismo;
    private NivelSedentarismo nivelSedentarismo;
    private List<PuestoRiesgo> riesgos = new ArrayList<>();

    public RolPuesto() {
    }

    public Integer getIdPuesto() {
        return idPuesto;
    }

    public void setIdPuesto(Integer nuevoIdPuesto) {
        idPuesto = nuevoIdPuesto;
    }

    public String getNombrePuesto() {
        return nombrePuesto;
    }

    public void setNombrePuesto(String nuevoNombrePuesto) {
        nombrePuesto = nuevoNombrePuesto;
    }

    public Integer getIdNivelSedentarismo() {
        return idNivelSedentarismo;
    }

    public void setIdNivelSedentarismo(Integer nuevoIdNivelSedentarismo) {
        idNivelSedentarismo = nuevoIdNivelSedentarismo;
    }

    public NivelSedentarismo getNivelSedentarismo() {
        return nivelSedentarismo;
    }

    public void setNivelSedentarismo(NivelSedentarismo nuevoNivelSedentarismo) {
        nivelSedentarismo = nuevoNivelSedentarismo;
    }

    public List<PuestoRiesgo> getRiesgos() {
        return riesgos;
    }

    public void setRiesgos(List<PuestoRiesgo> nuevosRiesgos) {
        riesgos = nuevosRiesgos;
    }
}
