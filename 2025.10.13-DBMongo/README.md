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
     db.vendas: {&gt: 1000}
})
``` 

- Maior e igual ao número desejado
```sql
db.vendas.find({
     db.vendas: {&gt: 1000}
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