CREATE TABLE colegios (
    id INT NOT NULL,
    nombre VARCHAR,
    created_at TIMESTAMP,
    update_at TIMESTAMP,
    PRIMARY KEY (id)
);

CREATE TABLE cursos (
    id INT,
    grado INT,
    salon VARCHAR,
    id_colegio INT,
    created_at TIMESTAMP,
    update_at TIMESTAMP,
    PRIMARY KEY (id),
    CONSTRAINT FK_CursosColegio FOREIGN KEY (id_colegio) REFERENCES colegios(id)
);

CREATE TABLE profesores (
    id INT,
    nombre VARCHAR,
    teach_number INT,
    created_at TIMESTAMP,
    update_at TIMESTAMP,
    PRIMARY KEY (id)
);

CREATE TABLE estudiantes (
    id INT,
    nombre VARCHAR,
    estud_number INT,
    created_at TIMESTAMP,
    update_at TIMESTAMP,
    PRIMARY KEY (id)
);

CREATE TABLE asignaturas (
    id INT,
    nombre VARCHAR,
    asig_number INT,
    id_curso INT,
    teach_number INT,
    created_at TIMESTAMP,
    update_at TIMESTAMP,
    PRIMARY KEY (id),
    CONSTRAINT FK_AsigCursos FOREIGN KEY (id_curso) REFERENCES cursos(id),
    CONSTRAINT FK_AsigTeach FOREIGN KEY (teach_number) REFERENCES profesores(id)
);

-- Insert para colegios
INSERT INTO colegios (id, nombre, created_at, update_at)
VALUES (1, 'El colegio del Olimpo', now(), now());

-- Insert para la tabla cursos
INSERT INTO cursos (id, grado, salon, id_colegio, created_at, update_at)
VALUES (1, 10, 'A', 1, now(), now());
INSERT INTO cursos (id, grado, salon, id_colegio, created_at, update_at)
VALUES (2, 10, 'B', 1, now(), now());
INSERT INTO cursos (id, grado, salon, id_colegio, created_at, update_at)
VALUES (3, 11, 'A', 1, now(), now());
INSERT INTO cursos (id, grado, salon, id_colegio, created_at, update_at)
VALUES (4, 11, 'B', 1, now(), now());

-- Insert para la tabla profesores
INSERT INTO profesores (id, nombre, teach_number, created_at, update_at)
VALUES (1, 'Némesis', 1, now(), now());
INSERT INTO profesores (id, nombre, teach_number, created_at, update_at)
VALUES (2, 'Príapo', 2, now(), now());
INSERT INTO profesores (id, nombre, teach_number, created_at, update_at)
VALUES (3, 'Iris', 3, now(), now());

-- Insert para la tabla estudiantes
INSERT INTO estudiantes (id, nombre, estud_number, created_at, update_at)
VALUES (1, 'Afrodita', 001, now(), now());
INSERT INTO estudiantes (id, nombre, estud_number, created_at, update_at)
VALUES (2, 'Apolo', 002, now(), now());
INSERT INTO estudiantes (id, nombre, estud_number, created_at, update_at)
VALUES (3, 'Ares', 003, now(), now());
INSERT INTO estudiantes (id, nombre, estud_number, created_at, update_at)
VALUES (4, 'Artemisa', 004, now(), now());
INSERT INTO estudiantes (id, nombre, estud_number, created_at, update_at)
VALUES (5, 'Atenea', 005, now(), now());
INSERT INTO estudiantes (id, nombre, estud_number, created_at, update_at)
VALUES (6, 'Dionisio', 006, now(), now());
INSERT INTO estudiantes (id, nombre, estud_number, created_at, update_at)
VALUES (7, 'Hefesto', 007, now(), now());
INSERT INTO estudiantes (id, nombre, estud_number, created_at, update_at)
VALUES (8, 'Hera', 008, now(), now());
INSERT INTO estudiantes (id, nombre, estud_number, created_at, update_at)
VALUES (9, 'Hermes', 009, now(), now());
INSERT INTO estudiantes (id, nombre, estud_number, created_at, update_at)
VALUES (10, 'Hades', 010, now(), now());
INSERT INTO estudiantes (id, nombre, estud_number, created_at, update_at)
VALUES (11, 'Poseidón', 011, now(), now());
INSERT INTO estudiantes (id, nombre, estud_number, created_at, update_at)
VALUES (12, 'Zeus', 012, now(), now());

-- Insert para la tabla asignatura
INSERT INTO asignaturas (id, nombre, asig_number, id_curso, teach_number, created_at, update_at)
VALUES (1, 'Matemáticas', 0001, 1, 1, now(), now());
INSERT INTO asignaturas (id, nombre, asig_number, id_curso, teach_number, created_at, update_at)
VALUES (2, 'Pre Icfes', 0002, 1, 1, now(), now());
INSERT INTO asignaturas (id, nombre, asig_number, id_curso, teach_number, created_at, update_at)
VALUES (3, 'Español', 0003, 1, 2, now(), now());
INSERT INTO asignaturas (id, nombre, asig_number, id_curso, teach_number, created_at, update_at)
VALUES (4, 'Ingles básico', 0004, 1, 3, now(), now());
INSERT INTO asignaturas (id, nombre, asig_number, id_curso, teach_number, created_at, update_at)
VALUES (5, 'Ingles avanzado', 0005, 1, 3, now(), now());

