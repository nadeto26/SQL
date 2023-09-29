SELECT DepositGroup,
SUM(DepositAmount) as TotalSum
FROM WizzardDeposits
WHERE MagicWandCreator = 'Ollivander family' AND DepositAmount < 150000
Group by DepositGroup 
ORDER BY DepositAmount DESC
