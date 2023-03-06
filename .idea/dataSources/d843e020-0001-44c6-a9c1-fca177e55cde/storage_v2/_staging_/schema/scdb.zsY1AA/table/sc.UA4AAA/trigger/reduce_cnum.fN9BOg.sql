create definer = root@localhost trigger reduce_cnum
    after delete
    on sc
    for each row
begin
    declare temp smallint;
    declare message varchar(20);
    select cnum into temp from course where course.Cno = old.Cno;
    if (temp = 0)
    then
        select XXX into message;
    else
        update course set cnum=cnum - 1 where course.Cno = old.Cno;
    end if;
end;

