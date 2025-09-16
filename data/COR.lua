function get_sets()
    mote_include_version = 2
    include('Mote-Include.lua')
    set_language('japanese')
end


function job_setup()
    state.Buff['トリプルショット']  = buffactive['トリプルショット'] or false
    
    -- gs c cycle IdleMode
    state.IdleMode:options('Normal','Refresh')

    -- gs c cycle OffenseMode
    state.OffenseMode:options('Normal','SubtleBlow')
    
    -- gs c cycle HybridMode
    state.HybridMode:options('Normal')
    
    -- gs c cycle WeaponskillMode
    state.WeaponskillMode:options('Normal', 'SubtleBlow')
    
    -- gs c cycle MainWeapons
    state.MainWeapons       = M{'RostamA','RostamB','Naegling'}
    
    -- gs c cycle SubWeapons
    state.SubWeapons        = M{'CrepuscularKnife','Tauret','BlurredKnife','NuskuShield'}
    
    -- gs c cycle RangeWeapons
    state.RangeWeapons      = M{'Fomalhaut','DeathPenalty','TPBonus'}
    state.RangedMode        = M('Marksmanship')
end


function job_state_change(stateField,  ewValue, oldValue)
    if stateField == 'MainWeapons' then
        if newValue == 'Naegling' then
            send_command('gs c set RangeWeapons TPBonus')
        end

    elseif stateField == 'RangeWeapons' then
        if newValue == 'Fomalhaut' then
            send_command('gs c set RangedMode Marksmanship')

        elseif newValue == 'TPBonus' then
            send_command('gs c set RangedMode Marksmanship')
        end
    end
end


function job_post_pretarget(spell, action, spellMap, eventArgs)
        --誤射防止
    if player.equipment.ammo == gear.HauksbokBullet.name then
        send_command('input /equip ammo')
    end

    if spell.name == '飛び道具' then
        if state.RangedMode.value == 'Marksmanship' then
            equip({ammo = gear.MarksmanshipPhysics})
        end

    elseif spell.name == 'イオリアンエッジ' then
        equip({ammo=gear.HauksbokBullet})
    end
end

function job_post_precast(spell, action, spellMap, eventArgs)
    if state.RangedMode.value == 'Marksmanship' then
        equip({ammo = gear.MarksmanshipPhysics})
    end
end


function job_post_midcast(spell, action, spellMap, eventArgs)
    if spell.action_type == 'Ranged Attack' then
        for buff,active in pairs(state.Buff) do
            if active and sets.buff[buff] then
                equip(sets.buff[buff])
            end
        end
    elseif spell.name == 'レデンサリュート'
        or spell.name == 'イオリアンエッジ' then
        equip(get_hachirin(spell.element))
    end
end

function job_post_aftercast(spell, action, spellMap, eventArgs)
    --誤射防止
    if spell.name == 'イオリアンエッジ' then
        send_command('input /equip ammo')
    end
end
