-- Escritura para registrar una venta: insertar en ventas y descontar stock en productos

-- Cualquiera puede registrar una venta (solo INSERT)
create policy "Insertar ventas"
  on public.ventas for insert
  with check (true);

-- Cualquiera puede actualizar productos (necesario para descontar stock)
create policy "Actualizar productos"
  on public.productos for update
  using (true)
  with check (true);

-- Limita el UPDATE a la columna stock: nombre, precio e imagen quedan protegidos
revoke update on public.productos from anon, authenticated;
grant update (stock) on public.productos to anon, authenticated;
