# UC8_ImplementarBancoDadosWeb
Implementar Banco de Dados

## PetShop BoxHors - Criação de Banco de dados

### Comando em SQL


```sql
CREATE TABLE CAD_DEPARTAMENTO (
    ID_DEPARTAMENTO INT PRIMARY KEY AUTO_INCREMENT,
    DEP_NOME VARCHAR(150)
);

CREATE TABLE CAD_CARGO (
    ID_CARGO INT PRIMARY KEY AUTO_INCREMENT,
    CARGO_NOME VARCHAR(150)
);

CREATE TABLE CAD_FUNCIONARIO (
    ID_USUARIO INT PRIMARY KEY AUTO_INCREMENT,
    USU_NOME VARCHAR(200),
    USU_DEPARTAMENTO INT,
    USU_CARGO INT,
    USU_DATACADASTRO DATE,
    USU_CPF VARCHAR(14),
    USU_CNPJ VARCHAR(18),
    USU_SENHA VARCHAR(255),
    USU_STATUS CHAR(1),
    FOREIGN KEY (USU_DEPARTAMENTO) REFERENCES CAD_DEPARTAMENTO(ID_DEPARTAMENTO),
    FOREIGN KEY (USU_CARGO) REFERENCES CAD_CARGO(ID_CARGO)
);

CREATE TABLE CAD_ANIMAL (
    ID_ANIMAL INT PRIMARY KEY AUTO_INCREMENT,
    ANI_NOME VARCHAR(150),
    ANI_APELIDO VARCHAR(150)
);

CREATE TABLE CAD_CLIENTE (
    ID_CLIENTE INT PRIMARY KEY AUTO_INCREMENT,
    CLI_NOME VARCHAR(150),
    CLI_ANIMAL INT,
    CLI_CPF VARCHAR(14),
    CLI_CNPJ VARCHAR(18),
    CLI_LOGRADOURO VARCHAR(150),
    CLI_NUMERO VARCHAR(20),
    CLI_COMPLEMENTO VARCHAR(40),
    CLI_BAIRRO VARCHAR(40),
    CLI_CIDADE VARCHAR(40),
    CLI_ESTADO CHAR(2),
    CLI_DATA DATE,
    CLI_STATUS CHAR(2),
    CLI_HISTORICO INT,
    FOREIGN KEY (CLI_ANIMAL) REFERENCES CAD_ANIMAL(ID_ANIMAL)
);

CREATE TABLE CAD_PRODUTO (
    ID_PRODUTO INT PRIMARY KEY AUTO_INCREMENT,
    PRO_NOME VARCHAR(250),
    PRO_CODIGOAUXILIAR VARCHAR(150),
    PRO_QUANTIDADE FLOAT,
    PRO_UNIDADE CHAR(2),
    PRO_STATUS CHAR(1)
);

CREATE TABLE CAD_SERVICOS (
    ID_SERVICOS INT PRIMARY KEY AUTO_INCREMENT,
    SER_NOME VARCHAR(150),
    SER_STATUS CHAR(1)
);

CREATE TABLE MOV_ATENDIMENTO (
    ID_ATENDIMENTO INT PRIMARY KEY AUTO_INCREMENT,
    ATEND_TIPO INT,
    ATEND_CLIENTE INT,
    ATEND_DATA DATETIME,
    ATEND_FUNCIONARIO INT,
    ATEND_RESPONSAVEL INT,
    ATEND_DESCRICAO TEXT,
    ATEND_PRODUTOS INT,
    ATEND_VALOR DECIMAL(10,2),
    FOREIGN KEY (ATEND_TIPO) REFERENCES CAD_SERVICOS(ID_SERVICOS),
    FOREIGN KEY (ATEND_CLIENTE) REFERENCES CAD_CLIENTE(ID_CLIENTE),
    FOREIGN KEY (ATEND_FUNCIONARIO) REFERENCES CAD_FUNCIONARIO(ID_USUARIO),
    FOREIGN KEY (ATEND_RESPONSAVEL) REFERENCES CAD_FUNCIONARIO(ID_USUARIO),
    FOREIGN KEY (ATEND_PRODUTOS) REFERENCES CAD_PRODUTO(ID_PRODUTO)
);

CREATE TABLE MOV_AGENDAMENTO (
    ID_AGENDAMENTO INT PRIMARY KEY AUTO_INCREMENT,
    AGEN_CLIENTE INT,
    AGEN_DATA DATE,
    AGEN_HORA TIME,
    AGEN_DESCRICAO VARCHAR(400),
    AGEN_RESPONSAVEL INT,
    FOREIGN KEY (AGEN_CLIENTE) REFERENCES CAD_CLIENTE(ID_CLIENTE),
    FOREIGN KEY (AGEN_RESPONSAVEL) REFERENCES CAD_FUNCIONARIO(ID_USUARIO)
);

-- Atualiza a FK de histórico do cliente (agora que MOV_ATENDIMENTO existe)
ALTER TABLE CAD_CLIENTE
ADD FOREIGN KEY (CLI_HISTORICO) REFERENCES MOV_ATENDIMENTO(ID_ATENDIMENTO);
```



