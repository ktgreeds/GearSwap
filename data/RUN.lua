function get_sets()
    mote_include_version = 2
    include('Mote-Include.lua')
    set_language('japanese')
end


function job_setup()
    state.Buff['エンボルド']       = buffactive['エンボルド'] or false
    state.Buff['バットゥタ']       = buffactive['バットゥタ'] or false
    state.Buff['ファストキャスト'] = buffactive['ファストキャスト'] or false
    
    -- gs c cycle IdleMode
    state.IdleMode:options('Normal')
    
    -- gs c cycle OffenseMode
    state.OffenseMode:options('Normal','Stp')

    -- gs c cycle HybridMode
    state.HybridMode:options('Normal','Parry','KnockBack')
    
    -- gs c cycle WeaponskillMode
    state.WeaponskillMode:options('Normal', 'SubtleBlow')

    -- gs c cycle MainWeapons
    state.MainWeapons   = M{'Epeolatry'}

    -- gs c cycle SubWeapons
    state.SubWeapons    = M{'Khonsu','AlberStrap'}

    -- gs c cycle RuneText
    state.RuneText = M(false, 'ルーン')
end


function job_post_midcast(spell, action, spellMap, eventArgs) 
    for buff,active in pairs(state.Buff) do
        if active and sets.buff[buff] then
            equip(sets.buff[buff])
        end
    end

    if string.find(spell.type, 'Magic') then
        local fc=70/100 --自信のFCを左辺にセット
        if buffactive['ファストキャスト'] then
            --フサルクトラウザ装備時メリポのインスパイア1につき+12％
            fc = fc + 12/100 --インスパイア1
            --fc = fc + 24/100 --インスパイア2
            --fc = fc + 36/100 --インスパイア3
            --fc = fc + 48/100 --インスパイア4
            --fc = fc + 60/100 --インスパイア5
        end
        if player.sub_job == '赤' then
            fc = fc + 15/100
        end
        if fc >= 80/100 then
            fc = 80/100
        end

        equip(sets.midcast.interruption)
        local adjust=0.9
        local cast_time = (spell.cast_time*(1-fc))*adjust    
        
        if spellMap == 'Cure' then
            eventArgs.handled = true
            send_command('wait '..cast_time..'; gs equip sets.midcast.Cure')

        elseif spellMap == 'Phalanx' then
            eventArgs.handled = true
            send_command('wait '..cast_time..'; gs equip sets.midcast.Phalanx')

        elseif spell.name == 'ストンスキン' then
            eventArgs.handled = true
            send_command('wait '..cast_time..'; gs equip sets.midcast.Stoneskin')

        elseif spellMap == 'Regen' then
            eventArgs.handled = true
            send_command('wait '..cast_time..'; gs equip sets.midcast.Regen')

        elseif spell.skill == '強化魔法' then
            eventArgs.handled = true
            send_command('wait '..cast_time..'; gs equip sets.midcast.EnhancingMagic')
        else
            eventArgs.handled = true
            send_command('wait '..cast_time..'; gs equip sets.Enmity')
        end
    end
end


function job_buff_change(buff, gain)
    if buff == 'バットゥタ' and gain then
        send_command('gs c set HybridMode Parry')

    elseif not state.Buff['バットゥタ'] then
        send_command('gs c set HybridMode Normal')

    elseif buff == 'エンボルド' gain then
        equip(sets.buff['エンボルド'])
        disable('back')
        
    elseif not state.Buff['エンボルド'] then
        enable('back')
        IdleMelee()
    end
end


function custom_self_command(cmdParams, eventArgs)
    if cmdParams[1] =='RuneText' then --【剣】ルーンカンニングペーパ－
        if state.RuneText.value then
            showTextRune()
        else
            hideTextRune()
        end
    end
end


--▼▼▼▼▼▼ルーンカンニングペーパー▼▼▼▼▼
local RUnetexts = require('texts')
message={
    [1] = {name='イグニス　', desc1='火：',desc2='（氷：',desc3='麻痺、バインド）'},
    [2] = {name='ゲールス　', desc1='氷：',desc2='（風：',desc3='静寂、ヘヴィ）'},
    [3] = {name='フラブラ　', desc1='風：',desc2='（土：',desc3='石化、テラー、スロウ）'},
    [4] = {name='テッルス　', desc1='土：',desc2='（雷：',desc3='スタン）'},
    [5] = {name='スルポール', desc1='雷：',desc2='（水：',desc3='毒）'},
    [6] = {name='ウンダ　　', desc1='水：',desc2='（火：',desc3='病気、悪疫、アムネジア）'},
    [7] = {name='ルックス　', desc1='光：',desc2='（闇：',desc3='呪い、睡眠）'},
    [8] = {name='テネブレイ', desc1='闇：',desc2='（光：',desc3='魅了、睡眠）'},
}
text_box = RUnetexts.new('${text}',{text={font='Meiryo', size=10}, pos={x=10, y=220}, padding = 5, bg={alpha=180}})
text_box.text='属性　　　　　　耐性\n'..
'\\cs(255,128,128)'..message[1].desc1..message[1].name..message[1].desc2..message[1].desc3..'\\cr'..'\n'..
'\\cs(128,255,255)'..message[2].desc1..message[2].name..message[2].desc2..message[2].desc3..'\\cr'..'\n'..
'\\cs(128,255,128)'..message[3].desc1..message[3].name..message[3].desc2..message[3].desc3..'\\cr'..'\n'..
'\\cs(255,255,128)'..message[4].desc1..message[4].name..message[4].desc2..message[4].desc3..'\\cr'..'\n'..
'\\cs(255,128,255)'..message[5].desc1..message[5].name..message[5].desc2..message[5].desc3..'\\cr'..'\n'..
'\\cs(128,128,255)'..message[6].desc1..message[6].name..message[6].desc2..message[6].desc3..'\\cr'..'\n'..
'\\cs(255,255,255)'..message[7].desc1..message[7].name..message[7].desc2..message[7].desc3..'\\cr'..'\n'..
'\\cs(128,128,128)'..message[8].desc1..message[8].name..message[8].desc2..message[8].desc3..'\\cr'

function showTextRune()
    text_box:show()
end

function hideTextRune()
    text_box:hide()
end
--▲▲▲▲▲ルーンカンニングペーパー▲▲▲▲▲
