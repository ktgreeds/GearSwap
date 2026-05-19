function init_weaponns()
    -- デフォルト武器を設定
    send_command('gs c set MainWeapons '..windower.to_shift_jis('ゴッドハンド'))
end


function init_gear_sets()
    -- ロックスタイル番号
    lockstyleset = 18

    -- 武器
    gear['ゴッドハンド']    = {name="ゴッドハンド"}
    gear.Slip               = {name="フレンジーサリット"}

    
    -- 待機装備
    sets.idle = {
        range={ name="Ｎ．ストリンガー", augments={'Path: A',}},
        head={ name="ムパカキャップ", augments={'Path: A',}},
        body={ name="ムパカダブレット", augments={'Path: A',}},
        hands={ name="ムパカグローブ", augments={'Path: A',}},
        legs={ name="ニャメフランチャ", augments={'Path: B',}},
        feet={ name="ニャメソルレット", augments={'Path: B',}},
        neck="無の喉輪",
        waist="プラチナモグベルト",
        left_ear="アスプロピアス",
        right_ear="エンメルカルピアス",
        left_ring={ name="メランリング", augments={'Path: A',}},
        right_ring="シュネデックリング",
        back="無の外装",
    }

    -- 抜刀装備
    sets.engaged = {
    }

    -- FC装備
    sets.precast.FC = {
        head={ name="ヘルクリアヘルム", augments={'Accuracy+11','STR+4','Phalanx +4','Accuracy+6 Attack+6','Mag. Acc.+16 "Mag.Atk.Bns."+16',}},
        legs={ name="ヘルクリアトラウザ", augments={'Mag. Acc.+16','"Fast Cast"+6','STR+10',}},
        feet={ name="ヘルクリアブーツ", augments={'"Fast Cast"+6','MND+2','Mag. Acc.+2',}},
        neck="オルンミラトルク",
        left_ear="エンチャンピアス+1",
        right_ear="エテオレートピアス",
        left_ring="メダダリング",
        right_ring="ラハブリング",
    }

    -- WSダメージ
    sets.precast.WS.Damage = {
    }
    
    -- WS魔攻
    sets.precast.WS.Magic = {
    }

    -- WSモクシャ62(42,20)
    sets.precast.WS.SubtleBlow = 
    {
    }
    
    --共通WS定義読み込み
    init_weapon_skill()

end