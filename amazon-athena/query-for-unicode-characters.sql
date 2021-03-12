//
// queries a row "email" for unicode characters
// kudos to Kyle Daryll A for this query
//

SELECT email,
    CASE
        WHEN regexp_extract(email, '[^\x00-\x7F]') IS NOT null THEN TRUE
        ELSE FALSE END AS has_non_ascii_char

FROM somedb

WHERE regexp_extract(email, '[^\x00-\x7F]') IS NOT null

LIMIT 10000