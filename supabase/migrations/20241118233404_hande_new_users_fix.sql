create table public.profiles (
  id uuid not null references auth.users on delete cascade,
  username varchar(15),

  primary key (id)
);

alter table public.profiles enable row level security;


CREATE OR REPLACE FUNCTION public.handle_new_user()
 RETURNS trigger
 LANGUAGE plpgsql
 SECURITY DEFINER
AS $function$
begin

  insert into public.profiles (id, username)
  values (new.id, new.raw_user_meta_data ->> 'username');

  return new;
end;
$function$
;