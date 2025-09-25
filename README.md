## Quarantine V.1.0

### 1. Apresentação

#### Gerenciamento de Quarentena de Voluntários em banco de sangue

**Quarantine** é um sistema webapp voltado para **bancos de sangue**, com o objetivo de **gerenciar períodos de quarentena de voluntários**.  
No contexto da triagem para doação, muitas vezes é necessário aplicar regras de resguardo (como viagens recentes, uso de medicamentos ou condições de saúde temporárias).  
Sem um sistema de controle eficiente, existe o risco de entrar em contato com voluntários **não liberados**, gerando retrabalho e até falhas no agendamento.

A solução proposta é uma plataforma simples e objetiva, onde o administrador cadastra voluntários e suas respectivas **regras de quarentena**. O sistema então controla automaticamente quem está **liberado** ou **bloqueado**, oferecendo uma visão clara e confiável para agendamento de doações..  


### 2. Especificaçao

#### Principais Funcionalidades

- CRUD de Voluntários (Doadores)
- CRUD de Regras de Quarentena  
- Associação de voluntários a regras específicas  
- Liberação automática após o prazo de resguardo  

#### Atores (usuários)

- Admin
- Captacao
- Doador

|                |ADMIN  |CAPTAÇAO | DOADOR|
|--------------------------------------|---|---|---|
|Cdastrar, Alterar e Remover DOADORES  | x |   |   |
|Consultar DOADORES                    | x | x |   |
|Cadastrar, Alterar e Remover REGRAS   | x |   |   |
|Consultar REGRAS                      | x | x |   |
|Aplicaçao de quarentena               | x | x |   |
|Cancelamento de quarentena            | x | x |   |
|Visualizaçao de status (pessoal)      |   |   | x |
|Notificaçao de liberaçao de doador    |   |   | x |
|Liberaçao automática de resguardo     |   |   |   |


#### Tecnologias Envolvidas

