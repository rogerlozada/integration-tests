Quando("eu somo {int} + {int}") do |valor1, valor2|
    @soma = valor1 + valor2
  end
  
  Entao("o resultado tem que ser {int}") do |resultado|
    expect(@soma).to eq resultado
  end





