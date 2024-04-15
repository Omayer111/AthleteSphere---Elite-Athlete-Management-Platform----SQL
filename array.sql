set serveroutput on
declare

counter integer;
bk_name1 BOOK.BOOK_NAME%type;
type nmArray is varray(5) of BOOK.BOOK_NAME%type;
arr nmArray:= nmArray(); /* this means the size is 0 */

begin 

counter := 1;
for x in 12..16
loop

select book_name into bk_name1 from book where book_no = x;
arr.extend();
arr(counter):= bk_name1; 

 /*first number of array is the max size possible
but the initial condition will be size 0 along the assignment we're extending hte size of the arr by 1 */   

counter := counter + 1;

end loop;

counter := 1;

while counter <= arr.count
loop

dbms_output.put_line(arr(counter));
counter:= counter + 1;

end loop;

end;