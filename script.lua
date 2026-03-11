-- ==================== AUTO JJs BR - GUI BONITA + ATÉ 100 + PULO FIXADO ====================
-- Atualizado: Limite 100 | Números por extenso completos

local Players = game:GetService("Players")
local TextChatService = game:GetService("TextChatService")
local player = Players.LocalPlayer

-- Lista completa até 100 (com !)
local words = {
    [1] = "UM!", [2] = "DOIS!", [3] = "TRÊS!", [4] = "QUATRO!", [5] = "CINCO!",
    [6] = "SEIS!", [7] = "SETE!", [8] = "OITO!", [9] = "NOVE!", [10] = "DEZ!",
    [11] = "ONZE!", [12] = "DOZE!", [13] = "TREZE!", [14] = "QUATORZE!", [15] = "QUINZE!",
    [16] = "DEZESSEIS!", [17] = "DEZESSETE!", [18] = "DEZOITO!", [19] = "DEZENOVE!", [20] = "VINTE!",
    [21] = "VINTE E UM!", [22] = "VINTE E DOIS!", [23] = "VINTE E TRÊS!", [24] = "VINTE E QUATRO!", [25] = "VINTE E CINCO!",
    [26] = "VINTE E SEIS!", [27] = "VINTE E SETE!", [28] = "VINTE E OITO!", [29] = "VINTE E NOVE!", [30] = "TRINTA!",
    [31] = "TRINTA E UM!", [32] = "TRINTA E DOIS!", [33] = "TRINTA E TRÊS!", [34] = "TRINTA E QUATRO!", [35] = "TRINTA E CINCO!",
    [36] = "TRINTA E SEIS!", [37] = "TRINTA E SETE!", [38] = "TRINTA E OITO!", [39] = "TRINTA E NOVE!", [40] = "QUARENTA!",
    [41] = "QUARENTA E UM!", [42] = "QUARENTA E DOIS!", [43] = "QUARENTA E TRÊS!", [44] = "QUARENTA E QUATRO!", [45] = "QUARENTA E CINCO!",
    [46] = "QUARENTA E SEIS!", [47] = "QUARENTA E SETE!", [48] = "QUARENTA E OITO!", [49] = "QUARENTA E NOVE!", [50] = "CINQUENTA!",
    [51] = "CINQUENTA E UM!", [52] = "CINQUENTA E DOIS!", [53] = "CINQUENTA E TRÊS!", [54] = "CINQUENTA E QUATRO!", [55] = "CINQUENTA E CINCO!",
    [56] = "CINQUENTA E SEIS!", [57] = "CINQUENTA E SETE!", [58] = "CINQUENTA E OITO!", [59] = "CINQUENTA E NOVE!", [60] = "SESSENTA!",
    [61] = "SESSENTA E UM!", [62] = "SESSENTA E DOIS!", [63] = "SESSENTA E TRÊS!", [64] = "SESSENTA E QUATRO!", [65] = "SESSENTA E CINCO!",
    [66] = "SESSENTA E SEIS!", [67] = "SESSENTA E SETE!", [68] = "SESSENTA E OITO!", [69] = "SESSENTA E NOVE!", [70] = "SETENTA!",
    [71] = "SETENTA E UM!", [72] = "SETENTA E DOIS!", [73] = "SETENTA E TRÊS!", [74] = "SETENTA E QUATRO!", [75] = "SETENTA E CINCO!",
    [76] = "SETENTA E SEIS!", [77] = "SETENTA E SETE!", [78] = "SETENTA E OITO!", [79] = "SETENTA E NOVE!", [80] = "OITENTA!",
    [81] = "OITENTA E UM!", [82] = "OITENTA E DOIS!", [83] = "OITENTA E TRÊS!", [84] = "OITENTA E QUATRO!", [85] = "OITENTA E CINCO!",
    [86] = "OITENTA E SEIS!", [87] = "OITENTA E SETE!", [88] = "OITENTA E OITO!", [89] = "OITENTA E NOVE!", [90] = "NOVENTA!",
    [91] = "NOVENTA E UM!", [92] = "NOVENTA E DOIS!", [93] = "NOVENTA E TRÊS!", [94] = "NOVENTA E QUATRO!", [95] = "NOVENTA E CINCO!",
    [96] = "NOVENTA E SEIS!", [97] = "NOVENTA E SETE!", [98] = "NOVENTA E OITO!", [99] = "NOVENTA E NOVE!", [100] = "CEM!"
}

