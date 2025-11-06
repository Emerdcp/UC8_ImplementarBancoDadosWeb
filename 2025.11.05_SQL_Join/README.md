# Comandos JSL Join

```sql
select * from clientes

select * from categorias

select * from fornecedores

select * from funcionarios

select * from itens_venda

select * from produtos

select * from vendas


    
select 	v.data_venda, v.valor_total, v.forma_pagamento,
		-- Itens_Venda
		iv.id_item_venda, iv.quantidade, iv.preco_unitario, 
		-- Clientes
		c.id_cliente, c.nome as cliente, c.cpf, c.telefone, c.email, c.endereco,
		-- Produtos
		p.id_produto, p.nome, p.descricao, p.preco, p.quantidade_estoque, p.codigo_barras,
		-- Fornecedores
		f.id_fornecedor, f.nome as fornecedor, f.cnpj, f.telefone, f.email, f.endereco,
		-- Categorias
		cat.id_categoria, cat.nome, cat.descricao
from vendas as v
inner join itens_venda as iv on v.id_venda = iv.id_venda
inner join clientes as c on c.id_cliente = v.id_cliente
inner join produtos as p on p.id_produto = iv.id_produto
inner join fornecedores as f on f.id_fornecedor = p.id_fornecedor
inner join categorias as cat on cat.id_categoria = p.id_categoria 

where p.descricao = 'Suco natural de laranja'
```
