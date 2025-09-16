function get_sets()
    mote_include_version = 2
    include('Mote-Include.lua')
    set_language('japanese')
end


function job_setup()
    -- gs c cycle IdleMode
    state.IdleMode:options('Normal','Refresh')
    
    -- gs c cycle OffenseMode
    state.OffenseMode:options('Normal','SubtleBlow')

    -- gs c cycle HybridMode
    state.HybridMode:options('Normal')

    -- gs c cycle WeaponskillMode
    state.WeaponskillMode:options('Normal', 'SubtleBlow')
    
    -- gs c cycle MainWeapons
    state.MainWeapons       = M{'Perun','Naegling','Malevolence','KrakenClub'}
    
    -- gs c cycle SubWeapons
    state.SubWeapons        = M{'CrepuscularKnife','KrakenClub','NuskuShield'}
    
    -- gs c cycle RangeWeapons
    state.RangeWeapons      = M{'Fomalhaut','Hangaku','TPBonus'}
    state.RangedMode        = M('Archery','Marksmanship')
end


function job_state_change(stateField,  newValue, oldValue)
    if stateField == 'RangeWeapons' then
        if newValue == 'Fomalhaut' then
            send_command('gs c set RangedMode Marksmanship')

        elseif newValue == 'TPBonus' then
            send_command('gs c set RangedMode Archery')
            
        elseif newValue == 'Hangaku' then
            send_command('gs c set RangedMode Archery')
        end
    end
end


function job_post_pretarget(spell, action, spellMap, eventArgs)
        --誤射防止
    if player.equipment.ammo == gear.HauksbokArrow.name 
    or player.equipment.ammo == gear.HauksbokBullet.name then
        send_command('input /equip ammo')
    end

    if spell.name == '飛び道具' then
        if state.RangedMode.value == 'Archery' then
            equip({ammo = gear.ArcheryPhysics})

        elseif state.RangedMode.value == 'Marksmanship' then
            equip({ammo = gear.MarksmanshipPhysics})
        end

    elseif spell.name == 'サベッジブレード' then
        equip({ammo=gear.HauksbokArrow})

    elseif spell.name == 'イオリアンエッジ' then
        equip({ammo=gear.HauksbokBullet})

    end
end


function job_post_precast(spell, action, spellMap, eventArgs)
    if spell.name == '飛び道具' then
        if state.RangedMode.value == 'Archery' then
            equip({ammo = gear.ArcheryPhysics})
        elseif state.RangedMode.value == 'Marksmanship' then
            equip({ammo = gear.MarksmanshipPhysics})
        end
    end
end


function job_post_midcast(spell, action, spellMap, eventArgs)
    if spell.action_type == 'Ranged Attack' then
        for buff,active in pairs(state.Buff) do
            if active and sets.buff[buff] then
                equip(sets.buff[buff])
            end
        end
    elseif spell.name == 'トゥルーフライト' 
        or spell.name == 'イオリアンエッジ' then
        equip(get_hachirin(spell.element))
    end

end


function job_post_aftercast(spell, action, spellMap, eventArgs)
    --誤射防止
    if spell.name == 'サベッジブレード' 
    or spell.name == 'イオリアンエッジ' then
        send_command('input /equip ammo')
    end
end
