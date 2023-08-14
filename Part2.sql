CREATE TABLE Products (
    PId INT PRIMARY KEY,
    PQ INT,
    PPrice DECIMAL(10, 2),
    Discount DECIMAL(5, 2)
);

INSERT INTO Products (PId, PQ, PPrice, Discount) VALUES
(1, 5, 100.00, 10.00),
(2, 2, 50.00, 5.00),
(3, 10, 200.00, 15.00);

CREATE FUNCTION CalculateDiscountedValue(@price DECIMAL(10, 2), @discount DECIMAL(5, 2))
RETURNS DECIMAL(10, 2)
AS
BEGIN
    DECLARE @discountedValue DECIMAL(10, 2);
    SET @discountedValue = @price - (@price * @discount / 100);
    RETURN @discountedValue;
END;

SELECT PId, PPrice, Discount, dbo.CalculateDiscountedValue(PPrice, Discount) AS PriceafterDiscount
FROM Products;
