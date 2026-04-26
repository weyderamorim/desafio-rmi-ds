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
Calcula taxa de absenteísmo por aluno e identifica casos de absenteísmo crônico (frequência < 75%).

---

## Testes de dados

### Testes genéricos
- `not_null`: garante campos obrigatórios
- `unique`: garante unicidade de chaves
- `relationships`: garante integridade entre tabelas

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
- Utilização de LEFT JOIN para preservar registros de frequência mesmo sem correspondência em outras tabelas
- Agregação de frequência por aluno e turma para simplificar análise de absenteísmo
- Normalização de nomes de colunas para padrão snake_case

## Limitações

- Não há informação de data de matrícula, limitando validações temporais
- Frequência agregada pode ocultar variações diárias

## Possíveis melhorias

- Incluir granularidade por data
- Criar métricas por escola/região
- Implementar testes adicionais de consistência temporal
