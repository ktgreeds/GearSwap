function init_weaponns()
    send_command('gs c set MainWeapons '..windower.to_shift_jis('ゴッドハンド'))
end


function init_gear_sets()
    -- ロックスタイル番号
    lockstyleset = 18

    -- 武器
    gear['ゴッドハンド']    = {name="ゴッドハンド"}
    gear.Slip               = {name="フレンジーサリット"}

    --モクシャ
    sets.SubtleBlow = {
    }

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

    -- バフ
   	sets.precast.JA['オーバードライヴ']     = set_combine({body="ＰＩトベ+4"})
   	sets.precast.JA['アクティベート']       = set_combine()
   	sets.precast.JA['応急処置']             = set_combine()
   	sets.precast.JA['リペアー']             = set_combine({feet="ＦＯバブーシュ+4"})
   	sets.precast.JA['黒衣チェンジ']         = set_combine({feet="ＰＩバブーシュ+4"})
   	sets.precast.JA['腹話術']               = set_combine({legs="ＰＩチュリダル+4"})
   	sets.precast.JA['タクティクスウィッチ'] = set_combine({feet="ＫＧスカルペ+3"})
   	sets.precast.JA['クールダウン']         = set_combine()
   	sets.precast.JA['ヘディーアーテフィス'] = set_combine()

    -- FC装備
    sets.precast.FC = {
        head={ name="ヘルクリアヘルム", augments={'Accuracy+11','STR+4','Phalanx +4','Accuracy+6 Attack+6','Mag. Acc.+16 "Mag.Atk.Bns."+16',}},
        legs={ name="ヘルクリアトラウザ", augments={'Mag. Acc.+16','"Fast Cast"+6','STR+10',}},
        feet={ name="ヘルクリアブーツ", augments={'"Fast Cast"+6','MND+2','Mag. Acc.+2',}},
        neck="オルンミラトルク",
        left_ear="エンチャンピアス+1",
        right_ear="エテオレートピアス",
        left_ring="",
        right_ring="ラハブリング",
    }

    -- WSダメージ
    sets.precast.WS.Damage = {
    }
    
    -- WS魔攻
    sets.precast.WS.Magic = {
    }
    
    --共通WS定義読み込み
    init_weapon_skill()

end