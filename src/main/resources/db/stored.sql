DELIMITER $$
# drop procedure sp_asignar_mesa_auto
CREATE PROCEDURE sp_asignar_mesa_auto(
    IN p_codigo CHAR(7),
    IN p_numero_personas INT
)
BEGIN
    DECLARE v_capacidad_requerida ENUM('DOS', 'CUATRO', 'SEIS', 'OCHO');
    DECLARE v_num_mesa INT;
    DECLARE v_id_reserva INT;
    DECLARE v_hora_inicio TIME;

    -- Determinar capacidad requerida
    IF p_numero_personas <= 2 THEN
        SET v_capacidad_requerida = 'DOS';
    ELSEIF p_numero_personas <= 4 THEN
        SET v_capacidad_requerida = 'CUATRO';
    ELSEIF p_numero_personas <= 6 THEN
        SET v_capacidad_requerida = 'SEIS';
    ELSE
        SET v_capacidad_requerida = 'OCHO';
    END IF;

    -- Buscar y asignar mesa disponible
    -- Intentar encontrar una mesa libre de la capacidad exacta
    SELECT num_mesa INTO v_num_mesa
    FROM mesa
    WHERE id_estado = 9
      AND capacidad = v_capacidad_requerida
      AND deleted_at IS NULL
    ORDER BY num_mesa
    LIMIT 1
    FOR UPDATE;

    SELECT
        id_reserva,
        hora_reserva
    INTO
        v_id_reserva,
        v_hora_inicio
    FROM reserva
    WHERE codigo = p_codigo;

    -- Si encontramos mesa, actualizarla
    IF v_num_mesa IS NOT NULL THEN
        UPDATE mesa
        SET id_estado = 10,
            updated_at = NOW(),
            modified_by = 1
        WHERE num_mesa = v_num_mesa;

        -- Crear registro en asignacion_mesa
        INSERT INTO asignacion_mesa (
            num_mesa,
            id_operario,
            id_reserva,
            fecha_asignacion,
            hora_inicio,
            expira,
            created_at,
            updated_at,
            modified_by
        )
        SELECT
            v_num_mesa,
            1,
            v_id_reserva,
            NOW(),
            v_hora_inicio,
            ADDTIME(NOW(), '00:15:00'),
            NOW(),
            NOW(),
            1
        FROM reserva r
        WHERE r.id_reserva = v_id_reserva;
    ELSE
        SET v_num_mesa = NULL;
    END IF;
END$$

DELIMITER ;