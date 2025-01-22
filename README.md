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
