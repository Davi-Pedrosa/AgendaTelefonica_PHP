# Agenda Telefônica - Flutter

Aplicação de agenda telefônica desenvolvida em Flutter com integração ao Supabase.

## 📋 Pré-requisitos

- Flutter SDK (versão 3.0.0 ou superior)
- Dart SDK
- Conta no Supabase
- Tabela `contatos` criada no Supabase

## 🗄️ Configuração do Banco de Dados (Supabase)

Antes de executar a aplicação, você precisa criar a tabela `contatos` no Supabase com a seguinte estrutura:

```sql
CREATE TABLE contatos (
  id SERIAL PRIMARY KEY,
  nome VARCHAR(255) NOT NULL,
  telefone1 VARCHAR(50) NOT NULL,
  telefone2 VARCHAR(50) NOT NULL,
  email VARCHAR(255) NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);
```

### Permissões RLS (Row Level Security)

Certifique-se de habilitar as políticas RLS no Supabase para permitir operações CRUD:

1. Acesse o Supabase Dashboard
2. Vá em Authentication > Policies
3. Crie políticas para a tabela `contatos`:
   - SELECT: Permitir leitura pública
   - INSERT: Permitir inserção pública
   - UPDATE: Permitir atualização pública
   - DELETE: Permitir exclusão pública

Ou execute no SQL Editor:

```sql
-- Habilitar RLS
ALTER TABLE contatos ENABLE ROW LEVEL SECURITY;

-- Política para SELECT (leitura)
CREATE POLICY "Permitir leitura pública" ON contatos
  FOR SELECT USING (true);

-- Política para INSERT (inserção)
CREATE POLICY "Permitir inserção pública" ON contatos
  FOR INSERT WITH CHECK (true);

-- Política para UPDATE (atualização)
CREATE POLICY "Permitir atualização pública" ON contatos
  FOR UPDATE USING (true);

-- Política para DELETE (exclusão)
CREATE POLICY "Permitir exclusão pública" ON contatos
  FOR DELETE USING (true);
```

## 🚀 Instalação

1. Clone o repositório ou navegue até a pasta do projeto

2. Instale as dependências:
```bash
flutter pub get
```

## ▶️ Executando a Aplicação

Para executar a aplicação:

```bash
flutter run
```

## 📱 Funcionalidades

- ✅ **Adicionar Contato**: Preencha os campos obrigatórios (Nome, Telefone1, Telefone2, Email) e clique em "Adicionar"
- ✅ **Atualizar Contato**: Selecione um contato na tabela, edite os campos e clique em "Atualizar"
- ✅ **Deletar Contato**: Selecione um contato na tabela e clique em "Deletar"
- ✅ **Buscar Contatos**: Digite o nome no campo de busca e clique em "Ver dados"

## 🎨 Layout

A aplicação possui um layout moderno com:
- Cabeçalho azul escuro com título "Agenda Telefônica"
- Formulário com campos em duas colunas
- Botões de ação coloridos (Verde: Adicionar, Azul: Atualizar, Vermelho: Deletar)
- Tabela responsiva para exibir os contatos

## 📦 Dependências

- `flutter`: SDK do Flutter
- `supabase_flutter`: ^2.5.6 - Cliente Flutter para Supabase
- `cupertino_icons`: ^1.0.6 - Ícones do iOS

## 🔧 Configuração

As credenciais do Supabase estão configuradas em `lib/config/supabase_config.dart`:

- URL: https://txrkcdweknuxdbwaoekz.supabase.co
- API Key: Configurada no arquivo

## 📝 Estrutura do Projeto

```
lib/
├── config/
│   └── supabase_config.dart    # Configuração do Supabase
├── models/
│   └── contact.dart             # Modelo de dados do contato
├── screens/
│   └── home_screen.dart         # Tela principal da aplicação
├── services/
│   └── supabase_service.dart    # Serviço de comunicação com Supabase
└── main.dart                    # Ponto de entrada da aplicação
```

## 🐛 Solução de Problemas

Se encontrar erros de conexão com o Supabase:
1. Verifique se a tabela `contatos` foi criada corretamente
2. Verifique se as políticas RLS estão configuradas
3. Verifique se as credenciais no `supabase_config.dart` estão corretas

## 📄 Licença

Este projeto é de uso educacional.
