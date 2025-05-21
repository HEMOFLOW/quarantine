#### Nome do sistema: Quarantine

##### Gerenciamento de Quarentena de Doadores:

##### Objetivo
Desenvolver um sistema web simples para que atendentes de bancos de sangue possam registrar doadores, aplicar regras de quarentena e receber notificações automáticas sobre doadores liberados.

### Atores
Atendente (ATENDIMENTO): usuário responsável pelo gerenciamento dos doadores e aplicação de quarentenas.

### Funcionalidades Principais

##### CRUD de Doadores (Gerenciamento de Quarentena de Doadores)
O atendente pode registrar um novo doador com dados como nome, e-mail, telefone, e observações gerais.
O atendente pode inativar um doador definitivamente.

##### CRUD de Regras de Quarentena (Gerenciamento de Quarentena de Doadores)
O atendente pode cadastrar regras de quarentena com nome da condição (ex: "Cirurgia Dentária", "Tatuagem"), e o tempo estimado de espera (ex: 7 dias, 30 dias, etc).

##### Aplicação de Quarentena (Gerenciamento de Quarentena de Doadores)
O atendente pode aplicar uma ou mais regras de quarentena a um doador.
O sistema registra a data de início da quarentena e calcula automaticamente a data de liberação.
É possível registrar múltiplas quarentenas por doador, com histórico.

##### Notificações (Gerenciamento de Quarentena de Doadores)
O sistema deve enviar uma notificação visual (por e-mail ou painel interno) informando quais doadores foram liberados da quarentena a cada dia.
Deve haver uma listagem com filtro “liberados hoje” e “em quarentena”.

##### Histórico e Agendamentos (Gerenciamento de Quarentena de Doadores)
Todos os lançamentos de quarentena devem ficar registrados em um histórico do doador.
O atendente pode consultar o histórico completo de agendamentos e quarentenas de um doador.

##### Exemplo de Fluxo de Uso
- O atendente cadastra o doador João Silva.
- João informa que fez uma tatuagem.
- O atendente aplica a regra “Tatuagem - 30 dias” a João.
- O sistema agenda automaticamente a liberação da quarentena de João para 30 dias depois.
- No dia da liberação, o sistema mostra em destaque na tela inicial que João está liberado e pode ser contatado novamente.

##### Critérios de Aceitação
- O sistema deve calcular corretamente as datas de liberação com base nas regras aplicadas.
- O sistema deve garantir que um doador não apareça na lista de contato enquanto estiver em quarentena.
- A interface deve ser clara, com foco em agilidade e simplicidade para o atendente.
- O sistema não precisa manter controle de login por enquanto, mas pode usar uma autenticação básica para o papel "atendente".


