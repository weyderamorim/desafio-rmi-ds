select 
    f.id_aluno, 
    f.id_turma, 
    f.id_escola, 
    t.ano, 
    avg(f.frequencia) as media_frequencia 
from {{ ref('stg_frequencia') }} f 
left join {{ ref('stg_turma') }} t 
    on f.id_turma = t.id_turma 
   and f.id_aluno = t.id_aluno 
where f.id_aluno is not null 
group by f.id_aluno, f.id_turma, f.id_escola, t.ano 
