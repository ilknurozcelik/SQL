<?xml version="1.0" encoding="UTF-8"?><sqlb_project><db path="C:/Users/user/OneDrive/Masaüstü/IT_FUNDAMENTALS_COURSE/SQL/chinook_db/chinook (1).db" readonly="0" foreign_keys="1" case_sensitive_like="0" temp_store="0" wal_autocheckpoint="1000" synchronous="2"/><attached/><window><main_tabs open="structure browser pragmas query" current="3"/></window><tab_structure><column_width id="0" width="300"/><column_width id="1" width="0"/><column_width id="2" width="125"/><column_width id="3" width="5166"/><column_width id="4" width="0"/><expanded_item id="0" parent="1"/><expanded_item id="1" parent="1"/><expanded_item id="2" parent="1"/><expanded_item id="3" parent="1"/></tab_structure><tab_browse><current_table name="4,8:maininvoices"/><default_encoding codec=""/><browse_table_settings><table schema="main" name="albums" show_row_id="0" encoding="" plot_x_axis="" unlock_view_pk="_rowid_"><sort/><column_widths><column index="1" value="84"/><column index="2" value="300"/><column index="3" value="76"/></column_widths><filter_values/><conditional_formats/><row_id_formats/><display_formats/><hidden_columns/><plot_y_axes/><global_filter/></table><table schema="main" name="invoices" show_row_id="0" encoding="" plot_x_axis="" unlock_view_pk="_rowid_"><sort/><column_widths><column index="1" value="93"/><column index="2" value="111"/><column index="3" value="162"/><column index="4" value="300"/><column index="5" value="167"/><column index="6" value="109"/><column index="7" value="132"/><column index="8" value="160"/><column index="9" value="53"/></column_widths><filter_values/><conditional_formats/><row_id_formats/><display_formats/><hidden_columns/><plot_y_axes/><global_filter/></table></browse_table_settings></tab_browse><tab_sql><sql name="SQL 1">/* 1. Write a query that displays InvoiceId, CustomerId and total dollar amount
for each invoice, sorted first by CustomerId (in ascending order), and then by 
total dollar amount (in descending order). */

SELECT InvoiceId, CustomerId, total
FROM invoices
ORDER BY CustomerId ASC, total DESC;


/* 2. Write a query that displays InvoiceId, CustomerId and total dollar amount
for each invoice, but this time sorted first by total dollar amount 
(in descending order), and then by CustomerId (in ascending order).*/

SELECT InvoiceId, CustomerId, total
FROM invoices
ORDER BY total DESC, CustomerId ASC;


/* 3. Compare the results of these two queries above. How are the results different
when you switch the column you sort on first? (Explain it in your own words.) */

-- In the first query results were sorted first by the CustomerID and then sorted by the
-- total dollar amount. For example; CustomerId=1 was returned first 7 rows, 
-- for CustomerId = 1, these 7 rows were sorted by the total dollar amount.

-- In the second query results were sorted first by the total dollar amount and then sorted by the
-- CustomerId. For example; total dollar amount in row 3 and 4 are the same while these rows 
-- were sorted by the CustomerId.

/* 4. Write a query to pull the first 10 rows and all columns from the invoices 
table that have a dollar amount of total greater than or equal to 10. */

SELECT *
FROM invoices
WHERE total &gt;=10
LIMIT 10;


/* 5. Write a query to pull the first 5 rows and all columns from the invoices 
table that have a dollar amount of total less than 10. */

SELECT *
FROM invoices
WHERE total &lt;10
LIMIT 5;

/* 6. Find all track names that start with 'B' and end with 's'. */

SELECT name
FROM tracks
WHERE name LIKE &quot;B%s&quot;;

/* 7. Use the invoices table to find all information regarding invoices whose 
billing address is USA or Germany or Norway or Canada and invoice date is at 
any point in 2010, sorted from newest to oldest. */

SELECT *
FROM invoices
WHERE BillingCountry IN (&quot;USA&quot;, &quot;Germany&quot;, &quot;Norway&quot;, &quot;Canada&quot;) AND InvoiceDate LIKE &quot;%2010%&quot;
ORDER BY InvoiceDate DESC;



</sql><current_tab id="0"/></tab_sql></sqlb_project>
