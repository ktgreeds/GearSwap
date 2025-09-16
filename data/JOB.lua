--初期設定
function get_sets()
    mote_include_version = 2    
    include('Mote-Include.lua')
    set_language('japanese')
end

--ジョブ設定
function job_setup()
end

--ユーザー設定
function user_setup()
    include('Mote-TreasureHunter')
    include(player.name .. '/weather_obi') 
    state.Weapons = M{'A','B','C'}
    state.OffenseMode:options('Normal',)
    state.IdleMode:options('Normal',)
end

--アンロード設定
function user_unload()
end

--ステータスチェンジ
function job_state_change(stateField, newValue, oldValue)
end

--バフ・デバフ処理
function job_buff_change(buff, gain)
end

--アクション事前処理：楽器持ち替えなどあれば
function job_post_pretarget(spell, action, spellMap, eventArgs)
end

--アクション前処理：FC着替えなど
function job_post_precast(spell, action, spellMap, eventArgs) 
end

--アクション中処理：着弾装備着替えなど
function job_post_midcast(spell, action, spellMap, eventArgs)
end

--アクション後処理：アクション後処理などあれば
function job_posat_aftercast(spell, action, spellMap, eventArgs) 
end

--待機装備着替え
function customize_idle_set(idleSet) 
    return idleSet
end

--攻撃装備着替え
function customize_melee_set(meleeSet)    
    return meleeSet
end

--カスタムコマンド
function job_self_command(cmdParams, eventArgs)
end