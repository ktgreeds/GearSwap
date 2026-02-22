function init_weaponns()
    -- デフォルト武器を設定
    send_command('gs c set MainWeapons RostamB; wait 0.5; gs c set SubWeapons NuskuShield; wait 0.5; gs c set RangeWeapons Fomalhaut;')
    if player.sub_job == '忍' or player.sub_job == 'NIN' or player.sub_job == '踊' or player.sub_job == 'DNC' then
        send_command('wait 2; gs c set SubWeapons GletisKnife')
    end
end


function init_gear_sets()
    -- ロックスタイル番号
    lockstyleset = 17

    -- 短剣
    gear.RostamA                    = {name="ロスタム", augments={'Path: A'}}
    gear.RostamB                    = {name="ロスタム", augments={'Path: B'}}
    gear.RostamC                    = {name="ロスタム", augments={'Path: C'}}
    gear.Kustawi                    = {name="クスタウィ+1"}
    gear.Tauret                     = {name="トーレット"}
    gear.GletisKnife                = {name="グレティナイフ"}

    -- 片手剣
    gear.Naegling                   = {name="ネイグリング"}
    
    -- 盾
    gear.NuskuShield                = {name="ヌスクシールド"}
    
    -- 銃
    gear.DeathPenalty               = {name="デスペナルティ"}
    gear.Fomalhaut                  = {name="フォーマルハウト"}
    gear.TPBonus                    = {name="アナーキー+2"}
    
    -- 矢弾
    gear.MarksmanshipPhysics        = {name="クロノブレット"}
    gear.MarksmanshipMagical        = {name="ライヴブレット"}
    gear.HauksbokBullet             = {name="ホクスボクブレット"}
    gear.HoxneAmpulla               = {name="ホクスニアムプラ"}
    gear.AnimikiiBullet             = {name="アニミキーブレット"}
    gear.CorsairShot                = gear.AnimikiiBullet 
    gear.LuzafsRing                 = {name="ルザフリング"}

    -- その他
    gear.Slip                       = {name="プライムガン"}

    -- 監視用バフ
    sets.buff['トリプルショット']   = {body="ＣＳフラック+3"}

    -- 待機装備（通常）
    sets.idle = {
        head="無の面",
        body={ name="ニャメメイル", augments={'Path: B',}},
        hands={ name="ニャメガントレ", augments={'Path: B',}},
        legs={ name="ニャメフランチャ", augments={'Path: B',}},
        feet={ name="ニャメソルレット", augments={'Path: B',}},
        neck={ name="バーシチョーカー+1", augments={'Path: A',}},
        waist="無の腰当",
        left_ear="エアバニピアス",
        right_ear="インフューズピアス",
        left_ring={ name="メランリング", augments={'Path: A',}},
        right_ring="シュネデックリング",
        back="無の外装",
    }

    -- 待機装備（リフレ）
    sets.idle.Refresh = set_combine(sets.idle,{
        head={ name="ヘルクリアヘルム", augments={'Weapon skill damage +2%','AGI+6','"Refresh"+2','Accuracy+9 Attack+9',}},
        hands={ name="ヘルクリアグローブ", augments={'Spell interruption rate down -6%','Attack+5','"Refresh"+2','Accuracy+8 Attack+8',}},
        legs={ name="ヘルクリアトラウザ", augments={'Pet: VIT+10','"Subtle Blow"+10','"Refresh"+2','Accuracy+8 Attack+8',}},
        feet={ name="ヘルクリアブーツ", augments={'"Mag.Atk.Bns."+17','STR+9','"Refresh"+2',}},
        neck="シビルスカーフ",
    })

    -- 抜刀装備
    sets.engaged = {
        head="マリグナスシャポー",
        body={ name="アデマジャケット+1", augments={'DEX+12','AGI+12','Accuracy+20',}},
        hands={ name="アデマリスト+1", augments={'Accuracy+20','Attack+20','"Subtle Blow"+8',}},
        legs="ＣＳトルーズ+3",
        feet="マリグナスブーツ",
        neck="無の喉輪",
        waist="ウィンバフベルト+1",
        left_ear="アスプロピアス",
        right_ear="テロスピアス",
        left_ring="メランリング",
        right_ring="シーリチリング+1",
        back={ name="カムラスマント", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},
    }

    sets.engaged.ACC = {
        head="マリグナスシャポー",
        body={ name="アデマジャケット+1", augments={'DEX+12','AGI+12','Accuracy+20',}},
        hands="ガズブレスレット+1",
        legs="ＣＳトルーズ+3",
        feet="マリグナスブーツ",
        neck="無の喉輪",
        waist="無の腰当",
        left_ear="アスプロピアス",
        right_ear="シャスーピアス+2",
        left_ring="シーリチリング+1",
        right_ring="シーリチリング+1",
        back="無の外装",
    }

    -- 二刀流11（サポ忍）
    sets.engaged.dual11= {left_ear="エアバニピアス"}

    -- 二刀流21（サポ踊）
   sets.engaged.dual21= set_combine(sets.engaged.dual11,{left_ear="エアバニピアス",back={ name="カムラスマント", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dual Wield"+10','Phys. dmg. taken-10%',}}})

    -- 即時発動アビリティ
    sets.precast.JA["ランダムディール"] = {
        body="ＬＡフラック+3"
    }
    
    sets.precast.JA["フォールド"] = {
        hands="ＬＡガントリー+3"
    }
    
    sets.precast.JA["スネークアイ"] = {
        legs="ＬＡトルーズ+3"
    }
    
    sets.precast.JA["ワイルドカード"] = {
        feet="ＬＡブーツ+4"
    }

    -- FC
    sets.precast.FC = {
        head={ name="ヘルクリアヘルム", augments={'"Mag.Atk.Bns."+9','"Fast Cast"+6','Mag. Acc.+9',}},
        body="ドレッドジュポン",
        hands={ name="レイライングローブ", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
        legs={ name="ヘルクリアトラウザ", augments={'Mag. Acc.+16','"Fast Cast"+6','STR+10',}},
        feet={ name="ヘルクリアブーツ", augments={'"Fast Cast"+6','MND+2','Mag. Acc.+2',}},
        neck="オルンミラトルク",
        waist="コーネリアの黒帯",
        left_ear="エテオレートピアス",
        right_ear="エンチャンピアス+1",
        left_ring="キシャールリング",
        right_ring="メダダリング",
        back="無の外装",
    }

    sets.precast.FC.value = 62

    -- スナップ
    sets.precast.RA = {
        ammo=gear.MarksmanshipPhysics,
        head={ name="テーオンシャポー", augments={'"Snapshot"+5','"Snapshot"+5',}},
        body="ＬＫフラック+4",
        hands={ name="ＬＡガントリー+3", augments={'Enhances "Fold" effect',}},
        legs="ＬＫトルーズ+4",
        feet="メガナダジャンボ+2",
        neck={ name="コモドアチャーム+2", augments={'Path: A',}},
        waist="イェマヤベルト",
        left_ring="昏黄の指輪",
        back={ name="カムラスマント", augments={'"Snapshot"+10',}},
    }

    -- ファントムロール
    sets.precast.CorsairRoll = {
        main={name="ロスタム", augments={'Path: C',}},
        range="コンペンセーター",
        head="ＬＡトリコルヌ+3",
        body="イケンガベスト",          --敵対心-10
        hands="ＣＳガントリー+3",
        Legs="デサルタタセッツ",        --敵対心-4
        feet="イケンガクロッグ",        --敵対心-6
        neck="王将の首飾り",
        waist="霊亀腰帯",               --敵対心-2
        left_ear="ベイラピアス",        --敵対心-8
        right_ear="シテレアパール",     --敵対心-4
        right_ring="クチェクラリング",  --敵対心-7
        back="ガンスリンガマント"       --敵対心-1
    }
    
    sets.precast.CorsairRoll['プリッツアロール'] = set_combine(sets.precast.CorsairRoll,{
        head="ＣＳトリコルヌ+3",
    })
    sets.precast.CorsairRoll['タクティックロール'] = set_combine(sets.precast.CorsairRoll,{
        body="ＣＳフラック+3",
    })
    sets.precast.CorsairRoll['アライズロール'] = set_combine(sets.precast.CorsairRoll,{
        hands="ＣＳガントリー+3",
    })
    sets.precast.CorsairRoll['キャスターズロール'] = set_combine(sets.precast.CorsairRoll,{
        Legs="ＣＳトルーズ+3",
    })
    sets.precast.CorsairRoll['コアサーズロール'] = set_combine(sets.precast.CorsairRoll,{
        feet="ＣＳブーツ+3",
    })
    sets.precast.CorsairRoll['ボルターズロール'] = {
        main={ name="ロスタム", augments={'Path: C',}},
    }

    -- クイックドロー
    sets.precast.CorsairShot = {
        ammo=gear.CorsairShot,
    }

    -- WSダメージ
    sets.precast.WS.Damage = {
        head="ニャメヘルム",
        body="ニャメメイル",
        hands="ニャメガントレ",
        legs="ニャメフランチャ",
        feet="ニャメソルレット",
        neck={ name="コモドアチャーム+2", augments={'Path: A',}},
        waist="セールフィベルト+1",
        left_ear="胡蝶のイヤリング",
        right_ear={ name="シャスーピアス+2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+17','Mag. Acc.+17','Crit.hit rate+6','STR+9 AGI+9',}},
        left_ring="スローダリング",
        right_ring="エパミノダスリング",
        back={ name="カムラスマント", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
    }
    
    -- WS遠隔ダメージ
    sets.precast.WS.Range = {
        ammo=gear.MarksmanshipPhysics,
        head={ name="ニャメヘルム", augments={'Path: B',}},
        body="ＬＫフラック+4",
        hands="ＣＳガントリー+3",
        legs={ name="ニャメフランチャ", augments={'Path: B',}},
        feet={ name="ＬＡブーツ+4", augments={'Enhances "Wild Card" effect',}},
        neck="イスクルゴルゲット",
        waist="テレンベルト",
        left_ear={ name="胡蝶のイヤリング", augments={'Accuracy+4','TP Bonus +250',}},
        right_ear="テロスピアス",
        left_ring="ディンジルリング",
        right_ring="王将の指輪",
        back={ name="カムラスマント", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
    }
    
    -- WS遠隔魔攻
    sets.precast.WS.Magic = {
        ammo=gear.MarksmanshipMagical,
        head={ name="ニャメヘルム", augments={'Path: B',}},
        --body={ name="ニャメメイル", augments={'Path: B',}},
        body="ＬＡフラック+3",
        hands={ name="ニャメガントレ", augments={'Path: B',}},
        legs={ name="ニャメフランチャ", augments={'Path: B',}},
        feet={ name="ＬＡブーツ+4", augments={'Enhances "Wild Card" effect',}},
        neck={ name="コモドアチャーム+2", augments={'Path: A',}},
        waist="オルペウスサッシュ",
        left_ear={ name="胡蝶のイヤリング", augments={'Accuracy+4','TP Bonus +250',}},
        right_ear="フリオミシピアス",
        left_ring="ディンジルリング",
        right_ring="メダダリング",
        back={ name="カムラスマント", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
    }
    
    --共通WS定義読み込み
    init_weapon_skill()
    
    --個別WS定義
    sets.precast.WS["レデンサリュート"] = set_combine(sets.precast.WS.Magic,{head="妖蟲の髪飾り+1",right_ring="アルコンリング"})
    sets.precast.WS["イオリアンエッジ"] = { Normal=set_combine(sets.precast.WS.Magic,{ammo=gear.HauksbokBullet}),
                                            SubtleBlow=set_combine(set_combine(sets.precast.WS.Magic,{ammo=gear.HauksbokBullet}),sets.precast.WS.SubtleBlow )}
    sets.precast.WS["エクゼンテレター"] = { Normal      = set_combine(sets.engaged.ACC),
                                            SubtleBlow  = set_combine(set_combine(sets.engaged.ACC),sets.precast.WS.SubtleBlow )}

    --遠隔攻撃
    sets.midcast.RA = {
        ammo=gear.RAbulletphysics,
        head="マリグナスシャポー",
        body="マリグナスタバード",
        hands="マリグナスグローブ",
        legs="ＣＳトルーズ+3",
        feet="マリグナスブーツ",
        neck="イスクルゴルゲット",
        waist="テレンベルト",
        left_ear="昏黄の耳飾り",
        right_ear="テロスピアス",
        left_ring="昏黄の指輪",
        right_ring="シーリチリング+1",
        back={ name="カムラスマント", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc.+10','"Store TP"+10',}},
    }

    -- クイックドロー
    sets.midcast.CorsairShot = set_combine(sets.midcast.RA,{
        ammo=gear.CorsairShot,
    })

    --AFと王将に変える
    sets.midcast['ライトショット'] = {
        range="デスペナルティ",
        ammo=gear.CorsairShot,
        head="ＬＫトリコルヌ+4",
        body="ＬＫフラック+4",
        hands="ＬＫガントリー+4",
        legs="ＣＳトルーズ+3",
        feet="ＬＫブーツ+4",
        neck="無の喉輪",
        waist="無の腰当",
        left_ear="アスプロピアス",
        right_ear={ name="シャスーピアス+2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+17','Mag. Acc.+17','Crit.hit rate+6','STR+9 AGI+9',}},
        left_ring="王将の指輪",
        right_ring="メダダリング",
        back="無の外装",
    }
end
