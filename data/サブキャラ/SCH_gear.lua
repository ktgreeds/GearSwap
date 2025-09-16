function init_weaponns()
    --デフォルト武器を設定
    send_command('gs c set MainWeapons Musa')
    send_command('gs c set SubWeapons Khonsu')
end


function init_gear_sets()
    --ロックスタイル番号
    lockstyleset_white = 139
    lockstyleset_black = 140
    lockstyleset        = lockstyleset_white

    --武器
    gear.Musa           = { name="ムサ"}
    gear.Khonsu         = { name="エンキストラップ"}
    gear.BunzisRod      = { name="ブンジロッド"}
    gear.Daybreak       = { name="デイブレイクワンド"}
    gear.AmmurapiShield = { name="アムラピシールド"}
    gear.Slip           = { name="プライムスタッフ"}
    
    --待機装備（通常）
    sets.idle = {
        ammo="ストンチタスラム+1",
        head={ name="無の面",priority=16},
        body="ＡＢガウン+3",
        hands="ヴォルトブレーサー",
        legs="ＡＢパンツ+3",
        feet="ニャメソルレット",
        neck="アギュトストール+2",
        waist="キャリアーサッシュ",
        left_ear="エテオレートピアス",
        right_ear="ハーティーピアス",
        left_ring="スティキニリング+1",
        right_ring="シュネデックリング",
        back="月明の羽衣",
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
        head="無の面",
        body="ＡＢガウン+3",
        hands="ＡＢブレーサー+3",
        legs="ＡＢパンツ+3",
        feet="ＡＢローファー+3",
        neck="無の喉輪",
        waist="無の腰当",
        left_ear="テロスピアス",
        right_ear="マーケピアス+1",
        left_ring="シーリチリング+1",
        right_ring="シーリチリング+1",
        back="無の外装",
    }
    
    --ベガリー用待機装備（着替え無効対策）
    sets.Vagary={
        main="ハーミットワンド",
        sub="玄冥盾",
        ammo="サピエンスオーブ",
        head={ name="ＰＤボード+4", augments={'Enh. "Altruism" and "Focalization"',}},
        body="ピンガチュニック+1",
        hands="ＡＣブレーサー+4",
        legs="ピンガズボン",
        feet="ＡＣローファー+4",
        neck="オルンミラトルク",
        waist="エンブラサッシュ",
        left_ear="マリグナスピアス",
        right_ear="エンチャンピアス+1",
        left_ring="キシャールリング",
        back={ name="フィフォレケープ+1", augments={'Path: A',}},
    }

	--監視用バフ
    sets.buff['机上演習'] = {
        head="ＡＣボード+3",
        body="ＰＤガウン+3",
        waist="エンブラサッシュ",
    }
    sets.buff['不惜身命の章'] = {}
    sets.buff['一心精進の章'] = {}
    sets.buff['天衣無縫の章'] = {}
    sets.buff['無憂無風の章'] = {}
    sets.buff['電光石火の章'] = {feet = "ＰＤローファー+3"}
    sets.buff['疾風迅雷の章'] = {feet = "ＰＤローファー+3"}
    sets.buff['意気昂然の章'] = {head = "ＡＢボネット+3"}
    sets.buff['気炎万丈の章'] = {head = "ＡＢボネット+3"}
    sets.buff['令狸執鼠の章'] = {hands= "ＡＢブレーサー+3"}
    sets.buff['震天動地の章'] = {
        main="ハーミットワンド",
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
        back={ name="フィフォレケープ+1", augments={'Path: A',}},
    }
    sets.buff['簡素清貧の章'] = {legs = "ＡＢパンツ+3"}
    sets.buff['勤倹小心の章'] = {legs = "ＡＢパンツ+3"}
    sets.buff['虚誘掩殺の策'] = {feet = "ＡＢローファー+3"}
    
    --即時発動系
    sets.precast.JA['連環計']   = {legs="ＰＤパンツ+3"}
    sets.precast.JA['大悟徹底'] = {body="ＰＤガウン+3"}
    
    --FC
    sets.precast.FC = {
        ammo="サピエンスオーブ",
        head={ name="ＰＤボード+4", augments={'Enh. "Altruism" and "Focalization"',}},
        body="ピンガチュニック+1",
        hands="ＡＣブレーサー+4",
        legs="ピンガズボン",
        feet="ＡＣローファー+4",
        neck="オルンミラトルク",
        waist="エンブラサッシュ",
        left_ear="マリグナスピアス",
        right_ear="エンチャンピアス+1",
        left_ring="キシャールリング",
        back={ name="フィフォレケープ+1", augments={'Path: A',}},
    }

    --FC（白グリ用）
    sets.precast.FC.WhiteMagic=set_combine(sets.precast.FC,{ main="ムサ"})

    --FC（黒グリ用）
   sets.precast.FC.BlackMagic=set_combine(sets.precast.FC,{ main={ name="ガーダ", augments={'"Fast Cast"+5','Mag. Acc.+14','"Mag.Atk.Bns."+14','DMG:+17',}},sub="チャンターシールド",})
    
   --FC（ディスペガ用）
   sets.precast.FC['ディスペガ'] = set_combine( sets.precast.FC,{main="デイブレイクワンド",})
    
    --FC（インパクト用）
    sets.precast.FC['インパクト'] = set_combine( sets.precast.FC,{head=empty,body="クレパスクラプリス",})
    
    --WS魔攻
    sets.precast.WS.Magic={
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
    sets.midcast.Cure = {
        ammo="ストンチタスラム+1",
        head={ name="ヴァニヤフード", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
        body={ name="ヴァニヤローブ", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
        hands={ name="テルキネグローブ", augments={'"Cure" potency +7%','Enh. Mag. eff. dur. +10',}},
        legs={ name="ヴァニヤスロップス", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
        feet={ name="ヴァニヤクロッグ", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
        neck="オルンミラトルク",
        waist="コーネリアの黒帯",
        left_ear="メンデカントピアス",
        right_ear={ name="オノワイヤリング+1", augments={'Path: A',}},
        left_ring="スティキニリング+1",
        right_ring="レベッチェリング",
        back="ソレムニティケープ",
    }

    --弱体魔法
    sets.midcast['弱体魔法'] = {
        main="ブンジロッド",
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
        right_ring="メダダリング",
        back="無の外装",
    }
    
    sets.midcast['ディスペガ'] = set_combine(sets.midcast['弱体魔法'],{main="デイブレイクワンド",})
    sets.midcast['スタン']      = set_combine(sets.midcast['弱体魔法'],{ammo="ペムフレドタスラム"})
    sets.midcast["インパクト"]  = set_combine(sets.midcast['弱体魔法'],{head=empty,body="クレパスクラプリス",})
    sets.midcast['精霊魔法'] = {
        main="ブンジロッド",
        sub="アムラピシールド",
        ammo={ name="ガストリタスラム+1", augments={'Path: A',}},
        head="ＰＤボード+4",
        body="ＡＢガウン+3",
        body="ＡＢガウン+3",
        hands={ name="アグゥゲージ", augments={'Path: A',}},
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

    sets.midcast['メルトン'] =  sets.midcast['精霊魔法']

    --計略
    sets.midcast.Helix = set_combine(sets.midcast['精霊魔法'] ,{
        sub="カルミナス",
        ammo={ name="ガストリタスラム+1", augments={'Path: A',}},
        waist="スクリミルコード",
        right_ear={ name="アバテルピアス+1", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+13','Enmity-3',}},
        back={ name="ブックワームケープ", augments={'INT+3','MND+3','Helix eff. dur. +20','"Regen" potency+7',}},
    
    })

    sets.midcast["光門の計II"] = set_combine(sets.midcast.Helix,{main="デイブレイクワンド"})

    sets.midcast.Drain = set_combine(sets.midcast['精霊魔法'] ,{
        main="ルビカンディティー",
        legs={ name="ＰＤパンツ+3", augments={'Enhances "Tabula Rasa" effect',}},
        feet={ name="マーリンクラッコー", augments={'Mag. Acc.+30','"Drain" and "Aspir" potency +11','INT+5','"Mag.Atk.Bns."+2',}},
        neck="エーラペンダント",
        waist="風鳥の帯",
        left_ring="エバネセンスリング",
        right_ring="アルコンリング",
    })

    sets.midcast['強化魔法'] = {
        head={ name="テルキネキャップ", augments={'"Cure" potency +7%','Enh. Mag. eff. dur. +10',}},
        body={ name="テルキネシャジュブ", augments={'"Cure" potency +7%','Enh. Mag. eff. dur. +10',}},
        hands={ name="テルキネグローブ", augments={'"Cure" potency +8%','Enh. Mag. eff. dur. +10',}},
        legs={ name="テルキネブラコーニ", augments={'"Cure" potency +7%','Enh. Mag. eff. dur. +10',}},
        feet={ name="テルキネピガッシュ", augments={'"Cure" potency +8%','Enh. Mag. eff. dur. +10',}},
        neck="インカンタートルク",
        waist="エンブラサッシュ",
        left_ear="ミミルピアス",
        left_ring="スティキニリング+1",
        back={ name="フィフォレケープ+1", augments={'Path: A',}},
    }

    sets.midcast.Storm      = set_combine(sets.midcast['強化魔法'], {feet="ＰＤローファー+3"})
    sets.midcast.Regen      = set_combine(sets.midcast['強化魔法'], {head="ＡＢボネット+3",body="テルキネシャジュブ",back="ブックワームケープ"})
    sets.midcast.Refresh    = set_combine(sets.midcast['強化魔法'], {head="ＡＭコイフ+1", legs="シェダルサラウィル",})
    sets.midcast.BarElement = set_combine(sets.midcast['強化魔法'], {legs="シェダルサラウィル",})
    sets.midcast.Stoneskin  = set_combine(sets.midcast['強化魔法'], {legs="シェダルサラウィル", neck='ノデンズゴルゲット', left_ear='アースクライピアス', waist="ジーゲルサッシュ",})
    sets.midcast.Refresh    = set_combine(sets.midcast['強化魔法'], {head="ＡＭコイフ+1"})
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
