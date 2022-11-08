create database if not exists ecommerce;

use ecommerce;
drop table customer;
drop database ecommerce;
drop procedure procedure_incert;

create table if not exists customer(
id_customer int auto_increment primary key,
customer_nome varchar(30),
email varchar(40),
senha varchar (60),
data_cadastro date
);

delimiter \\
create procedure procedure_insert(
	in nome_p varchar(20),
	in email_p varchar(30),
	in senha_p varchar(60)
)
begin
	if (length(senha_p) < 10 and length(senha_p) > 7) then
		insert into customer (customer_nome, email, senha, data_cadastro) values(nome_p, email_p, md5(senha_p), now());
	select * from customer;
	else
		select 'Forneça outra senha' as Message_error;
	end if;
end \\
delimiter ;

call procedure_insert('Daniel', 'daniel@email.com', '124578963');

show index from customer;