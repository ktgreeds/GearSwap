function init_weaponns()
    --デフォルト武器を設定
    send_command('gs c set MainWeapons Perun;wait 0.3; gs c set RangeWeapons Fomalhaut;wait 0.3; gs c set RangedMode Marksmanship')
    if player.sub_job == '忍' or player.sub_job == 'NIN' or player.sub_job == '踊' or player.sub_job == 'DNC' then
        send_command('gs c set SubWeapons KrakenClub')
    else
        send_command('gs c set SubWeapons NuskuShield')
    end

end


function init_gear_sets()
    --ロックスタイル番号
    lockstyleset = 181

    --片手剣
    gear.Naegling               = {name="ネイグリング"}
    --片手棍
    gear.KrakenClub             = {name="クラーケンクラブ"}
    --短剣
    gear.CrepuscularKnife       = {name="クレパスクラナイフ"}
    gear.Kustawi                = {name="クスタウィ+1"}
    gear.Malevolence            = {name="マレヴォレンス"}
    --片手斧
    gear.Perun                  = {name="ペルーン+1"}
    --盾
    gear.NuskuShield            = {name="ヌスクシールド"}
    --弓
    gear.Hangaku                = {name="板額の弓"}
    gear.Fomalhaut              = {name="フォーマルハウト"}
    gear.TPBonus                = {name="スパロウホーク+2"}
    --その他
    gear.Slip                   = {name="プライムガン"}

    --矢弾
    gear.ArcheryPhysics         = {name="石の矢"}
    gear.MarksmanshipPhysics    = {name="クロノブレット"}
    gear.MarksmanshipMagical    = {name="クロノブレット"}
    gear.HauksbokArrow          = {name="ホクスボクアロー"}
    gear.HauksbokBullet         = {name="ホクスボクブレット"}


    --待機装備（通常）
    sets.idle = {
        head="無の面",
        body="アダマンアーマー",
        hands={ name="ニャメガントレ", augments={'Path: B',}},
        legs={ name="ニャメフランチャ", augments={'Path: B',}},
        feet={ name="ニャメソルレット", augments={'Path: B',}},
        neck="無の喉輪",
        waist="無の腰当",
        left_ear="エアバニピアス",
        right_ear="インフューズピアス",
        left_ring="ヴェンジフルリング",
        right_ring="シュネデックリング",
        back="無の外装",
    }

    --待機装備（リフレ）
    sets.idle.Refresh = set_combine(sets.idle,{
        head={ name="ヘルクリアヘルム", augments={'Weapon skill damage +2%','AGI+6','"Refresh"+2','Accuracy+9 Attack+9',}},
        hands={ name="ヘルクリアグローブ", augments={'Spell interruption rate down -6%','Attack+5','"Refresh"+2','Accuracy+8 Attack+8',}},
        legs={ name="ヘルクリアトラウザ", augments={'Pet: VIT+10','"Subtle Blow"+10','"Refresh"+2','Accuracy+8 Attack+8',}},
        feet={ name="ヘルクリアブーツ", augments={'"Mag.Atk.Bns."+17','STR+9','"Refresh"+2',}},
        neck="シビルスカーフ",
    })

    --抜刀装備
    sets.engaged = {
        head="マリグナスシャポー",
        body="マリグナスタバード",
        hands="ＡＭグロブレト+3",
        legs="ＡＭブラーグ+3",
        feet="マリグナスブーツ",
        neck="無の喉輪",
        waist={ name="セールフィベルト+1", augments={'Path: A',}},
        left_ear="昏黄の耳飾り",
        right_ear="テロスピアス",
        left_ring="シーリチリング+1",
        right_ring="シーリチリング+1",
        back="無の外装",
    }

    --モクシャ 50
    sets.engaged.SubtleBlow = set_combine(sets.engaged,{
        head="ダンペニングタム",
        hands={ name="アデマリスト+1", augments={'Accuracy+20','Attack+20','"Subtle Blow"+8',}},
        feet="ムンムゲマッシュ+2",
        waist={ name="セールフィベルト+1", augments={'Path: A',}},
        right_ear="ディグニタリピアス",
        left_ring="シーリチリング+1",
        right_ring="シーリチリング+1",
    })

    --二刀流11（サポ忍）
    sets.engaged.dual11= {waist="霊亀腰帯",left_ear="エアバニピアス",}
    
    --二刀流21（サポ踊）
    sets.engaged.dual21= set_combine(sets.engaged.dual11,{back={ name="カムラスマント", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dual Wield"+10','Phys. dmg. taken-10%',}},})

    --監視用バフ
    sets.buff['トリプルショット']       = set_combine(sets.midcast.RA,{body="ＣＳフラック+3"})

    --即時発動系
    sets.precast.JA["ランダムディール"] = {body={ name="ＬＡフラック+3", augments={'Enhances "Loaded Deck" effect',}},}
    sets.precast.JA["フォールド"]       = {hands={ name="ＬＡガントリー+3", augments={'Enhances "Fold" effect',}},}
    sets.precast.JA["スネークアイ"]     = {legs={ name="ＬＡトルーズ+3", augments={'Enhances "Snake Eye" effect',}},}
    sets.precast.JA["ワイルドカード"]   = {feet={ name="ＬＡブーツ+4", augments={'Enhances "Wild Card" effect',}},}

    --FC
    sets.precast.FC = {
        head={ name="ヘルクリアヘルム", augments={'"Mag.Atk.Bns."+9','"Fast Cast"+6','Mag. Acc.+9',}},
        body="ドレッドジュポン",
        hands="レイライングローブ",
        legs={ name="ヘルクリアトラウザ", augments={'Mag. Acc.+16','"Fast Cast"+6','STR+10',}},
        feet={ name="ヘルクリアブーツ", augments={'"Fast Cast"+6','MND+2','Mag. Acc.+2',}},
        neck="オルンミラトルク",
        waist="コーネリアの黒帯",
        left_ear="エテオレートピアス",
        right_ear="エンチャンピアス+1",
        left_ring="ラハブリング",
        right_ring="メダダリング",
    }
    
    --スナップ
    sets.precast.RA = {
        head={ name="テーオンシャポー", augments={'"Snapshot"+5','"Snapshot"+5',}},
        body="ＡＭカバン+3",
        hands={ name="テーオングローブ", augments={'"Snapshot"+5','"Snapshot"+5',}},
        legs="ＯＲブラッカエ+3",
        feet="メガナダジャンボ+2",
        neck={ name="スカウトゴルゲ+2", augments={'Path: A',}},
        waist="イェマヤベルト",
        left_ring="昏黄の指輪",
        back={ name="ベレナスケープ", augments={'"Snapshot"+10',}},
    }

    --WSダメージ
    sets.precast.WS.Damage = {
        head="ニャメヘルム",
        body="ニャメメイル4",
        hands="ニャメガントレ",
        legs="ニャメフランチャ",
        feet="ニャメソルレット",
        neck="共和プラチナ章",
        waist={ name="セールフィベルト+1", augments={'Path: A',}},
        left_ear={ name="胡蝶のイヤリング", augments={'Accuracy+4','TP Bonus +250',}},
        right_ear="テロスピアス",
        left_ring="エパミノダスリング",
        right_ring="王将の指輪",
        back={ name="カムラスマント", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
    }
    
    --WS遠隔ダメージ
    sets.precast.WS.Range = {
        head="ニャメヘルム",
        body="ニャメメイル4",
        hands="ニャメガントレ",
        legs="ニャメフランチャ",
        feet="ニャメソルレット",
        neck="イスクルゴルゲット",
        waist="テレンベルト",
        left_ear={ name="胡蝶のイヤリング", augments={'Accuracy+4','TP Bonus +250',}},
        right_ear="テロスピアス",
        left_ring="ディンジルリング",
        right_ring="王将の指輪",
        back={ name="カムラスマント", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
    }
    
    --WS遠隔魔攻
    sets.precast.WS.Magic = {
        head="ニャメヘルム",
        body="ニャメメイル4",
        hands="ニャメガントレ",
        legs="ニャメフランチャ",
        feet="ニャメソルレット",
        neck={ name="コモドアチャーム+2", augments={'Path: A',}},
        waist="オルペウスサッシュ",
        left_ear={ name="胡蝶のイヤリング", augments={'Accuracy+4','TP Bonus +250',}},
        right_ear="フリオミシピアス",
        left_ring="ディンジルリング",
        right_ring="エパミノダスリング",
        back={ name="カムラスマント", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
    }

    --WSモクシャ
    sets.precast.WS.SubtleBlow = sets.engaged.SubtleBlow
    
    --共通WS定義読み込み
    init_weapon_skill()

    --遠隔攻撃
    sets.midcast.RA = {
        ammo=gear.RAbulletphysics,
        head="マリグナスシャポー",
        body="マリグナスタバード",
        hands="マリグナスグローブ",
        legs="ＣＳトルーズ+3",
        feet="マリグナスブーツ",
        neck="イスクルゴルゲット",
        waist="イェマヤベルト",
        left_ear="昏黄の耳飾り",
        right_ear="テロスピアス",
        left_ring="シーリチリング+1",
        right_ring="シーリチリング+1",
        back={ name="カムラスマント", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc.+10','"Store TP"+10',}},
    }
end