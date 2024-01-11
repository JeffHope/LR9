WITH TotalIncomes AS (
    -- Подзапрос для вычисления общего дохода от консультаций для каждого врача
    SELECT
        d.Fullname,
        SUM(d.ConsultationFee) as TotalIncome
    FROM
        Doctors d
    JOIN
        Appointments a ON a.DoctorFullname = d.Fullname
    GROUP BY
        d.Fullname 
), AverageIncome AS (
    -- Подзапрос для вычисления среднего дохода от консультаций по всем врачам
    SELECT AVG(TotalIncome) as AvgIncome FROM TotalIncomes
)
-- Основной запрос для получения информации о врачах, их специализации, количестве назначений и общем доходе
SELECT
    d.Fullname,
    d.Specialization,
    COUNT(a.AppointmentDate) AS TotalAppointments,
    ti.TotalIncome
FROM
    Doctors d
JOIN
    Appointments a ON d.Fullname = a.DoctorFullname
JOIN
    TotalIncomes ti ON d.Fullname = ti.Fullname
CROSS JOIN
    AverageIncome
GROUP BY
    d.Fullname, d.Specialization, ti.TotalIncome, AverageIncome.AvgIncome
HAVING
    ti.TotalIncome > AverageIncome.AvgIncome
ORDER BY
    ti.TotalIncome DESC;