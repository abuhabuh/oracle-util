declare
  l_enc   raw(2000);
  l_key   varchar2 (32);
  l_orig  varchar(2000);
begin
  l_key := 'asdfghjklpqwertyuiopoiuytrewqasd';
  l_enc := crypto_util.encrypt_aes256('chicken nuggets', l_key);
  l_orig := crypto_util.decrypt_aes256(l_enc, l_key);
end;
/
