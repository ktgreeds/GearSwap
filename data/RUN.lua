function get_sets()
    mote_include_version = 2
    include('Mote-Include.lua')
    set_language('japanese')
end


function job_setup()
    state.Buff['ファストキャスト'] = buffactive['ファストキャスト'] or false
    
    -- gs c cycle IdleMode
    state.IdleMode:options('Normal')
    
    -- gs c cycle OffenseMode
    state.OffenseMode:options('Normal', 'Stp')

    -- gs c cycle HybridMode
    state.HybridMode:options('Normal',  'KnockBack', 'Parry')
    
    -- gs c cycle WeaponskillMode
    state.WeaponskillMode:options('Normal', 'SubtleBlow')

    -- gs c cycle MainWeapons
    state.MainWeapons   = M{'Epeolatry', 'Lycurgos'}

    -- gs c cycle SubWeapons
    state.SubWeapons    = M{'AlberStrap', 'Khonsu'}
end


function job_post_midcast(spell, action, spellMap, eventArgs) 
end

function job_buff_change(buff, gain)
    if buff == 'バットゥタ' then
        if gain then
            send_command('gs c set HybridMode Parry')
        else
            send_command('gs c set HybridMode Normal')
        end

    elseif buff == 'エンボルド' then
        if gain then
            equip(sets.buff['エンボルド'])
            disable('back')
        else
            enable('back')
            IdleMelee()
        end
    end
end

function job_state_change(stateField, newValue, oldValue)
    if stateField == 'RuneText' then
        if newValue then
            showTextRune()
        else
            hideTextRune()
        end
    end
end


