local x = display.contentWidth -- Eixo X valor total
local y = display.contentHeight -- Eixo Y valor total

local meioX = display.contentCenterX -- irá pegar o centro da largura total da tela
local meioY = display.contentCenterY -- irá pegar o centro da altura total da tela

-- Display New Image Rect (exibe uma imagem na tela)
-- Como imagem de fundo (background)
local bg = display.newImageRect("/imagens/praia.jpg", 1080, 2400)
bg.x = meioX  
bg.y = meioY

-- Criação do Texto
local texto = display.newText( "Gustavo", meioX, meioY, nil, 200 )
texto:setFillColor (0, 0, 1)

-- Criação de transição para que em 3 segundos o texto se eleve ao ponto 0 do eixo Y.
transition.to( texto, {
    time = 3000, 
    y = 0
} )

-- Criação de transição com Delay (atraso), para que depois de 4 segundos o texto retorne ao ponto original do eixo Y.
transition.to( texto, {
    delay = 4000,
    time = 3000,
    y = meioY 
} )

-- Criação do Efeito Blink (Pisca)
transition.blink(texto, { time = 2000 })


-- Inserir uma foto para usar na transição depois.
local gustavo = display.newImageRect( "/imagens/gustavo.png", 640, 640)
gustavo.x = meioX 
gustavo.y = meioY


-- -- Criação da Função transicao
function transicao( )
    transition.to( gustavo, {
        time = 3000, 
        y = meioY - 100
    } )
end

-- Criação do Timer para execução da Função
timer.performWithDelay( 2000, transicao, 2 )

-- Exemplo de math.random (Randomização de Números)
local numeroAleatorio = math.random( 1, 5)
print("O número da vez é: " ..numeroAleatorio)

-- Exemplo de math.random (Randomização de Números)
local numeroAleatorio = math.random( 1, 3)

-- Utilizando as condicionais para cada número aleatório.
if numeroAleatorio == 1 then 
    display.remove( texto )
    print("O número da vez é: " ..numeroAleatorio.. " Texto removido!")

elseif numeroAleatorio == 2 then 
    display.remove( bg )
    print("O número da vez é: " ..numeroAleatorio.. " Fundo removido!")

else 
    bg:setFillColor(1, 0, 0)
    print("O número da vez é: " ..numeroAleatorio.. " Fundo colorido de vermelho!")
end

-- Criar uma transição de 2 segundos de forma aleatória.
transition.to(gustavo, {
    time = 2000,
    x = math.random(0, x),
    y = math.random( 0, y)
} )


-- Criar uma transição de 2 segundos de forma aleatória, usando a porcentagem da tela de 10% a 90%
transition.to(gustavo, {
    time = 2000,
    x = math.random( x*0.1, x*0.9 ), -- O objeto se move na tela no eixo X entre 10% de x, à 90% de x.
    y = math.random( y*0.1, y*0.9) -- O objeto se move na tela no eixo Y entre 10% de y, à 90% de y.
} )

-- Criando uma função moverGustavo, para poder utilizá-la com o Timer.
function moverGustavo()
transition.to(gustavo, {
    time = 2000,
    x = math.random( x*0.1, x*0.9 ), -- O objeto se move na tela no eixo X entre 10% de x, à 90% de y.
    y = math.random( y*0.1, y*0.9) -- O objeto se move na tela no eixo Y entre 10% de y, à 90% de y.
} )
end 

-- Utilizando o timer para ativar a transição a cada 2 segundos e meio, repetindo 5 vezes.
timer.performWithDelay( 2500, moverGustavo, 5 )


-- Criando a função para remover a foto do Gustavo da tela.
function removerGustavo()
    display.remove(gustavo)

    local venceu = display.newText( "Vitória", meioX, meioY, nil, 200 )
    venceu:setFillColor(0,1,0)
end

-- Adicionando o EventListener para ativar a função removerGustavo
gustavo:addEventListener("tap", removerGustavo)
