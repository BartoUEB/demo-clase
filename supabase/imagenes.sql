-- Apunta la columna imagen de productos a las fotos del bucket público "imagenes"
update public.productos
set imagen = 'https://osatcuizesczkkjzskxx.supabase.co/storage/v1/object/public/imagenes/' || imagen
where imagen not like 'http%';
