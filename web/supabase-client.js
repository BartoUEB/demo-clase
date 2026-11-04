// Cliente de Supabase reutilizable: se crea una sola vez y se comparte en toda la app
let _cliente = null;

function getSupabase(){
  if(!_cliente){
    if(typeof SUPABASE_URL === "undefined" || typeof SUPABASE_ANON_KEY === "undefined"){
      throw new Error("Falta web/config.js (copia config.example.js y completa tus datos).");
    }
    _cliente = supabase.createClient(SUPABASE_URL, SUPABASE_ANON_KEY);
  }
  return _cliente;
}
