function init_weaponns()
    -- デフォルト武器を設定
    send_command('gs c set MainWeapons RostamB; wait 0.3; gs c set RangeWeapons Fomalhaut;wait 0.3;')
    if player.sub_job == '忍' or player.sub_job == 'NIN' or player.sub_job == '踊' or player.sub_job == 'DNC' then
        send_command('gs c set SubWeapons CrepuscularKnife')
    else
        send_command('gs c set SubWeapons NuskuShield')
    end
end


function init_gear_sets()
    -- ロックスタイル番号
    lockstyleset = 111

    -- 短剣
    gear.RostamA                    = {name="ロスタム", augments={'Path: A'}}
    gear.RostamB                    = {name="ロスタム", augments={'Path: B'}}
    gear.RostamC                    = {name="ロスタム", augments={'Path: C'}}
    gear.CrepuscularKnife           = {name="クレパスクラナイフ"}
    gear.Kustawi                    = {name="クスタウィ+1"}
    gear.Tauret                     = {name="トーレット"}
    
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
    gear.CorsairShot                = {name="ホクスボクブレット"}
    gear.HauksbokBullet             = {name="ホクスボクブレット"}
    
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
        body="マリグナスタバード",
        hands="マリグナスグローブ",
        legs="ＣＳトルーズ+3",
        feet="マリグナスブーツ",
        neck="無の喉輪",
        waist={ name="ケンタークベルト+1", augments={'Path: A',}},
        left_ear="アスプロピアス",
        right_ear="テロスピアス",
        left_ring="シーリチリング+1",
        right_ring="シーリチリング+1",
        back="無の外装",
    }

    -- モクシャ 50
    sets.engaged.SubtleBlow = set_combine(sets.engaged,{
        head="ダンペニングタム",
        hands={ name="アデマリスト+1", augments={'Accuracy+20','Attack+20','"Subtle Blow"+8',}},
        feet="ムンムゲマッシュ+2",
        waist={ name="セールフィベルト+1", augments={'Path: A',}},
        right_ear="ディグニタリピアス",
        left_ring="シーリチリング+1",
        right_ring="シーリチリング+1",
    })

    -- 二刀流11（サポ忍）
    sets.engaged.dual11= {waist="霊亀腰帯",left_ear="エアバニピアス",}
    
    -- 二刀流21（サポ踊）
    sets.engaged.dual21= set_combine(sets.engaged.dual11,{back={ name="カムラスマント", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dual Wield"+10','Phys. dmg. taken-10%',}},})


    -- 即時発動アビリティ　ランダムディール
    sets.precast.JA["ランダムディール"] = {
        body="ＬＡフラック+3"
    }

    -- 即時発動アビリティ　フォールド
    sets.precast.JA["フォールド"] = {
        hands="ＬＡガントリー+3"
    }
    
    -- 即時発動アビリティ　スネークアイ
    sets.precast.JA["スネークアイ"] = {
        legs="ＬＡトルーズ+3"
    }
    
    -- 即時発動アビリティ　ワイルドカード
    sets.precast.JA["ワイルドカード"] = {
        feet="ＬＡブーツ+4"
    }

    -- FC
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
        left_ring="キシャールリング",
        right_ring="メダダリング",
    }
    
    -- スナップ
    sets.precast.RA = {
        ammo=gear.MarksmanshipPhysics,
        head={ name="テーオンシャポー", augments={'"Snapshot"+5','"Snapshot"+5',}},
        body="ＬＫフラック+4",
        hands={ name="ＬＡガントリー+3", augments={'Enhances "Fold" effect',}},
        legs="ＬＫトルーズ+3",
        feet="メガナダジャンボ+2",
        neck={ name="コモドアチャーム+2", augments={'Path: A',}},
        waist="イェマヤベルト",
        left_ring="昏黄の指輪",
        back={ name="カムラスマント", augments={'"Snapshot"+10',}},
    }

    -- ファントムロール
    sets.precast.CorsairRoll = {
        main={ name="ロスタム", augments={'Path: C',}},
        range={ name="コンペンセーター", augments={'DMG:+15','Rng.Atk.+15','"Mag.Atk.Bns."+15',}},
        head={ name="ＬＡトリコルヌ+3", augments={'Enhances "Winning Streak" effect',}},
        body="ＣＳフラック+3",
        hands="ＣＳガントリー+3",
        legs={ name="デサルタタセッツ", augments={'"Phantom Roll" ability delay -5','Phys. dmg. taken -4%',}},
        feet="ＣＳブーツ+2",
        neck="王将の首飾り",
        left_ring="ルザフリング",
        back={ name="ガンスリンガマント", augments={'Enmity-1','"Phantom Roll" ability delay -5',}},
    }

    -- WSダメージ
    sets.precast.WS.Damage = {
        head={ name="ニャメヘルム", augments={'Path: B',}},
        body={ name="ニャメメイル", augments={'Path: B',}},
        hands={ name="ニャメガントレ", augments={'Path: B',}},
        legs={ name="ニャメフランチャ", augments={'Path: B',}},
        feet={ name="ニャメソルレット", augments={'Path: B',}},
        neck="共和プラチナ章",
        waist={ name="セールフィベルト+1", augments={'Path: A',}},
        left_ear={ name="胡蝶のイヤリング", augments={'Accuracy+4','TP Bonus +250',}},
        right_ear="テロスピアス",
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
        body={ name="ニャメメイル", augments={'Path: B',}},
        hands={ name="ニャメガントレ", augments={'Path: B',}},
        legs={ name="ニャメフランチャ", augments={'Path: B',}},
        feet={ name="ＬＡブーツ+4", augments={'Enhances "Wild Card" effect',}},
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
    
    --個別WS定義
    sets.precast.WS["レデンサリュート"] = { Normal=set_combine(sets.precast.WS.Magic,{head="妖蟲の髪飾り+1",left_ring="アルコンリング"}),
                                            SubtleBlow=set_combine(set_combine(sets.precast.WS.Magic,{head="妖蟲の髪飾り+1",left_ring="アルコンリング"}),sets.precast.WS.SubtleBlow )}
    sets.precast.WS["イオリアンエッジ"] = { Normal=set_combine(sets.precast.WS.Magic,{ammo=gear.HauksbokBullet}),
                                            SubtleBlow=set_combine(set_combine(sets.precast.WS.Magic,{ammo=gear.HauksbokBullet}),sets.precast.WS.SubtleBlow )}

    --クイックドロー
    sets.precast.CorsairShot = {
        ammo=gear.CorsairShot,
        head={ name="ニャメヘルム", augments={'Path: B',}},
        body={ name="ＬＡフラック+3", augments={'Enhances "Loaded Deck" effect',}},
        hands={ name="ニャメガントレ", augments={'Path: B',}},
        legs={ name="ニャメフランチャ", augments={'Path: B',}},
        feet="ＣＳブーツ+2",
        neck={ name="コモドアチャーム+2", augments={'Path: A',}},
        waist="オルペウスサッシュ",
        left_ear="昏黄の耳飾り",
        right_ear="フリオミシピアス",
        left_ring="ディンジルリング",
        right_ring="メダダリング",
        back={ name="カムラスマント", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
    }

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
