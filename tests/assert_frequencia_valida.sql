-- Regra: frequência deve estar entre 0 e 100
-- Isso garante consistência de presença escolar

select *
from {{ ref('stg_frequencia') }}
where frequencia < 0
   or frequencia > 100