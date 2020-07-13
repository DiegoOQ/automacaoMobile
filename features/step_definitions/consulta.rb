Dado("que estou logado na aplicação") do
  Home.new.validarTelaHome
end

Quando("preencho dados da pesquisa") do
  Home.new.preencherCampoFiltro
end

Então("valido valor à vista dos anuncios") do
  Home.new.validarValor
end

Então("Crio um arquivo de dados contendo marca, modelo, ano, km, cor, câmbio e valor à vista de cada veiculo retornado") do
  Home.new.criandoArquivoMassa
end
