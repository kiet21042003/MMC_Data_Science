use testingsystem;

select * from `exam`;
select * from account;
select * from question;
select * from groupaccount;
-- Question 1: Thêm ít nhất 10 record vào mỗi table
-- Question 2: Lấy ra tất cả các phòng ban Department
select * from department;
-- Question 3: Lấy ra id của phòng ban "Sale"
select * from department d
where d.departmentname = 'Sale';

-- Question 4: lấy ra thông tin account có full name dài nhất
select * from account
where length(fullname) = (select max(length(fullname)) from account);

-- Question 5: Lấy ra thông tin account có full name dài nhất và thuộc phòng ban có id = 3
select * from account
where length(fullname) = (select max(length(fullname)) from account)
and departmentid = 3;
-- Question 6: Lấy ra tên group đã tham gia trước ngày 20/12/2019
select g.groupname, ga.* from `group` g, groupaccount ga
where ga.groupid = g.groupid
and ga.joindate < '2019-12-20';
-- Question 7: Lấy ra ID của question có >= 4 câu trả lời
select questionid, count(answerid) from answer
group by questionid
having count(answerid) >= 4;
-- Question 8: Lấy ra các mã đề thi có thời gian thi >= 60 phút và được tạo trước ngày 20/12/2019
select * from exam
where duration >= 60
and createdate < '2019-12-20';
-- Question 9: Lấy ra 5 group được tạo gần đây nhất
select * from `group`
order by createdate desc
limit 5;
-- Question 10: Đếm số nhân viên thuộc department có id = 2
select count(accountid), departmentid from account
group by departmentid
having departmentid =2;
-- Question 11: Lấy ra nhân viên có tên bắt đầu bằng chữ "D" và kết thúc bằng chữ "o"
select * from account
where fullname like 'D%o';
-- Question 12: Xóa tất cả các exam được tạo trước ngày 20/12/2019
DELETE FROM exam
WHERE CreateDate < '2019-12-20'
and examid >0;

-- Question 13: Xóa tất cả các question có nội dung bắt đầu bằng từ "câu hỏi"
delete from question
where content like 'Câu hỏi%'
and questionid>0;
-- Question 14: Update thông tin của account có id = 5 thành tên "Lô Văn Đề" và
update account
set fullname = 'Lô Văn Đề'
where accountid = 5;
-- email thành lo.vande@mmc.edu.vn
update account
set email = 'lo.vande@mmc.edu.vn'
where accountid = 5;
-- Question 15: Update account có id = 5 sẽ thuộc group có id = 4
update `groupaccount`
set groupid = 4
where accountid = 5
and groupid >0;