-- soal 1 membuat database dan table
create database books_store;

create table books (
    -> id_buku int auto_increment primary key,
    -> judul_buku varchar(255),
    -> pengarang varchar(255),
    -> tahun_terbit date,
    -> penerbit varchar(255),
    -> tanggal_dibuat date,
    -> tanggal_diupdate date);

create table category (
    -> id_category int auto_increment primary key,
    -> nama_category varchar(255),
    -> tanggal_dibuat date,
    -> tanggal_diupdate date);

-- soal 2 input 10 data pada tiap table

insert into books (judul_buku, pengarang, tahun_terbit, penerbit, tanggal_dibuat, tanggal_diupdate)
values
  ('Building Microservices', 'Sam Newman', '2014', "O'Reilly Media", '2023-09-18', '2023-09-18'),
  ('Clean Code', 'Robert C. Martin', '2008', 'Prentice Hall', '2023-09-18', '2023-09-18'),
  ('The Pragmatic Programmer', 'Andrew Hunt', '1999', 'AddisonWesley', '2023-09-18', '2023-09-18'),
  ('Design Patterns', 'Erich Gamma', '1994', 'AddisonWesley', '2023-09-18', '2023-09-18'),
  ('Introduction to Algorithms', 'Thomas H. Cormen', '1990', 'MIT Press', '2023-09-18', '2023-09-18'),
  ('The Art of Computer Programming', 'Donald E. Knuth', '1968', 'AddisonWesley', '2023-09-18', '2023-09-18'),
  ('Clean Architecture', 'Robert C. Martin', '2017', 'Prentice Hall', '2023-09-18', '2023-09-18'),
  ('Refactoring', 'Martin Fowler', '1999', 'AddisonWesley', '2023-09-18', '2023-09-18'),
  ('Domain-Driven Design', 'Eric Evans', '2003', 'AddisonWesley', '2023-09-18', '2023-09-18'),
  ('The Mythical Man-Month', 'Frederick Brooks', '1975', 'AddisonWesley', '2023-09-18', '2023-09-18');

insert into category (nama_category, tanggal_dibuat, tanggal_diupdate)
values
    ('Pemrograman', '2023-09-18', '2023-09-18'),
    ('Fiksi', '2023-09-18', '2023-09-18'),
    ('Nonfiksi', '2023-09-18', '2023-09-18'),
    ('Bisnis', '2023-09-18', '2023-09-18'),
    ('Teknologi', '2023-09-18', '2023-09-18'),
    ('Seni', '2023-09-18', '2023-09-18'),
    ('Sejarah', '2023-09-18', '2023-09-18'),
    ('Sains', '2023-09-18', '2023-09-18'),
    ('Hukum', '2023-09-18', '2023-09-18'),
    ('Kesehatan', '2023-09-18', '2023-09-18');

-- soale 3 menampilkan seluruh data dari tiap tabel

select * from books;

select * from category;

-- soal 4 update data dengan id 1 pada table books

update books
    -> set judul_buku = 'Building Microservices: Designing Fine-Grained Systems',
    ->     tahun_terbit = '2015',
    ->     tanggal_diupdate = '2023-09-20'
    -> where id_buku = 1;
    
-- soal 5 hapus data dengan id 10 dari kedua table

delete from books where id_buku= 10;

delete from category where id_category= 10;

-- soal 6 menampilkan data dengan ketentuan tertentu

select judul_buku
    -> from books
    -> where penerbit= 'AddisonWesley';

select *
    -> from books
    -> where tahun_terbit BETWEEN '2003' AND '2023';

select *
    -> from books
    -> where judul_buku LIKE '%design%';

-- soal 7 membuat table baru dengan nama book_category

create table book_categories (
    ->     id int auto_increment primary key,
    ->     id_buku int,
    ->     foreign key (id_buku) references books(id_buku),
    ->     id_category int,
    ->     foreign key (id_category) references category(id_category)
    ->     tanggal_dibuat date,
    ->     tanggal_diupdate data
    -> );

-- soal 8 input data pada table book_category

INSERT INTO book_categories (id_category, id_buku, tanggal_dibuat, tanggal_diupdate)
    -> VALUES
    ->   (2, 1, '2023-09-18', '2023-09-18'),
    ->   (3, 5, '2023-09-18', '2023-09-18'),
    ->   (1, 1, '2023-09-18', '2023-09-18');

-- soal 9 menampilkan data pada books dengan data pada category

select b.id_buku as id, b.judul_buku, c.nama_category as nama_category
from books as b
join book_categories as bc on b.id_buku = bc.id_buku
join category as c on bc.id_category = c.id_category;

-- saol 10 menambahkan kolom jumlah halaman dengan tipe data number

alter table books
    -> add jumlah_halaman int;