-- Variáveis
local maxNumber = 20
local delayTime = 1.8
local doJump = true
local running = false

-- Canal de chat
local generalChannel
if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
    generalChannel = TextChatService:WaitForChild("TextChannels"):WaitForChild("RBXGeneral", 5)
end

-- ====================== GUI (mesma bonita) ======================
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "AutoJJsBR_Bonita"
screenGui.ResetOnSpawn = false
screenGui.Parent = (gethui and gethui()) or game:GetService("CoreGui") or player:WaitForChild("PlayerGui")

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 360, 0, 450)
mainFrame.Position = UDim2.new(0.5, -180, 0.5, -225)
mainFrame.BackgroundColor3 = Color3.fromRGB(15, 35, 15)
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = screenGui
mainFrame.BackgroundTransparency = 0.1

local uiGradient = Instance.new("UIGradient")
uiGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(20, 60, 20)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(5, 25, 5))
}
uiGradient.Rotation = 90
uiGradient.Parent = mainFrame

local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(0, 16)
uiCorner.Parent = mainFrame

local uiStroke = Instance.new("UIStroke")
uiStroke.Color = Color3.fromRGB(0, 100, 0)
uiStroke.Thickness = 2
uiStroke.Transparency = 0.4
uiStroke.Parent = mainFrame

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 50)
title.BackgroundTransparency = 1
title.Text = "AUTO JJs BR"
title.TextColor3 = Color3.fromRGB(200, 255, 200)
title.TextScaled = true
title.Font = Enum.Font.GothamBlack
title.TextSize = 28
title.Parent = mainFrame

local subtitle = Instance.new("TextLabel")
subtitle.Size = UDim2.new(1, 0, 0, 20)
subtitle.Position = UDim2.new(0, 0, 0, 45)
subtitle.BackgroundTransparency = 1
subtitle.Text = "Contagem Militar Automática (até 100)"
subtitle.TextColor3 = Color3.fromRGB(150, 255, 150)
subtitle.TextScaled = true
subtitle.Font = Enum.Font.Gotham
subtitle.TextSize = 14
subtitle.Parent = mainFrame

local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 40, 0, 40)
closeBtn.Position = UDim2.new(1, -45, 0, 5)
closeBtn.BackgroundColor3 = Color3.fromRGB(180, 40, 40)
closeBtn.Text = "✕"
closeBtn.TextColor3 = Color3.new(1,1,1)
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 24
closeBtn.Parent = mainFrame

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 10)
closeCorner.Parent = closeBtn

closeBtn.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)

local function createLabel(text, posY)
    local lbl = Instance.new("TextLabel")
    lbl.Size = UDim2.new(0.9, 0, 0, 25)
    lbl.Position = UDim2.new(0.05, 0, 0, posY)
    lbl.BackgroundTransparency = 1
    lbl.Text = text
    lbl.TextColor3 = Color3.fromRGB(220, 255, 220)
    lbl.TextScaled = true
    lbl.Font = Enum.Font.GothamSemibold
    lbl.Parent = mainFrame
    return lbl
end

local function createBox(default, posY)
    local box = Instance.new("TextBox")
    box.Size = UDim2.new(0.9, 0, 0, 40)
    box.Position = UDim2.new(0.05, 0, 0, posY)
    box.BackgroundColor3 = Color3.fromRGB(10, 20, 10)
    box.Text = default
    box.TextColor3 = Color3.fromRGB(200, 255, 200)
    box.TextScaled = true
    box.Font = Enum.Font.Gotham
    box.ClearTextOnFocus = false
    local corner = Instance.new("UICorner", box)
    corner.CornerRadius = UDim.new(0, 8)
    box.Parent = mainFrame
    return box
end

createLabel("Até qual número? (máx 100)", 80)
local boxMax = createBox("20", 105)

createLabel("Velocidade (segundos)", 150)
local boxSpeed = createBox("1.8", 175)

local toggleBtn = Instance.new("TextButton")
toggleBtn.Size = UDim2.new(0.9, 0, 0, 50)
toggleBtn.Position = UDim2.new(0.05, 0, 0, 225)
toggleBtn.BackgroundColor3 = Color3.fromRGB(0, 180, 0)
toggleBtn.Text = "PULAR: LIGADO ✓"
toggleBtn.TextColor3 = Color3.new(1,1,1)
toggleBtn.Font = Enum.Font.GothamBold
toggleBtn.TextSize = 20
toggleBtn.Parent = mainFrame

