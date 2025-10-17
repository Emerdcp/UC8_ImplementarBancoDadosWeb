# UC8_ImplementarBancoDadosWeb
Implementar Banco de Dados

## Site para criação de Banco de dados com Modelagens

- Diagrama de Entidade-Relacionamento

https://miro.com/app/board/uXjVJHtrlb0=/

# Acesso para criação de banco de dados.

https://www.mongodb.com/

Logado com conta google emerdcp2

usuário:
Emerson
Senha:
Emerson123

## para criação

- Clique em Network, criar um IPI

![alt text](image.png)

- Clique em editar, e coloque o IPI

![alt text](image-1.png)

- Depois clique em Data Base

![alt text](image-2.png)

- Clique em conectar

![alt text](image-3.png)

- Clique em MongoDb for VS VsCode

![alt text](image-4.png)

- Copie o endereço em questão

![alt text](image-5.png)

mongodb+srv://Emerson:<db_password>@cluster0.vvujtvz.mongodb.net/

Altere pela senha que foi criado pra usar o banco <db_password>

mongodb+srv://Emerson:Emerson123@cluster0.vvujtvz.mongodb.net/

- Abaixe o MongoDb no VsCode

![alt text](image-6.png)

- Clique me Conectar

![alt text](image-7.png)

Depois copie a linha que alterou da senha, e coloque na barra e de um enter para poder configurar.

- Vai abrir o acesso ao banco no MongoDB.

![alt text](image-8.png)


# Comando de exemplos no Mongo

- Usar Banco

```sql
use('sala')
```

-Para inserir e criar dados no banco.
```sql
db.sala.insertOne({
     nome: "Paulo",
     idade: 22,
     curso: "Técnico em Informática para Internet"
 })
 ```
 
 - Para consulta os dados na tebela.

```sql
db.sala.find()
```

- Para varios insert

```sql
db.sala.insertMany([
     {nome: "Eduardo", idade: 17, curso: "Enfermagem"},
     {nome: "Gabriel", idade: 22, curso: "Estética"},
     {nome: "Pedro", idade: 18, curso: "TST"},
     {nome: "Victor", idade: 25, curso: "Enfermagem"}
])

db.sala.find()

db.sala.insertOne({
     nome: "Henrique",
     idade: 16,
     curso: "TST"
})

db.sala.find()

db.alunos.insertOne({
     nome: "Emerson",
     idade: 37,
     curso: "TST"
})

db.sala.find({curso: "TST"})
```

- Para realizar consultas de mais e um item
```sql
db.sala.find({
     $and: [
         {idade: {$gt: 10}},
         {idade: {$lt: 50}}
     ]
})
```

- Produto menos que
```sql
db.produtos.find({
    preco: { $lt: 500 }
})
```

- Menor ou igual 
```sql
db.produtos.find({
    estoque: { $lte: 10 }
})
```

- Selecionar um tipo unico.
```sql
db.fornecedor.find({
     tipoProduto: "Eletrônicos"
})
``` 

- Maior que o número desejado
```sql
db.vendas.find({
     db.vendas: {$$gt: 1000}
})
``` 

- Maior e igual ao número desejado
```sql
db.vendas.find({
     db.vendas: {$$gte: 1000}
})
``` 

- Para fazer atualização, upadate
```sql
db.sala.renameCollection("aluno")
```

- Para fazer atualização de um único documentos
```sql
db.aluno.updateOne(
    {nome: "Gabriel"},      //Vao procurando nome
    {$set: {curso: "TII"}} 
)

db.aluno.find()
```

- Para fazer atualização vários documentos
```sql
db.aluno.updateMany(
    {nome: "Gabriel"},      //Vao procurando nome
    {$set: {curso: "TII"}} 
)

db.aluno.find()
```

- Para consultar um documento em por ID
```sql
db.aluno.find({
    _id: ObjectId('68f03b1a6e901d871fd2ab30')
})
```

- Para excluir um documento
```sql
db.aluno.updateOne(
    {_id: ObjectId('68f03b1a6e901d871fd2ab30')},
    {$unset: {idade: ''}},
)
```

