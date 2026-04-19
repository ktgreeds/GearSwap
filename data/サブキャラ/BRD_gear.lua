function init_weaponns()
    send_command('gs c reset SubWeapons;')
    if player.sub_job == '忍' or player.sub_job == 'NIN' or player.sub_job == '踊' or player.sub_job == 'DNC' then
        send_command('wait 1; gs c set SubWeapons Aeneas')
    end
end


function init_gear_sets()
    -- ロックスタイル番号
    lockstyleset = 10

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
    gear.Empty                  = {name=nil}

    -- 盾
    gear.Genbu                  = {name="玄冥盾"}
    gear.AmmurapiShield			= {name="アムラピシールド"}
    gear.Loughnashade           = {name="ラックナシェード"}
    
    -- その他
    gear.Evasion                = {name="ニビルナイフ"}

    gear.JobMantle              = {}
    gear.JobMantle.Critical     = { name="インタラアスケープ", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10','Phys. dmg. taken-10%',}}
    gear.JobMantle.Magic        = { name="インタラアスケープ", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Enmity-10',}}
    gear.JobMantle.WSD          = {}
    gear.JobMantle.WSD.STR      = { name="インタラアスケープ", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}}
    gear.JobMantle.WSD.CHR      = { name="インタラアスケープ", augments={'CHR+20','Accuracy+20 Attack+20','CHR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}}
    gear.JobMantle.WSD.DEX      = { name="インタラアスケープ", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}}
    
    -- 待機装備（通常）
    sets.idle = {
        head="ＦＬキャロ+3",
        body="ニャメメイル",
        hands="ニャメガントレ",
        legs="ＢＲキャニオン+4",
        feet="ニャメソルレット",
        neck="バーシチョーカー+1",
        waist="無の腰当",
        left_ear="インフューズピアス",
        right_ear="エアバニピアス",
        left_ring="メランリング",
        right_ring="シュネデックリング",
        back="無の外装",
    }

    sets.idle.Evasion = set_combine(sets.idle,{
        range={ name="リノス", augments={'Evasion+14','"Regen"+1','AGI+7',}},
        head="ＦＬキャロ+3",
        body="レベレプレート",
        hands="レベレガントレ",
        legs="レベレブレー",
        feet="レベレサバトン",
        neck="バーシチョーカー+1",
        waist="無の腰当",
        left_ear="アスプロピアス",
        right_ear="エアバニピアス",
        left_ring="メランリング",
        right_ring="シュネデックリング",
        back="無の外装",
    })
    -- 抜刀装備
    sets.engaged = {
        range={ name="リノス", augments={'Accuracy+17','"Store TP"+4','Quadruple Attack +3',}},
        head="レベレマスク",
        body="レベレプレート",
        hands="レベレガントレ",
        legs="レベレサバトン",
        feet="レベレサバトン",
        neck={ name="バードチャーム+1", augments={'Path: A',}},
        waist="セールフィベルト+1",
        left_ear="アスプロピアス",
        right_ear="テロスピアス",
        left_ring="シーリチリング+1",
        right_ring="シーリチリング+1",
        back="無の外装",
    }

    -- 抜刀装備（モクシャ）
    sets.engaged.SubtleBlow = set_combine(sets.engaged,{
        neck="バーシチョーカー+1",
        waist="サリサフロイベルト",
        right_ear="ディグニタリピアス",
        left_ring="シーリチリング+1",
        right_ring="シーリチリング+1",
    })

    -- 二刀流11（サポ忍）
    sets.engaged.dual11= { waist="霊亀腰帯",right_ear="エアバニピアス"}

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
    sets.precast.FC.value = 80

   --FC（ディスペガ用）
   sets.precast.FC['ディスペガ'] = set_combine(sets.precast.FC,{main="デイブレイクワンド",})

    -- WSダメージ
    sets.precast.WS.Damage = {
        range={ name="リノス", augments={'Accuracy+15 Attack+15','Weapon skill damage +3%','STR+6 DEX+6',}},
        head={ name="ニャメヘルム", augments={'Path: B',}},
        body={ name="ＢＩジュストコル+4", augments={'Enhances "Troubadour" effect',}},
        hands={ name="ニャメガントレ", augments={'Path: B',}},
        legs={ name="ニャメフランチャ", augments={'Path: B',}},
        feet={ name="ニャメソルレット", augments={'Path: B',}},
        neck={ name="バードチャーム+1", augments={'Path: A',}},
        waist={ name="セールフィベルト+1", augments={'Path: A',}},
        left_ear="テロスピアス",
        right_ear={ name="胡蝶のイヤリング", augments={'Accuracy+4','TP Bonus +250',}},
        left_ring="イラブラットリング",
        right_ring="スローダリング",
        back=gear.JobMantle.WSD.STR
    }

    -- WSダメージ（モクシャ）
    sets.precast.WS.SubtleBlow = set_combine(sets.precast.WS.Damage,{neck="バーシチョーカー+1"})

    sets.precast.WS.Critical = {
        range={ name="リノス", augments={'Accuracy+15 Attack+15','Crit. hit damage +3%','DEX+8',}},
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
        back=gear.JobMantle.Critical
    }

    -- WS魔攻
    sets.precast.WS.Magic = {
        range={ name="リノス", augments={'Accuracy+15 Attack+15','Weapon skill damage +3%','STR+6 DEX+6',}},
        head={ name="ニャメヘルム", augments={'Path: B',}},
        body={ name="ニャメメイル", augments={'Path: B',}},
        hands={ name="ニャメガントレ", augments={'Path: B',}},
        legs={ name="ニャメフランチャ", augments={'Path: B',}},
        feet={ name="ニャメソルレット", augments={'Path: B',}},
        neck="シビルスカーフ",
        waist="アキュイテベルト+1",
        left_ear="王将の耳飾り",
        right_ear={ name="胡蝶のイヤリング", augments={'Accuracy+4','TP Bonus +250',}},
        left_ring="メダダリング",
        right_ring="メタモルリング+1",
        back=gear.JobMantle.Magic
    }

    --共通WS定義読み込み
    init_weapon_skill()
    sets.precast.WS["モーダントライム"]       = { Normal=set_combine(sets.precast.WS.Damage,gear.JobMantle.WSD.CHR),
                                                    SubtleBlow=set_combine(set_combine(sets.precast.WS.Damage,gear.JobMantle.WSD.CHR),  sets.precast.WS.SubtleBlow) }
    sets.precast.WS["ルドラストーム"]         = { Normal=set_combine(sets.precast.WS.Damage,gear.JobMantle.WSD.DEX),
                                                    SubtleBlow=set_combine(set_combine(sets.precast.WS.Damage,gear.JobMantle.WSD.DEX),  sets.precast.WS.SubtleBlow) }
    sets.precast.WS["エヴィサレーション"]     = { Normal=set_combine(sets.precast.WS.Critical,gear.JobMantle.Critical),
                                                    SubtleBlow=set_combine(set_combine(sets.precast.WS.Critical,gear.JobMantle.Critical),  sets.precast.WS.SubtleBlow) }
    

    -- ケアル
    sets.midcast.Cure = {
        head={ name="ケカスミトラ+1", augments={'MP+80','"Cure" spellcasting time -7%','Enmity-6',}},
        body={ name="ケカスブリオー+1", augments={'MP+80','"Cure" spellcasting time -7%','Enmity-6',}},
        hands={ name="ケカスカフス+1", augments={'MP+80','"Cure" spellcasting time -7%','Enmity-6',}},
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

    -- 精霊魔法
    sets.midcast['精霊魔法']={
        range={ name="リノス", augments={'Evasion+14','"Regen"+1','AGI+7',}},
        head="ニャメヘルム",
        body="ニャメメイル",
        hands="ニャメガントレ",
        legs="ニャメフランチャ",
        feet="ニャメソルレット",
        neck="シビルスカーフ",
        waist="エスカンストーン",
        left_ear="王将の耳飾り",
        right_ear="フリオミシピアス",
        left_ring="メダダリング",
        right_ring="シュネデックリング",
        back="無の外装",
    }

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

    -- 弱体魔法　ディスペガ
    sets.midcast['ディスペガ'] = set_combine(sets.midcast['弱体魔法'],{main="デイブレイクワンド"})
    
    sets.midcast['アブゾタック'] = {
        head="ＦＬキャロ+3",
        body="ＦＬオングルリヌ+3",
        hands="ＦＬマンシェト+3",
        legs="ＦＬラングラヴ+3",
        feet="ＦＬコテュルヌ+3",
        neck="無の喉輪",
        waist="無の腰当",
        left_ear="昏黄の耳飾り",
        right_ear={ name="フィリピアス+1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+15','Mag. Acc.+15','Damage taken-5%',}},
        left_ring="スティキニリング+1",
        right_ring="スティキニリング+1",
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

    -- ミラクルチアーセット
    sets.midcast.BardSong.MiracleCheerBase  = set_combine(sets.midcast.song_base, {
        head="ＦＬキャロ+3",
        body="ＦＬオングルリヌ+3",
        hands="ＦＬマンシェト+3",
        legs="ＦＬラングラヴ+3",
        feet="ＦＬコテュルヌ+3"
    })
    sets.midcast.BardSong.MiracleCheerEtude  = set_combine(sets.midcast.BardSong.MiracleCheerBase, {
        head="ムセスターバン+1",
    })
    sets.midcast.BardSong.MiracleCheerCarol  = set_combine(sets.midcast.BardSong.MiracleCheerBase, {
        hands="ムセスゲージ+1",
    })
    sets.midcast.BardSong.MiracleCheerMinne = set_combine(sets.midcast.BardSong.MiracleCheerBase, {
        legs="ムセスサラウィル+1",
    })
    sets.midcast.BardSong.MiracleCheerMambo = set_combine(sets.midcast.BardSong.MiracleCheerBase, {
        feet="ムセスクラッコー+1"
    })
end
