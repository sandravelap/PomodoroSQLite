package DAOs;

import java.time.LocalDate;

public class Empleado {
    private Integer idEmpleado;
    private Integer idPuesto;
    private String nombreCompleto;
    private String email;
    private LocalDate fechaNacimiento;
    private String condicionesMedicas;
    private Boolean activo;
    private RolPuesto puesto;

    public Empleado() {
    }

    public Integer getIdEmpleado() {
        return idEmpleado;
    }

    public void setIdEmpleado(Integer nuevoIdEmpleado) {
        idEmpleado = nuevoIdEmpleado;
    }

    public Integer getIdPuesto() {
        return idPuesto;
    }

    public void setIdPuesto(Integer nuevoIdPuesto) {
        idPuesto = nuevoIdPuesto;
    }

    public String getNombreCompleto() {
        return nombreCompleto;
    }

    public void setNombreCompleto(String nuevoNombreCompleto) {
        nombreCompleto = nuevoNombreCompleto;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String nuevoEmail) {
        email = nuevoEmail;
    }

    public LocalDate getFechaNacimiento() {
        return fechaNacimiento;
    }

    public void setFechaNacimiento(LocalDate nuevaFechaNacimiento) {
        fechaNacimiento = nuevaFechaNacimiento;
    }

    public String getCondicionesMedicas() {
        return condicionesMedicas;
    }

    public void setCondicionesMedicas(String nuevasCondicionesMedicas) {
        condicionesMedicas = nuevasCondicionesMedicas;
    }

    public Boolean getActivo() {
        return activo;
    }

    public void setActivo(Boolean nuevoActivo) {
        activo = nuevoActivo;
    }

    public RolPuesto getPuesto() {
        return puesto;
    }

    public void setPuesto(RolPuesto nuevoPuesto) {
        puesto = nuevoPuesto;
    }
}
