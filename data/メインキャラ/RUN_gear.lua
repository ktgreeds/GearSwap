function init_weaponns()
    --デフォルト武器を設定
    send_command('gs c set MainWeapons Epeolatry')
    send_command('gs c set SubWeapons AlberStrap')
end


function init_gear_sets()
    --ロックスタイル番号
    lockstyleset = 151

    --両手剣
    gear.Epeolatry          = {name="エピオラトリー"}
    --グリップ
    gear.AlberStrap         = {name="アルバーストラップ"}
    gear.Khonsu             = {name="コーンスー"}
    
    --待機装備（通常）
    sets.idle = {
        ammo="ストンチタスラム+1",
        head="無の面",
        body="ＥＲサーコート+3",
        hands="ＥＲガントレ+3",
        legs="ＥＲレグガード+3",
        feet="ＥＲグリーヴ+3",
        --neck={ name="ウォーダチャーム+1", augments={'Path: A',}},
        neck={ name="フサルクトルク+2", augments={'Path: A',}},
        waist={name="プラチナモグベルト",priority=16},
        left_ear={ name="オノワイヤリング+1", augments={'Path: A',}},
        right_ear={ name="エリラズピアス+1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+12','Mag. Acc.+12','Damage taken-4%',},priority=15},
        left_ring="ワーデンリング",
        right_ring="シュネデックリング",
        back={ name="オーグマケープ", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','VIT+10','Enmity+10','DEF+50',}},
    }
    
    --抜刀装備
    sets.engaged = {
        ammo="ストンチタスラム+1",
        head="無の面",
        body="ＥＲサーコート+3",
        hands="ＥＲガントレ+3",
        legs="ＥＲレグガード+3",
        feet="ＥＲグリーヴ+3",
        neck={ name="フサルクトルク+2", augments={'Path: A',}},
        --neck={ name="ウォーダチャーム+1", augments={'Path: A',}},
        waist={name="プラチナモグベルト",priority=16},
        left_ear="シェリダピアス",
        right_ear={ name="エリラズピアス+1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+12','Mag. Acc.+12','Damage taken-4%',}},
        left_ring="ワーデンリング",
        right_ring="ニックマドゥリング",
        back={ name="オーグマケープ", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','VIT+10','Enmity+10','DEF+50',}},
    }

    --STP
    sets.engaged.Stp = {
        ammo="コイストボダー",
        head="無の面",
        body="アシェーラハーネス",
        hands="ＥＲガントレ+3",
        legs="ＥＲレグガード+3",
        feet="ＥＲグリーヴ+3",
        neck="コンバタントトルク",
        waist={name="プラチナモグベルト",priority=16},
        left_ear="シェリダピアス",
        right_ear={ name="エリラズピアス+1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+12','Mag. Acc.+12','Damage taken-4%',}},
        left_ring="シーリチリング+1",
        right_ring="シーリチリング+1",
        back="無の外装",
    }

    --受け流し
    sets.engaged.Parry = set_combine(sets.engaged,{ head="無の面", hands="トゥルムミトン+1",legs="ＥＲレグガード+3",feet="トゥルムレギンス+1",})
    
    --ノックバック+4
    sets.engaged.KnockBack = set_combine(sets.engaged,{ legs="ダッシングサブリガ",back="リパルスマント",}) 
    
    --モクシャ46
    sets.engaged.SubtleBlow = 
    {
        neck={ name="バーシチョーカー+1", augments={'Path: A',}},--11
        waist="サリサフロイベルト",--5
        left_ear="ディグニタリピアス",--5
        right_ear="シェリダピアス",--II 5
        left_ring="シーリチリング+1",--10
        right_ring="シーリチリング+1",--10
    }

    --敵対心装備
    sets.Enmity = {
        ammo="サピエンスオーブ",
        head="ハリタスヘルム",
        body="エメットハーネス+1",
        hands="クーリスグローブ",
        legs="ＥＲレグガード+3",
        feet="ＥＲグリーヴ+3",
        neck="月光の首飾り",
        waist={ name="プラチナモグベルト",priority=16},
        left_ear={ name="オノワイヤリング+1", augments={'Path: A',},priority=15},
        right_ear={ name="クリプティクピアス",priority=12},
        left_ring={ name="ゼラチナスリング+1", augments={'Path: A',},priority=14},
        right_ring={ name="アイワツリング",priority=13},
        back={ name="オーグマケープ", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','VIT+10','Enmity+10','DEF+50',}},
    }

	--監視用バフ
    sets.buff['エンボルド'] = {back="ディバートケープ"}

	--即時発動系バフ
    sets.precast.JA = sets.Enmity
    sets.precast.JA['E.スフォルツォ']       = set_combine(sets.Enmity,{body="ＦＵコート+3"})
    sets.precast.JA['ヴァリエンス']         = set_combine(sets.Enmity,{body="ＲＮコート+3",legs="ＦＵトラウザ+3"})
    sets.precast.JA['ヴァレション']         = set_combine(sets.Enmity,{body="ＲＮコート+3",legs="ＦＵトラウザ+3"})
    sets.precast.JA['ガンビット']           = set_combine(sets.Enmity,{hands="ＲＮミトン+3"})
    sets.precast.JA['ソードプレイ']         = set_combine(sets.Enmity,{hands="ＦＵミトン+3"})
    sets.precast.JA['バットゥタ']           = set_combine(sets.Enmity,{head="ＦＵバンド+3"})
    sets.precast.JA['ビベイシャス']         = set_combine(sets.Enmity,{main="ペオードクレイモア",head="ＥＲガレア+3",legs="ＲＮトラウザ+4",neck="インカンタートルク",left_ring="スティキニリング+1",})
    sets.precast.JA['フルーグ']             = set_combine(sets.Enmity,{feet="ＲＮブーツ+3"})
    sets.precast.JA['レイク']               = set_combine(sets.Enmity,{feet="ＦＵブーツ+3"})
    sets.precast.JA['スワイプ']             =  {ammo="ペムフレドタスラム",
                                                head={ name="アグゥキャップ", augments={'Path: A',}},
                                                body={ name="アグゥローブ", augments={'Path: A',}},
                                                hands={ name="アグゥゲージ", augments={'Path: A',}},
                                                legs={ name="アグゥスロップス", augments={'Path: A',}},
                                                feet={ name="アグゥピガッシュ", augments={'Path: A',}},
                                                neck="シビルスカーフ",
                                                waist="プラチナモグベルト",
                                                left_ear={ name="オノワイヤリング+1", augments={'Path: A',}},
                                                right_ear={ name="エリラズピアス+1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+12','Mag. Acc.+12','Damage taken-4%',}},
                                                left_ring="メダダリング",
                                                right_ring="月明の指輪",
                                                back={ name="オーグマケープ", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','VIT+10','Enmity+10','DEF+50',}}}
    sets.precast.JA['ランジ']               = sets.precast.JA['スワイプ']

    --FC:70
    sets.precast.FC = {
        ammo="サピエンスオーブ",
        head="ＲＮバンド+3",
        body="ＥＲサーコート+3",
        hands={ name="レイライングローブ", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
        legs={ name="ニャメフランチャ", augments={'Path: B',}},
        feet={ name="カマイングリーヴ", augments={'HP+60','STR+10','INT+10',}},
        neck="オルンミラトルク",
        waist={ name="プラチナモグベルト",priority=16},
        left_ear={ name="オノワイヤリング+1", augments={'Path: A',},priority=15},
        right_ear={ name="エテオレートピアス",priority=13},
        left_ring="メダダリング",
        right_ring={ name="月明の指輪",priority=14},
        back={ name="オーグマケープ", augments={'HP+60','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Damage taken-5%',}},
    }
  
    --WSダメージ
    sets.precast.WS.Damage = {
        ammo="コイストボダー",
        head="ニャメヘルム",
        body="ニャメメイル",
        hands="ニャメガントレ",
        legs="ニャメフランチャ",
        feet="ニャメソルレット",
        neck="無の喉輪",
        waist={ name="ケンタークベルト+1", augments={'Path: A',}},
        left_ear="シェリダピアス",
        right_ear={ name="胡蝶のイヤリング", augments={'Accuracy+4','TP Bonus +250',}},
        left_ring="ニックマドルリング",
        right_ring="王将の指輪",
        back="無の外装",
    }
    
    --WSクリティカル
    sets.precast.WS.Critical = {
    }

    --WS魔攻
    sets.precast.WS.Magic = {
        ammo="コイストボダー",
        head="ニャメヘルム",
        body="ニャメメイル",
        hands="ニャメガントレ",
        legs="ニャメフランチャ",
        feet="ニャメソルレット",
        neck="シビルスカーフ",
        waist={ name="セールフィベルト+1", augments={'Path: A',}},
        left_ear={ name="胡蝶のイヤリング", augments={'Accuracy+4','TP Bonus +250',}},
        right_ear="フリオミシピアス",
        left_ring="エパミノダスリング",
        right_ring="王将の指輪",
        back="無の外装",
    }

    --WSモクシャ
    sets.precast.WS.SubtleBlow = 
    {
        neck={ name="バーシチョーカー+1", augments={'Path: A',}},
        waist="サリサフロイベルト",
        left_ear="ディグニタリピアス",
        right_ear="シェリダピアス",
        left_ring="シーリチリング+1",
        right_ring="シーリチリング+1",
    }
    
    --共通WS定義読み込み
    init_weapon_skill()

    --詠唱中断
    sets.midcast.interruption = {
        ammo="ストンチタスラム+1",
        head="ＥＲガレア+3",
        body="アダマンアーマー",
        hands={ name="ローハイドグローブ", augments={'HP+50','Accuracy+15','Evasion+20',}},
        legs={ name="カマインクウィス+1", augments={'HP+80','STR+12','INT+12',}},
        feet="ＥＲグリーヴ+3",
        neck="月光の首飾り",
        waist="オドンブラサッシュ",
        left_ear={ name="オノワイヤリング+1", augments={'Path: A',},priority=14},
        right_ear="磁界の耳",
        left_ring="メランリング",
        right_ring={ name="月明の指輪",priority=15},
        back={ name="月明の羽衣",priority=16}
	}

    --強化魔法
    sets.midcast.EnhancingMagic = {
        ammo="ストンチタスラム+1",
        head="ＥＲガレア+3",
        body="アダマンアーマー",
        hands="ＲＮミトン+3",
        legs={ name="ＦＵトラウザ+3", augments={'Enhances "Inspire" effect',}},
        feet="ＥＲグリーヴ+3",
        neck="インカンタートルク",
        waist="コーネリアの黒帯",
        left_ear="ミミルピアス",
        right_ear={ name="エリラズピアス+1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+12','Mag. Acc.+12','Damage taken-4%',}},
        left_ring="メランリング",
        right_ring={ name="月明の指輪",priority=15},
        back={ name="月明の羽衣",priority=16}
    }

    --ストンスキン
    sets.midcast.Stoneskin= set_combine(sets.midcast.EnhancingMagic ,{
        body="アダマンアーマー",
        hands="ストーンマフラ",
        legs="ヘイヴンホーズ",
        neck="ストーンゴルゲット",
        waist="ジーゲルサッシュ",
        left_ear="アースクライピアス",
        back={ name="月明の羽衣",priority=16},
    })

    --ファランクス
    sets.midcast.Phalanx = {
        main="ザルフィカール",
        sub="ウトゥグリップ",
        ammo="ストンチタスラム+1",
        head={ name="ＦＵバンド+3", augments={'Enhances "Battuta" effect',}},
        body={ name="ヘルクリアベスト", augments={'STR+10','Pet: STR+9','Phalanx +5','Mag. Acc.+3 "Mag.Atk.Bns."+3',}},
        hands={ name="ヘルクリアグローブ", augments={'Magic Damage +1','Crit. hit damage +3%','Phalanx +4','Accuracy+10 Attack+10','Mag. Acc.+20 "Mag.Atk.Bns."+20',}},
        legs={ name="ヘルクリアトラウザ", augments={'AGI+8','Attack+7','Phalanx +4','Accuracy+1 Attack+1','Mag. Acc.+2 "Mag.Atk.Bns."+2',}},
        feet={ name="ヘルクリアブーツ", augments={'Weapon skill damage +2%','"Fast Cast"+3','Phalanx +5','Accuracy+16 Attack+16',}},
        neck="インカンタートルク",
        waist={ name="プラチナモグベルト",priority=16},
        left_ear={ name="オノワイヤリング+1", augments={'Path: A',},priority=14},
        right_ear="ミミルピアス",
        left_ring={ name="ゼラチナスリング+1", augments={'Path: A',},priority=13},
        right_ring={ name="月明の指輪",priority=15},
        back={ name="ディバートケープ", augments={'Enmity+1','"Embolden"+15','"Dbl.Atk."+3',}},
    }

    --被ファランクス
    sets.midcast.IncreasedPhalanx = sets.midcast.Phalanx

    --被プロテス
    sets.midcast.IncreasedProtect = {
        right_ring="シェルターリング",
    }

    --被シェル
    sets.midcast.IncreasedShell = {
        right_ring="シェルターリング",
    }

    --被リジェネ
    sets.midcast.IncreasedRegenerated = {
        neck="サクロゴルゲット",
        right_ear={ name="エリラズピアス+1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+12','Mag. Acc.+12','Damage taken-4%',}},
        waist = "スローダベルト",
    }

    --被カーズナ
    sets.midcast.IncreasedRegenerated = {
        neck = "ニカンダネックレス",
        waist = "ギシドゥバサッシュ",
        left_ring="サイダリング",
        right_ring="ピュリティーリング",
    }
    
    --リジェネ
    sets.midcast.Regen = set_combine(sets.midcast.EnhancingMagic,{head="ＲＮバンド+3",body="ＦＵコート+3",neck="サクロゴルゲット",waist="スローダベルト"})

    --ケアル
    sets.midcast.Cure = sets.Enmity

end