### Para banco de dados de Mongo.

// 🧱 Criação do Banco
use PetShopBoxHors;

// 🏢 CAD_DEPARTAMENTO
db.departamentos.insertMany([
  { nome: "Administração" },
  { nome: "Veterinário" },
  { nome: "Atendimento ao Cliente" }
]);

// 💼 CAD_CARGO
db.cargos.insertMany([
  { nome: "Gerente" },
  { nome: "Veterinário Chefe" },
  { nome: "Recepcionista" }
]);

// 👩‍⚕️ CAD_FUNCIONARIO
db.funcionarios.insertMany([
  {
    nome: "João da Silva",
    departamento_id: db.departamentos.findOne({ nome: "Administração" })._id,
    cargo_id: db.cargos.findOne({ nome: "Gerente" })._id,
    data_cadastro: new Date(),
    cpf: "123.456.789-00",
    cnpj: null,
    senha: "senha123",
    status: "A"
  },
  {
    nome: "Maria Oliveira",
    departamento_id: db.departamentos.findOne({ nome: "Veterinário" })._id,
    cargo_id: db.cargos.findOne({ nome: "Veterinário Chefe" })._id,
    data_cadastro: new Date(),
    cpf: "987.654.321-00",
    cnpj: null,
    senha: "senha456",
    status: "A"
  },
  {
    nome: "Pedro Santos",
    departamento_id: db.departamentos.findOne({ nome: "Atendimento ao Cliente" })._id,
    cargo_id: db.cargos.findOne({ nome: "Recepcionista" })._id,
    data_cadastro: new Date(),
    cpf: "222.333.444-55",
    cnpj: null,
    senha: "senha789",
    status: "I"
  }
]);

// 🐾 CAD_ANIMAL
db.animais.insertMany([
  { nome: "Rex", apelido: "Requinho" },
  { nome: "Mimi", apelido: "Mimosa" },
  { nome: "Thor", apelido: "Thorzinho" }
]);

// 👤 CAD_CLIENTE
db.clientes.insertMany([
  {
    nome: "Carlos Pereira",
    cpf: "111.222.333-44",
    cnpj: null,
    logradouro: "Rua das Flores",
    numero: "123",
    complemento: "Casa 2",
    bairro: "Centro",
    cidade: "Pelotas",
    estado: "RS",
    data_cadastro: new Date(),
    status: "AT",
    animal: db.animais.findOne({ nome: "Rex" }),
    historico: []
  },
  {
    nome: "Ana Souza",
    cpf: "555.666.777-88",
    cnpj: null,
    logradouro: "Av. Brasil",
    numero: "456",
    complemento: "Apto 101",
    bairro: "Três Vendas",
    cidade: "Pelotas",
    estado: "RS",
    data_cadastro: new Date(),
    status: "AT",
    animal: db.animais.findOne({ nome: "Mimi" }),
    historico: []
  },
  {
    nome: "José Almeida",
    cpf: "999.888.777-66",
    cnpj: null,
    logradouro: "Rua Dom Pedro II",
    numero: "789",
    complemento: "",
    bairro: "Fragata",
    cidade: "Pelotas",
    estado: "RS",
    data_cadastro: new Date(),
    status: "IN",
    animal: db.animais.findOne({ nome: "Thor" }),
    historico: []
  }
]);