local toggleCorner = Instance.new("UICorner", toggleBtn)
toggleCorner.CornerRadius = UDim.new(0, 10)

toggleBtn.MouseButton1Click:Connect(function()
    doJump = not doJump
    toggleBtn.Text = doJump and "PULAR: LIGADO ✓" or "PULAR: DESLIGADO ✗"
    toggleBtn.BackgroundColor3 = doJump and Color3.fromRGB(0, 180, 0) or Color3.fromRGB(180, 0, 0)
end)

local status = Instance.new("TextLabel")
status.Size = UDim2.new(0.9, 0, 0, 40)
status.Position = UDim2.new(0.05, 0, 0, 285)
status.BackgroundTransparency = 1
status.Text = "Pronto para iniciar"
status.TextColor3 = Color3.fromRGB(255, 220, 100)
status.TextScaled = true
status.Font = Enum.Font.GothamSemibold
status.Parent = mainFrame

local startBtn = Instance.new("TextButton")
startBtn.Size = UDim2.new(0.43, 0, 0, 55)
startBtn.Position = UDim2.new(0.05, 0, 0, 335)
startBtn.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
startBtn.Text = "INICIAR ▶"
startBtn.TextColor3 = Color3.new(1,1,1)
startBtn.Font = Enum.Font.GothamBlack
startBtn.TextSize = 22
startBtn.Parent = mainFrame
local startCorner = Instance.new("UICorner", startBtn); startCorner.CornerRadius = UDim.new(0, 12)

local stopBtn = Instance.new("TextButton")
stopBtn.Size = UDim2.new(0.43, 0, 0, 55)
stopBtn.Position = UDim2.new(0.52, 0, 0, 335)
stopBtn.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
stopBtn.Text = "PARAR ■"
stopBtn.TextColor3 = Color3.new(1,1,1)
stopBtn.Font = Enum.Font.GothamBlack
stopBtn.TextSize = 22
stopBtn.Parent = mainFrame
local stopCorner = Instance.new("UICorner", stopBtn); stopCorner.CornerRadius = UDim.new(0, 12)

-- ====================== FUNÇÕES ======================
local function sendChat(msg)
    if generalChannel then
        generalChannel:SendAsync(msg)
    else
        warn("TextChannel não encontrado.")
        status.Text = "Erro: Chat não detectado"
        status.TextColor3 = Color3.fromRGB(255, 100, 100)
    end
end

local function startCounting()
    if running then return end
    
    maxNumber = tonumber(boxMax.Text) or 20
    delayTime = tonumber(boxSpeed.Text) or 1.8
    
    if maxNumber < 1 then maxNumber = 1 end
    if maxNumber > 100 then 
        maxNumber = 100 
        status.Text = "Limite ajustado para 100!"
    end
    
    if maxNumber >= 50 then
        status.Text = "Cuidado! Contagem alta ("..maxNumber..") pode causar kick por flood. Use delay 2.0+"
        status.TextColor3 = Color3.fromRGB(255, 150, 50)
        task.wait(3)  -- Mostra aviso por 3s
    end
    
    running = true
    status.Text = "Contando... 0/" .. maxNumber
    status.TextColor3 = Color3.fromRGB(100, 255, 100)
    
    for i = 1, maxNumber do
        if not running then break end
        
        status.Text = "Contando... " .. i .. "/" .. maxNumber
        sendChat(words[i] or (i .. "!"))
        
        if doJump then
            local char = player.Character
            if char then
                local humanoid = char:FindFirstChild("Humanoid")
                if humanoid then
                    if humanoid:GetState() ~= Enum.HumanoidStateType.Jumping and humanoid.FloorMaterial ~= Enum.Material.Air then
                        humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                        print("Pulo forçado no número " .. i)
                    else
                        print("Pulo ignorado (já no ar) no " .. i)
                    end
                end
            end
        end
        
        task.wait(delayTime)
    end
    
    running = false
    status.Text = "Finalizado! (" .. maxNumber .. ")"
    status.TextColor3 = Color3.fromRGB(255, 220, 100)
end

startBtn.MouseButton1Click:Connect(startCounting)
stopBtn.MouseButton1Click:Connect(function()
    running = false
    status.Text = "Parado manualmente"
    status.TextColor3 = Color3.fromRGB(255, 100, 100)
end)

print("Auto JJs BR atualizado - Agora até 100! Teste com delay alto pra contagens grandes.")
