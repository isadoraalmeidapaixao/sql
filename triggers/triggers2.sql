CREATE TRIGGER trg_AtualizaValorFinal
ON Hospedagem_Servico
AFTER INSERT
AS
BEGIN
    DECLARE @hospedagem_id INT;
    DECLARE @valorServico DECIMAL(10,2);  -- Use DECIMAL para valores monetários

    -- Pegando os dados da linha inserida
    SELECT 
        @hospedagem_id = hospedagem_id,
        @valorServico = valor
    FROM inserted;

    -- Atualizando o valorFinal da hospedagem correspondente
    UPDATE Hospedagem
    SET valorFinal = ISNULL(valorFinal, 0) + ISNULL(@valorServico, 0)
    WHERE id = @hospedagem_id;
END;
GO
