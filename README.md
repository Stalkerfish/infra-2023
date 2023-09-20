# Desafio de Infra Equipe SIGA

O foco desse desafio é avaliar sua habilidade de automatizar a execução de um backend em [go](https://go.dev/).

## Como começar
Primeiro você irá dar "fork" nesse projeto (para isso é necessário criar uma conta no GitLab). O botão de "fork" fica no canto superior direito. Após o "fork" você irá trabalhar nesse repositório criado.

## Aplicação
O programa é uma API de autenticação bem simples, nesse servidor tem 3 caminhos HTTP:
```shell
curl -X GET  'localhost:3000/'                                # Retorna só um Hello, world!
curl -X POST 'localhost:3000/?username=admin&password=123456' # Cria uma sessão para o usuário admin e retorna ela
curl -X GET  'localhost:3000/exist/:session'                  # Verifica se a sessão existe
```

Para os 3 caminhos funcionarem o banco de dados [Redis](https://redis.io/docs/about/) precisa estar rodando em localhost:6379, recomendamos subir o Redis em um container do docker.

Para iniciar o servidor basta rodar o seguinte comando:
```shell
go run .
```
Para instalar go basta seguir o seguinte tutorial https://go.dev/doc/install, porém recomendamos já criar um Dockerfile para fazer o build e iniciar o servidor.

## Objetivos
Marcos é um desenvolvedor da Equipe SIGA, ele gostaria de rodar esse servidor em 3 cenários possíveis:
- Desenvolver o projeto localmente
- Colocar o projeto em produção
- Adicionar Monitoramento no servidor

Crie para o Marcos um comando/script para cada cenário possível. Lembrando que não é necessário completar todos os cenários para fazer a entrega. 

### Desenvolvimento local
Esse cenários tem como objetivo que o Marcos possa subir um ambiente de desenvolvimento na sua máquina local, para isso as ferramentas que recomensamos são o [Docker](https://docs.docker.com/get-docker/) junto com o [Docker Compose](https://docs.docker.com/compose/).

Com o Docker instalado na sua máquina podemos completar a seguinte lista: 
- [ ] Criar um Dockerfile para fazer o build e iniciar o servidor
- [ ] Criar um docker-compose para iniciar o servidor e o banco de dados Redis
- [ ] Alterar a porta padrão do servidor de 3000 para o valor da variável de ambiente PORT
- [ ] Fazer upload da imagem Docker do servidor para o registry do GitLab

### Produção
Esse cenário tem como objetivo que o Marcos possa fazer o deploy do seu projeto em um servidor, para isso as ferramentas que recomendamos são o [Kubernetes](https://kubernetes.io/docs/concepts/overview/) junto com o [minikube](https://minikube.sigs.k8s.io/docs/) e o [Helm](https://helm.sh/docs/).

Esse cenário é totalmente opcional e para iniciar ele é bom ter terminado o cenário de desenvolvimento local.

- [ ] Iniciar um cluster kubernetes, preferencialmente com o minikube
- [ ] Instalar o Redis pelo Helm
- [ ] Criar um deployment para o servidor
- [ ] Criar um service para o servidor
- [ ] Criar um ingress para o servidor

### Monitoramento
Esse cenário tem como objetivo que se possa monitorar o servidor, para isso as ferramentas que recomendamos são o [Prometheus](https://prometheus.io/docs/introduction/overview/) junto com o [Grafana](https://grafana.com/docs/grafana/latest/getting-started/).

Esse cenário é totalmente opcional e para iniciar ele é bom ter terminado o cenário desenvolvimento local.

- [ ] Adicionar log de requisição no servidor
- [ ] Adicionar métricas do Prometheus no servidor 
- [ ] Subir um servidor Prometheus com o docker-compose
- [ ] Subir um servidor Grafana com o docker-compose
- [ ] Criar um dashboard simples com as métricas do servidor
- [ ] Instalar o Grafana e o Prometheus com helm em um cluster kubernetes

## Implementação
Sua implementação deverá estar no mesmo repositório que foi feito o "fork". Esse README que você está lendo agora deverá ser substituído pelo seu, que terá as instruções e informações para a execução da sua implementação. Incluindo possíveis dependências de programas que devem estar previamente instalados, informações sobre a sua implementação e instruções para a execução.

Sinta-se livre caso queira/precise mudar o código e/ou arquivos do servidor, mantendo a mesma lógica.

Caso tenha outra ideia ou se sinta mais confortável com outra solução você pode implementar no lugar do que foi citado acima, lembrando sempre que o resultado final deverá que ser o mesmo: O usuário executar apenas 1 comando para tudo funcionar em cada cenário. E deixar tudo explicado no README.

## Tutoriais

Caso você não tenha nenhuma experiências com docker, kubernetes e prometheus recomendamos os seguintes tutoriais:

### Docker
- Explicação sobre o que é o docker: [Docker in 100 Seconds](https://www.youtube.com/watch?v=Gjnup-PuquQ)
- Tutorial em português sobre o docker: [O mínimo que você precisa saber sobre Docker!](https://www.youtube.com/watch?v=ntbpIfS44Gw)
- Tutorial aprofundado em português sobre o docker: [TUDO O QUE VOCÊ PRECISA SABER SOBRE DOCKER EM 2022](https://www.youtube.com/watch?v=MeFyp4VnNx0)
- Tutorial aprofundado em inglês dobre o docker: [Docker Tutorial for Beginners [FULL COURSE in 3 Hours]](https://www.youtube.com/watch?v=3c-iBn73dDE)

### Kubernetes
- Explicação sobre o que é o kubernetes: [Kubernetes Explained in 100 Seconds](https://www.youtube.com/watch?v=PziYflu8cB8)
- Tutorial em português sobre o kubernetes: [TUDO O QUE VOCÊ PRECISA SABER SOBRE KUBERNETES PARA PASSAR NA ENTREVISTA!](https://www.youtube.com/watch?v=zEOeukcJl6E)
- Tutorial em inglês sobre o kubernetes: [Kubernetes Crash Course for Absolute Beginners [NEW]](https://www.youtube.com/watch?v=s_o8dwzRlu4)
- Tutorial aprofundo em inglês sobre o kubernetes: [Kubernetes Tutorial for Beginners [FULL COURSE in 4 Hours]](https://www.youtube.com/watch?v=X48VuDVv0do)
- Explicação sobre o que é o Helm: [What is Helm?](https://www.youtube.com/watch?v=fy8SHvNZGeE)

### Prometheus
- Explicação sobre o que é o prometheus: [Prometheus Monitoring System Crash Course](https://www.youtube.com/watch?v=BEBsuA5tgUU)
- Explicação sobre o que é o grafana: [Grafana Explained in Under 5 Minutes ⏲](https://www.youtube.com/watch?v=lILY8eSspEo)
- Adicionar log no Fiber: [Documentação Logger Middleware](https://docs.gofiber.io/api/middleware/logger)
- Adicionar prometheus no Fiber: [Documentação fiberprometheus](https://github.com/ansrivas/fiberprometheus)
- Instalar Kube Prometheus Stack(Prometheus, Prometheus Operator, Grafana) com helm: [Documentação Kube Prometheus Stack](https://github.com/prometheus-community/helm-charts/tree/main/charts/kube-prometheus-stack)
- Como usar o Prometheus Operator: [Documentação prometheus operator](https://github.com/prometheus-operator/prometheus-operator/blob/main/Documentation/user-guides/getting-started.md)

## Entrega
NÃO É NECESSÁRIO COMPLETAR TODOS OS CENÁRIOS PARA FAZER A ENTREGA.

Também vamos avaliar outros aspectos da sua solução, como:
- Documentação do projeto
- Seu nível de conhecimento com o Git
- Quais foram os caminhos que você tomou
- Se você entregou algo além do que pedimos

O prazo de entrega será até 23:59 do dia 01/10

Quando terminar todo seu desafio adicione o usuário @thiago-felipe como membro (coloque a role "Maintainer" ao adicionar) do seu projeto privado para ser avaliado, também preencha o seguinte formulário para confirmar a sua entrega: https://forms.gle/P8cVf3fxfBq3bkPS8.

## Dúvidas
Caso tenha alguma dúvida em relação ao desafio abra uma [issue](https://gitlab.com/equipesiga/processo-seletivo/infra-2023/-/issues/new) nesse projeto público. Sua dúvida pode ser a mesma de outros.

Boa sorte :)
