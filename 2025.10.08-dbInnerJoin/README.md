# UC8_ImplementarBancoDadosWeb
Implementar Banco de Dados

## Programa para usar no banco de dados.

# 📘 Documentação de Instalação do DBeaver

## 📌 O que é o DBeaver?

DBeaver é uma ferramenta de banco de dados universal e de código aberto, que permite trabalhar com diferentes SGBDs como MySQL, PostgreSQL, Oracle, SQL Server, SQLite, entre outros, por meio de uma interface gráfica amigável.

---

## 🖥️ Instalação no Windows

### Requisitos:

* Windows 7 ou superior
* Java (já vem incluído no instalador do DBeaver)

### Passos:

1. Acesse o site oficial:
   [https://dbeaver.io/download/](https://dbeaver.io/download/)

2. Clique na versão **DBeaver Community Edition** para Windows.

3. Baixe o instalador `.exe` (versão com JDK incluído recomendada).

4. Execute o instalador:

   * Dê dois cliques no arquivo baixado.
   * Siga o assistente de instalação (Next > Next > Install).
   * Finalize clicando em **Finish**.

5. Inicie o DBeaver a partir do menu Iniciar ou atalho na área de trabalho.

---

## 🍏 Instalação no macOS

### Requisitos:

* macOS 10.11 ou superior
* Java (incluso no pacote DMG)

### Passos:

1. Acesse o site:
   [https://dbeaver.io/download/](https://dbeaver.io/download/)

2. Baixe a versão **macOS (DMG)** da edição Community.

3. Após o download, abra o `.dmg` e arraste o ícone do DBeaver para a pasta **Aplicativos**.

4. Abra o DBeaver pela primeira vez:

   * Clique com o botão direito em "DBeaver.app" e escolha **Abrir** (isso contorna o Gatekeeper).

---

## 🐧 Instalação no Linux (Ubuntu/Debian)

### Requisitos:

* Distribuição baseada em Debian/Ubuntu
* Java 11 ou superior

### Opção 1: Instalação via repositório APT (recomendada)

```bash
# Atualizar pacotes
sudo apt update

# Instalar dependências
sudo apt install wget gnupg2 software-properties-common

# Importar a chave GPG do DBeaver
wget -O - https://dbeaver.io/debs/dbeaver.gpg.key | sudo gpg --dearmor -o /usr/share/keyrings/dbeaver.gpg

# Adicionar repositório
echo "deb [signed-by=/usr/share/keyrings/dbeaver.gpg] https://dbeaver.io/debs/dbeaver-ce /" | sudo tee /etc/apt/sources.list.d/dbeaver.list

# Atualizar lista de pacotes
sudo apt update

# Instalar DBeaver
sudo apt install dbeaver-ce
```

### Opção 2: Instalação via pacote `.deb`

1. Baixe o arquivo `.deb` da página oficial:
   [https://dbeaver.io/download/](https://dbeaver.io/download/)

2. Instale com:

```bash
sudo dpkg -i dbeaver-ce_*.deb
sudo apt -f install  # Para corrigir dependências, se necessário
```

---

## ✅ Verificação da Instalação

Após instalar:

* Execute o DBeaver.
* Na tela inicial, crie uma nova conexão com banco de dados.
* Se necessário, o DBeaver irá baixar o driver correspondente automaticamente.

---

## ℹ️ Observações Finais

* A edição **Community** é gratuita e suficiente para a maioria dos casos.
* Existe também a edição **Enterprise**, paga, com mais funcionalidades.
* O DBeaver pode ser integrado com Git, SSH, extensões de ERD, entre outras ferramentas.

---

Se quiser, posso gerar esse conteúdo em PDF, Markdown ou outro formato. Deseja isso?
