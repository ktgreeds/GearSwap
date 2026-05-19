function get_sets()
    mote_include_version = 2
    include('Mote-Include.lua')
	set_language('japanese')
end


function job_setup()
    state.Buff["ドレッドスパイク"]  = buffactive["ドレッドスパイク"] or false
    state.Buff["ダークシール"]      = buffactive["ダークシール"] or false
    state.Buff["ネザーヴォイド"]    = buffactive["ネザーヴォイド"] or false
    
    state.OffenseMode:options('Normal','SubtleBlow')
    state.WeaponskillMode:options('Normal','SubtleBlow')
    state.MainWeapons   = M{'クレパスクラサイズ','真・斬鉄剣'}
    state.SubWeapons    = M{'ウトゥグリップ'}
    state.Increased     = M(true)
end


function job_post_midcast(spell, action, spellMap, eventArgs)
    if spell.skill == '暗黒魔法' then
        if state.Buff['ダークシール'] then
            equip(sets.buff['ダークシール'])
        end
        if state.Buff['ネザーヴォイド'] then
            equip(sets.buff['ネザーヴォイド'])
        end
    end
end


function customize_idle_set(idleSet)
    if state.Buff["ドレッドスパイク"] then
        idleSet = set_combine(idleSet,sets.buff['ドレッドスパイク'])
    end
    return idleSet
end


function customize_melee_set(meleeSet)
    if state.Buff["ドレッドスパイク"] then
        meleeSet = set_combine(meleeSet,sets.buff['ドレッドスパイク'])
    end
    return meleeSet
end


function job_state_change(stateField,  newValue, oldValue)
    user_state_change(stateField,  newValue, oldValue)
end


