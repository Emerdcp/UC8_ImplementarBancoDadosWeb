# UC8_ImplementarBancoDadosWeb

# Para fazer um Join no Mongo

Para criar banco e inserir

```sql
use("sala");
db.aluno.deleteMany({})

db.aluno.insertMany([
    { nome: "Paulo", idade: 22, curso: "TII", lab: "lab1" },
    { nome: "Eduardo", idade: 17, curso: "Enfermagem", lab: "lab11" },
    { nome: "Pedro", idade: 18, curso: "TST", lab: "lab6" },
    { nome: "Victor", idade: 25, curso: "Enfermagem", lab: "lab11" },
    { nome: "Murilo", idade: 40, curso: "TST", lab: "lab6" },
    { nome: "Henrique", idade: 16, curso: "TST", lab: "lab6" },
    { nome: "Gabriel", idade: 22, curso: "TII", lab: "lab4" }
])


db.laboratorio.insertMany([
    { nome: "lab1", qntd: 30, tipo: "informatica" },
    { nome: "lab4", qntd: 24, tipo: "informatica" },
    { nome: "lab5", qntd: 14, tipo: "informatica" },
    { nome: "lab6", qntd: 30, tipo: "hardware" },
    { nome: "lab7", qntd: 40, tipo: "informatica" },
    { nome: "lab11", qntd: 35, tipo: "enfermagem" },
])
```

Join.

```sql
use("sala");

db.aluno.aggregate([
    {
        $lookup: {
          from: "laboratorio",//onde esta a info
          localField: "lab",//field (coluna) da tabela princiapl
          foreignField: "nome",//field (coluna) da tabela estrangeira
          as: "info_lab"//o vai ser o nome a ser exibido
        }
    },
    {
        $match: {
          idade: {$gt: 20}
        }
    },
    {
        $sort: {
          idade: -1
        }
    }
])


```


## Exercício Autores e Livros


use("AutoresLivros");

// db.autor.insertMany([
//     { nome: "Machado de Assis", nacionalidade: "Brasileiro"},
//     { nome: "George Orwell", nacionalidade: "Britânico"},
//     { nome: "Clarice Lispector", nacionalidade: "Brasileira"},
//     { nome: "J.K. Rowling ", nacionalidade: "Britânica"},
//     { nome: "Gabriel García Márquez", nacionalidade: "Colombiano"}
// ])


// db.livro.insertMany([
//     { titulo: "Dom Casmurro",Autor: "Machado de Assis", ano: 1899 },
//     { titulo: "1984", Autor: "George Orwell", ano: 1949 },
//     { titulo: "A Hora da Estrela", Autor: "Clarice Lispector", ano: 1977},
//     { titulo: "Harry Potter", Autor: "J.K. Rowling", ano: 1997 },
//     { titulo: "Cem Anos de Solidão", Autor: "Gabriel García Márquez", ano: 1967 }
// ])


// // Pra fazer correção de um campo
// db.livro.updateOne(
//     {titulo: "Harry Potter"},
//     {$set: { ano: 1998}}
// )


// //Para consulta o que tem tabela.
// db.livro.find(
//      {titulo: "Harry Potter"}
// )


// //Para consulta antes de tal ano
// db.livro.find({
//     ano: { $lt: 1950 }
// })

// //Para consulta de nacionalidades brasileiro e brasileira
// db.autor.find(
//    nacionalidade: { $in: ["Brasileiro", "Brasileira"] }
// )


// db.livro.aggregate([
//   {
//     $lookup: {
//       from: "autor",              // Coleção onde estão os livros
//       localField: "autor",         // Campo em 'autor'
//       foreignField: "nome",      // Campo correspondente em 'livro'
//       as: "autor_info"                // Nome do array de livros que virá junto
//     }
//   }
// ])


## Exercício Clientes e Pedidos


use("ClientePedidos");

// db.cliente.insertMany([
//     { nome: "Ana", cidade: "São Paulo"},
//     { nome: "Bruno", cidade: "Rio de Janeiro"},
//     { nome: "Carla", cidade: "Belo Horizonte"},
//     { nome: "Daniel", cidade: "Curitiba"},
//     { nome: "Elisa", cidade: "Porto Alegre"}
// ])


// db.pedido.insertMany([
//     { cliente: "Ana",produto: "Notebook", valor: 3500 },
//     { cliente: "Bruno", produto: "Celular", valor: 1800 },
//     { cliente: "Carla", produto: "Tablet", valor: 1200},
//     { cliente: "Daniel", produto: "Monitor ", valor: 900 },
//     { cliente: "Elisa", produto: "Impressora ", valor: 700 }
// ])


// para consulta banco
// db.cliente.find().pretty()
// db.pedido.find().pretty()



// // Pra fazer correção de um campo
// db.pedido.updateOne(
//     {cliente: "Daniel"},
//     {$set: { valor: 3500}}
// )

// db.pedido.find(
//      {cliente: "Daniel"}
// )


// //Para consulta acima de tal valor
// db.pedido.find({
//     valor: { $gt: 1000 }
// })



// db.pedido.aggregate([
//   {
//     $lookup: {
//       from: "cliente",        // Coleção onde estão os clientes
//       localField: "cliente",  // Campo em 'pedido' (nome do cliente)
//       foreignField: "nome",   // Campo correspondente em 'cliente'
//       as: "cliente_info"      // Nome do array que virá junto com os dados do cliente
//     }
//   }
// ])


## Exercícios 03 - 

// db.filme.insertMany([
//   { titulo: "O Grande Golpe", ano: 2005, genero: "Ação", estudio: "CineMax" },
//   { titulo: "Amor em Paris", ano: 2010, genero: "Romance", estudio: "Lumière" },
//   { titulo: "Mistério na Neve", ano: 2018, genero: "Suspense", estudio: "CineMax" },
//   { titulo: "Aventura Submarina", ano: 2022, genero: "Aventura", estudio: "Oceanic" },
//   { titulo: "O Código Perdido", ano: 2015, genero: "Mistério", estudio: "Lumière" }
// ])

// db.ator.insertMany([
//   { nome: "João Silva", idade: 35, filme: "O Grande Golpe" },
//   { nome: "Maria Costa", idade: 28, filme: "Amor em Paris" },
//   { nome: "Pedro Martins", idade: 42, filme: "Mistério na Neve" },
//   { nome: "Ana Ribeiro", idade: 30, filme: "Aventura Submarina" },
//   { nome: "Lucas Andrade", idade: 33, filme: "O Código Perdido" }
// ])

// db.estudio.insertMany([
//   { nome: "CineMax", sede: "São Paulo", fundado: 1998 },
//   { nome: "Lumière", sede: "Rio de Janeiro", fundado: 2005 },
//   { nome: "Oceanic", sede: "Recife", fundado: 2012 }
// ])



// Pra fazer correção de um campo
// db.filme.updateOne(
//     {titulo: "O Código Perdido"},
//     {$set: { genero: "Ação"}}
// )

// db.filme.find(
//      {titulo: "O Código Perdido"}
// )




//Para consulta acima de tal valor
// db.filme.find({
//     ano: { $gt: 2010 }
// })


// db.estudio.find({
//     fundado: { $lt: 2010 }
// })
