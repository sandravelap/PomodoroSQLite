package DAOs;

import java.time.LocalDate;

public class EncuestaBienestar {
    private Integer idEncuesta;
    private Integer idEmpleado;
    private LocalDate fecha;
    private Integer nivelEnergia;
    private Integer nivelEstres;
    private Empleado empleado;

    public EncuestaBienestar() {
    }

    public Integer getIdEncuesta() {
        return idEncuesta;
    }

    public void setIdEncuesta(Integer nuevoIdEncuesta) {
        idEncuesta = nuevoIdEncuesta;
    }

    public Integer getIdEmpleado() {
        return idEmpleado;
    }

    public void setIdEmpleado(Integer nuevoIdEmpleado) {
        idEmpleado = nuevoIdEmpleado;
    }

    public LocalDate getFecha() {
        return fecha;
    }

    public void setFecha(LocalDate nuevaFecha) {
        fecha = nuevaFecha;
    }

    public Integer getNivelEnergia() {
        return nivelEnergia;
    }

    public void setNivelEnergia(Integer nuevoNivelEnergia) {
        nivelEnergia = nuevoNivelEnergia;
    }

    public Integer getNivelEstres() {
        return nivelEstres;
    }

    public void setNivelEstres(Integer nuevoNivelEstres) {
        nivelEstres = nuevoNivelEstres;
    }

    public Empleado getEmpleado() {
        return empleado;
    }

    public void setEmpleado(Empleado nuevoEmpleado) {
        empleado = nuevoEmpleado;
    }
}
