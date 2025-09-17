USE estacionamentodb;

SELECT cliente. *, veiculo.placa, veiculo.modelo FROM cliente
INNER JOIN veiculo 
ON cliente.id = veiculo.cliente_id

