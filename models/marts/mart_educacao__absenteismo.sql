select 
    id_escola, 
    count(distinct id_aluno) as total_alunos, 
    count(distinct case when media_frequencia < 75 then id_aluno end) as alunos_absenteismo_cronico, 
    avg(media_frequencia) as media_frequencia_escola, 
    safe_divide(count(distinct case when media_frequencia < 75 then id_aluno end), count(distinct id_aluno)) as taxa_absenteismo_cronico 
from {{ ref('int_educacao__aluno_frequencia') }} 
group by id_escola 
