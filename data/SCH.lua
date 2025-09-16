function get_sets()
    mote_include_version = 2
    include('Mote-Include.lua')
    set_language('japanese')
end


function job_setup()
    state.Buff['意気昂然の章']      = buffactive['意気昂然の章'] or false
    state.Buff['一心精進の章']      = buffactive['一心精進の章'] or false
    state.Buff['簡素清貧の章']      = buffactive['簡素清貧の章'] or false
    state.Buff['机上演習:蓄積中']   = buffactive['机上演習:蓄積中'] or false
    state.Buff['気炎万丈の章']      = buffactive['気炎万丈の章'] or false
    state.Buff['虚誘掩殺の策']      = buffactive['虚誘掩殺の策'] or false
    state.Buff['勤倹小心の章']      = buffactive['勤倹小心の章'] or false
    state.Buff['疾風迅雷の章']      = buffactive['疾風迅雷の章'] or false
    state.Buff['震天動地の章']      = buffactive['震天動地の章'] or false
    state.Buff['天衣無縫の章']      = buffactive['天衣無縫の章'] or false
    state.Buff['電光石火の章']      = buffactive['電光石火の章'] or false
    state.Buff['不惜身命の章']      = buffactive['不惜身命の章'] or false
    state.Buff['無憂無風の章']      = buffactive['無憂無風の章'] or false
    state.Buff['令狸執鼠の章']      = buffactive['令狸執鼠の章'] or false
    state.Buff['白のグリモア']      = buffactive['白のグリモア'] or false
    state.Buff['黒のグリモア']      = buffactive['黒のグリモア'] or false
    state.Buff['白の補遺']          = buffactive['白の補遺'] or false
    state.Buff['黒の補遺']          = buffactive['黒の補遺'] or false
    
    --gs c cycle IdleMode
    state.IdleMode:options('Normal','Refresh')
    
    --gs c cycle OffenseMode
    state.OffenseMode:options('Normal','Vagary')
    
    -- gs c cycle HybridMode
    state.HybridMode:options('Normal')

    -- gs c cycle WeaponskillMode
    state.WeaponskillMode:options('Normal')
        
    -- gs c cycle MainWeapons
    state.MainWeapons   = M{'Musa','BunzisRod','Malevolence','Daybreak'}
    
    -- gs c cycle SubWeapons
    state.SubWeapons    = M{'Khonsu','AmmurapiShield','Daybreak'}

    state.Seidr  = M(false, 'Seidr Cotehardie')

end


function customize_idle_set(idleSet)
    if state.Buff['机上演習:蓄積中'] then
        idleSet = set_combine(idleSet, sets.buff['机上演習'])
    end
    return idleSet
end


function job_post_precast(spell, action, spellMap, eventArgs)
    if string.find(spell.type, 'Magic') then
        if spell.name == 'ディスペガ' then 
        elseif buffactive['黒のグリモア'] or buffactive['黒の補遺'] then
            equip(sets.precast.FC.Black)
        else
            equip(sets.precast.FC.White)
        end
    end
end


function job_post_midcast(spell, action, spellMap, eventArgs)
    for buff,active in pairs(state.Buff) do
        if active and sets.buff[buff] then
            if spell.name == 'インパクト' 
            or (spell.name == 'オーラ' and buff =='電光石火の章')
            or (spell.name == 'オーラ' and buff =='簡素清貧の章') then
                --バフ着替えなし
                --・インパクト
                --・オーラ（電光石火の章）
                --・オーラ（簡素清貧の章）
            else
                equip(sets.buff[buff])
            end
        end
    end 

    if (spell.skill == '精霊魔法' and spellMap ~= 'Helix') or (spellMap == 'Cure' or spellMap == 'Curaga') then
        equip(get_hachirin(spell.element))
    end

    if state.Seidr.value then
        equip(sets.Seidr)
    end
end


function job_state_change(stateField, newValue, oldValue)
    if stateField == 'Offense Mode' then
        if newValue == 'Vagary' then
            equip(sets.Vagary)
            disable('range','ammo','head','neck','left_ear','right_ear','body','hands','left_ring','right_ring','back','waist','legs','feet')
        else
            enable('range','ammo','head','neck','left_ear','right_ear','body','hands','left_ring','right_ring','back','waist','legs','feet')
            IdleMelee()
        end
    end
