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

- Para realizar consultas de masi e um item
```sql
db.sala.find({
     $and: [
         {idade: {$gt: 10}},
         {idade: {$lt: 50}}
     ]
})
```

// Produto menos que
db.produtos.find({
    preco: { $lt: 500 }
})

// Menor ou igual 
db.produtos.find({
    estoque: { $lte: 10 }
})
