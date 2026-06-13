function init_weaponns()
    --デフォルト武器を設定
    send_command('gs c set MainWeapons '..windower.to_shift_jis('クェラーロッド')..'; wait 1; gs c set SubWeapons '..windower.to_shift_jis('デュークシールド'))
end

function init_gear_sets()
    lockstyleset = 3

    sets.buff['机上演習'] = {
        head="ＡＣボード+3",
        body="ＰＤガウン+3",
        waist="エンブラサッシュ",
    }
    
    gear['クェラーロッド']       = {name="クェラーロッド"}
    gear['玄冥盾']               = {name="玄冥盾"}
    gear['デュークシールド']     = {name="デュークシールド"}
    gear.slip                    = {name="プライムモール"}

    sets.TreasureHunter = {
        ammo="完璧な幸運の卵",
        head="ヴォルトキャップ",
        hands="ヴォルトブレーサー",
        waist="チャークベルト",
    }

    sets.idle = {
        ammo="ストンチタスラム+1",
        head="無の面",
        body="アダマンアーマー",
        hands="ヴォルトブレーサー",
        legs="ニャメフランチャ", 
        feet="ニャメソルレット", 
        neck="シビルスカーフ",
        waist="キャリアーサッシュ",
        left_ear="エテオレートピアス",
        right_ear={ name="エーベルピアス+1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+15','Mag. Acc.+15','Damage taken-5%',}},
        left_ring="スティキニリング+1",
        right_ring="シュネデックリング",
        back="月明の羽衣",
    }

    sets.idle.Refresh={
        ammo="ホミリアリ",
        head={ name="マーリンフード", augments={'STR+5','Accuracy+6','"Refresh"+2','Accuracy+10 Attack+10',}},
        body="アダマンアーマー",
        hands={ name="マーリンダスタナ", augments={'Attack+4','CHR+2','"Refresh"+2',}},
        legs={ name="マーリンシャルワ", augments={'CHR+11','"Cure" potency +2%','"Refresh"+2','Accuracy+16 Attack+16','Mag. Acc.+19 "Mag.Atk.Bns."+19',}},
        feet={ name="マーリンクラッコー", augments={'CHR+12','Accuracy+5','"Refresh"+2',}},
        neck="シビルスカーフ",
        waist="風鳥の帯",
        left_ear="エテオレートピアス",
        right_ear="ハーティーピアス",
        left_ring="スティキニリング+1",
        right_ring="シュネデックリング",
    }

    sets.engaged = {
    }

    sets.precast.FC = {
        main={ name="ガーダ", augments={'"Fast Cast"+5','Mag. Acc.+14','"Mag.Atk.Bns."+14','DMG:+17',}},
        sub="チャンターシールド",
        ammo="サピエンスオーブ",
        head="パルーグクラウン",
        body="インヤガジュバ+2",
        hands="ＧＥゲージ+1",
        legs={ name="ケカスタイツ", augments={'MP+60','"Cure" spellcasting time -5%','Enmity-5',}},
        neck="オルンミラトルク",
        waist="エンブラサッシュ",
        left_ear="マリグナスピアス",
        right_ear="エンチャンピアス+1",
        left_ring="キシャールリング",
        right_ring="ラハブリング",
        back={ name="フィフォレケープ+1", augments={'Path: A',}},
    }
    
    sets.precast.WS.Magic={
    }

    sets.midcast.Cure = {
        main="デイブレイクワンド",
        sub="玄冥盾",
        ammo="サピエンスオーブ",
        head={ name="ケカスミトラ", augments={'MP+60','"Cure" spellcasting time -5%','Enmity-5',}},
        body={ name="ケカスブリオー", augments={'MP+60','"Cure" spellcasting time -5%','Enmity-5',}},
        legs={ name="ケカスタイツ", augments={'MP+60','"Cure" spellcasting time -5%','Enmity-5',}},
        feet={ name="ケカスブーツ", augments={'MP+60','"Cure" spellcasting time -5%','Enmity-5',}},
    }

    sets.midcast['弱体魔法'] = {
        main="デイブレイクワンド",
        sub="アムラピシールド",
        ammo="クォーツタスラム+1",
        head={name="無の面",priority=15},
        body="ＡＢガウン+3",
        hands="ＡＢブレーサー+3",
        legs="ＡＢパンツ+3",
        feet="ＡＢローファー+3",
        neck="無の喉輪",
        waist="無の腰当",
        left_ear="マリグナスピアス",
        right_ear={ name="オノワイヤリング+1", augments={'Path: A',},priority=16},
        left_ring="キシャールリング",
        right_ring="メタモルリング+1",
        back="無の外装",
    }
    
    sets.midcast['強化魔法'] = {
        head={ name="テルキネキャップ", augments={'"Conserve MP"+5','Enh. Mag. eff. dur. +10',}},
        body={ name="テルキネシャジュブ", augments={'"Conserve MP"+5','Enh. Mag. eff. dur. +10',}},
        hands={ name="テルキネグローブ", augments={'"Cure" potency +7%','Enh. Mag. eff. dur. +10',}},
        legs={ name="テルキネブラコーニ", augments={'"Conserve MP"+5','Enh. Mag. eff. dur. +10',}},
        feet={ name="テルキネピガッシュ", augments={'"Conserve MP"+5','Enh. Mag. eff. dur. +10',}},
        neck="インカンタートルク",
        waist="エンブラサッシュ",
        left_ear="アンドアーピアス",
        right_ear="ミミルピアス",
        left_ring="メランリング",
        right_ring={ name="ゼラチナスリング+1", augments={'Path: A',}},
        back={ name="月明の羽衣",priority=16},
    }

    sets.midcast['アクアベール']   = set_combine(sets.midcast['強化魔法'], {head="ＡＭコイフ+1", legs="シェダルサラウィル"})

    sets.midcast.Cursna={
        hands="ヒエロスミトン",
        feet="ＧＥガロッシュ+1",
        neck="デビリスメダル",
        left_ring="メネロスリング",
        right_ring="ハオマリング",
        back="オレタニアケープ+1",
    }
end
