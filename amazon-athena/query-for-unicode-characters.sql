##
##
## queries a row "email" for unicode characters
## kudos to Kyle Daryll A for this query
##
##

SELECT email,
    CASE
        WHEN regexp_extract(email, '[^\x00-\x7F]') IS NOT null THEN TRUE
        ELSE FALSE END AS has_non_ascii_char
FROM somedb
WHERE regexp_extract(email, '[^\x00-\x7F]') IS NOT null
LIMIT 10000


##
##
## equivalent query on MSSQL server
##
##


SELECT TOP(10000) email,
    patindex('%[^ !-~]%' COLLATE Latin1_General_BIN,email) as [Position],
    substring(email,patindex('%[^ !-~]%' COLLATE Latin1_General_BIN,email),1) as [InvalidCharacter],
    ascii(substring(email,patindex('%[^ !-~]%' COLLATE Latin1_General_BIN,email),1)) as [ASCIICode]
FROM somedb WITH(NOLOCK)
WHERE patindex('%[^ !-~]%' COLLATE Latin1_General_BIN,email) >0
