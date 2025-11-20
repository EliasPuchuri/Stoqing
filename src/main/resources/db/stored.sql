DELIMITER $$

CREATE PROCEDURE sp_asignar_mesa(
    IN p_id_reserva INT,
    IN p_id_operario INT,
    IN p_numero_personas INT
)
BEGIN
    DECLARE v_capacidad_requerida ENUM('DOS', 'CUATRO', 'SEIS', 'OCHO');
    DECLARE v_num_mesa INT;

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

    -- Si encontramos mesa, actualizarla
    IF v_num_mesa IS NOT NULL THEN
        -- Crear registro en asignacion_mesa
        INSERT INTO asignacion_mesa (
            num_mesa,
            id_operario,
            id_reserva,
            fecha_asignacion,
            created_at,
            updated_at
        )
        SELECT
            v_num_mesa,
            p_id_operario,
            p_id_reserva,
            NOW(),
            NOW(),
            NOW()
        FROM reserva r
        WHERE r.id_reserva = p_id_reserva;
    ELSE
        SET v_num_mesa = NULL;
    END IF;
END$$

DELIMITER ;