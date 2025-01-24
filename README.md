# Serasa - Marvel

## Descrição do Projeto

Este é um aplicativo para visualização de personagens da Marvel.

**Funcionalidades:**

* Exibição de uma lista paginada de personagens.
* Busca de personagens pelo nome (nome exato).
* Exibição de detalhes de um personagem, incluindo sua descrição.

## Instruções de Instalação

* Certifique-se de que o Flutter 3.24.3 ou superior esteja instalado.
* Certifique-se de que o Dart 3.5.3 ou superior esteja instalado.

## Instruções para Execução

1. No arquivo [project_constants.dart](lib/shared/constants/project_constants.dart), insira sua `apikey` no local indicado.
2. Execute o comando:
   ```bash
   flutter run
   ```

**Observações:**

* Infelizmente, não tive tempo suficiente para me dedicar mais aos testes.
* Também não consegui finalizar completamente os controles de estado das telas. Foi implementado o estado de carregamento (loading) e a lógica de tratamento de erros está pronta, mas a interface visual para os erros ainda não foi concluída.
