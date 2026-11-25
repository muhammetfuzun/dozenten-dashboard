-- Einmalig im Supabase SQL Editor ausführen (Project → SQL Editor → New query → Run).
-- Legt eine Tabelle an, in der jeder angemeldete Nutzer genau eine Zeile (seinen kompletten Cockpit-Stand) hat.
-- Row Level Security sorgt dafür, dass jeder nur die eigene Zeile sieht und ändern kann.

create table if not exists public.cockpit_state (
  user_id    uuid primary key default auth.uid() references auth.users(id) on delete cascade,
  data       jsonb not null,
  updated_at timestamptz not null default now()
);

alter table public.cockpit_state enable row level security;

drop policy if exists "eigene zeile" on public.cockpit_state;
create policy "eigene zeile" on public.cockpit_state
  for all to authenticated
  using (auth.uid() = user_id)
  with check (auth.uid() = user_id);

revoke all on public.cockpit_state from anon;
