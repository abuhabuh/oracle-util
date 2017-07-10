-- Example code


-- Grant perm for DMUSER to connect and resolve www.google.com 
begin
  DBMS_NETWORK_ACL_ADMIN.append_host_ace(
    host => 'www.google.com',
    ace => xs$ace_type(
      privilege_list => xs$name_list('connect', 'resolve'),
      principal_name => 'DMUSER',
      principal_type => xs_acl.ptype_db)
  );
end;

