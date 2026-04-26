# Projeto dbt – Educação (RMI)

## Objetivo

Transformar dados brutos educacionais em camadas analíticas, permitindo análises sobre frequência e absenteísmo de alunos.

---

## Arquitetura

O projeto segue a estrutura padrão do dbt:

- **staging**: limpeza e padronização dos dados brutos  
- **intermediate**: combinação de tabelas e criação de métricas  
- **marts**: modelos analíticos prontos para consumo  

---

## Fluxo de dados

1. Dados brutos no BigQuery  
2. Models de staging (limpeza)  
3. Model intermediate (frequência por aluno)  
4. Mart de absenteísmo  

---

## Modelos principais

### Staging
- `stg_aluno`
- `stg_escola`
- `stg_turma`
- `stg_frequencia`
- `stg_avaliacao`

### Intermediate
- `int_educacao__aluno_frequencia`  
Consolida a frequência média por aluno e turma.

### Mart
- `mart_educacao__absenteismo`  
Calcula indicadores de absenteísmo por escola.

---

## Testes de dados

### Testes genéricos
- `not_null`
- `unique`

### Testes de regra de negócio
- Frequência deve estar entre 0 e 100  
- Taxa de absenteísmo deve estar entre 0 e 1  

---

## Como rodar o projeto

```bash
dbt debug
dbt run
dbt test
```

## Decisões de modelagem

- O cálculo de frequência foi centralizado na camada intermediate para evitar duplicação de lógica.
- O mart foi desenhado para responder diretamente uma pergunta de negócio (absenteísmo por escola).
- Foi priorizada clareza e simplicidade na modelagem em vez de complexidade desnecessária.