- Para Atualizar o nome de do ducumento
```sql
db.aluno.updateOne(
    { _id: ObjectId('68f03b1a6e901d871fd2ab30')},
    {$rename: {'cuso' : 'curso'}}
)

db.aluno.find(
    { _id: ObjectId('68f03b1a6e901d871fd2ab30')}
)
```

- Para Ocutação do campos dos documentos, manter sempre o 0 para ficar oculta.
```sql
db.aluno.find({nome: "Henrique"},
    {idade: 0}
)
```

- Para Organização dos campos, 1 crescendo e descrencente
```sql
db.aluno.find().sort({idade, 1})
```

- Para trazer o limite, e a organização dos campos, 1 crescendo e descrencente
```sql
db.aluno.find().limit(3).sort({idade, -1})
```


## Para remover mensagem de quando executado.

da um control + Shift mais P

colocar o comando setting.josn e dar um enter

![alt text](image-9.png)

Colocar o campo na extensão.

"mdb.confirmRunAll":false

![alt text](image-10.png)




# Exercícios 01

use('agencia_espacial')

// db.alienigenas_turistas.insertMany([
//     {nome: "Zlorg", planeta_origem: "Nebulon-5", especie: "Lumífero", destino: "Saturno", humor: "Animado", numero_de_tentaculos: 4, gasto_medio: 230},
//     {nome: "Xyra", planeta_origem: "Glorptar", especie: "Gelatina Sentiente", destino: "Marte", humor: "Curioso", numero_de_tentaculos: 0, gasto_medio: 180},
//     {nome: "Bliptor", planeta_origem: "Kronix", especie: "Ciborgue Etéreo", destino: "Lua", humor: "Entediado", numero_de_tentaculos: 2,  gasto_medio: 90},
//     {nome: "T’quinn", planeta_origem: "Vortex-12", especie: "Anfíbio Cósmico", destino: "Terra", humor: "Fascinado", numero_de_tentaculos: 6, gasto_medio: 320},
//     {nome: "Moolah", planeta_origem: "Zeltra", especie: "Felino Galáctico", destino: "Netuno", humor: "Sonolento", numero_de_tentaculos: 3, gasto_medio: 150}
// ])

// db.alienigenas_turistas.find()

// db.alienigenas_turistas.find({
//     destino: "Marte"
// })


// db.alienigenas_turistas.find(
//     {humor: "Animado"},
//     {nome: 1, planeta_origim: 1}
// )

// db.alienigenas_turistas.find({
//     gasto_medio: {$gt: 200}
// });


// db.alienigenas_turistas.updateOne(
//     {nome: "Bliptor"},      //Vao procurando nome
//     {$set: {humor: "Emplogado"}} 
// )

// db.alienigenas_turistas.find()

// db.alienigenas_turistas.updateOne(
//     {nome: "T’quinn"},     
//     {$set: {gasto_medio: 400}} 
// )

// db.alienigenas_turistas.find().sort({
//     gasto_medio: -1}).limit(1)


// db.alienigenas_turistas.find().sort({destino: 1 })

// db.alienigenas_turistas.find()






# Exercícios 02

use('agencia_espacial')

// db.naves_exploradoras.insertMany([
//     {nome: "Estrela Veloz", modelo: "GX-900", comandante: "Capitã Luna", destino: "Andrômeda", tripulantes: 8, status: "Em missão", autonomia_dias: 120},
//     {nome: "Aurora Nebulosa", modelo: "ZX-12", comandante: "Comandante Vork", destino: "Galáxia Sombria", tripulantes: 5, status: "Em manutenção", autonomia_dias: 80},
//     {nome: "Cometa Dourado", modelo: "TX-77", comandante: "Tenente Zog", destino: "Saturno", tripulantes: 12, status: "Em missão", autonomia_dias: 150},
//     {nome: "Eclipse Rubro", modelo: "RX-404", comandante: "Capitão Blork", destino: "Buraco Negro Beta", tripulantes: 3, status: "Perdida", autonomia_dias: 60},
//     {nome: "Lótus Cósmica", modelo: "NX-222", comandante: "Dra. Kora", destino: "Terra", tripulantes: 10, status: "Em reparos", autonomia_dias: 100}
// ])

