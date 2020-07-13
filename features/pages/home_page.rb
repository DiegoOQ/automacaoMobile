class Home < InterfaceFramework
  @@campoPesquisa = "//android.widget.EditText[@bounds='[136,471][823,602]']"
  @@campoModelo = "//android.widget.EditText[@text='Search model']"
  @@btnPular = "//android.widget.Button[@text='PULAR']"
  @@btnSearch = "//android.widget.Button[@bounds='[0,927][1080,1053]']"
  @@iFrame = "/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/androidx.drawerlayout.widget.DrawerLayout/android.widget.RelativeLayout/android.widget.FrameLayout"
  @@btnMenu = "//android.widget.ImageButton[@content-desc='Open navigation drawer']"
  @@valor = "//android.widget.TextView[@resource-id='br.com.icarros.androidapp:id/priceText']"
  @@km = "//android.widget.TextView[@resource-id='br.com.icarros.androidapp:id/mileageText']"
  @@cambio = "//android.widget.TextView[@resource-id='br.com.icarros.androidapp:id/transmissionText']"
  @@cor = "//android.widget.TextView[@resource-id='br.com.icarros.androidapp:id/colorText']"

  def validarTelaHome
    # find(@@btnPular).click
    find(@@campoPesquisa).displayed?
  end

  def preencherCampoFiltro
    find(@@campoPesquisa).click
    find(@@campoModelo).send_keys("Chrysler")
    find(@@btnSearch).displayed?
    find(@@btnSearch).click
  end

  def validarValor
    find(@@valor)
  end

  def criandoArquivoMassa
    @valor = find(@@valor).text
    @cor = find(@@cor).text
    @km = find(@@km).text
    @cambio = find(@@cambio).text

    tempHash = {
      "valor" => "" + @valor + "",
      "cor" => "" + @cor + "",
      "km" => "" + @km + "",
      "cambio" => "" + @cambio + "",
    }
    fJson = File.open("C:/Projetos/ruby/Mobile/Itau/massa.json", "w")

    fJson.write(tempHash)
    fJson.close
  end

  def validarInformacoesDoCanal
    require "json"
    json = File.read("C:/Projetos/ruby/Mobile/Itau/temp.json").to_json
    puts json["valor"]
    #puts my_hash["valor"]
  end
end
