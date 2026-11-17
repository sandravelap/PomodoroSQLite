package DAOs;

import java.time.LocalDateTime;

public class RegistroActividad {
    private Integer idRegistro;
    private Integer idEmpleado;
    private Integer idEjercicio;
    private LocalDateTime fechaHora;
    private Integer duracionSeg;
    private String molestia;
    private Empleado empleado;
    private Ejercicio ejercicio;

    public RegistroActividad() {
    }

    public Integer getIdRegistro() {
        return idRegistro;
    }

    public void setIdRegistro(Integer nuevoIdRegistro) {
        idRegistro = nuevoIdRegistro;
    }

    public Integer getIdEmpleado() {
        return idEmpleado;
    }

    public void setIdEmpleado(Integer nuevoIdEmpleado) {
        idEmpleado = nuevoIdEmpleado;
    }

    public Integer getIdEjercicio() {
        return idEjercicio;
    }

    public void setIdEjercicio(Integer nuevoIdEjercicio) {
        idEjercicio = nuevoIdEjercicio;
    }

    public LocalDateTime getFechaHora() {
        return fechaHora;
    }

    public void setFechaHora(LocalDateTime nuevaFechaHora) {
        fechaHora = nuevaFechaHora;
    }

    public Integer getDuracionSeg() {
        return duracionSeg;
    }

    public void setDuracionSeg(Integer nuevaDuracionSeg) {
        duracionSeg = nuevaDuracionSeg;
    }

    public String getMolestia() {
        return molestia;
    }

    public void setMolestia(String nuevaMolestia) {
        molestia = nuevaMolestia;
    }

    public Empleado getEmpleado() {
        return empleado;
    }

    public void setEmpleado(Empleado nuevoEmpleado) {
        empleado = nuevoEmpleado;
    }

    public Ejercicio getEjercicio() {
        return ejercicio;
    }

    public void setEjercicio(Ejercicio nuevoEjercicio) {
        ejercicio = nuevoEjercicio;
    }
}