// 📦 CAD_PRODUTO
db.produtos.insertMany([
  {
    nome: "Ração Premium 10kg",
    codigo_auxiliar: "RAC10",
    quantidade: 20,
    unidade: "KG",
    status: "A"
  },
  {
    nome: "Coleira Ajustável",
    codigo_auxiliar: "COL001",
    quantidade: 50,
    unidade: "UN",
    status: "A"
  },
  {
    nome: "Shampoo Canino",
    codigo_auxiliar: "SHAM001",
    quantidade: 30,
    unidade: "UN",
    status: "A"
  }
]);

// 🧾 CAD_SERVICOS
db.servicos.insertMany([
  { nome: "Banho e Tosa", status: "A" },
  { nome: "Consulta Veterinária", status: "A" },
  { nome: "Vacinação", status: "A" }
]);

// 🩺 MOV_ATENDIMENTO
db.atendimentos.insertMany([
  {
    tipo_id: db.servicos.findOne({ nome: "Banho e Tosa" })._id,
    cliente_id: db.clientes.findOne({ nome: "Carlos Pereira" })._id,
    funcionario_id: db.funcionarios.findOne({ nome: "Maria Oliveira" })._id,
    responsavel_id: db.funcionarios.findOne({ nome: "João da Silva" })._id,
    descricao: "Banho e tosa completa com hidratação",
    produtos: [
      { produto_id: db.produtos.findOne({ nome: "Shampoo Canino" })._id, quantidade: 1 }
    ],
    valor: 85.00,
    data: new Date()
  },
  {
    tipo_id: db.servicos.findOne({ nome: "Consulta Veterinária" })._id,
    cliente_id: db.clientes.findOne({ nome: "Ana Souza" })._id,
    funcionario_id: db.funcionarios.findOne({ nome: "Maria Oliveira" })._id,
    responsavel_id: db.funcionarios.findOne({ nome: "João da Silva" })._id,
    descricao: "Consulta de rotina",
    produtos: [],
    valor: 120.00,
    data: new Date()
  },
  {
    tipo_id: db.servicos.findOne({ nome: "Vacinação" })._id,
    cliente_id: db.clientes.findOne({ nome: "José Almeida" })._id,
    funcionario_id: db.funcionarios.findOne({ nome: "Maria Oliveira" })._id,
    responsavel_id: db.funcionarios.findOne({ nome: "João da Silva" })._id,
    descricao: "Vacina antirrábica",
    produtos: [],
    valor: 60.00,
    data: new Date()
  }
]);

// 📅 MOV_AGENDAMENTO
db.agendamentos.insertMany([
  {
    cliente_id: db.clientes.findOne({ nome: "Carlos Pereira" })._id,
    data: new Date("2025-11-01"),
    hora: "14:30",
    descricao: "Retorno para banho",
    responsavel_id: db.funcionarios.findOne({ nome: "Pedro Santos" })._id
  },
  {
    cliente_id: db.clientes.findOne({ nome: "Ana Souza" })._id,
    data: new Date("2025-11-02"),
    hora: "10:00",
    descricao: "Vacinação anual",
    responsavel_id: db.funcionarios.findOne({ nome: "Maria Oliveira" })._id
  },
  {
    cliente_id: db.clientes.findOne({ nome: "José Almeida" })._id,
    data: new Date("2025-11-03"),
    hora: "16:00",
    descricao: "Consulta de retorno",
    responsavel_id: db.funcionarios.findOne({ nome: "João da Silva" })._id
  }
]);
