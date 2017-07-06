create or replace package crypto_util
as
  /*
  p_source_str: varchar2(2000) -> converted to raw(2000) during execution
  p_key: varchar(32) -> converted to raw(32) during execution
  */
  function encrypt_aes256 (p_source_str in varchar2, p_key in varchar2) return raw;
  
  /*
  p_encrypted: raw(2000) -> converted to varchar2(2000) during execution
  p_key: varchar(32) -> converted to raw(32) during execution
  */
  function decrypt_aes256 (p_encrypted in raw, p_key in varchar2) return varchar2;
end crypto_util;
/
