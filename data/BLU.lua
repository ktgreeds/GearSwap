function get_sets()
    mote_include_version = 2    
    include('Mote-Include.lua')
    set_language('japanese')
end


function job_setup()
    state.Buff["エフラックス"]       = buffactive["エフラックス"] or false
    state.Buff["エンチェーンメント"] = buffactive["エンチェーンメント"] or false
    state.Buff["コンバージェンス"]   = buffactive["コンバージェンス"] or false
    state.Buff["ディフュージョン"]   = buffactive["ディフュージョン"] or false
    state.Buff["ブルーチェーン"]     = buffactive["ブルーチェーン"] or false
    state.Buff["ブルーバースト"]     = buffactive["ブルーバースト"] or false
    
    -- gs c cycle IdleMode
    state.IdleMode:options('Normal','Refresh')
    
    -- gs c cycle OffenseMode
    state.OffenseMode:options('Normal','LockWeapons')
    
    -- gs c cycle HybridMode
    state.HybridMode:options('Normal')

    -- gs c cycle WeaponskillMode
    state.WeaponskillMode:options('Normal')

    -- gs c cycle MainWeapons
    state.MainWeapons   = M{'Tizona','Naegling','Maxentius','QutrubKnife'}
    
    -- gs c cycle SubWeapons
    state.SubWeapons    = M{'SakpatasSword'}
    
    -- gs c cycle TreasureHunter
    state.TreasureHunter = M(false)

    -- gs c cycle LockWeapons
    state.LockWeapons = M(false)
end


function job_post_midcast(spell, action, spellMap, eventArgs)
    if spell.skill == '青魔法' then
        for buff,active in pairs(state.Buff) do
            if active and sets.buff[buff] then
                equip(sets.buff[buff])
            end
        end
    end

    if string.find(spell.type, 'Magic') then
        local fc=80/100
        if player.sub_job == '赤' then
            fc = fc + 15/100
        end
        if fc >= 80/100 then
            fc = 80/100
        end
        
        local adjust=0.8
        local cast_time = (spell.cast_time*(1-fc))*adjust
        eventArgs.handled = true

        if spell.cast_time > 1 then
            equip(sets.midcast.interruption)
        end

        if spellMap == 'BlueMagical' then
            if spell.name == 'エントゥーム' then
                send_command('wait '..cast_time..'; gs equip sets.midcast['..windower.to_shift_jis('エントゥーム')..']')
            elseif spell.name == 'テネブラルクラッシュ' then
                send_command('wait '..cast_time..'; gs equip sets.midcast['..windower.to_shift_jis('テネブラルクラッシュ')..']')
            elseif spell.name == 'アンビルライトニング' then
                send_command('wait '..cast_time..'; gs equip sets.midcast['..windower.to_shift_jis('アンビルライトニング')..']')
            else
                send_command('wait '..cast_time..'; gs equip sets.midcast.BlueMagical')
            end

        elseif spellMap == 'BlueMagicAcc' then
            if spell.name == '夢想花' then
                send_command('wait '..cast_time..'; gs equip sets.midcast['..windower.to_shift_jis('夢想花')..']')
            else
                send_command('wait '..cast_time..'; gs equip sets.midcast.BlueMagicAcc')
            end

        elseif spellMap == 'BlueHealing' then
            send_command('wait '..cast_time..'; gs equip sets.midcast.BlueHealing')

        elseif spellMap == 'BlueBuff' then
            send_command('wait '..cast_time..'; gs equip sets.midcast.BlueBuff')
        
        elseif spell.name== 'アクアベール' then
            send_command('wait '..cast_time..'; gs equip sets.midcast['..windower.to_shift_jis('アクアベール')..']')

        elseif spellMap == 'Phalanx' then
            send_command('wait '..cast_time..'; gs equip sets.midcast['..windower.to_shift_jis('ファランクス')..']')
        end
    end

    if state.TreasureHunter.value then
        equip(sets.TreasureHunter)
    end
end

function customize_idle_set(idleSet)
    idleSet = set_combine(idleSet, {main=gear.ClaidheamhSoluis,sub=gear.Nehushtan})
    return idleSet
end

function user_customize_melee_set(meleeSet)
    return meleeSet
end

function job_state_change(stateField, newValue, oldValue)
    if stateField == 'Offense Mode' then
        if newValue == 'Normal' then
            enable('main','sub')
        else
            equip({main=gear.Tizona,sub=gear.SakpatasSword})
            disable('main','sub')
        end
    end
end
