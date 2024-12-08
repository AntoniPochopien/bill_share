import "jsr:@supabase/functions-js/edge-runtime.d.ts"
import { createClient } from 'jsr:@supabase/supabase-js@2'

const headers = { "Content-Type": "application/json" }

Deno.serve(async (req) => {
  try{
    const authHeader = req.headers.get('Authorization')!

    const supabase = createClient(
      Deno.env.get('SUPABASE_URL') ?? '',
      Deno.env.get('SUPABASE_ANON_KEY') ?? '',
      { global: { headers: { Authorization: authHeader } } }
    )

    const token = authHeader.replace('Bearer ', '')
    const { data } = await supabase.auth.getUser(token)
    const user = data.user

    const body = await req.json();
    const { title, amount, payer_id, beneficients_ids, group_id} = body;
    if (!title || typeof title !== "string") {
      return new Response("The 'title' field is required and must be a string.", { status: 400 });
    }
    if (!group_id || typeof group_id !== "number"){
      return new Response("The 'group_id' field is required and must be a number.", { status: 400 });
    }
    if (!amount || typeof amount !== "number" || amount <= 0) {
      return new Response("The 'amount' field is required and must be a number greater than zero.", { status: 400 });
    }
    if (!payer_id || typeof payer_id !== "string") {
      return new Response("The 'payer_id' field is required and must be a valid UUID.", { status: 400 });
    }
    if (!Array.isArray(beneficients_ids) || beneficients_ids.length === 0) {
      return new Response("The 'beneficients_ids' field must be an array containing at least one element.", { status: 400 });
    }

    const sharePerUser = amount / beneficients_ids.length;
    const creator_id = user.id;
    // Insert into expenses tabel
    const { data: expense, error: expenseError } = await supabase
      .from("expenses")
      .insert([{ title, amount, payer_id, group_id, creator_id }])
      .select("id")
      .single();

    if (expenseError) {
      console.error(expenseError);
      return new Response("The expense could not be added.", { status: 500 });
    }

    const expenseId = expense.id;
    const beneficiariesData = beneficients_ids.map((beneficient_id: string) => ({
      expense_id: expenseId,
      beneficiary_id: beneficient_id,
      share: sharePerUser,
    }));
    
    // Insert into expense_beneficiaries tabel
    const { error: beneficiariesError } = await supabase
      .from("expense_beneficiaries")
      .insert(beneficiariesData);
    if (beneficiariesError) {
      console.error(beneficiariesError);
      return new Response("Failed to add beneficiaries.", { status: 500 });
    }
    return new Response(
      JSON.stringify({ message: "The expense was successfully added.", expenseId }),
      { status: 201, headers: { "Content-Type": "application/json" } }
    );

  }catch(err){
    return new Response(
      JSON.stringify({ error: err?.message ?? 'Internal Server Error' }),
      { status: 500, headers: headers }
    )
  }
})

