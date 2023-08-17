local x = display.contentWidth -- Eixo X valor total
local y = display.contentHeight -- Eixo Y valor total

local meioX = display.contentCenterX -- irá pegar o centro da largura total da tela
local meioY = display.contentCenterY -- irá pegar o centro da altura total da tela


-- Exemplo 01 - Exemplo de Tap

-- Criando o fundo da aplicação
local bg = display.newRect( meioX, meioY, x, y )
bg:setFillColor (0.5, 0, 1 ) 

-- Criação do botão vermelho
local botaoVermelho = display.newCircle(  x*0.5, y*0.3, 150 )
botaoVermelho:setFillColor (1, 0, 0) -- Preenchimento de vermelho

-- Criação do botão verde
local botaoVerde = display.newCircle(  x*0.5, y*0.7, 150 )
botaoVerde:setFillColor (0, 1, 0) -- Preenchimento de verde

-- Criação da função altera cor
function alteraCor()
    bg:setFillColor (0.5, 0, 0)
    print ( "Cor do fundo alterada!" )
end

-- Adicionando o EventListener para ativar a função alteraCor através do toque no botão vermelho.
botaoVermelho:addEventListener("tap", alteraCor)

-- Criação da função remove fundo
function removeFundo()
    display.remove( bg )
    print ( "Fundo removido!" )
end

-- Adicionando o EventListener para ativar a função removeFundo através do toque no botão verde.
botaoVerde:addEventListener("tap", removeFundo)


-- Exemplo 02 - Exemplo de Touch

-- Criando o fundo da aplicação
local bg = display.newRect( meioX, meioY, x, y )
bg:setFillColor (0.5, 0, 1 ) 

-- Criação do botão vermelho
local botaoVermelho = display.newCircle(  x*0.5, y*0.3, 150 )
botaoVermelho:setFillColor (1, 0, 0) -- Preenchimento de vermelho

-- Criação do botão verde
local botaoVerde = display.newCircle(  x*0.5, y*0.7, 150 )
botaoVerde:setFillColor (0, 1, 0) -- Preenchimento de verde

-- Criação da função toque botão vermelho
function toqueVermelho()
        print ( "Botão Vermelho Tocado" )
end

-- Adicionando o EventListener para ativar a função toqueVermelho através do toque no botão vermelho.
botaoVermelho:addEventListener("touch", toqueVermelho)

-- Criação da função toque botão verde
function toqueVerde()
    print ( "Botão Verde Tocado" )
end

-- Adicionando o EventListener para ativar a função toqueVerde através do toque no botão verde.
botaoVerde:addEventListener("touch", toqueVerde)



-- Exemplo 03 - Exemplo de Event

-- Criando o fundo da aplicação
local bg = display.newRect( meioX, meioY, x, y )
bg:setFillColor (0.5, 0, 1 ) 

-- Criação do botão vermelho
local botaoVermelho = display.newCircle(  x*0.5, y*0.3, 150 )
botaoVermelho:setFillColor (1, 0, 0) -- Preenchimento de vermelho

-- Criação do botão verde
local botaoVerde = display.newCircle(  x*0.5, y*0.7, 150 )
botaoVerde:setFillColor (0, 1, 0) -- Preenchimento de verde

-- Criação da função verifica toque
function verificaToque( event )
    if event.phase == "began" then -- Verifica a fase do  evento de entrada
        print ( "Entrada do toque")
    
    elseif event.phase == "ended" then -- Verifica a fase do evento de saída
        print ( "Saída do toque" ) 

    elseif event.phase == "moved" then -- Verifica a fase do evento de arrastar
        print( "Arrastando o toque" )

    elseif event.phase == "cancelled" then -- Verifica a fase de evento de cancelamento do toque
        print( "Toque cancelado!" )
    end

end

-- Adicionando o EventListener para ativar a função verificaToque através do toque no botão vermelho.
botaoVermelho:addEventListener("touch", verificaToque)

-- Adicionando o EventListener para ativar a função verificaToque através do toque no botão verde.
botaoVerde:addEventListener("touch", verificaToque)

-- Exemplo 04 - Exemplo de Event Target

-- Criando o fundo da aplicação
local bg = display.newRect( meioX, meioY, x, y )
bg:setFillColor (0.5, 0, 1 ) 

-- Criação do botão vermelho
local botaoVermelho = display.newCircle(  x*0.5, y*0.3, 150 )
botaoVermelho:setFillColor (1, 0, 0) -- Preenchimento de vermelho

-- Criação do botão verde
local botaoVerde = display.newCircle(  x*0.5, y*0.7, 150 )
botaoVerde:setFillColor (0, 1, 0) -- Preenchimento de verde

-- Criação da função verifica toque
function verificaToque( event )
    if event.phase == "began" then
        if event.target == botaoVermelho then
            bg:setFillColor (0.6, 0, 0) 
            
        elseif event.target == botaoVerde then
            bg:setFillColor (0, 0.6, 0)
        end
    end
end

-- Adicionando o EventListener para ativar a função verificaToque através do toque no botão vermelho.
botaoVermelho:addEventListener("touch", verificaToque)

-- Adicionando o EventListener para ativar a função verificaToque através do toque no botão verde.
botaoVerde:addEventListener("touch", verificaToque)

-- Exemplo 05 - Exemplo de Grupos

local grupoBg = display.newGroup() -- Criação do Grupo Background (BASE)
local grupoJogo = display.newGroup() -- Criação do grupo de elementos do jogo (RECHEIO)
local grupoGUI = display.newGroup() -- Criação do grupo da GUI (COBERTURA)

-- Criando o fundo da aplicação
local bg = display.newRect( grupoBg, meioX, meioY, x, y )
bg:setFillColor (0.5, 0, 1 ) 

-- Criação do Objeto Jogador
local jogador = display.newCircle( grupoJogo, meioX, meioY, 150 )

-- Criação do Chão do Jogo
local chao = display.newRect( grupoJogo, meioX, y*0.7, x, 200 )

-- Exemplo 6 - Aplicando Aplha a todo o grupo.

-- Aplicando o Alpha a todo o grupo do Jogo
grupoJogo.alpha = 0.8


-- Para finalizar o dia, exibir o exemplo do Jogo Highway Race
