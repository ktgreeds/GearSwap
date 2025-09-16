function init_weaponns()
    --デフォルト武器を設定
    send_command('gs c set MainWeapons Geirrothr')
    send_command('gs c set SubWeapons UtuGrip')
end


function init_gear_sets()
    --ロックスタイル番号
    lockstyleset = 171

    --武器
    gear.ShiningOne             = {name="シャイニングワン"}
    gear.Geirrothr              = {name="ゲイルレズ"}
    gear.UtuGrip                = {name="ウトゥグリップ"}
    gear.Khonsu                 = {name="コーンスー"}


    --待機装備（通常）
    sets.idle = {
        ammo="ストンチタスラム+1",
        head="無の面",
        body="サクロブレスト",
        hands="ＰＥバンブレス+3",
        legs="ＰＥキュイソー+3",
        feet="ＰＥシンバルド+3",
        neck="竜騎士の首輪+2",
        waist="プラチナモグベルト",
        left_ear={ name="オノワイヤリング+1", augments={'Path: A',}},
        right_ear="ハーティーピアス",
        left_ring="ワーデンリング",
        right_ring="シュネデックリング",
        back={ name="ブリガンチアマント", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
    }

    --待機装備（リフレ）
    sets.idle.Refresh = set_combine(sets.idle,{
        left_ring="スティキニリング+1",
        neck="シビルスカーフ",
    })
    
    --走り回る用
    sets.Kiting={right_ring="シュネデックリング",}

    --抜刀装備
    sets.engaged = {
        ammo="コイストボダー",
        head="フロプトヘルム",
        body="ＰＥプラカート+3",
        hands="ＰＥバンブレス+3",
        legs="ＰＥキュイソー+3",
        feet="ＰＥシンバルド+3",
        neck="竜騎士の首輪+2",
        waist={ name="セールフィベルト+1", augments={'Path: A',}},
        left_ear="シェリダピアス",
        right_ear="テロスピアス",
        left_ring="ニックマドゥリング",
        right_ring="シーリチリング+1",
		back="無の外装",
    }

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

    --監視用バフ
    sets.buff['八双']                       = sets.precast.JA['八双']


    --即時発動系バフ
    sets.precast.JA['ジャンプ']             = {
        ammo="コイストボダー",
        head="フロプトヘルム",
        body="ＶＳメイル+3",
        hands="ＶＳフィンガー+3",
        legs="ＰＥキュイソー+3",
        feet="オストログリーヴ",
        neck="コンバタントトルク",
        waist={ name="セールフィベルト+1", augments={'Path: A',}},
        left_ear="シェリダピアス",
        right_ear="テロスピアス",
        left_ring="シーリチリング+1",
        right_ring="シーリチリング+1",
        back={ name="ブリガンチアマント", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
    }
    sets.precast.JA['ハイジャンプ']         = set_combine(sets.precast.JA['ジャンプ'],{legs = "ＶＳブレー+3"})
    sets.precast.JA['スーパージャンプ']     = sets.precast.JA['ジャンプ']
    sets.precast.JA['スピリットジャンプ']   = set_combine(sets.precast.JA['ジャンプ'],{legs = "ＰＥキュイソー+3",feet="ＰＥシンバルド+3"})
    sets.precast.JA['ソウルジャンプ']       = set_combine(sets.precast.JA['ジャンプ'],{legs = "ＰＥキュイソー+3"})
    sets.precast.JA['アンゴン']             = {ammo="アンゴン",hands="ＰＴフィンガー+3"}
    sets.precast.JA['竜剣']                 = {body="ＰＴメイル+3"}
    sets.precast.JA['ディープブリージング'] = {head="ＰＴアーメット+3"}
    sets.precast.JA['スピリットリンク']     = {head="ＶＳアーメット+3",body="ＰＴグリーヴ+3",hands="ＰＥバンブレス+3"}
    sets.precast.JA['スマイトブレス']       = {head="ＶＳアーメット+3"}
    sets.precast.JA['レストアブレス']       = {head="ＶＳアーメット+3"}
    sets.precast.JA['コールワイバーン']     = {body="ＰＴメイル+3"}

    --FC
    sets.precast.FC = {
        ammo="サピエンスオーブ",
        head={ name="カマインマスク+1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},
        body="サクロブレスト",
        hands={ name="レイライングローブ", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
        feet={ name="カマイングリーヴ", augments={'HP+60','STR+10','INT+10',}},
        neck="オルンミラトルク",
        left_ear="エテオレートピアス",
        right_ear="エンチャンピアス+1",
        left_ring="メダダリング",
        right_ring="ラハブリング",
    }

    --WSダメージ
    sets.precast.WS.Damage = {
        ammo="ノブキエリ",
        head={ name="ニャメヘルム", augments={'Path: B',}},
        body={ name="ニャメメイル", augments={'Path: B',}},
        hands={ name="ニャメガントレ", augments={'Path: B',}},
        legs={ name="ニャメフランチャ", augments={'Path: B',}},
        feet={ name="ニャメソルレット", augments={'Path: B',}},
        neck="竜騎士の首輪+2",
        waist={ name="セールフィベルト+1", augments={'Path: A',}},
        left_ear={ name="胡蝶のイヤリング", augments={'Accuracy+4','TP Bonus +250',}},
        right_ear="スラッドピアス",
        left_ring="スローダリング",
        right_ring="王将の指輪",
        back={ name="ブリガンチアマント", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
    }

    --WSクリティカル
    sets.precast.WS.Critical = {
        ammo="ノブキエリ",
        head={ name="ブリスタサリット+1", augments={'Path: A',}},
        body="フロプトブレスト",
        hands="グレティガントレ",
        legs="ＰＥキュイソー+3",
        feet="グレティブーツ",
        neck="フォシャゴルゲット",
        waist="フォシャベルト",
        left_ear="シェリダピアス",
        right_ear={ name="ペルタスピアス+1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+12','Mag. Acc.+12','Crit.hit rate+4',}},
        left_ring="ニックマドゥリング",
        right_ring="王将の指輪",
        back="無の外装",
    }

    --WS魔攻
    sets.precast.WS.Magic = {
        ammo={ name="ガストリタスラム+1", augments={'Path: A',}},
        head={ name="ニャメヘルム", augments={'Path: B',}},
        body={ name="ニャメメイル", augments={'Path: B',}},
        hands={ name="ニャメガントレ", augments={'Path: B',}},
        legs={ name="ニャメフランチャ", augments={'Path: B',}},
        feet={ name="ニャメソルレット", augments={'Path: B',}},
        neck="シビルスカーフ",
        waist="オルペウスサッシュ",
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

    sets.midcast['スマイトブレス']       = {head="ＰＴアーメット+3"}
    sets.midcast['レストアブレス']       = {head="ＰＴアーメット+3"}

end