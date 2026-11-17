package DAOs;

public class Ejercicio {
    private Integer idEjercicio;
    private String nombre;
    private String descripcion;
    private String grupoMuscular;
    private Integer duracionEstimadaSeg;
    private String urlMultimedia;

    public Ejercicio() {
    }

    public Integer getIdEjercicio() {
        return idEjercicio;
    }

    public void setIdEjercicio(Integer nuevoIdEjercicio) {
        idEjercicio = nuevoIdEjercicio;
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

    public String getGrupoMuscular() {
        return grupoMuscular;
    }

    public void setGrupoMuscular(String nuevoGrupoMuscular) {
        grupoMuscular = nuevoGrupoMuscular;
    }

    public Integer getDuracionEstimadaSeg() {
        return duracionEstimadaSeg;
    }

    public void setDuracionEstimadaSeg(Integer nuevaDuracionEstimadaSeg) {
        duracionEstimadaSeg = nuevaDuracionEstimadaSeg;
    }

    public String getUrlMultimedia() {
        return urlMultimedia;
    }

    public void setUrlMultimedia(String nuevaUrlMultimedia) {
        urlMultimedia = nuevaUrlMultimedia;
    }
}
