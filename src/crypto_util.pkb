create or replace package body crypto_util
as

  g_encryption_type_aes   constant pls_integer := 
                            dbms_crypto.encrypt_aes256 
                            + dbms_crypto.chain_cbc 
                            + dbms_crypto.pad_pkcs5;

  function encrypt_aes256 (p_source_str in varchar2, p_key in varchar2) return raw
  as
    l_source_raw      raw(2000);
    l_encrypted_raw   raw(2000);
    l_key_raw         raw(32);
  begin
    l_source_raw := utl_i18n.string_to_raw(p_source_str, 'AL32UTF8');
    l_key_raw := utl_i18n.string_to_raw(p_key, 'AL32UTF8');
  
    l_encrypted_raw := dbms_crypto.encrypt(
      src => l_source_raw, 
      typ => g_encryption_type_aes, 
      key => l_key_raw);
    
    return l_encrypted_raw;
  end encrypt_aes256;



  function decrypt_aes256 (p_encrypted in raw, p_key in varchar2) return varchar2
  as
    l_key_raw     raw(32);
    l_orig_raw    raw(2000);
    l_orig_str    varchar2(2000);
  begin
    l_key_raw := utl_i18n.string_to_raw(p_key, 'AL32UTF8');    
    
    l_orig_raw := dbms_crypto.decrypt(p_encrypted, g_encryption_type_aes, l_key_raw);
    l_orig_str := utl_i18n.raw_to_char(l_orig_raw, 'AL32UTF8');
  
    return l_orig_str;
  end;

end crypto_util;
/
