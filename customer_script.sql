SELECT
    c.FirstName,
    c.LastName,
    SUM(o.totalamount) AS TotalCost
FROM
    Customers c
    JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY
    c.CustomerID,
    c.FirstName,
    c.LastName
-- сортировка
ORDER BY
    TotalCost desc;
-- средняя сумма заказа
SELECT
    c.FirstName,
    c.LastName,
    SUM(o.totalamount) AS TotalCost,
    AVG(o.totalamount) AS AverageCost -- Добавленный столбец со средней стоимостью
FROM
    Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY
    c.CustomerID,
    c.FirstName,
    c.LastName;
-- максимальная сумма заказов
SELECT 
    c.FirstName,
    c.LastName,
    SUM(o.totalamount) AS TotalCost
FROM 
    Customers c
JOIN 
    Orders o ON c.CustomerID = o.CustomerID
GROUP BY 
    c.CustomerID, c.FirstName, c.LastName
HAVING 
    SUM(o.totalamount) = (
        SELECT MAX(TotalCost)
        FROM (
            SELECT 
                SUM(o.totalamount) AS TotalCost
            FROM 
                Orders o
            GROUP BY 
                o.CustomerID
        ) AS SubQuery
    )
-- лист для максимума
WITH CustomersTotalCost AS (
    SELECT
        c.CustomerID,
        c.FirstName,
        c.LastName,
        SUM(o.totalamount) AS TotalCost,
        RANK() OVER (ORDER BY SUM(o.totalamount) DESC) AS Rank
    FROM
        Customers c
    JOIN
        Orders o ON c.CustomerID = o.CustomerID
    GROUP BY
        c.CustomerID, c.FirstName, c.LastName
)
SELECT
    ctc.FirstName,
    ctc.LastName,
    o.OrderID,
    o.totalamount AS OrderCost
FROM
    CustomersTotalCost ctc
JOIN
    Orders o ON ctc.CustomerID = o.CustomerID
WHERE
    ctc.Rank = 1
ORDER BY
    o.totalamount ASC;
--  суммарная стоимость заказов превышает среднюю суммарную
WITH CustomersTotalCost AS (
    SELECT
        c.CustomerID,
        c.FirstName,
        c.LastName,
        SUM(o.totalamount) AS TotalCost
    FROM
        Customers c
    JOIN
        Orders o ON c.CustomerID = o.CustomerID
    GROUP BY
        c.CustomerID, c.FirstName, c.LastName
)
SELECT
    ctc.FirstName,
    ctc.LastName,
    ctc.TotalCost,
    AVG(ctc.TotalCost) AS AverageOrderCost
FROM
    CustomersTotalCost ctc
WHERE
    ctc.TotalCost > (
        SELECT
            AVG(TotalCost)
        FROM
            CustomersTotalCost
    )
GROUP BY
    ctc.CustomerID, ctc.FirstName, ctc.LastName, ctc.TotalCost;