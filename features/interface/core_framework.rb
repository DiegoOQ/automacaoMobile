module CoreFramework
  def find(how = :xpath, elemento)
    wait_true(timeout: 80, interval: 0.5) { $driver.find_element(how, elemento) }
  end

  def click(how = :xpath, elemento)
    wait_true(timeout: 2, interval: 0.5) { $driver.find_element(how, elemento).click }
  end

  def scroll
    Appium::TouchAction.new.swipe(start_x: 144, start_y: 400, end_x: 40, end_y: 30).perform
  end
end
