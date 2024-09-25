--liquibase formatted sql
--changeset aiauser:1 stripComments:false
--CustOrderHist is a proc
--this is a comment
CREATE PROCEDURE [${AIA_UAT_SCHEMA_NAME}].[CustOrderHist] @CustomerID nchar(5)
AS
SELECT ProductName, Total=SUM(Quantity)
FROM Products P, [Order Details] OD, Orders O, Customers C
WHERE C.CustomerID = @CustomerID
AND C.CustomerID = O.CustomerID AND O.OrderID = OD.OrderID AND OD.ProductID = P.ProductID
--also a commment
GROUP BY ProductName;
--rollback drop procedure [${AIA_UAT_SCHEMA_NAME}].[CustOrderHist];