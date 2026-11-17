-- ==========================================
-- ACTIVAR CLAVES FORÁNEAS EN SQLITE
-- ==========================================
PRAGMA foreign_keys = ON;

-- ==========================================
-- TABLAS CATÁLOGO (NORMALIZACIÓN)
-- ==========================================

-- Catálogo de niveles de sedentarismo (Relación 1:N con puestos)
CREATE TABLE niveles_sedentarismo (
                                      id_nivel INTEGER PRIMARY KEY AUTOINCREMENT,
                                      nombre TEXT NOT NULL UNIQUE,
                                      descripcion TEXT
);

-- Catálogo de riesgos ergonómicos (Relación N:M con puestos)
CREATE TABLE riesgos_ergonomicos (
                                     id_riesgo INTEGER PRIMARY KEY AUTOINCREMENT,
                                     nombre TEXT NOT NULL UNIQUE,
                                     descripcion TEXT
);

-- ==========================================
-- TABLAS PRINCIPALES: SALUD LABORAL
-- ==========================================

-- 1. Tabla de puestos de trabajo
CREATE TABLE roles_puestos (
                               id_puesto INTEGER PRIMARY KEY AUTOINCREMENT,
                               nombre_puesto TEXT NOT NULL UNIQUE,
                               id_nivel_sedentarismo INTEGER NOT NULL,

                               CONSTRAINT fk_puesto_sedentarismo
                                   FOREIGN KEY (id_nivel_sedentarismo)
                                       REFERENCES niveles_sedentarismo(id_nivel)
);

-- 1b. Tabla intermedia: Riesgos asociados a cada puesto (N:M)
CREATE TABLE puesto_riesgos (
                                id_puesto INTEGER NOT NULL,
                                id_riesgo INTEGER NOT NULL,
                                nivel_incidencia TEXT DEFAULT 'Medio' CHECK (nivel_incidencia IN ('Bajo', 'Medio', 'Alto')),

                                PRIMARY KEY (id_puesto, id_riesgo),

                                CONSTRAINT fk_pr_puesto
                                    FOREIGN KEY (id_puesto)
                                        REFERENCES roles_puestos(id_puesto)
                                            ON DELETE CASCADE,

                                CONSTRAINT fk_pr_riesgo
                                    FOREIGN KEY (id_riesgo)
                                        REFERENCES riesgos_ergonomicos(id_riesgo)
                                            ON DELETE CASCADE
);

-- 2. Tabla de empleados
CREATE TABLE empleados (
                           id_empleado INTEGER PRIMARY KEY AUTOINCREMENT,
                           id_puesto INTEGER NOT NULL,
                           nombre_completo TEXT NOT NULL,
                           email TEXT NOT NULL UNIQUE,
                           fecha_nacimiento TEXT,
                           condiciones_medicas TEXT,
                           activo INTEGER NOT NULL DEFAULT 1 CHECK (activo IN (0, 1)),

                           CONSTRAINT fk_empleado_puesto
                               FOREIGN KEY (id_puesto)
                                   REFERENCES roles_puestos(id_puesto)
);

-- 3. Tabla de ejercicios
CREATE TABLE ejercicios (
                            id_ejercicio INTEGER PRIMARY KEY AUTOINCREMENT,
                            nombre TEXT NOT NULL,
                            descripcion TEXT,
                            grupo_muscular TEXT,
                            duracion_estimada_seg INTEGER,
                            url_multimedia TEXT,

                            CONSTRAINT chk_duracion_ejercicio
                                CHECK (duracion_estimada_seg IS NULL OR duracion_estimada_seg > 0)
);

-- 4. Tabla de rutinas asignadas a puestos
CREATE TABLE rutinas_por_puesto (
                                    id_asignacion INTEGER PRIMARY KEY AUTOINCREMENT,
                                    id_puesto INTEGER NOT NULL,
                                    id_ejercicio INTEGER NOT NULL,
                                    frecuencia_diaria INTEGER NOT NULL DEFAULT 1,
                                    prioridad INTEGER NOT NULL DEFAULT 1,

                                    CONSTRAINT fk_rutina_puesto
                                        FOREIGN KEY (id_puesto)
                                            REFERENCES roles_puestos(id_puesto),

                                    CONSTRAINT fk_rutina_ejercicio
                                        FOREIGN KEY (id_ejercicio)
                                            REFERENCES ejercicios(id_ejercicio),

                                    CONSTRAINT chk_frecuencia
                                        CHECK (frecuencia_diaria > 0),

                                    CONSTRAINT chk_prioridad
                                        CHECK (prioridad > 0)
);

