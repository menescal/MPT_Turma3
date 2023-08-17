local x = display.contentWidth -- Eixo X valor total
local y = display.contentHeight -- Eixo Y valor total

local meioX = display.contentCenterX -- irá pegar o centro da largura total da tela
local meioY = display.contentCenterY -- irá pegar o centro da altura total da tela

-- print ("Minha Largura atual é: " ..x)
-- print ("Minha Altura atual é: " ..y)


-- Display New Image Rect (exibe uma imagem na tela)
-- Como imagem de fundo (background)
local bg = display.newImageRect("/imagens/praia.jpg", 1080, 2400)
bg.x = meioX  
bg.y = meioY

-- Criação do Texto
local texto = display.newText( "Gustavo", meioX, meioY, nil, 200 )
texto:setFillColor (0, 0, 1)

-- -- Criação de Transição
-- transition.to( texto, {
--     time=5000, 
--     delay=3000, 
--     alpha=0
-- } )

-- -- Criação do Blink ("Pisca-pisca")
-- transition.blink(texto, {time=1000})

-- Criação de Função de Transição
function transicao()
    transition.to( texto, {
        time = 2000,
        x = math.random( 0, x ),
        y = math.random( 0, y )
    } )
end


-- -- Randomização

-- local numeroRandomico = math.random(1, 10 )
-- print ("Número Randomico da vez é:" ..numeroRandomico)

-- -- Exemplo de Randomização

-- local valorAleatorio = math.random( 1, 3 )
-- print("O Valor da vez é: " ..valorAleatorio)

-- if valorAleatorio == 1 then 
--     texto:setFillColor(0, 1, 0)
--     print("Muda a cor do texto para verde")

-- elseif valorAleatorio == 2 then 
--     display.remove( bg )
--     print("Fundo de Tela Removido")

-- else 
--     bg:setFillColor(1, 0, 1)
--     print("Fundo de tela colorido com roxo")
-- end 
-- function imprimir( )
--     print("executou")
-- end

-- Timer
timer.performWithDelay( 1000, transicao, 10 )
