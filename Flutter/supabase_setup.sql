-- Script de configuração da tabela contatos no Supabase

-- Criar a tabela contatos
CREATE TABLE IF NOT EXISTS contatos (
  id BIGSERIAL PRIMARY KEY,
  nome VARCHAR(255) NOT NULL,
  telefone1 VARCHAR(50) NOT NULL,
  telefone2 VARCHAR(50) NOT NULL,
  email VARCHAR(255) NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Habilitar Row Level Security (RLS)
ALTER TABLE contatos ENABLE ROW LEVEL SECURITY;

-- Política para SELECT (leitura pública)
CREATE POLICY "Permitir leitura pública" ON contatos
  FOR SELECT USING (true);

-- Política para INSERT (inserção pública)
CREATE POLICY "Permitir inserção pública" ON contatos
  FOR INSERT WITH CHECK (true);

-- Política para UPDATE (atualização pública)
CREATE POLICY "Permitir atualização pública" ON contatos
  FOR UPDATE USING (true);

-- Política para DELETE (exclusão pública)
CREATE POLICY "Permitir exclusão pública" ON contatos
  FOR DELETE USING (true);

-- Comentários para documentação
COMMENT ON TABLE contatos IS 'Tabela para armazenar contatos da agenda telefônica';
COMMENT ON COLUMN contatos.id IS 'ID único do contato';
COMMENT ON COLUMN contatos.nome IS 'Nome do contato';
COMMENT ON COLUMN contatos.telefone1 IS 'Primeiro telefone do contato';
COMMENT ON COLUMN contatos.telefone2 IS 'Segundo telefone do contato';
COMMENT ON COLUMN contatos.email IS 'Email do contato';
COMMENT ON COLUMN contatos.created_at IS 'Data de criação do registro';

