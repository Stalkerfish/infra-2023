# Desafio de Infra Equipe SIGA

O foco desse desafio é avaliar sua habilidade de automatizar a execução de um backend em [go](https://go.dev/).

## Como começar
Primeiro você irá dar "fork" nesse projeto (para isso é necessário criar uma conta no GitLab). O botão de "fork" fica no canto superior direito. Após o "fork" você irá trabalhar nesse repositório criado.

## Aplicação
O programa é uma API de autenticação bem simples, nesse servidor tem 3 caminhos HTTP:
```shell
curl -x GET  localhost:3000/                                # Retorna só um Hello, world!
curl -x POST localhost:3000/?username=admin&password=123456 # Cria uma sessão para o usuário admin e retorna ela
curl -x GET  localhost:3000/exist/:session                  # Verifica se a sessão existe
```

Para os 3 caminhos funcionarem precisa tem um banco de dados [Redis](https://redis.io/docs/about/) rodando em localhost:6379, recomendamos subir o Redis em um container do docker.

Para iniciar o servidor basta rodar o seguinte comando:
```shell
go run .
```
Para instalar go basta seguir o seguinte tutorial https://go.dev/doc/install, porém recomendamos já criar um Dockerfile para fazer o build e iniciar o servidor.

## Objetivos

O objetivo do projeto é que um desenvolvedor possa subir o servidor em diversas máquinas com um só comando/script, por isso criamos níveis para pode te auxiliar.

Definimos os objetivos em 3 níveis, Desenvolvimento Local, Produção, Monitoramento. Não é necessário completar todos os níveis.

### Desenvolvimento local
Esse nível tem como objetivo que o desenvolvedor possa subir um ambiente de desenvolvimento na sua máquina local, para isso as ferramentas que recomendados é o [Docker](https://docs.docker.com/get-docker/) junto com o [Docker Compose](https://docs.docker.com/compose/).

Com o Docker instalado na sua máquina podemos completar a seguinte lista: 
- [ ] Criar um Dockerfile para fazer o build e iniciar o servidor
- [ ] Criar um docker-compose para iniciar o servidor e o banco de dados Redis
- [ ] Alterar a porta padrão do servidor de 3000 para o valor da variável de ambiente PORT
- [ ] Fazer upload da imagem Docker do servidor para o registry do GitLab

### Produção
Esse nível tem como objetivo que o desenvolvedor possa fazer o deploy do seu projeto em um servidor, para isso as ferramentas que recomendados é o [Kubernetes](https://kubernetes.io/docs/concepts/overview/) junto com o [minikube](https://minikube.sigs.k8s.io/docs/) e o [Helm](https://helm.sh/docs/).

Esse nível é totalmente opcional e para iniciar ele é bom ter terminado o nível de desenvolvimento local.

- [ ] Iniciar um cluster kubernetes, preferencialmente com o minikube
- [ ] Instalar o Redis pelo Helm
- [ ] Criar um deployment para o servidor
- [ ] Criar um service para o servidor
- [ ] Criar um ingress para o servidor

### Monitoramento
Esse nível tem como objetivo que se possa monitorar o servidor, para isso as ferramentas que recomendados é o [Prometheus](https://prometheus.io/docs/introduction/overview/) junto com o [Grafana](https://grafana.com/docs/grafana/latest/getting-started/).

Esse nível é totalmente opcional e para iniciar ele é bom ter terminado o nível Docker.

- [ ] Adicionar log no servidor
- [ ] Adicionar métricas do Prometheus no servidor 
- [ ] Subir um servidor Prometheus com o docker-compose
- [ ] Subir um servidor Grafana com o docker-compose
- [ ] Criar um dashboard simples com as métricas do servidor
- [ ] Instalar o Grafana e o Prometheus com helm em um cluster kubernetes

## Implementação
Sua implementação deverá estar no mesmo repositório que foi feito o "fork". Esse README que você está lendo agora deverá ser substituído pelo seu, que terá as instruções e informações para a execução da sua implementação. Incluindo possíveis dependências de programas que devem estar previamente instalados, informações sobre a sua implementação e instruções para a execução.

Sinta-se livre caso queira/precise mudar o código e/ou arquivos do servidor, mantendo a mesma lógica.

Caso tenha outra ideia ou se sinta mais confortável com outra solução você pode implementar no lugar do que foi citado acima, lembrando sempre que o resultado final deverá que ser o mesmo: O usuário executar apenas 1 comando para tudo funcionar. E deixar tudo explicado no README.

## Entrega
NÃO É NECESSÁRIO COMPLETAR TODOS OS NÍVEIS PARA FAZER A ENTREGA.

Também vamos avaliar outros aspectos da sua solução, como:
- Documentação do projeto
- Seu nível de conhecimento com o Git
- Quais foram os caminhos que você tomou
- Se você entregou algo além do que pedimos

O prazo de entrega será até 23:59 do dia 24/09

Quando terminar todo seu desafio adicione o usuário @thiago-felipe como membro (coloque a role "Maintainer" ao adicionar) do seu projeto privado para ser avaliado, também preencha o seguinte formulário para confirmar a sua entrega: .

## Dúvidas
Caso tenha alguma dúvida em relação ao desafio abra uma [issue](https://gitlab.com/ltellesfl/desafio-infra/-/issues/new) nesse projeto público. Sua dúvida pode ser a mesma de outros.

Boa sorte :)

