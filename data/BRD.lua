function get_sets()
    mote_include_version = 2
    include('Mote-Include.lua')
    set_language('japanese')
end



function job_setup()
    --dummy
    set_dummy_song('戦士達のピーアン')
    set_dummy_song('戦士達のピーアンII')
    set_dummy_song('戦士達のピーアンIII')

    --state
    state.OffenseMode:options('Normal','SubtleBlow')
    state.WeaponskillMode:options('Normal','SubtleBlow')
    state.MainWeapons     = M{'Carnwenhan','Naegling'}
    state.SubWeapons      = M{'AmmurapiShield','Genbu','Aeneas','Malevolence'}
    --state.Instruments     = M{'Empty','Gjallarhorn','Daurdabla','Marsyas','Blurred','MiracleCheer'}
    state.UseMiracleCheer = M(false,'Miracle Cheer')
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
