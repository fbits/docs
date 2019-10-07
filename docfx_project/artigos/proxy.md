# Integração com Proxy
A Tray Corp permite a integração de um site fora de nossos servidores com a loja virtual através de um proxy. Esse proxy irá agir como intermediário das requisições da loja virtual, podendo buscar conteúdo de nossos servidores ou de um servidor externo dependendo do caminho da requisição.
​
## Exemplo
Suponha um blog no endereço blog.minhaloja.com.br hospedado externamente e a loja virtual no endereço minhaloja.com.br.  O proxy irá permitir que você determine um caminho a qual o blog será retornado através do endereço da loja, como por exemplo minhaloja.com.br/blog.

Algumas lojas que utilizam o proxy:
- [Loja Virus](https://www.lojavirus.com.br/) - [Blog](https://www.lojavirus.com.br/blog)
- [Líder da Matilha](https://www.liderdamatilha.com.br/) - [Blog](https://www.liderdamatilha.com.br/dicas)
- [BS Autocenter](https://www.bsautocenter.com.br/) - [Blog](https://www.bsautocenter.com.br/blog)
## Requisitos
Para que a integração possa ocorrer, é necessário informar alguns dados:
- Endereço do site a ser integrado
- Caminho da loja física a ser utilizado
- Serviço de hospedagem utilizado (Ex: Wordpress)
- Contato da pessoa responsável pelo design do site
