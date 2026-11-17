package DAOs;

public class RiesgoErgonomico {
    private Integer idRiesgo;
    private String nombre;
    private String descripcion;

    public RiesgoErgonomico() {
    }

    public Integer getIdRiesgo() {
        return idRiesgo;
    }

    public void setIdRiesgo(Integer nuevoIdRiesgo) {
        idRiesgo = nuevoIdRiesgo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nuevoNombre) {
        nombre = nuevoNombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String nuevaDescripcion) {
        descripcion = nuevaDescripcion;
    }
}
