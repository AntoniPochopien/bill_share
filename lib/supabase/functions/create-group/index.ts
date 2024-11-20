// Follow this setup guide to integrate the Deno language server with your editor:
// https://deno.land/manual/getting_started/setup_your_environment
// This enables autocomplete, go to definition, etc.

// Setup type definitions for built-in Supabase Runtime APIs
import "jsr:@supabase/functions-js/edge-runtime.d.ts"
import { createClient } from 'jsr:@supabase/supabase-js@2'

const headers = { "Content-Type": "application/json" }


Deno.serve(async (req) => {
  try{
    const supabase = createClient(
    Deno.env.get('SUPABASE_URL') ?? '',
    Deno.env.get('SUPABASE_ANON_KEY') ?? '',
    { global: { headers: { Authorization: req.headers.get('Authorization')! } } }
  )

  const authHeader = req.headers.get('Authorization')!
  const token = authHeader.replace('Bearer ', '')
  const { data: userData, userError } = await supabase.auth.getUser(token)
  
  const user = userData.user
    if (!user) {
      return new Response('Unauthorized: User not found', { status: 401 })
    }
    const userId = user.sub

  const { name } = await req.json()

  if (!name) {
    return new Response('Missing "name" in the request body', { status: 400 })
  }

  const { data, error } = await supabase
  .from('groups')
  .insert({ name: name }).select('id')


  if (error) {
    return new Response(
      JSON.stringify({ error: error.message }),
      { status: 400, headers: headers}
    )
  }

  const newGroup = data[0]
  const newGroupId = data[0].id

  const response = await supabase.from('groups_profiles').insert({'user_id':userId, 'group_id':newGroupId})

  if (response.error) {
    return new Response(
      JSON.stringify({ error: response.error.message }),
      { status: 400, headers: headers }
    )
  }

  return new Response(
    JSON.stringify({ message: 'Group created successfully', newGroup }),
    { status: 201, headers: headers }
  )
}catch(err){
  return new Response(
    JSON.stringify({ error: err?.message ?? 'Internal Server Error' }),
    { status: 500, headers: headers }
  )
}
})