// db.naves_exploradoras.find()


// 01.Para trazer uma missão

// db.naves_exploradoras.find({
//     status: "Em missão"
// })


// 02.Para trazer o nome de colunas maiores que 100 

// db.naves_exploradoras.find(
//     { autonomia_dias: { $gt: 100 } },
//     { nome: 1, destino: 1}
// );


//03.Para atualizar o nome do resultado.

// db.naves_exploradoras.updateOne(
//     {nome: "Eclipse Rubro"},      //Vao procurando nome
//     {$set: {status: "Resgatado",}} 
// )


// 04. Para atualizar uma chave de registro 

// db.naves_exploradoras.updateOne(
//     {nome: "Aurora Nebulosa"},      //Vao procurando nome
//     {$set: {autonomia_dias: 120}} 
// )

// db.naves_exploradoras.find()


# Exercícios 03

use('agencia_espacial')

// db.robos_de_exploracao.insertMany([
//     {codigo: "RBX-01", modelo: "RoverMax", planeta_destino: "Marte", status: "Ativo", bateria: 87, amostras_coletadas: 45},
//     {codigo: "ZY-22", modelo: "GeoProbe", planeta_destino: "Europa", status: "Em reparo", bateria: 43, amostras_coletadas: 22},
//     {codigo: "ALN-7", modelo: "ScanBot", planeta_destino: "Netuno", status: "Desativado", bateria: 0, amostras_coletadas: 60},
//     {codigo: "GR-9", modelo: "DeepMiner", planeta_destino: "Vênus", status: "Ativo", bateria: 65, amostras_coletadas: 38},
//     {codigo: "PX-5", modelo: "Atmoscan", planeta_destino: "Titã", status: "Ativo", bateria: 91, amostras_coletadas: 52}
// ])

// db.robos_de_exploracao.find()

// db.robos_de_exploracao.find({
//     status: "Ativo"
// })

// db.robos_de_exploracao.find(
//     { amostras_coletadas: { $gt: 40 } },
//     { codigo: 1, bateria: 1}
// );

// db.robos_de_exploracao.updateOne(
//     {codigo: "ZY-22"},      
//     {$set: {status: "Ativo"}} 
// )


// db.robos_de_exploracao.updateOne(
//     {codigo: "ALN-7"},      
//     {$set: {bateria: 100}} 
// )

// db.robos_de_exploracao.find()

// db.robos_de_exploracao.find().sort({amostras_coletadas: -1 });

# Exercico 04


// db. planetas_catalogados.insertMany([
//     {nome: "Xyphos", sistema: "Helion", tipo: "Rochoso", possui_vida: "true", gravidade: 1.1, temperatura_media: 25},
//     {nome: "Glacia", sistema: "Crion", tipo: "Gelado", possui_vida: "false", gravidade: 0.8, temperatura_media: -120},
//     {nome: "Voltar", sistema: "Omega-3", tipo: "Vulcânico", possui_vida: "false", gravidade: 2.3, temperatura_media: 460},
//     {nome: "Aqualis", sistema: "Serpentis", tipo: "Oceânico", possui_vida: "true", gravidade: 1.0, temperatura_media: 18},
//     {nome: "Drunor", sistema: "Velkar", tipo: "Gasoso", possui_vida: "false", gravidade: 0.5, temperatura_media: 60}
// ])

// db. planetas_catalogados.find()



// db. planetas_catalogados.find({
//     possui_vida: "true"
// })

// db.planetas_catalogados.find(
//     { gravidade: { $gt: 1.0 } },
//     { nome: 1, sistema: 1, _id: 0 }
// );

// db.planetas_catalogados.updateOne(
//     { nome: "Voltar" },
//     { $set: { temperatura_media: 390 } }
// );

// db. planetas_catalogados.find()


// db.planetas_catalogados.updateOne(
//     { nome: "Aqualis" },
//     { $set: { possui_vida: "false" } }
// );

// db. planetas_catalogados.find()



// db.planetas_catalogados.find().sort({ temperatura_media: 1 });


# exercicio 05


