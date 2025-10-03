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
    state.IdleMode:options('Normal','Refresh')

    -- gs c cycle OffenseMode
    state.OffenseMode:options('Normal')
    
    -- gs c cycle HybridMode
    state.HybridMode:options('Normal')

    -- gs c cycle WeaponskillMode
    state.WeaponskillMode:options('Normal', 'SubtleBlow')

    -- gs c cycle MainWeapons
    state.MainWeapons   = M{'Carnwenhan','Naegling'}

    -- gs c cycle SubWeapons
    state.SubWeapons    = M{'Genbu','Aeneas','Malevolence'}
    
    -- gs c cycle Instruments
    state.Instruments =  M{'Gjallarhorn','Daurdabla','Marsyas','Blurred','MiracleCheer'}

    state.UseMiracleCheer = M(false, 'Miracle Cheer')

end


function customize_idle_set(idleSet) 
    idleSet = set_combine(idleSet,{main=gear.Evasion})
    return idleSet
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
            print(spell.target.type)
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
    for buff,active in pairs(state.Buff) do
        if active and sets.buff[buff] then
            equip(sets.buff[buff])
        end
    end
    
    if spell.name == 'イオリアンエッジ' then
        equip(get_hachirin(spell.element))
    end

end


function set_dummy_song(song_name)
    spell_maps[song_name] = 'Dummy'
end
