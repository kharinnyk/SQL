# SQL na Biblioteca

Página única e autocontida para aprender SQL do zero, em português do Brasil, de forma gamificada. A guia é a Lia, uma coruja bibliotecária, e a metáfora do curso inteiro é uma biblioteca (tabela = estante, linha = ficha, consulta = bilhete para a bibliotecária).

- 10 paradas, do básico ao avançado, cada uma com 3 passos: **Entender** (cartões com exemplo), **Brincar** (simulação + laboratório com SQLite de verdade) e **Prova** (aprovação com cerca de 70% de acertos, a próxima parada só abre depois).
- A parada 10 tem o chefe final, que mistura tudo. Nota máxima dá um selo.
- Guia de bolso, glossário com busca (54 termos), tira-dúvidas (14 perguntas) e um chat opcional com a Lia.
- Progresso salvo no `localStorage` do navegador.

## Como abrir

Abra o `index.html` no navegador. Não precisa de servidor nem de internet, exceto para carregar as fontes do Google Fonts (sem elas, a página usa fontes do sistema).

Para publicar no GitHub Pages: **Settings → Pages → Deploy from a branch → `main` / root**.

## Laboratório de consultas

Em cada parada, no passo "Brincar", você escreve uma consulta e vê o resultado. Roda o **SQLite** de verdade, pela biblioteca [sql.js](https://github.com/sql-js/sql.js) (versão 1.8.0, SQLite 3.39.3, licença MIT) embutida na página, em modo asm.js. Os dados (livros, autores, empréstimos) são inventados e ficam só na memória do navegador.

O SQLite é diferente do Athena, Redshift e PostgreSQL em alguns pontos (ordem do NULL, ILIKE, tipos, datas). A própria página lista as diferenças principais.

## Chat "Pergunte à Lia"

O chat usa a capacidade `sample` do ambiente de artifacts do claude.ai (`window.claude`). Fora de lá, essa capacidade não existe e o chat fica escondido automaticamente. O resto da página funciona igual.

## Estrutura

```
index.html            página gerada (é o que se publica)
build.sh              gera o index.html a partir de src/ e lib/
src/
  body.html           estrutura da página (cabeçalho, seções, SVGs reutilizáveis)
  style.css           todos os estilos
  util.js             helpers de DOM, colorização de SQL, tabelas
  content1.js         paradas 1 a 4
  content2.js         paradas 5 a 8
  content4.js         paradas 9 e 10
  content3.js         guia de bolso, decisor, hábitos, glossário, dúvidas
  art.js              ilustrações SVG e mapa
  sims.js             simulações (feitas à mão, não são um banco de verdade)
  lab.js              laboratório com SQLite (sql.js)
  app.js              motor: abas, provas, progresso, mapa, guia, chat, céu de estrelas
lib/
  sql-asm.js          sql.js 1.8.0 (asm.js)
  SQLJS-LICENSE.txt   licença do sql.js (MIT)
tests/                testes automatizados com Playwright (Python)
```

## Como editar e gerar

Edite os arquivos em `src/` e rode:

```bash
./build.sh
```

Requer `bash` e Node.js (só para validar o JavaScript).

## Testes

Os testes abrem a página num Chromium headless, clicam em tudo (abas, simulações, provas certas e erradas, bloqueio, zerar progresso, glossário, chat com mock, laboratório) e checam rolagem horizontal e alvos de toque em 390 e 360 px.

```bash
pip install playwright && playwright install chromium
python3 -m http.server 8766 &      # na raiz do projeto
python3 tests/t1.py                # t1 a t10; t5.py aceita a largura: python3 tests/t5.py 390
```

## Sobre o conteúdo

Os exemplos usam SQL padrão. As notas de dialeto sobre PostgreSQL, Amazon Athena e Amazon Redshift foram conferidas nas documentações oficiais em 21/10/2026, assim como os fatos do SQLite usados no laboratório. Notas sobre MySQL, SQL Server e Oracle, e detalhes de CAST, divisão entre inteiros, VIEW e MINUS vêm de conhecimento geral e não foram conferidos um a um. Bancos mudam com o tempo: confirme na documentação do seu.

Todos os dados são inventados e nenhum número de simulação é real.

## Licença

O código desta página ainda não tem licença definida: escolha a sua antes de publicar (por exemplo, MIT). A pasta `lib/` traz o sql.js sob a licença MIT dele.
