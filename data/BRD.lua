function get_sets()
    mote_include_version = 2
    include('Mote-Include.lua')
    set_language('japanese')
end


function job_setup()
    set_dummy_song('戦士達のピーアン')
    set_dummy_song('戦士達のピーアンII')
    set_dummy_song('戦士達のピーアンIII')

    -- gs c cycle IdleMode
    state.IdleMode:options('Normal')

    -- gs c cycle OffenseMode
    state.OffenseMode:options('Normal','SubtleBlow')
    
    -- gs c cycle HybridMode
    state.HybridMode:options('Normal')

    -- gs c cycle WeaponskillMode
    state.WeaponskillMode:options('Normal','SubtleBlow')

    -- gs c cycle MainWeapons
    state.MainWeapons   = M{'Carnwenhan','Naegling'}

    -- gs c cycle SubWeapons
    state.SubWeapons    = M{'Genbu','Aeneas','Malevolence'}
    
    -- gs c cycle Instruments
    --state.Instruments =  M{'Empty','Gjallarhorn','Daurdabla','Marsyas','Blurred','MiracleCheer','Empty'}

    -- gs c cycle UseMiracleCheer
    state.UseMiracleCheer = M(false, 'Miracle Cheer')

    send_command('bind ~F7 gs c cycle UseMiracleCheer')

end


function user_unload()
    send_command('bind ~F7 gs c cycle OffenseMode')
end


function job_post_precast(spell, action, spellMap, eventArgs)
    if spell.type=='BardSong' then
        if spell.name == '栄典の戴冠マーチ' then
            equip({range=gear.Marsyas})

        elseif spell.name == '冷静と情熱のアリア' then
            equip({range=gear.Loughnashade})

        elseif spell.name == '魔物達のララバイ' or spell.name == '魔物達のララバイII' then
            equip({range=gear.Blurred})

        elseif spellMap == 'Dummy' then
            equip({range=gear.Daurdabla})

        else
            if not state.UseMiracleCheer.value 
            or spell.target.type == "MONSTER" then
                equip({range=gear.Gjallarhorn})
                
            else
                equip({range=gear.MiracleCheer})
            end
        end
    end 
end


function job_post_midcast(spell, action, spellMap, eventArgs)    
    if spell.type=='BardSong' then
        if state.UseMiracleCheer.value then
            if spellMap == "Etude" then
                equip(sets.midcast.BardSong.MiracleCheerEtude)
            elseif spellMap == "Carol" then
                equip(sets.midcast.BardSong.MiracleCheerCarol)
            elseif spellMap == "Minne" then
                equip(sets.midcast.BardSong.MiracleCheerMinne)
            elseif spellMap == "Mambo" then
                equip(sets.midcast.BardSong.MiracleCheerMambo)
            else
                equip(sets.midcast.BardSong.MiracleCheerBase)
            end
        end
    end
    if spell.name == 'イオリアンエッジ' then
        equip(get_hachirin(spell.element))
    end

end


function customize_idle_set(idleSet)
    idleSet = set_combine(idleSet,{main=gear.Evasion})
    return set_combine(idleSet,customize_weapon_set())
end


function user_customize_melee_set(meleeSet)
    return set_combine(meleeSet,customize_weapon_set())
end


function customize_weapon_set()
    return nil
end


function job_state_change(stateField,  newValue, oldValue)
    if stateField == 'Offense Mode' then
        if state.WeaponskillMode.value ~= 'SubtleBlow' and newValue == 'SubtleBlow' then
            send_command('gs c set WeaponskillMode SubtleBlow')        
        elseif state.WeaponskillMode.value == 'SubtleBlow' and newValue ~= 'SubtleBlow' then
            send_command('gs c set WeaponskillMode Normal')        
        end
    end
end


function set_dummy_song(song_name)
    spell_maps[song_name] = 'Dummy'
end
