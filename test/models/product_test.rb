require "test_helper"

class ProductTest < ActiveSupport::TestCase
  test "product attributes must not be empty" do
    product = Product.new
    assert product.invalid?
    assert product.errors[:title].any?
    assert product.errors[:description].any?
    assert product.errors[:price].any?
    assert product.errors[:image_url].any?
  end
  test "product price must be positive" do
    product = Product.new(title: "New Product", description: "New description", image_url: "product.jpg")
    product.price = -1
    assert product.invalid?
    assert_equal ["debe ser mayor que o igual a 0.01"],
                 product.errors[:price]

    product.price = 0
    assert product.invalid?
    assert_equal ["debe ser mayor que o igual a 0.01"],
                 product.errors[:price]

    product.price = 1
    assert product.valid?
  end

  def new_product(image_url)
    Product.new(title: "New Product", description: "New Description", image_url: image_url, price: 20)
  end

  test "product image url must have correct format" do

    ok = %w[ product.gif product.png product.JPG product.jpg http://product.png product.jpeg ]
    bad = %w[ product.doc product.rb product.xls product.fig ]
    ok.each do |image_url|
      assert new_product(image_url).valid?
    end
    bad.each do |image_url|
      assert new_product(image_url).invalid?
    end
  end

  test "product title must be unique" do
    product = Product.new(title: products(:shirt).title,
                          description: "New descrition",
                          price: 20,
                          image_url: "product.jpg")
    product.invalid?
    assert_equal ["ya está en uso"], product.errors[:title]
  end


  test "product title must be more 10 characters" do
    product = Product.new(title: "Short",
                          description: "New descrition",
                          price: 20,
                          image_url: "product.jpg")
    product.invalid?
    assert_equal ["es demasiado corto (10 caracteres mínimo)"], product.errors[:title]
  end
end