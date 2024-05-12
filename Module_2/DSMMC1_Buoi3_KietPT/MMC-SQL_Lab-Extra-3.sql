use hr;

-- Truy vấn 1: Truy xuất tất cả nhân viên có địa chỉ ở Elgin, IL
-- Gợi ý: Sử dụng toán tử LIKE để tìm các string tương tự
select * from employees
where address like '%Elgin,IL';
-- Truy vấn 2: Truy xuất tất cả nhân viên sinh vào những năm 1970.
-- Gợi ý: Sử dụng toán tử LIKE để tìm các string tương tự
SELECT *
FROM EMPLOYEES
WHERE B_DATE LIKE '197%';

-- Truy vấn 3: Truy xuất tất cả nhân viên trong phòng ban 5 có mức lương từ 60000 đến 70000.
-- Gợi ý: Sử dụng từ khóa BETWEEN cho truy vấn này
select * from employees
where salary between 60000 and 70000;

-- Truy vấn 4A: Truy xuất danh sách nhân viên được sắp xếp theo ID phòng ban.
-- Gợi ý: Sử dụng mệnh đề ORDER BY cho truy vấn này
select * from employees order by dep_id;
-- Truy vấn 4B: Truy xuất danh sách nhân viên được sắp xếp theo thứ tự giảm dần theo ID phòng ban và trong mỗi phòng ban, những nhân viên này được sắp xếp theo họ với thứ tự giảm dần của bảng chữ cái.
select * from employees order by dep_id desc, l_name ;
-- Truy vấn 5A: Đối với mỗi ID phòng ban, truy xuất số lượng nhân viên trong phòng ban.
-- Gợi ý: Sử dụng COUNT (*) để truy xuất tổng số cột, sau đó dùng GROUP BY
select dep_id, COUNT(*) as 'số lượng nhân viên'
from employees 
group by dep_id;
-- Truy vấn 5B: Đối với mỗi phòng ban, truy xuất số lượng nhân viên trong phòng ban và mức lương trung bình của nhân viên trong phòng ban.
-- Gợi ý: Sử dụng COUNT (*) để truy xuất tổng số cột và dùng hàm AVG () để tính toán mức lương trung bình, sau đó nhóm kết quả lại
select dep_id, COUNT(*) AS Num_Employees,  AVG(salary)
from employees 
group by dep_id;
-- Truy vấn 5C: Gắn nhãn các cột đã tính trong tập hợp kết quả của Truy vấn 5B là NUM_EMPLOYEES và AVG_SALARY.
-- Gợi ý: Sử dụng AS “LABEL_NAME” sau tên cột
select dep_id, COUNT(*) AS NUM_EMPLOYEES,  AVG(salary) as AVG_SALARY
from employees 
group by dep_id;
-- Truy vấn 5D: Trong Truy vấn 5C, hãy sắp xếp tập hợp kết quả Mức lương trung bình.
-- Gợi ý: Sử dụng ORDER BY sau GROUP BY
select dep_id, COUNT(*) AS NUM_EMPLOYEES,  AVG(salary) as AVG_SALARY
from employees 
group by dep_id
order by AVG(salary);
-- Truy vấn 5E: Trong Truy vấn 5D, giới hạn kết quả thành ít hơn 4 nhân viên cho các phòng ban.
select dep_id, COUNT(*) AS NUM_EMPLOYEES,  AVG(salary) as AVG_SALARY
from employees 
group by dep_id
having num_employees <4
order by AVG(salary);