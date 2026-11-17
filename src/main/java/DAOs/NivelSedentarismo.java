package DAOs;

public class NivelSedentarismo {
    private Integer idNivel;
    private String nombre;
    private String descripcion;

    public NivelSedentarismo() {
    }

    public Integer getIdNivel() {
        return idNivel;
    }

    public void setIdNivel(Integer nuevoIdNivel) {
        idNivel = nuevoIdNivel;
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