-- 5. Tabla de registros de actividad
CREATE TABLE registro_actividad (
                                    id_registro INTEGER PRIMARY KEY AUTOINCREMENT,
                                    id_empleado INTEGER NOT NULL,
                                    id_ejercicio INTEGER NOT NULL,
                                    fecha_hora TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                    duracion_seg INTEGER NOT NULL,
                                    molestia TEXT,

                                    CONSTRAINT fk_registro_empleado
                                        FOREIGN KEY (id_empleado)
                                            REFERENCES empleados(id_empleado),

                                    CONSTRAINT fk_registro_ejercicio
                                        FOREIGN KEY (id_ejercicio)
                                            REFERENCES ejercicios(id_ejercicio),

                                    CONSTRAINT chk_duracion_registro
                                        CHECK (duracion_seg > 0)
);

-- 6. Tabla de encuestas de bienestar
CREATE TABLE encuestas_bienestar (
                                     id_encuesta INTEGER PRIMARY KEY AUTOINCREMENT,
                                     id_empleado INTEGER NOT NULL,
                                     fecha TEXT NOT NULL DEFAULT CURRENT_DATE,
                                     nivel_energia INTEGER,
                                     nivel_estres INTEGER,

                                     CONSTRAINT fk_encuesta_empleado
                                         FOREIGN KEY (id_empleado)
                                             REFERENCES empleados(id_empleado)
);

-- ==========================================
-- ÍNDICES BASE DE DATOS: SALUD LABORAL
-- ==========================================
CREATE INDEX idx_puestos_sedentarismo
    ON roles_puestos(id_nivel_sedentarismo);

CREATE INDEX idx_puesto_riesgos_riesgo
    ON puesto_riesgos(id_riesgo);

CREATE INDEX idx_empleados_puesto
    ON empleados(id_puesto);

CREATE INDEX idx_rutinas_puesto
    ON rutinas_por_puesto(id_puesto);

CREATE INDEX idx_rutinas_ejercicio
    ON rutinas_por_puesto(id_ejercicio);

CREATE INDEX idx_registro_empleado
    ON registro_actividad(id_empleado);

CREATE INDEX idx_registro_ejercicio
    ON registro_actividad(id_ejercicio);

CREATE INDEX idx_encuestas_empleado
    ON encuestas_bienestar(id_empleado);

-- ==========================================
-- DATOS DE MUESTRA NORMALIZADOS
-- ==========================================

-- Catálogo: Niveles de sedentarismo
INSERT INTO niveles_sedentarismo (nombre, descripcion) VALUES
                                                           ('Bajo', 'Trabajo con desplazamiento físico continuo o manipulación de cargas.'),
                                                           ('Moderado', 'Alternancia entre trabajo sentado, de pie y desplazamientos cortos.'),
                                                           ('Alto', 'Permanencia sentada frente a pantallas durante más del 75% de la jornada.'),
                                                           ('Muy Alto', 'Inmovilidad postural prolongada sin pausas activas programadas.');

-- Catálogo: Riesgos ergonómicos (extraídos y atomizados de los datos previos)
INSERT INTO riesgos_ergonomicos (nombre, descripcion) VALUES
                                                          ('Fatiga visual', 'Cansancio ocular por exposición prolongada a pantallas.'),
                                                          ('Síndrome del túnel carpiano', 'Compresión del nervio mediano por uso intensivo de teclado y ratón.'),
                                                          ('Sobrecarga lumbar', 'Tensión muscular en la zona baja de la espalda por carga o mala postura.'),
                                                          ('Lesiones por manipulación de cargas', 'Riesgo de distensiones al levantar o trasladar objetos pesados.'),
                                                          ('Tensión cervical', 'Rigidez en cuello y trapecios por postura estática o uso de diadema.'),
                                                          ('Fatiga vocal', 'Sobreesfuerzo de las cuerdas vocales por atención telefónica continua.'),
                                                          ('Tendinitis en muñeca', 'Inflamación de tendones por movimientos repetitivos de precisión.'),
                                                          ('Rigidez dorsal', 'Sobrecarga en la parte media-alta de la espalda.');

-- 1. Puestos de trabajo
INSERT INTO roles_puestos (nombre_puesto, id_nivel_sedentarismo) VALUES
                                                                     ('Desarrollador de Software', 3),         -- Alto
                                                                     ('Operario de Almacén', 1),               -- Bajo
                                                                     ('Atención al Cliente / Call Center', 3), -- Alto
                                                                     ('Diseñador Gráfico', 3);                 -- Alto

