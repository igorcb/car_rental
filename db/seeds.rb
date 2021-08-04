# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Cadastro de Categorias'
grupo_ax   = Category.create(name: 'GRUPO AX')
grupo_b    = Category.create(name: 'GRUPO B')
grupo_d    = Category.create(name: 'GRUPO D')
grupo_f    = Category.create(name: 'GRUPO F')
grupo_fx   = Category.create(name: 'GRUPO FX')
grupo_h    = Category.create(name: 'GRUPO H')
grupo_hx   = Category.create(name: 'GRUPO HX')
grupo_hw   = Category.create(name: 'GRUPO HW')

puts 'Cadastro dos Carros por categoria'
puts 'Grupo AX'
grupo_ax.cars.create!(name: 'Mobi Like', price: 120, rented: false, url_image: 'https://storage.googleapis.com/movida-public-images/modelos/3210_image.png')
grupo_ax.cars.create!(name: 'WV UP Extreme', price: 120, rented: false, url_image: 'https://quatrorodas.abril.com.br/wp-content/uploads/2020/12/Volkswagen-Up-Xtreme-2021-3-e1617836833976.jpg')
grupo_ax.cars.create!(name: 'Kwid-Intense', price: 120, rented: false, url_image: 'https://bestcars.com.br/bc/wp-content/uploads/2018/05/Renault-Kwid-Intense-16.jpg')
grupo_ax.cars.create!(name: 'Nissan Micra', price: 120, rented: false, url_image: 'https://www.oficinabrasil.com.br/uploads/1.4e.jpg')

puts 'Grupo B'
grupo_b.cars.create!(name: 'ONIX LT', price: 150, rented: false, url_image: 'https://storage.googleapis.com/movida-public-images/modelos/2313_image.png')
grupo_b.cars.create!(name: 'Sandero Stapway', price: 150, rented: false, url_image: 'https://carrobonito.com/wp-content/uploads/2015/01/sandero-stepway-2015.jpg')
grupo_b.cars.create!(name: 'FORD K', price: 150, rented: false, url_image: 'https://cdn.autopapo.com.br/box/uploads/2018/11/22195928/img_2882.jpg')

puts 'Grupo D'
grupo_d.cars.create!(name: 'HB20', price: 180, rented: false, url_image: 'https://autorac.com.br/wp-content/uploads/2020/10/hb20-vision-1-0-mt-traseira-imagem-descricao.png')
grupo_d.cars.create!(name: 'POLO', price: 180, rented: false, url_image: 'https://images.noticiasautomotivas.com.br/img/f/volkswagen-polo-gts-avalia%C3%A7%C3%A3o-na-34.jpg')
grupo_d.cars.create!(name: 'J3 Turim', price: 180, rented: false, url_image: 'https://www.dezeroacem.com.br/wordpress/wp-content/uploads/2014/03/Jac-Motors-J3-S-flex-Brasil-2014-2015-1.jpg')

puts 'Grupo F'
grupo_f.cars.create!(name: 'HB20s', price: 210, rented: false, url_image: 'https://3.bp.blogspot.com/-bvjCxENEu4A/UTu2DT05rcI/AAAAAAAAMBs/4XkgvAGUCRY/s1600/hb20s.fora.fte2.jpg')
grupo_f.cars.create!(name: 'Logan', price: 210, rented: false, url_image: 'https://cdn.motor1.com/images/mgl/ErxVo/s1/2020-dacia-logan.jpg')
grupo_f.cars.create!(name: 'Voyage', price: 210, rented: false, url_image: 'https://4.bp.blogspot.com/-tFyAUVnx-Qo/VTFsb_sPn6I/AAAAAAACGEw/1k2vSfULa_Y/s1600/VW-Voyage-2016-Evidence.jpg')

puts 'Grupo HX'
grupo_hx.cars.create!(name: 'Duster', price: 280, rented: false, url_image: 'https://upload.wikimedia.org/wikipedia/commons/c/c2/2018_Dacia_Duster_Comfort_1.6.jpg')
grupo_hx.cars.create!(name: 'Renegade', price: 280, rented: false, url_image: 'https://upload.wikimedia.org/wikipedia/commons/7/73/2019_Jeep_Renegade_1.6_Multijet.jpg')
grupo_hx.cars.create!(name: 'Nivus', price: 280, rented: false, url_image: 'https://upload.wikimedia.org/wikipedia/commons/d/d4/2021_Volkswagen_Nivus_Highline_front_view_%28Colombia%29_02.png')
grupo_hx.cars.create!(name: 'T-cross 1.0 TSI', price: 280, rented: false, url_image: 'https://upload.wikimedia.org/wikipedia/commons/8/83/2019_Volkswagen_T-Cross_First_Edition_TSi_1.0.jpg')

puts 'Grupo HW'
grupo_hx.cars.create!(name: 'Jeep Compass', price: 340, rented: false, url_image: 'https://upload.wikimedia.org/wikipedia/commons/e/e0/2019_Jeep_Compass_Limited_2.4L%2C_front_7.6.19.jpg')
grupo_hx.cars.create!(name: 'Creta', price: 340, rented: false, url_image: 'https://img1.wsimg.com/isteam/ip/3b4c4d95-2285-43d6-baaa-bb69469d5a74/hyundai-creta.jpg/:/cr=t:0%25,l:0%25,w:100%25,h:100%25/rs=w:1280')
grupo_hx.cars.create!(name: 'Captur', price: 340, rented: false, url_image: 'https://upload.wikimedia.org/wikipedia/commons/8/83/Renault_Captur_II_at_IAA_2019_IMG_0446.jpg')
grupo_hx.cars.create!(name: 'Kicks', price: 340, rented: false, url_image: 'https://upload.wikimedia.org/wikipedia/commons/2/21/2018_Nissan_Kicks_SV_front_3.30.19.jpg')

puts grupo_fx.to_s
puts grupo_h.to_s
puts grupo_hw.to_s
