use music_store

--Write query to return the email, first name, last name, & Genre of all Rock Music 
--listeners. Return your list ordered alphabetically by email starting with A

select distinct email,first_name,last_name from customer join invoice on customer.customer_id=invoice.customer_id
join invoice_line on invoice.invoice_id=invoice_line.invoice_id where track_id in(select track_id from track join genre
on track.genre_id=genre.genre_id where genre.name like 'Rock') order by email 

--Let's invite the artists who have written the most rock music in our dataset. Write a 
--query that returns the Artist name and total track count of the top 10 rock bands

select top 10 artist.artist_id,artist.name,COUNT(artist.artist_id) as no_of_songs from track
join album on album.album_id=track.album_id
join artist on artist.artist_id=album.artist_id
join genre on genre.genre_id=track.genre_id
where genre.name like 'Rock'
group by artist.artist_id,artist.name
order by no_of_songs desc


--Return all the track names that have a song length longer than the average song length. 
--Return the Name and Milliseconds for each track. Order by the song length with the 
--longest songs listed first
select name,milliseconds from track
where milliseconds>(select avg(milliseconds) as avg_track_length
from track) order by milliseconds desc 

select name,milliseconds,milliseconds/60000 as minutes from track
where milliseconds>(select avg(milliseconds) as avg_track_length
from track) order by milliseconds desc 


---------------------------------------------

use xyzcompany

select * from employees

EXEC sp_rename 'employee.dept', 'department'; -- rename column name by providing table name and old column name and new column name

EXEC sp_rename 'employee', 'employees'; -- rename table name by providing old table name and new table name

select * from admissions

execute sp_rename 'admission', 'admissions'

exec sp_rename 'admissions.st_fname','st_fathername'