-- 1b. Asignación de riesgos a puestos
INSERT INTO puesto_riesgos (id_puesto, id_riesgo, nivel_incidencia) VALUES
                                                                        (1, 1, 'Alto'),  -- Desarrollador -> Fatiga visual
                                                                        (1, 2, 'Alto'),  -- Desarrollador -> Síndrome del túnel carpiano
                                                                        (2, 3, 'Alto'),  -- Operario -> Sobrecarga lumbar
                                                                        (2, 4, 'Medio'), -- Operario -> Lesiones por manipulación de cargas
                                                                        (3, 5, 'Alto'),  -- Call Center -> Tensión cervical
                                                                        (3, 6, 'Medio'), -- Call Center -> Fatiga vocal
                                                                        (4, 7, 'Alto'),  -- Diseñador -> Tendinitis en muñeca
                                                                        (4, 8, 'Medio'), -- Diseñador -> Rigidez dorsal
                                                                        (4, 1, 'Alto');  -- Diseñador -> Fatiga visual (reutilización del catálogo)

-- 2. Empleados
INSERT INTO empleados (id_puesto, nombre_completo, email, fecha_nacimiento, condiciones_medicas, activo) VALUES
                                                                                                             (1, 'Laura Méndez García', 'laura.mendez@empresa.com', '1992-04-15', 'Miopía leve', 1),
                                                                                                             (2, 'Carlos Ruiz Navarro', 'carlos.ruiz@empresa.com', '1985-11-23', 'Lumbalgia crónica leve', 1),
                                                                                                             (3, 'Elena Torres Vidal', 'elena.torres@empresa.com', '1996-08-02', NULL, 1),
                                                                                                             (4, 'Javier Ortega Soler', 'javier.ortega@empresa.com', '1990-01-30', 'Tendinitis previa en muñeca derecha', 0);

-- 3. Ejercicios
INSERT INTO ejercicios (nombre, descripcion, grupo_muscular, duracion_estimada_seg, url_multimedia) VALUES
                                                                                                        ('Estiramiento cervical lateral', 'Inclinar suavemente la cabeza hacia cada hombro manteniendo 15 segundos por lado.', 'Cuello y trapecio', 60, 'https://ejemplo.com/videos/cervical.mp4'),
                                                                                                        ('Flexión y extensión de muñecas', 'Estirar el brazo al frente y tirar suavemente de los dedos hacia arriba y hacia abajo.', 'Antebrazo y muñeca', 45, 'https://ejemplo.com/videos/munecas.mp4'),
                                                                                                        ('Rotación lumbar sentado', 'Sentado con la espalda recta, girar el torso suavemente apoyándose en el respaldo.', 'Zona lumbar', 90, 'https://ejemplo.com/videos/lumbar.mp4'),
                                                                                                        ('Regla visual 20-20-20', 'Mirar un punto fijo a 6 metros de distancia durante 20 segundos para relajar la vista.', 'Músculos oculares', 20, NULL);

-- 4. Rutinas asignadas a puestos
INSERT INTO rutinas_por_puesto (id_puesto, id_ejercicio, frecuencia_diaria, prioridad) VALUES
                                                                                           (1, 4, 4, 1), -- Desarrollador -> Regla 20-20-20
                                                                                           (1, 2, 2, 2), -- Desarrollador -> Muñecas
                                                                                           (2, 3, 3, 1), -- Operario -> Rotación lumbar
                                                                                           (3, 1, 3, 1); -- Call Center -> Estiramiento cervical

-- 5. Registros de actividad
INSERT INTO registro_actividad (id_empleado, id_ejercicio, fecha_hora, duracion_seg, molestia) VALUES
                                                                                                   (1, 4, '2026-11-17 10:30:00', 25, NULL),
                                                                                                   (1, 2, '2026-11-17 12:15:00', 50, 'Ligera rigidez en muñeca derecha'),
                                                                                                   (2, 3, '2026-11-17 14:00:00', 95, 'Sin molestias, alivio en zona baja'),
                                                                                                   (3, 1, '2026-11-17 16:45:00', 60, NULL);

-- 6. Encuestas de bienestar
INSERT INTO encuestas_bienestar (id_empleado, fecha, nivel_energia, nivel_estres) VALUES
                                                                                      (1, '2026-11-17', 4, 2),
                                                                                      (2, '2026-11-17', 3, 3),
                                                                                      (3, '2026-11-17', 5, 1),
                                                                                      (4, '2026-11-10', 2, 4);