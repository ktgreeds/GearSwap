function init_weaponns()
    send_command('gs c set MainWeapons '..windower.to_shift_jis('ムサ')..'; wait 1; gs c set SubWeapons '..windower.to_shift_jis('エンキストラップ'))
end


function init_gear_sets()
    -- ロックスタイル番号
    lockstyleset  = 20
    lockstyleset_white  = 23
    lockstyleset_black  = 24

    -- 武器
    gear['ムサ']                = {name="ムサ"}
    gear['オパショーロ']        = {name="オパショーロ"}
    gear['コーンスー']          = {name="コーンスー"}
    gear['エンキストラップ']    = {name="エンキストラップ"}
    gear['ブンジロッド']        = {name="ブンジロッド"}
    gear['デイブレイクワンド']  = {name="デイブレイクワンド"}
    gear['マレヴォレンス']      = {name="マレヴォレンス", augments={'INT+9','Mag. Acc.+10','"Mag.Atk.Bns."+9','"Fast Cast"+4',}}
    gear['アムラピシールド']    = {name="アムラピシールド"}
    gear.Slip                   = { name="プライムスタッフ"}
    
    -- 監視用バフ
    sets.buff['机上演習']       = {head="ＡＣボード+4",body="ＰＤガウン+3",waist="エンブラサッシュ",}
    sets.buff['電光石火の章']   = {feet="ＰＤローファー+4"}
    sets.buff['疾風迅雷の章']   = {feet="ＰＤローファー+4"}
    sets.buff['意気昂然の章']   = {head="ＡＢボネット+3"}
    sets.buff['気炎万丈の章']   = {head="ＡＢボネット+3"}
    sets.buff['令狸執鼠の章']   = {hands="ＡＢブレーサー+3"}
    sets.buff['簡素清貧の章']   = {legs="ＡＢパンツ+3"}
    sets.buff['勤倹小心の章']   = {legs="ＡＢパンツ+3"}
    sets.buff['虚誘掩殺の策']   = {feet="ＡＢローファー+3"}
    sets.buff['震天動地の章']   = {main="エレマイトワンド",
                                   sub="玄冥盾",
                                   ammo="ストンチタスラム+1",
                                   head="無の面",
                                   body="アダマンアーマー",
                                   hands="ローゲイスカフス",
                                   legs="アマリクスロップス",
                                   feet="ＡＣローファー+4",
                                   neck="無の喉輪",
                                   waist="コーネリアの黒帯",
                                   left_ear="エテオレートピアス",
                                   right_ear="ハーティーピアス",
                                   left_ring="シーリチリング+1",
                                   right_ring="シーリチリング+1",
                                   back={ name="フィフォレケープ+1", augments={'Path: A',}},}

    --待機装備（通常）
    sets.idle = {
        ammo="ストンチタスラム+1",
        head="無の面",
        body="ＡＢガウン+3",
        hands="ニャメガントレ",
        legs="ＡＢパンツ+3",
        feet="ニャメソルレット",
        neck="シビルスカーフ",
        waist="キャリアーサッシュ",
        left_ear="エテオレートピアス",
        right_ear="ハーティーピアス",
        left_ring="メランリング",
        right_ring="シュネデックリング",
        back={ name="ルッフケープ", augments={'Eva.+20 /Mag. Eva.+20','Haste+10','Occ. inc. resist. to stat. ailments+10',}},   
    }

    --待機装備（リフレ）
    sets.idle.Refresh=set_combine(sets.idle,{
        head={ name="マーリンフード", augments={'Crit. hit damage +2%','Pet: Crit.hit rate +1','"Refresh"+2','Accuracy+4 Attack+4',}},
        body="ＡＢガウン+3",
        hands={ name="マーリンダスタナ", augments={'AGI+6','Pet: STR+5','"Refresh"+2','Accuracy+8 Attack+8',}},
        legs={ name="マーリンシャルワ", augments={'CHR+8','STR+3','"Refresh"+2','Mag. Acc.+2 "Mag.Atk.Bns."+2',}},
        feet={ name="マーリンクラッコー", augments={'Weapon Skill Acc.+8','"Fast Cast"+2','"Refresh"+2',}},
        neck="シビルスカーフ",
        left_ring="スティキニリング+1",
    })

    --抜刀装備
    sets.engaged = {
        ammo="ストンチタスラム+1",
        head={ name="ブリスタサリット+1", augments={'Path: A',}},
        body="ニャメメイル",
        hands="ニャメガントレ", 
        legs="ニャメフランチャ", 
        feet="ニャメソルレット", 
        neck="コンバタントトルク",
        waist="ウィンバフベルト+1",
        left_ear="テロスピアス",
        right_ear="アスプロピアス",
        left_ring="メランリング",
        right_ring="守りの指輪",
        back="無の外装",
    }
    
    -- 即時発動アビリティ　連環計
    sets.precast.JA['連環計'] = {
        legs="ＰＤパンツ+4"
    }

    -- 即時発動アビリティ　大悟徹底
    sets.precast.JA['大悟徹底'] = {
        body="ＰＤガウン+3"
    }
    
    --FC
    sets.precast.FC = {
        ammo="サピエンスオーブ",
        head="ＰＤボード+4",
        body="ピンガチュニック+1",
        hands="ＡＣブレーサー+4",
        legs="ピンガズボン+1",
        feet="ＡＣローファー+4",
        neck="オルンミラトルク",
        waist="エンブラサッシュ",
        left_ear="マリグナスピアス",
        right_ear="エンチャンピアス+1",
        left_ring="キシャールリング",
        right_ring="メダダリング",
        back="フィフォレケープ+1",
    }
    sets.precast.FC.value = 47

    -- FC（白グリ用）
    sets.precast.FC.WhiteMagic=set_combine(sets.precast.FC,{
        --main="ムサ"
    })

    -- FC（黒グリ用）
    sets.precast.FC.BlackMagic=set_combine(sets.precast.FC,{
        sub="チャンターシールド",
    })
    
    -- FC（ディスペガ用）
    sets.precast.FC['ディスペガ'] = set_combine( sets.precast.FC,{
        main="デイブレイクワンド",
    })

    -- FC（インパクト用）
    sets.precast.FC['インパクト'] = set_combine( sets.precast.FC,{
        head=empty,body="トワイライトプリス",
    })
    
    -- WSダメージ
    sets.precast.WS.Damage = {
        ammo="コイストボダー",
        head="ニャメヘルム",
        body="ニャメメイル",
        hands="ニャメガントレ", 
        legs="ニャメフランチャ", 
        feet="ニャメソルレット", 
        neck="コンバタントトルク",
        waist={ name="セールフィベルト+1", augments={'Path: A',}},
        left_ear={ name="胡蝶のイヤリング", augments={'Accuracy+4','TP Bonus +250',}},
        right_ear="テロスピアス",
        left_ring="シーリチリング+1",
        right_ring="シーリチリング+1",
        back="無の外装",
    }

    -- WS魔攻
    sets.precast.WS.Magic = {
        ammo={ name="ガストリタスラム+1", augments={'Path: A',}},
        head="ＡＢボネット+3",
        body="ＡＢガウン+3",
        hands="ＡＢブレーサー+3",
        legs="ＡＢパンツ+3",
        feet="ＡＢローファー+3",
        neck={ name="アギュトストール+2", augments={'Path: A',}},
        waist="スクリミルコード",
        left_ear="マリグナスピアス",
        right_ear="王将の耳飾り",
        left_ring="フレキリング",
        right_ring="メダダリング",
        back={ name="ルッフケープ", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
    }
    
    --共通WS定義読み込み
    init_weapon_skill()

    --弱体魔法
    sets.midcast['弱体魔法'] = {
        main="デイブレイクワンド",
        sub="アムラピシールド",
        ammo="クォーツタスラム+1",
        head="ＡＣボード+4",
        body="ＡＣガウン+4",
        hands="ＡＣブレーサー+4",
        legs="ＡＢパンツ+3",
        feet="ＡＣローファー+4",
        neck={ name="アギュトストール+2", augments={'Path: A',}},
        waist={ name="オブシテナサッシュ", augments={'Path: A',}},
        left_ear="マリグナスピアス",
        right_ear="王将の耳飾り",
        left_ring="キシャールリング",
        right_ring={ name="メタモルリング+1", augments={'Path: A',}},
        back="無の外装",
--        back={ name="オリストケープ+1", augments={'Path: A',}},
    }
    
    -- 弱体魔法　ディスペガ
    sets.midcast['ディスペガ'] = set_combine(sets.midcast['弱体魔法'],{
        main="デイブレイクワンド",
    })

    -- 弱体魔法　インパクト
    sets.midcast['インパクト']  = set_combine(sets.midcast['弱体魔法'],{
        head=empty,body="トワイライトプリス",
    })

    -- 弱体魔法　スタン
    sets.midcast['スタン']      = set_combine(sets.midcast['弱体魔法'],{
        ammo="ペムフレドタスラム"
    })
    
    sets.midcast['精霊魔法'] = {
        main={ name="ブンジロッド", augments={'Path: A',}},
        sub="アムラピシールド",
        ammo={ name="ガストリタスラム+1", augments={'Path: A',}},
        head={ name="ＰＤボード+4", augments={'Enh. "Altruism" and "Focalization"',}},
        body={ name="アグゥローブ", augments={'Path: A',}},
        hands={ name="アグゥゲージ", augments={'Path: A',}},
        legs={ name="アグゥスロップス", augments={'Path: A',}},
        feet="ＡＢローファー+3",
        neck={ name="アギュトストール+2", augments={'Path: A',}},
        waist="スクリミルコード",
        left_ear="マリグナスピアス",
        right_ear="王将の耳飾り",
        left_ring="フレキリング",
        right_ring="メダダリング",
        back={ name="ルッフケープ", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
    }
    sets.midcast['精霊魔法'].weak = set_combine(sets.midcast['精霊魔法'],{
    })

    sets.midcast['メルトン'] =  sets.midcast['精霊魔法']

    --計略
    sets.midcast.Helix = set_combine(sets.midcast['精霊魔法'] ,{
        sub="カルミナス",
        right_ear={ name="アバテルピアス+1", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+13','Enmity-3',}},
        waist="スクリミルコード",
        back="ブックワームケープ"    
    })

    -- 光門の計II
    sets.midcast["光門の計II"] = set_combine(sets.midcast.Helix,{
        main="デイブレイクワンド"
    })

    -- アスピル系
    sets.midcast.Aspir = set_combine(sets.midcast['精霊魔法'] ,{
        main="ルビカンディティー",
        legs="ＰＤパンツ+4",
        feet="アグゥピガッシュ",
        neck="エーラペンダント",
        waist="風鳥の帯",
        left_ring="エバネセンスリング",
        right_ring="アルコンリング",
    })

    -- ドレイン系
    sets.midcast.Drain = sets.midcast.Aspir

    sets.midcast['強化魔法'] = {
        head={ name="テルキネキャップ", augments={'"Cure" potency +7%','Enh. Mag. eff. dur. +10',}},
        body={ name="テルキネシャジュブ", augments={'"Cure" potency +7%','Enh. Mag. eff. dur. +10',}},
        hands={ name="テルキネグローブ", augments={'"Cure" potency +8%','Enh. Mag. eff. dur. +10',}},
        legs={ name="テルキネブラコーニ", augments={'"Cure" potency +7%','Enh. Mag. eff. dur. +10',}},
        feet={ name="テルキネピガッシュ", augments={'"Cure" potency +8%','Enh. Mag. eff. dur. +10',}},
        neck="インカンタートルク",
        waist="エンブラサッシュ",
        left_ear="アンドアーピアス",
        right_ear="ミミルピアス",
        left_ring="メランリング",
        right_ring={ name="ゼラチナスリング+1", augments={'Path: A',}},
        back={ name="月明の羽衣",priority=16},
    }

    -- 陣系
    sets.midcast.Storm = set_combine(sets.midcast['強化魔法'], {
        feet="ＰＤローファー+4"
    })

    -- リジェネ
    sets.midcast.Regen = set_combine(sets.midcast['強化魔法'], {
        head="ＡＢボネット+3",
        body="テルキネシャジュブ",
        back="ブックワームケープ"
    })

    -- リフレシュ
    sets.midcast.Refresh = set_combine(sets.midcast['強化魔法'], {
        head="ＡＭコイフ+1"
    })

    -- バ系
    sets.midcast.BarElement = set_combine(sets.midcast['強化魔法'], {
        legs="シェダルサラウィル"
    })

    -- ストンスキン
    sets.midcast['ストンスキン'] = set_combine(sets.midcast['強化魔法'], {
        legs="シェダルサラウィル",
        neck='ノデンズゴルゲット',
        left_ear='アースクライピアス',
        waist="ジーゲルサッシュ"
    })

    -- アクアベール
    sets.midcast['アクアベール'] = set_combine(sets.midcast['強化魔法'], {
        head="ＡＭコイフ+1",
        legs="シェダルサラウィル"
    })

    --ケアル
    sets.midcast.Cure = {
        sub="玄冥盾",
        ammo="ストンチタスラム+1",
        head={ name="ケカスミトラ+1", augments={'MP+80','"Cure" spellcasting time -7%','Enmity-6',}},
        body={ name="ケカスブリオー+1", augments={'MP+80','"Cure" spellcasting time -7%','Enmity-6',}},
        hands={ name="ケカスカフス+1", augments={'MP+80','"Cure" spellcasting time -7%','Enmity-6',}},
        legs={ name="ケカスタイツ", augments={'MP+60','"Cure" spellcasting time -5%','Enmity-5',}},
        feet="ＡＣローファー+4",
        neck="オルンミラトルク",
        waist="プラチナモグベルト",
        left_ear="シテレアパール",
        right_ear="アスプロピアス",
        left_ring={ name="メランリング", augments={'Path: A',}},
        right_ring="守りの指輪",
        back={ name="ルッフケープ", augments={'Eva.+20 /Mag. Eva.+20','Enmity-10','Damage taken-5%',}},
    }

    sets.midcast.Cursna={
        hands="ヒエロスミトン",
        feet="ＧＥガロッシュ+1",
        neck="デビリスメダル",
        left_ring="メネロスリング",
        right_ring="ハオマリング",
        back="オレタニアケープ+1",
    }
end
