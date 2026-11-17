package DAOs;

public class RutinaPorPuesto {
    private Integer idAsignacion;
    private Integer idPuesto;
    private Integer idEjercicio;
    private Integer frecuenciaDiaria;
    private Integer prioridad;
    private RolPuesto puesto;
    private Ejercicio ejercicio;

    public RutinaPorPuesto() {
    }

    public Integer getIdAsignacion() {
        return idAsignacion;
    }

    public void setIdAsignacion(Integer nuevoIdAsignacion) {
        idAsignacion = nuevoIdAsignacion;
    }

    public Integer getIdPuesto() {
        return idPuesto;
    }

    public void setIdPuesto(Integer nuevoIdPuesto) {
        idPuesto = nuevoIdPuesto;
    }

    public Integer getIdEjercicio() {
        return idEjercicio;
    }

    public void setIdEjercicio(Integer nuevoIdEjercicio) {
        idEjercicio = nuevoIdEjercicio;
    }

    public Integer getFrecuenciaDiaria() {
        return frecuenciaDiaria;
    }

    public void setFrecuenciaDiaria(Integer nuevaFrecuenciaDiaria) {
        frecuenciaDiaria = nuevaFrecuenciaDiaria;
    }

    public Integer getPrioridad() {
        return prioridad;
    }

    public void setPrioridad(Integer nuevaPrioridad) {
        prioridad = nuevaPrioridad;
    }

    public RolPuesto getPuesto() {
        return puesto;
    }

    public void setPuesto(RolPuesto nuevoPuesto) {
        puesto = nuevoPuesto;
    }

    public Ejercicio getEjercicio() {
        return ejercicio;
    }

    public void setEjercicio(Ejercicio nuevoEjercicio) {
        ejercicio = nuevoEjercicio;
    }
}
