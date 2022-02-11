select * from bd_facts.tbl_asesores;
select * from bd_facts.tbl_clientes;
select * from bd_facts.tbl_facturas;

select 
meg.idAsesor,
meg.numeroID,
meg.nombres,
meg.apellidos,
q.nombrecompleto,
q.numeroID
from tbl_asesores meg left join tbl_clientes q on meg.idAsesor = q.idAsesor
where q.idAsesor is null;


select
q.idCliente,
q.nombrecompleto,
mon.idFactura,
mon.fechaEmision,
mon.fechaVencimiento,
mon.fechapagada 
From  tbl_facturas mon inner join tbl_clientes q on mon.idCliente = q.idCliente 
where mon.fechaVencimiento between '2022-01-01 22:36:30' and '2022-02-28 04:11:10';


#Ejecución :
set @v_idAsesor = 14; 
set @v_idCliente = 101;
set @v_cantClientes = 0;

#Ejecución
set @v_idAsesor = 1; 
set @v_idCliente = 128;
set @v_cantClientes = 0;

#Asignar

update bd_facts.tbl_clientes
set idAsesor = @v_idAsesor
where idCliente =  @v_idCliente;

#Actualizar

 select count(*) into @v_cantClientes
 from bd_facts.tbl_clientes
 where idAsesor = @v_idAsesor;
 
update bd_facts.tbl_asesores
set cantClientes = @v_cantClientes
where idAsesor =  @v_idAsesor; 

select * from bd_facts.tbl_clientes where idAsesor = @v_idAsesor;
select cantClientes from bd_facts.tbl_asesores where idAsesor = @v_idCliente ;

commit 

select A.idAsesor, A.numeroID, (E.cantClientes) as clientes 
from bd_facts.tbl_clientes as A
left join bd_facts.tbl_asesores as E
on A.idAsesor = E.idAsesor
group by idAsesor
having clientes >= 4



