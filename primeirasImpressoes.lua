-- Criação de Variáveis de Localização

local meioX = display.contentCenterX -- irá pegar o centro da largura total da tela
local meioY = display.contentCenterY -- irá pegar o centro da altura total da tela
local x = display.contentWidth -- vai de 0 a 1080
local y = display.contentHeight -- Eixo y vai de 0 a 2400


-- Display New Image Rect (exibe uma imagem na tela)
-- Como imagem de fundo (background)

local bg = display.newImageRect("/imagens/bgpraia.png", 1080, 2400 )
bg.x = meioX -- Posso multiplica de 0 a 1
bg.y = meioY -- Posso multiplica de 0 a 1

-- print("Minha Largura atual é: " ..meioX)
-- print("Minha Altura atual é: " ..meioY)

-- Display New Image Rect (exibe uma imagem na tela)

-- local logo = display.newImageRect("/imagens/logo.png", 200, 200 )
-- logo.x = 160
-- logo.y = 450



-- Display New Circle (exibe um objeto em forma de círculo)

-- X: Representa a posição X em pixels.
-- Y: Representa a posiçõa Y em pixels.
-- R: O tamanho do cículo. (raio)

-- --                                    X       Y    R
-- local circulo = display.newCircle(  meioX, y*0.3, 100 )
-- circulo:setFillColor(1, 0, 1)
-- circulo.strokeWidth = 10
-- circulo:setStrokeColor( 1, 1, 0 )


-- Display Text (Exibe um texto no simulador)

-- TEXTO: Inserir meu texto entre aspas simples ou duplas
-- X: Representa a posição x em pixels.
-- Y: Representa a posiçõa y em pixels.
-- F: Representa a fonte. (o valor nil, é a fonte padrão)
-- TF: Tamanho da fonte a ser exibida. 


-- -- --                            TEXTO       X    Y      F    TF
-- local texto = display.newText( "Gustavo", 160, 240, nil, 200 )

-- transition.to( texto, {
--     time = 3000, 
--     rotation = 360,
--     alpha = 0
-- } )

-- Comando para realizar a opacidade.
-- texto.alpha = 1 -- Transparência - Valor pode ir de 0 a 1.

-- Comando para realizar rotações no objeto.
-- texto.rotation = 360 -- Valor em graus de 0 a 360.

-- -- Como colorir um objeto.
-- --                  R  G  B
-- texto:setFillColor (0, 0, 1)
-- -- Padrão RGB - RED (vermelho), GREEN (Verde), BLUE (Azul)


-- Display New Rect (exibe um quadrado ou um retângulo)

-- --                   X    Y    L   A
-- display.newRect( 160, 200, 100, 100 ) --  QUADRADO
-- display.newRect( meioX, 400, 200, 100 ) -- RETÂNGULO

-- X: Representa a posição X em pixels.
-- Y: Representa a posiçõa Y em pixels.
-- L: Representa a largura em pixels.
-- A: Representa a altura em pixels.

-- Display New RoundedRect (exibe um quadrado ou retêngulo arredondado)

-- --                       X    Y    L     A   AR
-- display.newRoundedRect( 160, 1500, 200, 200, 20 ) -- quadrado
-- display.newRoundedRect( 800, 1500, 400, 35, 20 ) -- retângulo

-- X: Representa a posição X em pixels.
-- Y: Representa a posiçõa Y em pixels.
-- L: Representa a largura em pixels.
-- A: Representa a altura em pixels.
-- AR: Representa o arredondamento em pixels.

-- -- Transição de objeto.

-- transition.to( texto, 
-- {
--     time = 3000,
--     rotation = 360
-- } )

-- Display New Polygon (Exibe um novo poligono)
-- Criação de uma estrela.

local vertices = { 0,-110, 27,-35, 105,-35, 43,16, 65,90, 0,45, -65,90, -43,15, -105,-35, -27,-35, }
--                                    x      y       
local estrela = display.newPolygon( meioX, y*0.9, vertices )
-- estrela.fill = { type="image", 
-- filename="imagens/gustavo.png" }
estrela.strokeWidth = 10
-- --                         r  g  b 
-- estrela:setStrokeColor( 1, 1, 0 )

-- transition.to( estrela, {
--     time = 5000, 
--     delay = 5000,
--     rotation = 180,
--     x = 100, 
--     y = 100,
--     alpha = 0.2
-- } )

-- -- Como saber a largura e altura da tela em uso.

-- local larguraTela = display.contentWidth -- irá pegar o tamanho total da largura da tela e armarzenar

-- local alturaTela = display.contentHeight -- irá pegar o tamanho total da altura da tela e armarzenar

-- print ("largura da tela é: " .. larguraTela)
-- print ("altura da tela é: " .. alturaTela)

-- Display Set Status Bar
-- Irá esperar por um valor, sem que as principais opções:
-- display.HiddenStatusBar (ocultar a barra de status)
-- display.DefaultStatusBar (exibe a barra de status)

-- display.setStatusBar( display.HiddenStatusBar )

-- Criando uma função de Transição

function transicao( )
    transition.to( estrela, {
        time = 2000, 
        x = meioX - 200,
    } )
end
transicao()

-- Criando uma função imprimir para verificar a execução do performWithDelay
function imprimir(  )
    print ("Executou")
end

-- Imprimir a função no console para verificar a execução do performWithDelay
--                     tempo   função   vezes
timer.performWithDelay( 1000, imprimir , 10 )

-- Radomização

local valorAleatorio = math.random( 1, 3 )
print(valorAleatorio)

if valorAleatorio == 1 then
    estrela:setFillColor(0,1,0)

elseif valorAleatorio == 2 then 
    display.remove( bg )

else 
    bg:setFillColor(0, 0, 1)
end 

-- Criando uma função de transição uilizando o math.random
function moverEstrela()
    transition.to( estrela, {
        time = 2000,
        x = math.random( 0, x ), -- Posição 0 até o máximo do pronto X
        y = math.random( 0, y ) -- Posção 0 até o máximo do ponto Y    
    } )
end

-- Valores para 10% da tela x*0,1
-- Valores para 90% da tela x*0,9

-- timer.performWithDelay() = irá executar uma função com um determinado tempo e quantidade de repetições
--                     tempo    função     quantidade de repetições
timer.performWithDelay( 2500, moverEstrela, 5 )


-- 15/08


-- -- Criando a função colorir estrela.
-- function colorirEstrela()
--     estrela:setFillColor( 0, 1, 0 )
-- end 

-- -- Criando a função tap - Toque simples.
-- estrela:addEventListener("tap", colorirEstrela)
