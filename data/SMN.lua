function get_sets()
    mote_include_version = 2
    include('Mote-Include.lua')
    set_language('japanese')
end


function job_setup()
    state.Buff['神獣の加護']            = buffactive['神獣の加護'] or false
    state.Buff['アストラルパッセージ']  = buffactive['アストラルパッセージ'] or false
    
    -- gs c cycle OffenseMode
    state.OffenseMode:options('Normal')
    
    -- gs c cycle IdleMode
    state.IdleMode:options('Normal')
    
    -- gs c cycle WeaponskillMode
    state.WeaponskillMode:options('Normal', 'SubtleBlow')
    
    -- gs c cycle MainWeapons
    state.MainWeapons   = M{'Nirvana'}
    
    -- gs c cycle SubWeapons
    state.SubWeapons    = M{'ElanStrap'}

    -- gs c cycle BloadPactText
    state.BloadPactText = M(false, '履行テキスト')
end


function customize_idle_set(idleSet)
    if pet.isvalid then
        if pet.status == 'Engaged' then
            idleSet = set_combine(idleSet, sets.idle.Avatar.Melee)
        elseif state.Buff['神獣の加護'] then
            idleSet = set_combine(idleSet, sets.idle.Avatar.Favor)
        else
            idleSet = set_combine(idleSet, sets.idle.Avatar)
        end
    else
        idleSet = set_combine(idleSet, sets.idle)
    end
    return idleSet
end


function custom_self_command(cmdParams, eventArgs)
    if cmdParams[1] == 'bp' then --【召喚】パッセ
        if buffactive['アストラルパッセージ'] then
            if player.mp < 229 then
                send_command('input /ja '..windower.to_shift_jis("コンバート")..' <me>')
                send_command('input /item '..windower.to_shift_jis("ルシドエリクサーII")..' <me>')
            else
            bp_commnad(cmdParams)
            end
        else
            bp_commnad(cmdParams)
        end

    elseif cmdParams[1] == 'spirit' then --【召喚】エレ回復
        spirit_command()
        
    elseif cmdParams[1] =='BloadPactText' then --【召喚】履行技カンニングペーパー
        if state.BloadPactText.value then
            showText()
        else
            hideText()
        end
    end
end