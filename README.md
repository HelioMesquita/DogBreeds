# dogwall
A dog breed list app

# Setup
Rodar o comando 'pod install' dentro da pasta do projeto através do terminal.

# Arquitetura
A arquitetura utilizada foi a CLEAN, sendo assim como o template para criacao do projeto.
A escolha desta arquitetura se deu porque a sua divisao de camadas permite o desenvolvimento de uma aplicacao altamente testavel.

# Dependencias
- **PromiseKit:** Biblioteca que deixa de forma transparente a realizacao de funcoes assincronas. No caso foi utilizado para fazer a request.
- **R.swift:** Biblioteca para indexa o projeto, criando o "R" semelhante ao android. Foi utilizada para o repositorio de strings no aplicativo
- **IQKeyboardManagerSwift:** Biblioteca utilizada para gerenciar o teclado. Foi utilizado na tela de login 
- **SDWebImage:** Biblioteca utilizada para fazer download e cache das imagens na collection view.
- **Cuckoo:** Biblioteca que gera um arquivo na qual cria, de forma automatica, todos os mock das classes para serem testadas, nao havendo a necessidade de criar o spy.
- **Nimble:** Biblioteca que deixa de uma forma mais verbosa a forma de realiar a assertividade do teste. Nao foi utilizado o Quick, pois o mesmo realiza somente o teste da classe toda, nao somente de um determinado tempo.
