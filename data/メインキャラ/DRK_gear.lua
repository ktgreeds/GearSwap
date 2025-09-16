function init_weaponns()
    --デフォルト武器を設定
    send_command('gs c set MainWeapons Zantetsu')
    send_command('gs c set SubWeapons UtuGrip')
end


function init_gear_sets()
    --ロックスタイル番号
    lockstyleset = 51

    --武器
    gear.Zantetsu               = {name="真・斬鉄剣"}
    gear.Deathbane              = {name="デスベインサイズ"}
    gear.UtuGrip                = {name="ウトゥグリップ"}
    gear.Khonsu                 = {name="コーンスー"}
    
    --待機装備（通常）
    sets.idle = {
        ammo="ストンチタスラム+1",
        head="サクパタヘルム",
        body="アダマンアーマー",
        hands="サクパタガントレ",
        legs="サクパタクウィス",
        feet="サクパタレギンス",
        neck={ name="暗黒の数珠+2", augments={'Path: A',}},
        waist="キャリアーサッシュ",
        left_ear="インフューズピアス",
        right_ear="ハーティーピアス",
        left_ring="メランリング",
        right_ring="シュネデックリング",
        back={ name="アンコウマント", augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10','Phys. dmg. taken-10%',}},
    }
    
    --待機装備（リフレ）
    sets.idle.Refresh = set_combine(sets.idle, {
        neck = "シビルスカーフ",
        body = "ルーグラクローク+1"
    })

    --走り回る用
    sets.Kiting={right_ring="シュネデックリング",}

    --抜刀装備
    sets.engaged = {
        ammo="コイストボダー",
        head="サクパタヘルム",
        body="デーゴンブレスト",
        hands="サクパタガントレ",
        legs="サクパタクウィス",
        feet="サクパタレギンス",
        neck="暗黒の数珠+2",
        waist={ name="セールフィベルト+1", augments={'Path: A',}},
        left_ear="テロスピアス",
        right_ear={ name="ヒーズンピアス+2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+17','Mag. Acc.+17','Weapon skill damage +4%','STR+9 INT+9',}},
        left_ring="シーリチリング+1",
        right_ring="ニックマドゥリング",
		back="無の外装",
    }
    
    --監視用バフ
    sets.buff['ドレッドスパイク']           = {body="ＨＴキュイラス+2"}
    sets.buff['ダークシール']               = {head="ＦＬバーゴネット+1",body="アダマンアーマー"}
    sets.buff['ネザーヴォイド']             = {body="アクロサーコート",legs="ＨＴフランチャ+2",feet="ラトリソルレット"}

    --即時発動系
    sets.precast.JA['ラストリゾート']       = {feet="ＦＬソルレット+3",back="アンコウマント"}
    sets.precast.JA['ネザーヴォイド']       = {legs="ＨＴフランチャ+2"}
    sets.precast.JA['ウェポンバッシュ']     = {head="ＩＧガントレ+2"}
    
    --FC
    sets.precast.FC = {
        ammo="サピエンスオーブ",
        head={ name="カマインマスク+1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},
        body="サクロブレスト",
        hands={ name="レイライングローブ", augments={'Accuracy+6','Mag. Acc.+2','"Mag.Atk.Bns."+6',}},
        legs={ name="オディシアクウィス", augments={'"Fast Cast"+6','AGI+9','Mag. Acc.+2',}},
        feet={ name="オディシアグリーヴ", augments={'Mag. Acc.+1 "Mag.Atk.Bns."+1','"Fast Cast"+6','VIT+2','Mag. Acc.+2','"Mag.Atk.Bns."+13',}},
        neck="オルンミラトルク",
        left_ear="エンチャンピアス+1",
        right_ear="エテオレートピアス",
        left_ring="キシャールリング",
        right_ring="ラハブリング",
    }
    
    --WSダメージ
    sets.precast.WS.Damage = {
        ammo="ノブキエリ",
        head={ name="ＦＬバーゴネット+3", augments={'Enhances "Dark Seal" effect',}},
        body="ＩＧキュイラス+3",
        hands={ name="ＦＬガントレット+3", augments={'Enhances "Diabolic Eye" effect',}},
        legs={ name="ＦＬフランチャー+3", augments={'Enhances "Muted Soul" effect',}},
        feet="ＨＴソルレット+2",
        neck={ name="暗黒の数珠+2", augments={'Path: A',}},
        waist={ name="セールフィベルト+1", augments={'Path: A',}},
        left_ear="テロスピアス",
        right_ear={ name="ヒーズンピアス+2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+17','Mag. Acc.+17','Weapon skill damage +4%','STR+9 INT+9',}},
        left_ring="エパミノダスリング",
        right_ring="コーネリアリング",
        back={ name="アンコウマント", augments={'VIT+20','Accuracy+20 Attack+20','VIT+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
    }
    
    --WS魔攻
    sets.precast.WS.Magic = {
        ammo="ノブキエリ",
        head="ニャメヘルム",
        body="ニャメメイル",
        hands="ニャメガントレ",
        legs="ニャメフランチャ",
        feet="ニャメソルレット",
        neck="シビルスカーフ",
        waist="オルペウスサッシュ",
        left_ear="マリグナスピアス",
        right_ear={ name="ヒーズンピアス+2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+17','Mag. Acc.+17','Weapon skill damage +4%','STR+9 INT+9',}},
        left_ring="エパミノダスリング",
        right_ring="コーネリアリング",
        back={ name="アンコウマント", augments={'VIT+20','Accuracy+20 Attack+20','VIT+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
    }

    --WSモクシャ
    sets.precast.WS.SubtleBlow = 
    {
        neck={ name="バーシチョーカー+1", augments={'Path: A',}},
		body="デーゴンブレスト",
        waist="サリサフロイベルト",
        left_ear="ディグニタリピアス",
        left_ring="シーリチリング+1",
        right_ring="シーリチリング+1",
    }
    
    --共通WS定義読み込み
    init_weapon_skill()

    --ドレイン
    sets.midcast.Drain = {
        main="ミサンスロピー",
        ammo="ペムフレドタスラム",
        body={ name="ルーグラクローク+1", augments={'Path: A',}},
        hands={ name="ＦＬガントレット+3", augments={'Enhances "Diabolic Eye" effect',}},
        legs="ＨＴフランチャ+2",
        feet={ name="オディシアグリーヴ", augments={'"Drain" and "Aspir" potency +10','Pet: Mag. Acc.+21','Accuracy+5 Attack+5',}},
        neck="エーラペンダント",
        waist="オルペウスサッシュ",
        left_ear="マリグナスピアス",
        right_ear={ name="ヒーズンピアス+2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+17','Mag. Acc.+17','Weapon skill damage +4%','STR+9 INT+9',}},
        left_ring="エバネセンスリング",
        right_ring="アルコンリング",
        back={ name="デオルクネスマント", augments={'Attack+6','Dark magic skill +7','"Drain" and "Aspir" potency +25',}},
    }

    --精霊魔法
    sets.midcast['精霊魔法']={
        ammo={ name="ガストリタスラム+1", augments={'Path: A',}},
        head="ニャメヘルム",
        body="ニャメメイル",
        hands="ニャメガントレ",
        legs="ニャメフランチャ",
        feet="ＨＴソルレット+2",
        neck="シビルスカーフ",
        waist="オルペウスサッシュ",
        left_ear="マリグナスピアス",
        right_ear="フリオミシピアス",
        right_ring="メタモルリング+1",
        back={ name="デオルクネスマント", augments={'Attack+6','Dark magic skill +7','"Drain" and "Aspir" potency +25',}},
    }

    --エンダーク
    sets.midcast['エンダークII']={
        ammo="ストンチタスラム+1",
        head="ＩＧバゴネット+3",
        body="アダマンアーマー",
        hands={ name="ＦＬガントレット+3", augments={'Enhances "Diabolic Eye" effect',}},
        legs="ＨＴフランチャ+2",
        feet="ラトリソルレット",
        neck="インカンタートルク",
        waist="オルペウスサッシュ",
        left_ear={ name="オノワイヤリング+1", augments={'Path: A',}},
        right_ear="磁界の耳",
        left_ring="エバネセンスリング",
        right_ring="スティキニリング+1",
        back={ name="デオルクネスマント", augments={'Attack+6','Dark magic skill +7','"Drain" and "Aspir" potency +25',}},
    }
    
    --アブゾ系
    sets.midcast.Absorb={
        ammo="ペムフレドタスラム",
        head="ＩＧバゴネット+3",
        body="アダマンアーマー",
        hands={ name="ＦＬガントレット+3", augments={'Enhances "Diabolic Eye" effect',}},
        legs={ name="ＦＬフランチャー+3", augments={'Enhances "Muted Soul" effect',}},
        feet="ラトリソルレット",
        neck="エーラペンダント",
        left_ear="マリグナスピアス",
        right_ear={ name="ヒーズンピアス+2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+17','Mag. Acc.+17','Weapon skill damage +4%','STR+9 INT+9',}},
        left_ring="キシャールリング",
        right_ring="スティキニリング+1",
        back="チュパローサマント"
    }
end