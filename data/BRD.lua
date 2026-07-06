function get_sets()
    mote_include_version = 2
    include('Mote-Include.lua')
    set_language('japanese')
end


function job_setup()
    --dummy
--    set_dummy_song('戦士達のピーアン')
--    set_dummy_song('戦士達のピーアンII')
--    set_dummy_song('戦士達のピーアンIII')

    --state
    state.IdleMode:options('Normal','Evasion')
    state.OffenseMode:options('Normal','SubtleBlow')
    state.WeaponskillMode:options('Normal','SubtleBlow')
    state.MainWeapons     = M{'カルンウェナン','ネイグリング'}
    state.SubWeapons      = M{'アムラピシールド','玄冥盾','エーネアス','マレヴォレンス'}
    state.UseMiracleCheer = M(false,'Miracle Cheer')
end


function job_post_precast(spell, action, spellMap, eventArgs)
    if spell.type=='BardSong' then
        if spell.name == '栄典の戴冠マーチ' then
            equip({range=gear['マルシュアス']})
        elseif spell.name == '冷静と情熱のアリア' then
            equip({range=gear['ラックナシェード']})
        elseif spell.name == '魔物達のララバイ' or spell.name == '魔物達のララバイII' then
            equip({range=gear['ブラーハープ']})
        elseif spellMap == 'Dummy' then
            equip({range=gear['ダウルダヴラ']})
        else
            if not state.UseMiracleCheer.value or spell.target.type == "MONSTER" then
                --equip({range=gear['ギャッラルホルン']})
                equip({range=gear['ラックナシェード']})
            else
                equip({range=gear['ミラクルチアー']})
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
    user_state_change(stateField,  newValue, oldValue)
end


function set_dummy_song(song_name)
    spell_maps[song_name] = 'Dummy'
end