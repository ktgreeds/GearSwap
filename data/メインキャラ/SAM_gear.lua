function init_weaponns()
    --デフォルト武器を設定
    send_command('gs c set MainWeapons DojikiriYasutsuna')
    send_command('gs c set SubWeapons UtuGrip')
end


function init_gear_sets()
    --ロックスタイル番号
    lockstyleset = 81

    --武器
    gear.DojikiriYasutsuna      = {name="童子切安綱"}
    gear.ShiningOne             = {name="シャイニングワン"}
    gear.UtuGrip                = {name="ウトゥグリップ"}
    gear.Khonsu                 = {name="コーンスー"}
    
    --待機装備
    sets.idle = {
        ammo="ストンチタスラム+1",
        head={ name="ニャメヘルム", augments={'Path: B',}},
        body="アダマンアーマー",
        hands={ name="ニャメガントレ", augments={'Path: B',}},
        legs={ name="ニャメフランチャ", augments={'Path: B',}},
        feet={ name="ニャメソルレット", augments={'Path: B',}},
        neck={ name="バーシチョーカー+1", augments={'Path: A',}},
        waist="無の腰当",
        left_ear="エアバニピアス",
        right_ear="インフューズピアス",
        left_ring="メランリング",
        right_ring="シュネデックリング",
        back="無の外装",
    }

    --抜刀装備
    sets.engaged = {
        ammo={ name="コイストボダー", augments={'Path: A',}},
        head="極春日烏帽子形兜",
        body="極春日胴丸",
        hands={ name="楯無篭手改", augments={'Path: A',}},
        legs="極春日板佩楯",
        feet="乾闥婆脛当改",
        neck={ name="侍の喉輪+2", augments={'Path: A',}},
        waist={ name="セールフィベルト+1", augments={'Path: A',}},
        left_ear="シェレピアス",
        right_ear={ name="真春日耳飾り", augments={'System: 1 ID: 1676 Val: 0','Accuracy+19','Mag. Acc.+19','Weapon skill damage +4%','STR+13 DEX+13',}},
        left_ring="シーリチリング+1",
        right_ring="シーリチリング+1",
        back="無の外装",
    }

    --モクシャ51
    sets.precast.WS.SubtleBlow = 
    {
        neck={ name="バーシチョーカー+1", augments={'Path: A',}},--11
		body="デーゴンブレスト",--II 10
        waist="サリサフロイベルト",--5
        left_ear="ディグニタリピアス",--5
        left_ring="シーリチリング+1",--10
        right_ring="シーリチリング+1",--10
    }

    sets.engaged.Hasso          = set_combine(sets.engaged,{legs="極春日板佩楯"})
    sets.engaged.Seigan         = set_combine(sets.engaged,{head="極春日烏帽子形兜",neck="月明の喉輪"})
    sets.engaged.ThirdEye       = set_combine(sets.engaged,{legs="極左近士板佩楯"})

    --監視用バフ
    sets.buff['明鏡止水'] = {legs="極左近士筒脛当"}

    --即時発動系
    sets.precast.JA['明鏡止水']     = {legs="極左近士筒脛当"}
    sets.precast.JA['黙想']         = {head="極脇戸桃形兜",hands="極左近士筒篭手",back="スメルトリオマント"}
    sets.precast.JA['先義後利']     = {legs="極春日筒脛当"}
    sets.precast.JA['護摩の守護円'] = {head="極脇戸桃形兜"}

    --FC
    sets.precast.FC = {
        ammo="サピエンスオーブ",
        body="サクロブレスト",
        hands={ name="レイライングローブ", augments={'Accuracy+6','Mag. Acc.+2','"Mag.Atk.Bns."+6',}},
        neck="オルンミラトルク",
        waist="コーネリアの黒帯",
        left_ear="エテオレートピアス",
        right_ear="エンチャンピアス+1",
        left_ring="メダダリング",
        right_ring="ラハブリング",
    }

    --WSダメージ
    sets.precast.WS.Damage = {
        ammo="ノブキエリ",
        head={ name="ムパカキャップ", augments={'Path: A',}},
        body="越左近士胴丸",
        hands="極春日筒篭手",
        legs={ name="ニャメフランチャ", augments={'Path: B',}},
        feet={ name="ニャメソルレット", augments={'Path: B',}},
        neck={ name="侍の喉輪+2", augments={'Path: A',}},
        waist={ name="セールフィベルト+1", augments={'Path: A',}},
        left_ear="スラッドピアス",
        right_ear={ name="真春日耳飾り", augments={'System: 1 ID: 1676 Val: 0','Accuracy+19','Mag. Acc.+19','Weapon skill damage +4%','STR+13 DEX+13',}},
        left_ring="スローダリング",
        right_ring="王将の指輪",
        back={ name="スメルトリオマント", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
    }
    
    --WS魔攻
    sets.precast.WS.Magic = {
        ammo="ノブキエリ",
        head={ name="ニャメヘルム", augments={'Path: B',}},
        body={ name="ニャメメイル", augments={'Path: B',}},
        hands={ name="ニャメガントレ", augments={'Path: B',}},
        legs={ name="ニャメフランチャ", augments={'Path: B',}},
        feet={ name="ニャメソルレット", augments={'Path: B',}},
        neck={ name="侍の喉輪+2", augments={'Path: A',}},
        waist="オルペウスサッシュ",
        left_ear={ name="胡蝶のイヤリング", augments={'Accuracy+4','TP Bonus +250',}},
        right_ear={ name="真春日耳飾り", augments={'System: 1 ID: 1676 Val: 0','Accuracy+19','Mag. Acc.+19','Weapon skill damage +4%','STR+13 DEX+13',}},
        left_ring="スローダリング",
        right_ring="王将の指輪",
        back={ name="スメルトリオマント", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
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

end