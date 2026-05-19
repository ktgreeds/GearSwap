function init_weaponns()
    --デフォルト武器を設定
    send_command('gs c set MainWeapons AgwusAxe')
    send_command('gs c set SubWeapons SacroBulwark')
end


function init_gear_sets()
    --ロックスタイル番号
    lockstyleset = 9

    --武器
    gear.AgwusAxe               = {name="アグゥアクス"}
    gear.SacroBulwark           = {name="サクロバルワーク"}

    --待機装備
    sets.idle = {
        ammo="ストンチタスラム+1",
        head="無の面",
        body="アダマンアーマー",
        hands="ニャメガントレ",
        legs={ name="ニャメフランチャ", augments={'Path: B',}},
        feet="ニャメソルレット",
        neck="無の喉輪",
        waist="プラチナモグベルト",
        left_ear="ハンドラーピアス+1",
        right_ear={ name="ヌグーミピアス+1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+12','Mag. Acc.+12','Pet: "Dbl. Atk."+6',}},
        left_ring="メランリング",
        right_ring="シュネデックリング",
        back="無の外装",
    }

    --待機装備（ペット呼び出し時）
    sets.idle.Pet = set_combine(sets.idle,{feet="グレティブーツ",right_ring="ヌグーミピアス+1"})

    --走り回る用
    sets.Kiting={right_ring="シュネデックリング",}

    --即時発動系
    sets.precast.JA['K.インスティンクト']   = {head="ＡＫヘルム+1"}
    sets.precast.JA['よびだす']             = {hands="ＡＫグローブ+1"}
    sets.precast.JA['しょうしゅう']         = {hands="ＡＫグローブ+1"}

    --FC
    sets.precast.FC = {
        neck="オルンミラトルク",
        body="レイライングローブ",
        right_ear="エンチャンピアス+1",
        right_ring="メダダリング",
    }
    sets.precast.FC.value = 47

    --ペット技
    sets.midcast.Pet = {
        legs="グレティブリーチズ",
    }
    
    sets.midcast.Pet['TP吸収キッス'] = set_combine(sets.midcast.Pet,{
        main="クンバカルナ",
        hands="ＮＫマノプラス+3",
    })
end