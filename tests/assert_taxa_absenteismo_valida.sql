-- Regra: taxa de absenteísmo deve estar entre 0 e 1
-- Evita erros de cálculo no modelo analítico

select * 
from {{ ref('mart_educacao__absenteismo') }} 
where taxa_absenteismo_cronico < 0 
   or taxa_absenteismo_cronico > 1 