----------------------------------------------------------------------------------------------------------

CREATE TABLE horarios (
    id INT,
    id_curso INT,
    id_asignatura INT,
    id_estudiante INT,
    created_at TIMESTAMP,
    update_at TIMESTAMP,
    PRIMARY KEY (id)
);

-- 10A
INSERT INTO horarios (id, id_curso, id_asignatura, id_estudiante, created_at, update_at)
VALUES (1, 1, 1, 1, now(), now());
INSERT INTO horarios (id, id_curso, id_asignatura, id_estudiante, created_at, update_at)
VALUES (2, 1, 3, 1, now(), now());
INSERT INTO horarios (id, id_curso, id_asignatura, id_estudiante, created_at, update_at)
VALUES (3, 1, 4, 1, now(), now());

INSERT INTO horarios (id, id_curso, id_asignatura, id_estudiante, created_at, update_at)
VALUES (4, 1, 1, 2, now(), now());
INSERT INTO horarios (id, id_curso, id_asignatura, id_estudiante, created_at, update_at)
VALUES (5, 1, 3, 2, now(), now());
INSERT INTO horarios (id, id_curso, id_asignatura, id_estudiante, created_at, update_at)
VALUES (6, 1, 4, 2, now(), now());

INSERT INTO horarios (id, id_curso, id_asignatura, id_estudiante, created_at, update_at)
VALUES (7, 1, 1, 3, now(), now());
INSERT INTO horarios (id, id_curso, id_asignatura, id_estudiante, created_at, update_at)
VALUES (8, 1, 3, 3, now(), now());
INSERT INTO horarios (id, id_curso, id_asignatura, id_estudiante, created_at, update_at)
VALUES (9, 1, 4, 3, now(), now());

-- 10B
INSERT INTO horarios (id, id_curso, id_asignatura, id_estudiante, created_at, update_at)
VALUES (10, 2, 1, 4, now(), now());
INSERT INTO horarios (id, id_curso, id_asignatura, id_estudiante, created_at, update_at)
VALUES (11, 2, 3, 4, now(), now());
INSERT INTO horarios (id, id_curso, id_asignatura, id_estudiante, created_at, update_at)
VALUES (12, 2, 5, 4, now(), now());

INSERT INTO horarios (id, id_curso, id_asignatura, id_estudiante, created_at, update_at)
VALUES (13, 2, 1, 5, now(), now());
INSERT INTO horarios (id, id_curso, id_asignatura, id_estudiante, created_at, update_at)
VALUES (14, 2, 3, 5, now(), now());
INSERT INTO horarios (id, id_curso, id_asignatura, id_estudiante, created_at, update_at)
VALUES (15, 2, 5, 5, now(), now());

INSERT INTO horarios (id, id_curso, id_asignatura, id_estudiante, created_at, update_at)
VALUES (16, 2, 1, 6, now(), now());
INSERT INTO horarios (id, id_curso, id_asignatura, id_estudiante, created_at, update_at)
VALUES (17, 2, 3, 6, now(), now());
INSERT INTO horarios (id, id_curso, id_asignatura, id_estudiante, created_at, update_at)
VALUES (18, 2, 5, 6, now(), now());

-- 11A
INSERT INTO horarios (id, id_curso, id_asignatura, id_estudiante, created_at, update_at)
VALUES (19, 3, 1, 7, now(), now());
INSERT INTO horarios (id, id_curso, id_asignatura, id_estudiante, created_at, update_at)
VALUES (20, 3, 2, 7, now(), now());

INSERT INTO horarios (id, id_curso, id_asignatura, id_estudiante, created_at, update_at)
VALUES (21, 3, 1, 8, now(), now());
INSERT INTO horarios (id, id_curso, id_asignatura, id_estudiante, created_at, update_at)
VALUES (22, 3, 2, 8, now(), now());

-- 11B
INSERT INTO horarios (id, id_curso, id_asignatura, id_estudiante, created_at, update_at)
VALUES (23, 4, 1, 9, now(), now());
INSERT INTO horarios (id, id_curso, id_asignatura, id_estudiante, created_at, update_at)
VALUES (24, 4, 2, 9, now(), now());

INSERT INTO horarios (id, id_curso, id_asignatura, id_estudiante, created_at, update_at)
VALUES (25, 4, 1, 10, now(), now());
INSERT INTO horarios (id, id_curso, id_asignatura, id_estudiante, created_at, update_at)
VALUES (26, 4, 2, 10, now(), now());

INSERT INTO horarios (id, id_curso, id_asignatura, id_estudiante, created_at, update_at)
VALUES (27, 4, 1, 11, now(), now());
INSERT INTO horarios (id, id_curso, id_asignatura, id_estudiante, created_at, update_at)
VALUES (28, 4, 2, 11, now(), now());

INSERT INTO horarios (id, id_curso, id_asignatura, id_estudiante, created_at, update_at)
VALUES (29, 4, 1, 12, now(), now());
INSERT INTO horarios (id, id_curso, id_asignatura, id_estudiante, created_at, update_at)
VALUES (30, 4, 2, 12, now(), now());

---------------------------------------------------------------------------------------------------------

DROP TABLE colegios;
DROP TABLE cursos;
DROP TABLE profesores;
DROP TABLE estudiantes;
DROP TABLE asignaturas;
DROP TABLE horarios;