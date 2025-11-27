# 🚀 Guia Rápido de Instalação

## Passo 1: Configurar o Banco de Dados (Supabase)

1. Acesse o Supabase Dashboard: https://app.supabase.com
2. Vá em **SQL Editor**
3. Cole e execute o conteúdo do arquivo `supabase_setup.sql`
4. Isso criará a tabela `contatos` e configurará as permissões necessárias

## Passo 2: Instalar Dependências

No terminal, execute:

```bash
flutter pub get
```

## Passo 3: Executar a Aplicação

```bash
flutter run
```

## ✅ Pronto!

A aplicação está configurada e pronta para uso. As credenciais do Supabase já estão configuradas no código.

## 📝 Notas Importantes

- Certifique-se de que o Flutter está instalado e configurado
- Verifique se você tem um dispositivo/emulador conectado ou use `flutter run -d chrome` para web
- Se encontrar erros de conexão, verifique se a tabela foi criada corretamente no Supabase

