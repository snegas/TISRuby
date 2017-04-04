require 'rails_helper'

RSpec.describe Product, :type => :model do
  it 'is valid with all attributes' do
    expect(Product.new(name: 'Test product', description: 'Test product description', price: 2)).to be_valid
  end

  it 'is not valid without a name' do
    product = Product.new(name: nil)
    expect(product).to_not be_valid
  end

  it 'is not valid without a description' do
    product = Product.new(description: nil)
    expect(product).to_not be_valid
  end

  it 'is not valid without a price' do
    product = Product.new(price: nil)
    expect(product).to_not be_valid
  end

  it 'is not valid with a name in than 50 symbols' do
    product = Product.new(name: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent egestas massa nec' +
      'metus condimentum pellentesque. Mauris ut dolor dignissim, laoreet nulla at, consequat ante.')
    expect(product).to_not be_valid
  end

  it 'is not valid with a description longer than 300 symbols'do
    product = Product.new(name: ' Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent egestas massa nec metus condimentum pellentesque. Mauris ut dolor dignissim, laoreet nulla at, consequat ante. Donec mollis blandit nunc, sit amet consequat justo lacinia ut. In pharetra nunc odio, eget faucibus dolor placerat eu. Vestibulum ut porttitor ipsum. Nulla vitae commodo massa. In at nisi a lectus faucibus egestas vel ut nunc. Ut nec aliquet nisl. Vivamus porttitor id felis vel vulputate. Proin posuere libero at consectetur pharetra. Sed finibus, orci sit amet tristique tempus, tellus mauris ultrices augue, a vestibulum leo augue vitae nunc. Vestibulum finibus porttitor semper. In justo leo, semper vel diam eu, consequat pharetra enim. Suspendisse finibus quam sed tellus egestas mollis euismod at erat. Cras suscipit enim vitae quam ultricies porttitor. Vestibulum vulputate aliquet enim et vulputate.

Nullam felis mauris, lacinia id sem ut, finibus viverra lorem. Maecenas condimentum diam molestie volutpat ultrices. Nulla facilisi. Nullam id nisl ut enim mollis ultrices. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed dictum iaculis nibh quis viverra. Aliquam maximus efficitur mauris, ac bibendum eros vulputate vitae. Duis luctus magna justo, vitae mollis libero vestibulum et. Aliquam pellentesque eros eget sapien consectetur, quis fringilla lacus auctor. Suspendisse dictum tempor turpis vehicula vestibulum. Praesent sodales sapien magna, ac fermentum massa vulputate laoreet. Duis feugiat, ex in gravida euismod, urna metus feugiat quam, eget ultrices odio magna sed arcu. Vestibulum mauris diam, efficitur vel sem elementum, vulputate tempus lacus. Donec nulla erat, gravida quis iaculis in, tristique et tortor.

Maecenas faucibus mattis sapien, sed accumsan lectus consequat nec. Aenean at ex ut mauris maximus tincidunt eget non justo. Integer at dapibus sem, vitae mattis tortor. Quisque tincidunt, eros quis maximus commodo, eros mauris dictum velit, et varius ipsum enim eget ex. Pellentesque eget odio quis augue feugiat aliquam. Aliquam varius et lectus a maximus. Proin nec rhoncus lacus, et vestibulum est.

Phasellus eleifend sem et dignissim tincidunt. Pellentesque vitae mattis ipsum. Fusce nec semper est, consectetur ornare libero. Morbi at erat sit amet risus pellentesque elementum. Vestibulum quis ipsum sem. Pellentesque sagittis metus a sem posuere, in tincidunt ante tempus. Etiam at justo eu leo porta pulvinar eget a metus. Nunc eu lacus quis nunc ornare suscipit et nec urna. Aenean sit amet hendrerit est, nec ornare justo. Phasellus malesuada elementum tortor vitae hendrerit. Etiam euismod in ipsum sit amet pretium. Proin blandit tincidunt faucibus. Donec id elit sapien. Phasellus dignissim dolor porta, aliquet lectus sit amet, fermentum velit. Curabitur a arcu at orci blandit fermentum. Vestibulum libero nisi, feugiat eu finibus convallis, lobortis eget nisi. ')
    expect(product).to_not be_valid
  end

  it 'is not valid with a negative price' do
    product = Product.new(price: -0.1)
    expect(product).to_not be_valid
  end

  it 'is not valid with a zero price' do
    product = Product.new(price: 0)
    expect(product).to_not be_valid
  end
end
