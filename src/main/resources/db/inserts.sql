create database reservas;
# drop database reservas;

set global event_scheduler = on;
set global time_zone = '-05:00';

insert into operario(nombre, apellido, dni, contrasena, telefono, enabled, created_at)
values
    ('Uso', 'General', '12345678', '$2a$12$iGnx1hcFYV9sfcjdkpWAY.af/7TVFHG22FRFcM0dhv6I/XfqRCM8.','123456789', 1, now()),
    ('Claudia', 'Marrujo', '87654321', '$2a$12$WoVSjatLgyYTTPe.c3nkKOSReU87wUumvf2zgRWWoOwQQySiSPNmK','977174726', 1, now()),
    ('Alejandro', 'Tineo', '72844354', '$2a$12$EXcZnwGexsTOfVdVUHYhAOloRFxUcug1CP7zBjIIOZZjrhLil4Xpm','961654036', 1, now()),
    ('Daniel', 'Puchuri', '74043831', '$2a$12$RrEso7BeZzUuoxpAU/LLiecNVnMX.rjW/GS.4a18TzljXRa9Z6Z6e','990800392', 1, now());

-- ESTADOS RESERVA
insert into estado(nombre, tipo, descripcion,color, activo, created_at)
values
    ('Pago pendiente',          'RESERVA', 'Reserva creada, a la espera del pago de la garantía.',                         '#22BB74', TRUE, now()),
    ('Reserva programada',      'RESERVA', 'Reserva confirmada y programada (pago registrado).',                           '#2D89EF', TRUE, now()),
    ('Cancelado - Expirado',    'RESERVA', 'Reserva cancelada automáticamente por no registrarse el pago en 15 minutos.',  '#888888', TRUE, now()),
    ('Cancelado - Cliente',     'RESERVA', 'Reserva cancelada por el cliente o por solicitud de este.',                     '#999999', TRUE, now()),
    ('Cancelado - Inconveniente','RESERVA','Reserva cancelada por motivos internos del local.',                             '#999999', TRUE, now()),
    ('Reserva en curso',        'RESERVA', 'Reserva que ya está siendo atendida en el local.',                              '#F5660F', TRUE, now()),
    ('Reserva finalizada',      'RESERVA', 'Reserva completada y finalizada exitosamente.',                                 '#22BB74', TRUE, now()),
    ('Cancelado - No show',     'RESERVA', 'Cliente no se presentó luego del tiempo de tolerancia.',                        '#CC0000', TRUE, now());

-- ESTADOS MESA

INSERT INTO estado (nombre, tipo, descripcion, color, activo, created_at)
VALUES
    ('Libre', 'MESA', 'Mesa disponible para asignar', '#22BB74', TRUE, now()),
    ('Solicitada', 'MESA', 'Mesa solicitada', '#22BB74', TRUE, now()),
    ('Reservada', 'MESA', 'Mesa marcada como reservada cuando el cliente ya pagó la reserva', '#D42939', TRUE, now()),
    ('Ocupada', 'MESA', 'Mesa marcada como ocupada cuando la reserva está en curso', '#F5660F', TRUE, now()),
    ('Mantenimiento', 'MESA', 'Mesa no disponible por trabajos/mantenimiento', '#F3C40B', TRUE, now());

-- MESAS

INSERT INTO mesa (num_mesa, id_estado, capacidad, created_at) VALUES
    -- Mesas para 2 personas
    (1, 9, 'DOS', now()),
    (2, 9, 'DOS', now()),
    (3, 9, 'DOS', now()),
    (4, 9, 'DOS', now()),

    -- Mesas para 4 personas
    (5, 9, 'CUATRO', now()),
    (6, 9, 'CUATRO', now()),
    (7, 9, 'CUATRO', now()),
    (8, 9, 'CUATRO', now()),
    (9, 9, 'CUATRO', now()),

    -- Mesas para 6 personas
    (10, 9, 'SEIS', now()),
    (11, 9, 'SEIS', now()),
    (12, 9, 'SEIS', now()),
    (13, 9, 'SEIS', now()),

    -- Mesas para 8 personas
    (14, 9, 'OCHO', now()),
    (15, 9, 'OCHO', now());
