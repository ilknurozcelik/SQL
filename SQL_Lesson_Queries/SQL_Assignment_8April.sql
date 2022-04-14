<?xml version="1.0" encoding="UTF-8"?><sqlb_project><db path="C:/Users/user/OneDrive/Masaüstü/IT_FUNDAMENTALS_COURSE/SQL/chinook_db/chinook.db" readonly="0" foreign_keys="1" case_sensitive_like="0" temp_store="0" wal_autocheckpoint="1000" synchronous="2"/><attached><db schema="araclar" path="C:\Users\user\OneDrive\Masaüstü\IT_FUNDAMENTALS_COURSE\SQL\araclar_db\araclar.db"/></attached><window><main_tabs open="structure browser pragmas query" current="3"/></window><tab_structure><column_width id="0" width="300"/><column_width id="1" width="0"/><column_width id="2" width="125"/><column_width id="3" width="5166"/><column_width id="4" width="0"/><expanded_item id="0" parent="1"/><expanded_item id="1" parent="1"/><expanded_item id="2" parent="1"/><expanded_item id="3" parent="1"/><expanded_item id="4" parent="1"/></tab_structure><tab_browse><current_table name="4,6:mainalbums"/><default_encoding codec=""/><browse_table_settings><table schema="main" name="albums" show_row_id="0" encoding="" plot_x_axis="" unlock_view_pk="_rowid_"><sort/><column_widths><column index="1" value="84"/><column index="2" value="300"/><column index="3" value="76"/></column_widths><filter_values/><conditional_formats/><row_id_formats/><display_formats/><hidden_columns/><plot_y_axes/><global_filter/></table><table schema="main" name="tracks" show_row_id="0" encoding="" plot_x_axis="" unlock_view_pk="_rowid_"><sort/><column_widths><column index="1" value="75"/><column index="2" value="300"/><column index="3" value="84"/><column index="4" value="121"/><column index="5" value="80"/><column index="6" value="300"/><column index="7" value="115"/><column index="8" value="79"/><column index="9" value="88"/></column_widths><filter_values/><conditional_formats/><row_id_formats/><display_formats/><hidden_columns/><plot_y_axes/><global_filter/></table></browse_table_settings></tab_browse><tab_sql><sql name="SQL 2">--ÖDEVLER--


/* albums tablosundaki Title sutunu Faceless veya Let There Be Rock olan kayıtların 

albumid'lerini elde ederek tracks tablosunda bu id'lere eşit olan kayıtların bilgilerini 

SUBQUERY kullanarak listeyiniz. Listelemede trackid, name ve albumid bilgileri bulunmalıdır. */

SELECT AlbumId
FROM albums
WHERE Title = &quot;Faceless&quot; OR Title = &quot;Let There Be Rock&quot;;

SELECT TrackId, name, AlbumId
FROM tracks
WHERE AlbumId IN (SELECT AlbumId
FROM albums
WHERE Title = &quot;Faceless&quot; OR Title = &quot;Let There Be Rock&quot;);


/* albums tablosundaki Title sutunu Faceless veya Let There Be Rock olan kayıtların 

albumid'lerini elde ederek tracks tablosunda bu id'lere eşit olan kayıtların bilgilerini 

JOIN kullanarak listeyiniz.Listelemede trackid, name ve albumid bilgileri bulunmalıdır. */

SELECT t.TrackId, t.name, a.AlbumId
FROM tracks AS t
JOIN albums AS a
ON a.AlbumId = t.AlbumId
WHERE a.Title = &quot;Faceless&quot; OR a.Title = &quot;Let There Be Rock&quot;;




</sql><current_tab id="0"/></tab_sql></sqlb_project>
