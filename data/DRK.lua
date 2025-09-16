function get_sets()
    mote_include_version = 2
    include('Mote-Include.lua')
	set_language('japanese')
end


function job_setup()
	state.Buff["ラストリゾート"]    = buffactive["ラストリゾート"] or false	
	state.Buff["暗黒"]              = buffactive["暗黒"] or false
    state.Buff["ドレッドスパイク"]  = buffactive["ドレッドスパイク"] or false
    state.Buff["ダークシール"]      = buffactive["ダークシール"] or false
    state.Buff["ネザーヴォイド"]    = buffactive["ネザーヴォイド"] or false
    
    
    -- gs c cycle OffenseMode
    state.OffenseMode:options('Normal')
    
    -- gs c cycle IdleMode
    state.IdleMode:options('Normal','Refresh')
    
    -- gs c cycle WeaponskillMode
    state.WeaponskillMode:options('Normal', 'SubtleBlow')

    -- gs c cycle MainWeapons
    state.MainWeapons   = M{'Zantetsu','Deathbane'}

    -- gs c cycle SubWeapons
    state.SubWeapons    = M{'UtuGrip','Khonsu'}
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


function job_buff_change(buff, gain)
    if buff == "ドレッドスパイク" and not gain then
        IdleMelee()
    end
end