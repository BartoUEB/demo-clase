-- Esquema de la tienda de barrio (demo-clase)

-- Tablas
create table public.productos (
  id bigint primary key,
  nombre text not null,
  precio integer not null check (precio >= 0),
  stock integer not null, -- puede ser negativo: se vende aunque falte registrar unidades
  imagen text
);

create table public.ventas (
  id bigint primary key,
  producto_id bigint not null references public.productos (id),
  cantidad integer not null check (cantidad > 0),
  total integer not null check (total >= 0),
  fecha date not null
);

create index ventas_producto_id_idx on public.ventas (producto_id);

-- Datos
insert into public.productos (id, nombre, precio, stock, imagen) values
  (1, 'Arroz 500 g', 3200, 24, 'arroz.png'),
  (2, 'Leche entera 1 L', 4500, 12, 'leche.png'),
  (3, 'Huevos x12', 9800, 8, 'huevos.png'),
  (4, 'Panela 500 g', 3800, 15, 'panela.png'),
  (5, 'Café molido 250 g', 7600, 10, 'cafe.png');

insert into public.ventas (id, producto_id, cantidad, total, fecha) values
  (1, 1, 2, 6400, '2026-11-01'),
  (2, 3, 1, 9800, '2026-11-01');

-- Row Level Security: solo lectura para cualquiera
alter table public.productos enable row level security;
alter table public.ventas enable row level security;

create policy "Lectura pública de productos"
  on public.productos for select
  using (true);

create policy "Lectura pública de ventas"
  on public.ventas for select
  using (true);
