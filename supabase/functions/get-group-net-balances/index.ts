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

  const { group_id } = body;
  const groupMembersDb = await supabase
  .from("groups_profiles")
  .select("profiles(id, username), is_admin")
  .eq("group_id", group_id);
  const groupMembers = groupMembersDb.data;

  console.log(groupMembers);


  const groupExpensesDb = await supabase
  .from("expense_beneficiaries")
  .select("expenses(payer_id, amount), share, beneficiary_id")
  .eq('expenses.group_id', group_id);
  const groupExpenses = groupExpensesDb.data;

  console.log(groupExpenses);

  const debtors: { [key: string]: GLfloat } = {};
  const owningTo: { [key: string]: GLfloat } = {};


  for (const expense of groupExpenses) {

    if (expense.expenses.payer_id === user.id && expense.beneficiary_id !== user.id) {
        if(!debtors[expense.beneficiary_id]){
          debtors[expense.beneficiary_id] = 0;
        }
        debtors[expense.beneficiary_id] += +expense.share;
    }else if(expense.beneficiary_id === user.id && expense.expenses.payer_id !== user.id){
        if(!owningTo[expense.expenses.payer_id]){
          owningTo[expense.expenses.payer_id] = 0;
        }
        owningTo[expense.expenses.payer_id] += +expense.share;
    }
  }

  const merged: { [key: string]: GLfloat } = {};

  for (const key in debtors) {
    merged[key] = (merged[key] || 0) + debtors[key];
  }

  for (const key in owningTo) {
    merged[key] = (merged[key] || 0) - owningTo[key];
  }



  const groupMembersWithBalance = Object.entries(merged).map(([memberId, balance])=>{
    const member = groupMembers.find(
      (groupMember) => groupMember.profiles.id === memberId
    );
    if (!member) {
      return null;
    }
    return {
      ...member,
      balance,
    }
  });

  return new Response(
      JSON.stringify(groupMembersWithBalance),
      { 
        status: 200,
        headers: headers,
      })
 }catch(err){
    return new Response(
      JSON.stringify({ error: err?.message ?? 'Internal Server Error' }),
      { status: 500, headers: headers }
    )
  }
})
