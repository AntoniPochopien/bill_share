set check_function_bodies = on;

CREATE OR REPLACE FUNCTION public.handle_new_user()
 RETURNS trigger
 LANGUAGE plpgsql
 SECURITY DEFINER
AS $function$
begin

  insert into public.users (id, username)
  values (new.id, new.raw_user_meta_data ->> 'username');

  return new;
end;
$function$
;