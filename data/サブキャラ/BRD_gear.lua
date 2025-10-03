function init_weaponns()
    -- デフォルト武器を設定
    send_command('gs c set MainWeapons Carnwenhan')
    if player.sub_job == '忍' or player.sub_job == 'NIN' or player.sub_job == '踊' or player.sub_job == 'DNC' then
        send_command('gs c set SubWeapons Genbu')
    else
        send_command('gs c set SubWeapons Genbu')
    end
    send_command('gs c set Instruments Gjallarhorn')
end


function init_gear_sets()
    -- ロックスタイル番号
    lockstyleset = 71

    -- 短剣
    gear.Carnwenhan             = {name="カルンウェナン"}
    gear.Aeneas                 = {name="エーネアス"}
    gear.Malevolence            = {name="マレヴォレンス", augments={'INT+10','Mag. Acc.+10','"Mag.Atk.Bns."+10','"Fast Cast"+5',}}

    -- 片手剣
    gear.Naegling               = {name="ネイグリング"}
    
    -- 楽器
    gear.Gjallarhorn            = {name="ギャッラルホルン"}
    gear.Daurdabla              = {name="ダウルダヴラ"}
    gear.Marsyas                = {name="マルシュアス"}
    gear.Blurred                = {name="ブラーハープ+1"}
    gear.MiracleCheer           = {name="ミラクルチアー"}

    -- 盾
    gear.Genbu                  = {name="玄冥盾"}
    gear.Loughnashade           = {name="ラックナシェード"}
    
    -- その他
    gear.Evasion                = {name="ニビルナイフ"}

    -- 待機装備（通常）
    sets.idle = {
        range={ name="リノス", augments={'Evasion+14','"Regen"+1','AGI+7',}},
        head="無の面",
        body={ name="ニャメメイル", augments={'Path: B',}},
        hands={ name="ニャメガントレ", augments={'Path: B',}},
        legs="ＢＲキャニオン+4",
        feet={ name="ニャメソルレット", augments={'Path: B',}},
        neck="バーシチョーカー+1",
        waist="無の腰当",
        left_ear="エアバニピアス",
        right_ear="インフューズピアス",
        left_ring="メランリング",
        right_ring="シュネデックリング",
        back="無の外装",
    }

    -- 待機装備（リフレ）
    sets.idle.Refresh = set_combine(sets.idle,{
        head="無の面",
        body={ name="カイロンダブレット", augments={'Mag. Acc.+7','Pet: Haste+3','"Refresh"+2','Mag. Acc.+20 "Mag.Atk.Bns."+20',}},
        hands={ name="カイロングローブ", augments={'"Mag.Atk.Bns."+23','Accuracy+23','"Refresh"+2',}},
        legs={ name="カイロンホーズ", augments={'Damage taken-2%','Rng.Acc.+3','"Refresh"+2','Accuracy+5 Attack+5','Mag. Acc.+14 "Mag.Atk.Bns."+14',}},
        feet={ name="カイロンスリッパー", augments={'Spell interruption rate down -5%','Magic dmg. taken -1%','"Refresh"+2','Accuracy+7 Attack+7',}},
        neck="シビルスカーフ",
        left_ring="スティキニリング+1",
    })

    -- 抜刀装備
    sets.engaged = {
        range={ name="リノス", augments={'Accuracy+17','"Store TP"+4','Quadruple Attack +3',}},
        head="ＦＬキャロ+3",
        body="アシェーラハーネス",
        hands="ブンジグローブ",
        legs="ＦＬラングラヴ+3",
        feet="ＦＬコテュルヌ+3",
        neck={ name="バードチャーム+1", augments={'Path: A',}},
        waist="セールフィベルト+1",
        left_ear="テロスピアス",
        right_ear={ name="フィリピアス+1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+15','Mag. Acc.+15','Damage taken-5%',}},
        left_ring="シーリチリング+1",
        right_ring="シーリチリング+1",
        back="無の外装",
    }

    -- 二刀流11（サポ忍）
    sets.engaged.dual11= {
        waist="霊亀腰帯",
        left_ear="エアバニピアス"
    }

    -- 即時発動アビリティ　ソウルボイス
    sets.precast.JA["ソウルボイス"] = {
        legs="ＢＩキャニオンズ+3"
    }
    
    -- 即時発動アビリティ　ナイチンゲール
    sets.precast.JA["ナイチンゲール"] = {
        feet="ＢＩスリッパー+3"
    }

    -- 即時発動アビリティ　トルバドゥール
    sets.precast.JA["トルバドゥール"] = {
        body="ＢＩジュストコル+4"
    }

    -- FC
    sets.precast.FC = {
        sub="玄冥盾",
        range={ name="リノス", augments={'Accuracy+17','"Store TP"+4','Quadruple Attack +3',}},
        head="ブンジハット",
        body="インヤガジュバ+2",
        hands={ name="レイライングローブ", augments={'Accuracy+12','Mag. Acc.+14','"Mag.Atk.Bns."+15','"Fast Cast"+2',}},
        legs="アヤモコッシャレ+2",
        feet="ＦＬコテュルヌ+3",
        neck="オルンミラトルク",
        waist="エンブラサッシュ",
        left_ear={ name="アスプロピアス", augments={'Path: A',}},
        right_ear={ name="フィリピアス+1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+15','Mag. Acc.+15','Damage taken-5%',}},
        left_ring="メランリング",
        right_ring="メダダリング",
        back={ name="フィフォレケープ+1", augments={'Path: A',}},
    }

    -- FC（歌）
    sets.precast.FC.BardSong = set_combine(sets.precast.FC,{
        head="ＦＬキャロ+3",
        body="ＢＲジュスト+4",
        legs="ＢＩスリッパー+4"
    })

    -- WSダメージ
    sets.precast.WS.Damage = {
        range={ name="リノス", augments={'Accuracy+15 Attack+15','Weapon skill damage +3%','Quadruple Attack +3',}},
        head={ name="ニャメヘルム", augments={'Path: B',}},
        body={ name="ＢＩジュストコル+4", augments={'Enhances "Troubadour" effect',}},
        hands={ name="ニャメガントレ", augments={'Path: B',}},
        legs={ name="ニャメフランチャ", augments={'Path: B',}},
        feet={ name="ニャメソルレット", augments={'Path: B',}},
        neck={ name="バードチャーム+1", augments={'Path: A',}},
        waist={ name="セールフィベルト+1", augments={'Path: A',}},
        left_ear="テロスピアス",
        right_ear={ name="胡蝶のイヤリング", augments={'Accuracy+4','TP Bonus +250',}},
        left_ring="シーリチリング+1",
        right_ring="シーリチリング+1",
        back={ name="インタラアスケープ", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
    }

    sets.precast.WS.Critical = {
        range={ name="リノス", augments={'Accuracy+15 Attack+15','Weapon skill damage +3%','Quadruple Attack +3',}},
        head={ name="ニャメヘルム", augments={'Path: B',}},
        body={ name="ＢＩジュストコル+4", augments={'Enhances "Troubadour" effect',}},
        hands={ name="ニャメガントレ", augments={'Path: B',}},
        legs={ name="ニャメフランチャ", augments={'Path: B',}},
        feet={ name="ニャメソルレット", augments={'Path: B',}},
        neck={ name="バードチャーム+1", augments={'Path: A',}},
        waist={ name="セールフィベルト+1", augments={'Path: A',}},
        left_ear="テロスピアス",
        right_ear={ name="胡蝶のイヤリング", augments={'Accuracy+4','TP Bonus +250',}},
        left_ring="シーリチリング+1",
        right_ring="シーリチリング+1",
        back={ name="インタラアスケープ", augments={'DEX+20','Accuracy+20 Attack+20','DEX+5','Crit.hit rate+10',}},
    }

    -- WS魔攻
    sets.precast.WS.Magic={
        range={ name="リノス", augments={'Accuracy+15 Attack+15','Weapon skill damage +3%','Quadruple Attack +3',}},
        head={ name="ニャメヘルム", augments={'Path: B',}},
        body={ name="ニャメメイル", augments={'Path: B',}},
        hands={ name="ニャメガントレ", augments={'Path: B',}},
        legs={ name="ニャメフランチャ", augments={'Path: B',}},
        feet={ name="ニャメソルレット", augments={'Path: B',}},
        neck="シビルスカーフ",
        waist="オルペウスサッシュ",
        left_ear="王将の耳飾り",
        right_ear={ name="胡蝶のイヤリング", augments={'Accuracy+4','TP Bonus +250',}},
        left_ring="シーリチリング+1",
        right_ring="シーリチリング+1",
        back={ name="インタラアスケープ", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Enmity-10',}},    
    }
    
    -- WSモクシャ
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
    
    -- ケアル
    sets.midcast.Cure = {
        head={ name="ケカスミトラ", augments={'MP+60','"Cure" spellcasting time -5%','Enmity-5',}},
        body={ name="ケカスブリオー", augments={'MP+60','"Cure" spellcasting time -5%','Enmity-5',}},
        hands={ name="テルキネグローブ", augments={'"Cure" potency +8%','Enh. Mag. eff. dur. +10',}},
        legs={ name="ケカスタイツ", augments={'MP+60','"Cure" spellcasting time -5%','Enmity-5',}},
        feet={ name="ケカスブーツ", augments={'MP+60','"Cure" spellcasting time -5%','Enmity-5',}},
        neck="インカンタートルク",
        waist="プラチナモグベルト",
        left_ear={ name="アスプロピアス", augments={'Path: A',}},
        right_ear={ name="フィリピアス+1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+15','Mag. Acc.+15','Damage taken-5%',}},
        left_ring="メランリング",
        right_ring="守りの指輪",
        back="ソレムニティケープ",
    }

    -- ケアルガ
    sets.midcast.Curaga = sets.midcast.Cure

    -- 強化魔法
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

    -- バ系
    sets.midcast.BarElement    = set_combine(sets.midcast['強化魔法'], {legs="シェダルサラウィル"})

    -- 弱体魔法
    sets.midcast['弱体魔法'] = {
        main="カルンウェナン",
        sub="アムラピシールド",
        head="ＢＲランドリト+4",
        body="ＦＬオングルリヌ+3",
        hands="ＦＬマンシェト+3",
        legs="ＢＲキャニオン+4",
        feet="ＢＲスリッパー+4",
        neck="月虹の呼び子+1",
        waist="無の腰当",
        left_ear="王将の耳飾り",
        right_ear={ name="フィリピアス+1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+15','Mag. Acc.+15','Damage taken-5%',}},
        left_ring="キシャールリング",
        right_ring={ name="メタモルリング+1", augments={'Path: A',}},
        back="無の外装",
    }

    -- ダミー歌
    sets.midcast.song_dummy = {
        range="ダウルダヴラ",
    }
    
    -- 歌ベース装備
    sets.midcast.song_base = {
        main="カルンウェナン", 
        neck="月虹の呼び子+1",
        waist="コーネリアの黒帯",
        back={ name="インタラアスケープ", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Enmity-10',}},
    }

    -- その他歌171%（アリア、ダージュ、シルベント、マズルカ、その他レジスト歌など）
    sets.midcast.BardSong  = set_combine(sets.midcast.song_base, {
        body="ＦＬオングルリヌ+3",
        legs="インヤガシャルワ+2",
        feet="ＢＲスリッパー+4"
    })

    sets.midcast.BardSong.Dummy                 = sets.midcast.song_dummy

    -- メヌエット 171%
    sets.midcast.BardSong.Minuet = set_combine(sets.midcast.song_base, {
        body="ＦＬオングルリヌ+3",
        legs="インヤガシャルワ",
        feet="ブリオソスリッパー"
    })
    
    -- マーチ 171%
    sets.midcast.BardSong.March = set_combine(sets.midcast.song_base, {
        body="ＦＬオングルリヌ+3",
        hands="ＦＬマンシェト+3",
        legs="インヤガシャルワ",
        feet="ブリオソスリッパー"
    })
    
    -- 栄典 171%
    sets.midcast.BardSong['栄典の戴冠マーチ'] = set_combine(sets.midcast.song_base, {
        body="ＦＬオングルリヌ+3",
        hands="ＦＬマンシェト+3",
        legs="インヤガシャルワ"
    })
    
    -- マド 171%
    sets.midcast.BardSong.Madrigal = set_combine(sets.midcast.song_base, {
        head="ＦＬキャロ+3",
        body="ＦＬオングルリヌ+3",
        legs="インヤガシャルワ"
    })
    
    -- プレ 171%
    sets.midcast.BardSong.Prelude = set_combine(sets.midcast.song_base, {
        body="ＦＬオングルリヌ+3",
        legs="インヤガシャルワ",
        feet="ブリオソスリッパー"
    })

    -- マンボ 171%
    sets.midcast.BardSong.Mambo = set_combine(sets.midcast.song_base, {
        body="ＦＬオングルリヌ+3",
        legs="インヤガシャルワ",
        feet="ムセスクラッコー+1"
    })
    
    -- ミンネ 172%
    sets.midcast.BardSong.Minne = set_combine(sets.midcast.song_base, {
        body="ＦＬオングルリヌ+3",
        legs="ムセスサラウィル+1",
        feet="ＢＲスリッパー+2"
    })

    -- ピーアン 171%
    sets.midcast.BardSong.Paeon = set_combine(sets.midcast.song_base, {
        head="ＢＲランドリト+4",
        body="ＦＬオングルリヌ+3",
        legs="インヤガシャルワ"
    })
    
    -- バラード 171%
    sets.midcast.BardSong.Ballad = set_combine(sets.midcast.song_base, {
        body="ＦＬオングルリヌ+3",
        legs="インヤガシャルワ+2",
        feet="ＢＲスリッパー+4"
    })
    
    -- カロル 172%
    sets.midcast.BardSong.Carol = set_combine(sets.midcast.song_base, {
        hands="ムセスゲージ+1",
        legs="インヤガシャルワ+2",
        feet="ブリオソスリッパー"
    })
    
    -- エチュード 171%
    sets.midcast.BardSong.Etude = set_combine(sets.midcast.song_base, {
        head="ムセスターバン+1",
        body="ＦＬオングルリヌ+3",
        legs="インヤガシャルワ"
    })

    -- ララバイ191％
    sets.midcast.BardSong.Lullaby = set_combine(sets.midcast['弱体魔法'],{
        body="ＦＬオングルリヌ+3",
        hands="ＢＲカフス+4",
        legs="インヤガシャルワ+2",
        feet="ＢＲスリッパー+4"
    })
    
    -- レクイエム171%
    sets.midcast.BardSong.Requiem = set_combine(sets.midcast['弱体魔法'],{
        body="ＦＬオングルリヌ+3",
        legs="インヤガシャルワ+2",
        feet="ＢＲスリッパー+4"
    })
    
    -- エレジー171%
    sets.midcast.BardSong.Elegy = set_combine(sets.midcast['弱体魔法'],{
        body="ＦＬオングルリヌ+3",
        legs="インヤガシャルワ+2",
        feet="ＢＲスリッパー+4"
    })
    
    -- ノクターン171%
    sets.midcast.BardSong['恋情のノクターン'] = set_combine(sets.midcast['弱体魔法'],{
        body="ＦＬオングルリヌ+3",
        legs="インヤガシャルワ+2",
        feet="ＢＲスリッパー+4"
    })
        
    -- スレノ177%
    sets.midcast.BardSong.Threnody = set_combine(sets.midcast.magic_acc, {
        body="ムセスマンティル+1",
        legs="インヤガシャルワ+2",
        feet="ＢＲスリッパー+4"
    })

    -- フィナーレ
    sets.midcast.BardSong['魔法のフィナーレ']   = sets.midcast['弱体魔法'] 
    
    -- ヴィルレー
    sets.midcast.BardSong['乙女のヴィルレー']   = sets.midcast['弱体魔法']


end
