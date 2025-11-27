create table public.contatos (
  id uuid primary key default gen_random_uuid(),
  nome text not null,
  telefone1 text not null,
  telefone2 text,
  email text not null,
  criado_em timestamp with time zone default now()
);

create policy "permitir select"
on public.contatos
for select
using (true);

create policy "permitir insert"
on public.contatos
for insert
with check (true);

create policy "permitir update"
on public.contatos
for update
using (true);

create policy "permitir delete"
on public.contatos
for delete
using (true);
