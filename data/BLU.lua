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

function job_post_precast(spell, action, spellMap, eventArgs)
end

function job_post_midcast(spell, action, spellMap, eventArgs)
    for buff,active in pairs(state.Buff) do
        if active and sets.buff[buff] then
            equip(sets.buff[buff])
        end
    end

    if string.find(spell.type, 'Magic') then
        if not sets.precast.FC.value then
            sets.precast.FC.value = 80
        end

        local fc = sets.precast.FC.value/100
        if player.main_job == '剣' and buffactive['ファストキャスト'] then
            --フサルクトラウザ装備時メリポのインスパイア1につき+12％
            fc = fc + 12/100 --インスパイア1
            --fc = fc + 24/100 --インスパイア2
            --fc = fc + 36/100 --インスパイア3
            --fc = fc + 48/100 --インスパイア4
            --fc = fc + 60/100 --インスパイア5
        end
        if player.sub_job == '赤' then
            fc = fc + 15/100
        elseif player.main_job == '赤' then
            fc = fc + 38/100
        end
        if fc >= 80/100 then
            fc = 80/100
        end
        
        eventArgs.handled = true
        
        local adjust = 0.15
        local cast_time = (spell.cast_time*(1-fc))-adjust

        IdleMelee()
        equip(sets.midcast.interruption)

        if sets.midcast[spell.name] then
            send_command('wait '..cast_time..'; gs equip sets.midcast['..windower.to_shift_jis(spell.name)..']')
        elseif sets.midcast[spellMap] then
            send_command('wait '..cast_time..'; gs equip sets.midcast.'..spellMap)

            
        elseif sets.midcast[spell.skill] then
            send_command('wait '..cast_time..'; gs equip sets.midcast['..windower.to_shift_jis(spell.skill)..']')


        elseif sets.midcast[spell.type] then
            send_command('wait '..cast_time..'; gs equip sets.midcast.'..spell.type) 
        end
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
