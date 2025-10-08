function init_weaponns()
    --デフォルト武器を設定
    send_command('gs c set MainWeapons Idris')
    send_command('gs c set SubWeapons Genbu')
end


function init_gear_sets()
    --ロックスタイル番号
    lockstyleset = 141

    --武器
    gear.Idris                  = {name="イドリス"}
    gear.Genbu                  = {name="玄冥盾"}
    gear.Slip                   = {name="プライムモール"}

    --待機装備（通常）
    sets.idle = {
        range={ name="デュンナ", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
        head="無の面",
        body="ＡＺコート+3",
        hands="ＡＺグローブ+3",
        legs={ name="ニャメフランチャ", augments={'Path: B',}},
        feet="ＡＺゲートル+3",
        neck="シビルスカーフ",
        waist="無の腰当",
        left_ear={ name="アスプロピアス", augments={'Path: A',}},
        right_ear={ name="アジムスピアス+2", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+17','Damage taken-6%','INT+9 MND+9',}},
        left_ring="スティキニリング+1",
        right_ring="シュネデックリング",
        back="無の外装",
    }
    
    --待機装備（リフレ）
    sets.idle.Refresh = set_combine(sets.idle,{
        body="ＡＺコート+3",
        hands="ＢＡミテーヌ+3",
        head={ name="マーリンフード", augments={'Crit. hit damage +2%','Pet: Crit.hit rate +1','"Refresh"+2','Accuracy+4 Attack+4',}},
        body="ＡＺコート+3",
        hands={ name="マーリンダスタナ", augments={'AGI+6','Pet: STR+5','"Refresh"+2','Accuracy+8 Attack+8',}},
        legs={ name="マーリンシャルワ", augments={'CHR+8','STR+3','"Refresh"+2','Mag. Acc.+2 "Mag.Atk.Bns."+2',}},
        feet={ name="マーリンクラッコー", augments={'Weapon Skill Acc.+8','"Fast Cast"+2','"Refresh"+2',}},
        neck="シビルスカーフ",
        left_ring="スティキニリング+1",}
    )

    --待機装備（羅盤通常）
    sets.idle.Luopan = {
        range={ name="デュンナ", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
        head="ＡＺフード+3",
        body={ name="テルキネシャジュブ", augments={'Mag. Evasion+25','Pet: "Regen"+3','Pet: Damage taken -4%',}},
        hands={ name="テルキネグローブ", augments={'Mag. Evasion+24','Pet: "Regen"+3','Pet: Damage taken -4%',}},
        legs={ name="テルキネブラコーニ", augments={'Mag. Evasion+25','Pet: "Regen"+3','Pet: Damage taken -4%',}},
        feet={ name="ＢＡサンダル+4", augments={'Enhances "Radial Arcana" effect',}},
        neck={ name="バグアチャーム+2", augments={'Path: A',}},
        waist="イーサベルト",
        left_ear={ name="アスプロピアス", augments={'Path: A',}},
        right_ear={ name="アジムスピアス+2", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+17','Damage taken-6%','INT+9 MND+9',}},
        left_ring={ name="メランリング", augments={'Path: A',}},
        right_ring="守りの指輪",
        back={ name="ナントセルタケープ", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Pet: "Regen"+10','Pet: "Regen"+5',}},
    }

    --待機装備（羅盤リフレ）
    sets.idle.Luopan.Refresh = set_combine(sets.idle.Luopan,sets.idle.Refresh)
    
    --FC
    sets.precast.FC = {
        range={ name="デュンナ", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
        head={ name="マーリンフード", augments={'"Fast Cast"+5','DEX+9','Mag. Acc.+9',}},
        body={ name="マーリンジュバ", augments={'Mag. Acc.+26','"Fast Cast"+6','MND+1',}},
        hands={ name="アグゥゲージ", augments={'Path: A',}},
        legs={ name="サイクロスラッパ", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}},
        feet={ name="マーリンクラッコー", augments={'"Mag.Atk.Bns."+2','"Fast Cast"+5','AGI+6','Mag. Acc.+14',}},
        neck="オルンミラトルク",
        waist="エンブラサッシュ",
        left_ear="マリグナスピアス",
        right_ear="エンチャンピアス+1",
        left_ring="メダダリング",
        right_ring="守りの指輪",
        back={ name="フィフォレケープ+1", augments={'Path: A',}},
    }

    --FC（ディスペガ用）
   sets.precast.FC['ディスペガ'] = set_combine( sets.precast.FC,{main="デイブレイクワンド",})

    --即時発動系
    sets.precast.JA["ライフサイクル"]               = {body="ＧＯチュニック+1"}
    sets.precast.JA["ボルスター"]                   = {body="ＢＡチュニック+1"}
    sets.precast.JA["メンドハレイション"]           = {Legs="ＢＡパンツ+3"}
    sets.precast.JA["レイディアルアルカナ"]         = {feet="ＢＡサンダル+3"}
    sets.precast.JA["フルサークル"]                 = {head="ＡＺフード+3"}
        
    --WSモクシャ
    sets.precast.WS.SubtleBlow = 
    {
        neck={ name="バーシチョーカー+1", augments={'Path: A',}},
        waist="サリサフロイベルト",
        left_ear="ディグニタリピアス",
        left_ring="シーリチリング+1",
        right_ring="シーリチリング+1",
    }
    
    --共通WS定義読み込み
    init_weapon_skill()

    --ケアル
    sets.midcast.Cure={
        head={ name="ヴァニヤフード", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
        body={ name="ヴァニヤローブ", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
        hands={ name="テルキネグローブ", augments={'"Cure" potency +8%','Enh. Mag. eff. dur. +10',}},
        legs={ name="ヴァニヤスロップス", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
        feet={ name="ヴァニヤクロッグ", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
        neck="インカンタートルク",
        waist="コーネリアの黒帯",
        left_ear="メンデカントピアス",
        right_ear="エテオレートピアス",
        left_ring="スティキニリング+1",
        right_ring="レベッチェリング",
        back="ソレムニティケープ",
    }
    
    --強化魔法
    sets.midcast['強化魔法']={
        sub="アムラピシールド",
        head={ name="テルキネキャップ", augments={'"Cure" potency +7%','Enh. Mag. eff. dur. +10',}},
        body={ name="テルキネシャジュブ", augments={'"Cure" potency +7%','Enh. Mag. eff. dur. +10',}},
        hands={ name="テルキネグローブ", augments={'"Cure" potency +8%','Enh. Mag. eff. dur. +10',}},
        legs={ name="テルキネブラコーニ", augments={'"Cure" potency +7%','Enh. Mag. eff. dur. +10',}},
        feet={ name="テルキネピガッシュ", augments={'"Cure" potency +8%','Enh. Mag. eff. dur. +10',}},
        neck="インカンタートルク",
        waist="エンブラサッシュ",
        right_ear="ミミルピアス",
        back={ name="フィフォレケープ+1", augments={'Path: A',}},
    }
    
    --精霊魔法
    sets.midcast['精霊魔法']={
        sub="アムラピシールド",
        range={ name="デュンナ", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
        head="エアハット+1",
        body={ name="アグゥローブ", augments={'Path: A',}},
        hands={ name="アグゥゲージ", augments={'Path: A',}},
        legs="ＡＺタイツ+3",
        feet="アグゥピガッシュ",
        neck="シビルスカーフ",
        waist="サクロコード",
        left_ear="マリグナスピアス",
        right_ear={ name="アジムスピアス+2", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+17','Damage taken-6%','INT+9 MND+9',}},
        left_ring="メダダリング",
        right_ring={ name="メタモルリング+1", augments={'Path: A',}},
        back={ name="ナントセルタケープ", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Pet: Damage taken -5%',}},
    }
    
    --弱体魔法
    sets.midcast['弱体魔法']={
        sub="アムラピシールド",
        range={ name="デュンナ", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
        head="ＡＺフード+3",
        body="ＡＺコート+3",
        hands="ＡＺグローブ+3",
        legs="ＡＺタイツ+3",
        feet="ＡＺゲートル+3",
        neck="無の喉輪",
        waist="無の腰当",
        left_ear="マリグナスピアス",
        right_ear={ name="アジムスピアス+2", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+17','Damage taken-6%','INT+9 MND+9',}},
        left_ring="メダダリング",
        right_ring={ name="メタモルリング+1", augments={'Path: A',}},
        back="無の外装",
    }
    
    -- 弱体魔法　ディスペガ
    sets.midcast['ディスペガ'] = set_combine(sets.midcast['弱体魔法'],{
        main="デイブレイクワンド",
    })

    --風水魔法
    sets.midcast.Geomancy={
        range={ name="デュンナ", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
        head="ＡＺフード+3",
        body="ＡＺコート+3",
        hands="ＡＺグローブ+3",
        legs={ name="ＢＡパンツ+3", augments={'Enhances "Mending Halation" effect',}},
        feet="ＡＺゲートル+3",
        neck={ name="バグアチャーム+2", augments={'Path: A',}},
        waist="プラチナモグベルト",
        left_ear={ name="アスプロピアス", augments={'Path: A',}},
        right_ear={ name="アジムスピアス+2", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+17','Damage taken-6%','INT+9 MND+9',}},
        left_ring={ name="メランリング", augments={'Path: A',}},
        right_ring="守りの指輪",
        back={ name="龍脈の外套", augments={'Geomancy Skill +8','Indi. eff. dur. +20','Pet: Damage taken -3%',}},
    }

    --エントラスト
    sets.midcast.Entrust={
        main={ name="ガーダ", augments={'Indi. eff. dur. +11','"Mag.Atk.Bns."+19','DMG:+7',}},
    }
end
