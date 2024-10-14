# Desafio-dio-progr-consulta-CPF-Ruby

# Desafio Dio - Programa em Ruby para Consulta de CPF

Vamos criar um programa simples em Ruby que permite ao usuário validar um número de CPF. O CPF (Cadastro de Pessoas Físicas) é um documento utilizado no Brasil e possui regras específicas para sua validação.

## Código do Programa

Aqui está um exemplo de como você pode escrever esse programa:

ruby

```ruby
# Função para validar CPF
def validar_cpf(cpf)
  # Remove caracteres não numéricos
  cpf = cpf.gsub(/[^\d]/, '')

  # Verifica se o CPF tem 11 dígitos
  return false unless cpf.length == 11

  # Verifica se todos os dígitos são iguais
  return false if cpf.chars.uniq.length == 1

  # Calcula os dois dígitos verificadores
  2.times do |j|
    soma = 0
    cpf[0..8 + j].chars.each_with_index do |digit, i|
      soma += digit.to_i * (10 + j - i)
    end

    # Calcula o dígito verificador
    digito = (soma * 10) % 11
    digito = 0 if digito == 10 || digito == 11
    return false unless digito == cpf[9 + j].to_i
  end

  true
end

# Solicita ao usuário o CPF
print "Digite o CPF (apenas números): "
cpf = gets.chomp

# Valida o CPF e exibe o resultado
if validar_cpf(cpf)
  puts "O CPF #{cpf} é VÁLIDO."
else
  puts "O CPF #{cpf} é INVÁLIDO."
end
```

## Explicação do Código

- **Função `validar_cpf`**:
  - Remove caracteres não numéricos do CPF.
  - Verifica se o CPF tem 11 dígitos.
  - Verifica se todos os dígitos são iguais (invalidando CPFs como `111.111.111-11`).
  - Calcula os dois dígitos verificadores com base nos 9 primeiros dígitos.
- **Entrada do Usuário**: O programa solicita ao usuário que insira um CPF.
- **Resultado**: O programa informa se o CPF é válido ou inválido.

## Como Executar o Programa

1. **Crie um arquivo Ruby** chamado `valida_cpf.rb`:

   

   ```bash
   touch valida_cpf.rb
   ```

2. **Abra o arquivo** em um editor de texto e cole o código acima.

3. **Execute o programa** no terminal:

   bash

   

   ```bash
   ruby valida_cpf.rb
   ```

4. **Siga as instruções** na tela para inserir o CPF.

## Exemplo de Saída

Se você inserir `12345678909`, a saída será:

plaintext



```plaintext
O CPF 12345678909 é INVÁLIDO.
```

Se você inserir um CPF válido, como `11144477735`, a saída será:

plaintext



```plaintext
O CPF 11144477735 é VÁLIDO.
```
