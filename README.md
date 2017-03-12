# Diceware
Uma aplicação para criar senhas fortes e fáceis de memorizar.

[Dicewire](http://world.std.com/~reinhold/diceware.html) é um método proposto por Arnold G. Reinhold para gerar e memorizar senhas fortes utilizando um dicionário quase 8 mil palavras (que tem inclusive versão em [português](https://gist.github.com/patxipierce/3a96b1927b844ce47c04a242651bafc2)) e cinco dados.

As senhas podem conter qualquer número de palavras. Cada palavra deste dicionário adiciona 12,9 bits de entropia. Segundo especialistas, uma chave forte deve conter pelo menos 75 bits de entropia (i.e. pelo menos seis palavras deste dicionário).

Você pode [comprar uma senha de uma garotinha na internet](http://www.dicewarepasswords.com/) se preferir, mas não consideramos isso seguro.

## Estrutura do Rails
`rails new .`

* app
  * assets: guardam os arquivos CSS e JavaScript
  * controllers: responsável pela lógica do programa
  * helpers: funções auxiliares
  * mailers
  * models: função que se comunicam com a base de dados
  * views: renderiza os templates para gerar as páginas HMTL
* bin: executáveis
* config: arquivos de configuração
* db: configurações do BD
* lib: bibliotecas
* log
* public: páginas estáticas
* test: arquivos de teste
* tmp
* vendor

## Console
`rails c`

O console é um REPL, um interpretador ruby.
Em ruby tudo é objeto, inclusive os [números](http://ruby-doc.org/core-2.2.0/Fixnum.html).

```
5.class
5.methods
5.methods.sort
5.times do
  puts "OK"
end
```

O método `class` devolve a classe de um objeto qualquer e a classe `methods` devolve uma lista de métodos que o objeto entende.

Uma [lista](http://ruby-doc.org/core-2.4.0/Array.html) em ruby é uma classe muito versátil. O método `sort` a ordena.

Em ruby podemos passar um bloco (uma sequência de comandos) como parâmetro para um uma função ou método. O método `times` da classe `Fixnum` recebe um bloco e o repete um número de vezes.

## Métodos HTTP
O protocolo HTTP possui dois métodos principais o GET e POST. Nesta aula vimos apenas o primeiro.

Um navegador ao visitar uma página faz uma requisição do tipo GET e espera que o servidor lhe envie uma documento de volta em algum formato que ele seja capaz de interpretar.

## Rotas
Em rails definimos o que fazer a partir das requisições configurando o arquivo `config/routes.rb`. Por exemplo:

```
get 'password/new' => 'password#new'
```

Define que ao receber uma requisição do tipo GET no endereço `password/new` a função `new` no controlador `password` deve ser disparada.

## Controlador
O controlador contém a lógica do programa. Neste caso vamos usá-lo para sortear um número de palavras chaves para formar uma senha e então vamos renderizar um template.

## Views
No final do processo o controlador automaticamente renderiza um template usando o formato [ERB](http://ruby-doc.org/stdlib-2.4.0/libdoc/erb/rdoc/ERB.html) com o mesmo nome da função chamada.

## Modelos
Tipicamente os modelos contem á lógica associada a base de dados. No nosso caso, porém, não precisamos de uma base de dados. Ainda assim, podemos usar modelos para organizar nosso código em classes.

Em ruby método `init` é executado quando um objeto é construído (e.g. ele é o construtor). Os atributos são idetificados por um arroba no início do nome da variável e eles são privados por padrão. Para acessá-los precisamos de getters e setters. O seguinte é um getter para o atributo `@array`:

```
def array
    @array
end
```

Alternativamente podemos simplesmente fazer:
```
attr_reader :array
```

## Refatoração
Uma refatoração é uma mudança no código que não altera sua funcionalidade (só o torna mais legível, mais modular ou mais eficiente). Por exemplo:
```
@array = []
5.times do
  @array << dictionary.sample
end
```

Pode ser refatorado como:

```
@array = 5.times.map do
  @dictionary.sample
end
```

## Gemfile
O arquivo `Gemfile` contém as bibliotecas que utilizaremos. Depois de incluída no arquivo, para instalar as bibliotecas basta rodar o comando `bundle install` ou simplesmente `bundle`

## CSS
Os arquivos para configurar a visualização devem ser separados do HTML ou seu template. A boa prática de programação é deixar esse tipo de código em um arquivo CSS. O rails usa uma linguagem chamada [SASS](https://sass-lang.com/) para facilitar a criação desses tipo de arquivos.


