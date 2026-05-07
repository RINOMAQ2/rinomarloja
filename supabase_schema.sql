-- Próximo passo: banco online Supabase/Postgres
create table companies (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  document text,
  phone text,
  email text,
  address text,
  created_at timestamptz default now()
);

create table profiles (
  id uuid primary key default gen_random_uuid(),
  company_id uuid references companies(id) on delete cascade,
  name text not null,
  email text unique not null,
  phone text,
  role text not null check (role in ('admin','motorista','cliente')),
  active boolean default true,
  created_at timestamptz default now()
);

create table deliveries (
  id uuid primary key default gen_random_uuid(),
  code text unique not null,
  company_id uuid references companies(id) on delete cascade,
  type text not null,
  client_name text,
  work_name text,
  contact text,
  phone text,
  address text not null,
  equipment_description text not null,
  scheduled_date date,
  scheduled_time time,
  priority text default 'Normal',
  status text default 'Agendada',
  notes text,
  proof_url text,
  signature_url text,
  created_at timestamptz default now()
);
