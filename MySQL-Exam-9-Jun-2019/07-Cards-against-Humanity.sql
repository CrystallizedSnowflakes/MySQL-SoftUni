# Extract from the database, all of the cards, and the clients that own them, so that they end up in the following format:
-- {card_number} : {full_name}
# Order the results descending by card id.

SELECT ca.id, CONCAT(ca.card_number, ' : ', cl.full_name) AS card_token FROM cards AS ca
LEFT JOIN bank_accounts AS ba
ON ca.bank_account_id = ba.id
LEFT JOIN clients AS cl
ON ba.client_id = cl.id
ORDER BY ca.id DESC;
