## Descrição do projeto
<p>Desafio de avaliação proposto pela Mainô. A tarefa é implementar um blog utilizando Ruby on Rails seguindo as regras estabelecidas</p>

<h2>Informações do Projeto</h2>

### Versões

- **Ruby**: 3.3.0
- **Rails**: 7.2.2.1

### Como clonar e executar o repositório

1. **Clone o repositório**:
   ```sh
   git clone https://github.com/jorgecoutinhobr/simple_blog.git
   cd simple_blog
   ```

2. **Instale as dependências**:
   ```sh
   bundle install
   ```

3. **Configure o banco de dados**:
   ```sh
   rails db:create
   rails db:migrate
   rails db:seed
   ```

4. **Inicie o servidor**:
   ```sh
   rails server
   ```

5. **Acesse a aplicação**:
   Abra o navegador e acesse `http://localhost:3000`

### Testes

Para executar os testes, use o seguinte comando:
```sh
bundle exec rspec spec
```

<h2>Funcionalidades extras</h2>
<ul>
  <li>Adicionado I18n</li>
  <li>Upload de txt para criação de tags utilizando sidekiq</li>
  <li>Testes com RSpec</li>
  <li>Tags</li>
  <li>Filtro de posts por tag</li>
  <li>Adicionado foto de perfil usando Gravatar</li>
  <li>Posts usando rich text</li>
  <li>O usuário pode apagar os próprios comentários</li>
</ul>