end


function job_buff_change(buff, gain)
    if buff == "机上演習:蓄積中" and gain then 
        equip(sets.buff['机上演習'])
    elseif (buff == "黒のグリモア" or buff == "黒の補遺" or buff == "白のグリモア" or buff == "白の補遺") and gain then
        send_command('gs c lockstyleset')
        IdleMelee()
    end
end


--▼▼▼▼▼▼震天動地連携用▼▼▼▼▼
sc_mb = {
    ['溶解'] = {'炎'},
    ['硬化'] = {'氷'},
    ['炸裂'] = {'風'},
    ['切断'] = {'土'},
    ['衝撃'] = {'雷'},
    ['振動'] = {'水'},
    ['貫通'] = {'光'},
    ['収縮'] = {'闇'},
    ['核熱'] = {'炎', '光'},
    ['重力'] = {'土', '闇'},
    ['分解'] = {'風', '雷'},
    ['湾曲'] = {'氷', '水'},
}


function custom_self_command(cmdParams, eventArgs)
    if cmdParams[1] == 'lockstyleset' then --ロックスタイル固定処理
        if buffactive['黒のグリモア'] or buffactive['黒の補遺'] then
            send_command('gs c set MainWeapons BunzisRod; wait 0.1; gs c set SubWeapons AmmurapiShield; wait 1; input /lockstyleset '..lockstyleset_black)

        elseif buffactive['白のグリモア'] or buffactive['白の補遺'] then
            send_command('gs c set MainWeapons Musa; wait 0.1; gs c set SubWeapons Khonsu; wait 1; input /lockstyleset '..lockstyleset_white)

        else
            send_command('input /lockstyleset '..lockstyleset_white)

        end
    elseif cmdParams[1] == 'sc' then --【学者】震天動地連携処理
        if cmdParams[2] == 'start' then
            disp_start_skillchain_message(cmdParams[3],cmdParams[4])

        elseif cmdParams[2] == 'end' then
            disp_end_skillchain_message(cmdParams[3],cmdParams[4])

        else
            windower.add_to_chat(123,'invalid argment: ' .. command)
        end
    end
end


function get_auto_translate_char_squence(phrase)
    local at_start = 0xFD
    local at_end = 0xFD
    local at_type = 0x02
    local at_lang = 0x01
    local phrase_id = gearswap.res.auto_translates:with('ja', phrase).id

    if phrase_id then
        local phrase_id_upper = bit.band(bit.rshift(phrase_id, 8), 0xFF)
        local phrase_id_lower = bit.band(phrase_id, 0xFF)
        
        if phrase_id_lower == 0x00 then
            return nil
        else
            return string.char(at_start, at_type, at_lang, phrase_id_upper, phrase_id_lower, at_end)
        end
    end
    return nil
end


function disp_start_skillchain_message(sc_name,count)
    local sc_msg = get_auto_translate_char_squence(sc_name)
    local sc_mb_msg = {}

    for i, v in ipairs(sc_mb[sc_name]) do
        sc_mb_msg[i] = get_auto_translate_char_squence(v)
    end

    local msg = 'input /p '..windower.to_shift_jis(count)..sc_msg
    
    for i,v in ipairs(sc_mb_msg) do
        msg = msg..v
    end
    local start_msg = get_auto_translate_char_squence('準備中です。')

    msg = msg..start_msg..windower.to_shift_jis(' → ')..' <t> <call21>'
    send_command(msg)
end


function disp_end_skillchain_message(sc_name,count)
    local sc_msg = get_auto_translate_char_squence(sc_name)
    local sc_mb_msg = {}

    for i, v in ipairs(sc_mb[sc_name]) do
        sc_mb_msg[i] = get_auto_translate_char_squence(v)
    end

    local msg = 'input /p '..windower.to_shift_jis(count)..sc_msg
    
    for i,v in ipairs(sc_mb_msg) do
        msg = msg..v
    end
    local end_msg = get_auto_translate_char_squence('全力で攻撃だ！')

    msg = msg..end_msg..windower.to_shift_jis(' → ')..' <t> '..windower.to_shift_jis('※').. '<recast='..windower.to_shift_jis("戦術魔道書")..'>'
    send_command(msg)
end
--▲▲▲▲▲震天動地連携用▲▲▲▲▲