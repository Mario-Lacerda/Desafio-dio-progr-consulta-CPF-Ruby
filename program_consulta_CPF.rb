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
   