- *Backend*: [Flask](https://flask.palletsprojects.com/) (Python)  
- *Frontend*: [Vue.js](https://vuejs.org/) (SPA ou páginas dinâmicas)  
- *Banco*: [MariaDB](https://mariadb.org/) (banco de dados relacional)

Outras ferramentas de apoio:

- Modelagem: [MermaidChart](https://www.mermaidchart.com) (Modelagem de diagramas)
- Prorotipação: [Playcode](https://playcode.io/new) (Diagramação rápida de HTML)
- Documentação: [Playcode](https://markdownlivepreview.com/) (Markdown online editor)
- Teste: [Beekeeper](https://www.beekeeperstudio.io/db/mariadb-client/) (Cliente para MariaDB)





### 3. Projeto

#### Principais Entidades de Negócio

A entidade VOLUNTÁRIO concentra os atributos de identificação e perfil do doador, como nome, CPF e tipo sanguíneo. Já a entidade REGRAS descreve as condições aplicáveis, registrando sua descrição e o tempo associado. O relacionamento entre essas entidades é materializado pela tabela intermediária (QUARENTENA), que armazena o vínculo entre voluntários e regras, incluindo a data de atribuição e a data de início da quarentena, fundamentais para o acompanhamento e a rastreabilidade do processo.

A figura 1 apresenta a representação ER desse modelo, e a figura 2 o modelo de classe (UML) do mesmo modelo.


![]()
<img src="https://github.com/HEMOFLOW/quarantine/blob/1b64303467fa324dcb45545416f7519be812e3d6/projeto/s2_diagrama_entidades%2Ber.png">
> Figura 1 - Entidade-relacionamento


O relacionamento entre essas entidades apresenta cardinalidade do tipo muitos-para-muitos (N:N), uma vez que um mesmo voluntário pode estar associado a diversas regras ao longo do tempo, e, da mesma forma, uma regra pode ser atribuída a diferentes voluntários. Esse relacionamento é viabilizado pela tabela intermediária (QUATENTENA), que inclui ainda os atributos data de atribuição e data de início da quarentena, assegurando o controle histórico e a rastreabilidade das aplicações de regras.

![]()
<img src="https://github.com/HEMOFLOW/quarantine/blob/1b64303467fa324dcb45545416f7519be812e3d6/projeto/s2_diagrama_classes.png">
> Figura 2 - Diagrama de Classe (UML)


O diagrama de estados (figura 3) representa o ciclo de vida de um VOLUNTARIO no sistema, destacando o estado LIBERADO como condição inicial e central do processo. 

![]()
<img src="https://github.com/HEMOFLOW/quarantine/blob/1b64303467fa324dcb45545416f7519be812e3d6/projeto/s2_diagrama_estadocor.png">
> Figura 3 - Gestão de estados: VOLUNTARIO

A partir dele, é possível a transição para os estados QUARENTENA, BLOQUEADO ou DESLIGADO, permitindo diferentes fluxos de controle conforme as regras de negócio. O retorno de QUARENTENA e BLOQUEADO para LIBERADO evidencia a possibilidade de reativação do registro, enquanto a transição para DESLIGADO caracteriza um estado final, sem possibilidade de retomada.
A referencia para gestão de estado de um VOLUNTARIO, é realizada a partir da tabela-relacionamento QUARENTENA, e uma lógica de decisão.  

---
### 4. Resultados

Os resultados do desenvolvimento são apresentados a partir da tela principal do sistema (figura 4), ilustrada nos prints do MVP. 

Basicamente, a concepção da tela segue uma proposta minimalista, priorizando princípios de usabilidade, redução de cliques desnecessários e apoio visual imediato para o usuário.

A figura 4a exibe a listagem de voluntários, com indicação visual de seu estado atual: em verde quando o voluntário está liberado para doação e em vermelho quando encontra-se em quarentena.  

![]()
<img src="https://github.com/HEMOFLOW/quarantine/blob/1b64303467fa324dcb45545416f7519be812e3d6/projeto/s2_telas_lista123.png">
> Figura 4 - Listagem de voluntários

A (figura 4b) a interação do usuário ao selecionar um voluntário na listagem. Nesse caso, a linha correspondente passa a ser destacada em amarelo, indicando o estado de seleção. Imediatamente, um popup é exibido (figura 4c), oferecendo duas ações principais: o envio de uma notificação de participação em campanha de doação de sangue ou a inclusão do voluntário em um período de quarentena. Nesta última opção, o sistema possibilita a escolha do tipo de quarentena e a definição de uma data de referência, permitindo ao usuário concluir o processo de forma simples e controlada (figura 5).


![]()
<img src="https://github.com/HEMOFLOW/quarantine/blob/cda8af678efe2641fdd021fc5595b340fcd177b9/projeto/s2_diagrama_atividade_quarentena.png">
> Figura 5 - Fluxograma: APLICANDO QUARENTENA

A interface também disponibiliza recursos de filtro e caeastro rápido. O filtro (topo da listagem) permite a seleção por nome ou CPF, bem como o refinamento por tipo sanguíneo, garantindo rapidez na localização de registros específicos. Já o cadastro rápido de novos voluntários, está disponível da parte de baixo da listagem.




#### Aceitação

Para avaliar o protótipo, apresentamos a ferramenta a quatro possíveis futuros usuários, todos especialistas da área de doação de sangue e atendimento em bancos de sangue. Inicialmente, foi realizada uma breve descrição do aplicativo, destacando seus principais objetivos e funcionalidades. Em seguida, propusemos cinco tarefas do tipo “simulação guiada”, que funcionaram como desafios práticos para explorar a interface. Durante a execução dessas tarefas, monitoramos aspectos objetivos como o tempo gasto e o número de cliques necessários, bem como observamos as dificuldades enfrentadas e percepções espontâneas dos participantes, com o intuito de identificar pontos fortes e oportunidades de melhoria do sistema.

**Desafios propostos aos participantes:**

- *Consultar voluntários*: localizar rapidamente um voluntário específico, utilizando o filtro de busca por nome ou CPF.

- *Aplicar filtro por tipo sanguíneo*: restringir a listagem para visualizar apenas os voluntários com determinado tipo sanguíneo.

- *Selecionar voluntário*: clicar em um voluntário da listagem e confirmar a mudança de destaque (linha amarela).

- *Enviar notificação de convite*: acessar o popup e realizar o envio de uma notificação de participação em campanha de doação.

- *Aplicar quarentena*: selecionar uma regra de quarentena no popup, definir a data de início e concluir o processo.

![]()
<img src="https://github.com/HEMOFLOW/quarantine/blob/4402ca541168de82a59b92ca0ebdf0fb78685517/projeto/aceitacao_teste_tabela_2.png">
> Figura 6 - Tabela de teste e aceitação


