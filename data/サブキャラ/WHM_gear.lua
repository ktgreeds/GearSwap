function init_weaponns()
    --デフォルト武器を設定
    send_command('gs c set MainWeapons '..windower.to_shift_jis('クェラーロッド')..'; wait 1; gs c set SubWeapons '..windower.to_shift_jis('デュークシールド'))
end


function init_gear_sets()
	--ロックスタイル番号
	lockstyleset = 3

	--武器
    gear['クェラーロッド']       = {name="クェラーロッド"}
    gear['玄冥盾']               = {name="玄冥盾"}
    gear['デュークシールド']     = {name="デュークシールド"}
    gear.slip                    = {name="プライムモール"}


    --待機装備
	sets.idle = {
        ammo="ストンチタスラム+1",
        head="ＥＢキャップ+3",
        body="ＥＢブリオー+3",
        hands="ＥＢミトン+3",
        legs="ＥＢパンタロン+3",
        feet="ＥＢダックビル+3",
        --neck="シビルスカーフ",
        neck="クレリクトルク+1",
        waist="キャリアーサッシュ",
        left_ear="ハーティーピアス",
        right_ear={ name="エーベルピアス+1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+14','Mag. Acc.+14','Damage taken-5%',}},
        left_ring="メランリング",
        right_ring="シュネデックリング",
        back={ name="アラウナスケープ", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Haste+10','Occ. inc. resist. to stat. ailments+10',}},
	}

	sets.idle.Refresh = set_combine(sets.idle,{
        head={ name="カイロンハット", augments={'Pet: Phys. dmg. taken -2%','Attack+4','"Refresh"+2','Accuracy+18 Attack+18',}},
        body="ＥＢブリオー+3",
        hands={ name="カイロングローブ", augments={'"Mag.Atk.Bns."+23','Accuracy+23','"Refresh"+2',}},
        legs={ name="カイロンホーズ", augments={'Damage taken-2%','Rng.Acc.+3','"Refresh"+2','Accuracy+5 Attack+5','Mag. Acc.+14 "Mag.Atk.Bns."+14',}},
        feet={ name="カイロンスリッパー", augments={'Spell interruption rate down -5%','Magic dmg. taken -1%','"Refresh"+2','Accuracy+7 Attack+7',}},
        neck="シビルスカーフ",
        left_ring="スティキニリング+1",
    })

	--抜刀装備
	sets.engaged = {}

	--バフ
	sets.buff['ハートオブソラス'] 		= {body="ＥＢブリオー+3",legs="ＰＩダックビル+3",back="アラウナスケープ"}
	sets.buff['ハートオブミゼリ'] 		= {legs="ＰＩパンタロン+3"}
	sets.buff['女神の愛撫']   	    	= {hands="ＥＢミトン+3",back="メンディングケープ"}
    sets.precast.JA['女神の祝福']       = {body="ＰＩブリオー+1"}
    sets.precast.JA['女神の印']         = {}
    sets.precast.JA['ハートオブソラス'] = {}
    sets.precast.JA['ハートオブミゼリ'] = {}
    sets.precast.JA['マーター']         = {hands="ＰＩミトン+1"}
	sets.precast.JA['デヴォーション']   = {head="ＰＩキャップ+3"}
    sets.precast.JA['女神の愛撫']       = {}
    sets.precast.JA['女神の聖域']       = {}
    sets.precast.JA['女神の羽衣']       = {}
	
	--FC
    sets.precast.FC = {
        main={ name="クェラーロッド", augments={'MP+80','"Cure" potency +15%','Enmity-5',}},
        sub="チャンターシールド",
        ammo="サピエンスオーブ",
        head="ＥＢキャップ+3",
        body="ピンガチュニック+1",
        hands={ name="ファナチクグローブ", augments={'MP+50','Healing magic skill +10','"Conserve MP"+7','"Fast Cast"+7',}},
        legs="ピンガズボン",
        feet="ＥＢダックビル+3",
        neck={name="オルンミラトルク",priority=12}, --30
        waist={name="プラチナモグベルト",priority=16},
        left_ear="マリグナスピアス",
        right_ear={name="エテオレートピアス",priority=14},--50
        left_ring="メダダリング",
        right_ring={name="メタモルリング+1",priority=15},--60
        back={name="フィフォレケープ+1",priority=13},--45
    }
 
	--FC（ディスペガ）
	sets.precast.FC['ディスペガ'] = set_combine(sets.precast.FC,{main="デイブレイクワンド",})
	
	--FC（インパクト）
	sets.precast.FC['インパクト'] = set_combine(sets.precast.FC,{head=empty,body="クレパスクラプリス",})
	
	--WSダメージ
    sets.precast.WS.Damage = {
    }
	
	--WSクリティカル
    sets.precast.WS.Critical = {
	}
	
	--WS魔攻
    sets.precast.WS.Magic = {
	}

    --共通WS定義読み込み
    init_weapon_skill()

	--精霊魔法
    sets.midcast['精霊魔法'] = {
    }
	
	--弱体魔法時間
	sets.midcast['弱体魔法'] ={
        sub="アムラピシールド",
        ammo="ペムフレドタスラム",
        head="ＥＢキャップ+3",
        bodyu="ＥＢブリオー+3",
        hands="ＥＢミトン+3",
        legs="ＥＢパンタロン+3",
        feet="ＥＢダックビル+3",
        neck="無の喉輪",
        waist="無の腰当",
        left_ear="マリグナスピアス",
        right_ear={ name="エーベルピアス+1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+14','Mag. Acc.+14','Damage taken-5%',}},
        left_ring="メダダリング",
        right_ring="キシャールリング",
        back="無の外装",
	}

	--暗黒魔法
	sets.midcast['暗黒魔法'] ={
	}
    --ディスペガ
	sets.midcast['ディスペガ']  = set_combine(sets.midcast['弱体魔法'],{main="デイブレイクワンド",})

	--インパクト
	sets.midcast["インパクト"]  = set_combine(sets.midcast['弱体魔法'],{head=empty,body="クレパスクラプリス",})


	--ケアル
	sets.midcast.Cure = {
        main="レテクロッド+1",
        sub="玄冥盾",
        ammo="ストンチタスラム+1",
        head={ name="ケカスミトラ+1", augments={'MP+80','"Cure" spellcasting time -7%','Enmity-6',}},
        body={ name="ケカスブリオー+1", augments={'MP+80','"Cure" spellcasting time -7%','Enmity-6',}},
        hands={ name="ケカスカフス+1", augments={'MP+80','"Cure" spellcasting time -7%','Enmity-6',}},
        legs='ＥＢパンタロン+3',
        feet={ name="ケカスブーツ", augments={'MP+60','"Cure" spellcasting time -5%','Enmity-5',}},
        neck={ name="クレリクトルク+1", augments={'Path: A',}},
        waist="プラチナモグベルト",
        left_ear="アスプロピアス",
        right_ear={name="エテオレートピアス",priority=16},--50
        left_ring="メランリング",
        right_ring="守りの指輪",
        back={ name="アラウナスケープ", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Haste+10','Occ. inc. resist. to stat. ailments+10',}},
	}
	sets.midcast.Curaga = 	sets.midcast.Cure
    
	--強化魔法
	sets.midcast['強化魔法'] = {
        main={ name="ガーダ", augments={'Enh. Mag. eff. dur. +5','Mag. Acc.+12','DMG:+4',}},
        sub="アムラピシールド",
        ammo="ストンチタスラム+1",
        head={ name="テルキネキャップ", augments={'"Cure" potency +7%','Enh. Mag. eff. dur. +10',}},
        body={ name="テルキネシャジュブ", augments={'"Cure" potency +7%','Enh. Mag. eff. dur. +10',}},
        hands={ name="テルキネグローブ", augments={'"Cure" potency +8%','Enh. Mag. eff. dur. +10',}},
        legs={ name="テルキネブラコーニ", augments={'"Cure" potency +7%','Enh. Mag. eff. dur. +10',}},
        feet="ＥＢダックビル+3",
        neck="インカンタートルク",
        waist="エンブラサッシュ",
        left_ear="ミミルピアス",
        right_ear={name="アスプロピアス",priority=15},
        left_ring="スティキニリング+1",
        right_ring={name="ゼラチナスリング+1",priority=16},
        back={ name="メンディングケープ", augments={'Healing magic skill +2','Enha.mag. skill +10','Mag. Acc.+8',}},
	}

    -- リジェネ
	sets.midcast.Regen = set_combine(sets.midcast['強化魔法'] ,{
        body="ＰＩブリオー+1",
        hands="ＥＢミトン+3",
        legs="ＴＥパンタロン+3",
    })

	sets.midcast['ストンスキン'] = set_combine(sets.midcast['強化魔法'] ,{
        legs="シェダルサラウィル",
        neck='ノデンズゴルゲット',
        left_ear='アースクライピアス',
        waist="ジーゲルサッシュ",
    })
    
	sets.midcast['アクアベール'] = set_combine(sets.midcast['強化魔法'] ,{
        head="カイロンハット",
        legs="シェダルサラウィル",
    })

	sets.midcast['オースピス'] = set_combine(sets.midcast['強化魔法'] ,{
        feet="ＥＢダックビル+3",
    })

    -- バ属性系
    sets.midcast.BarElement = set_combine(sets.midcast['強化魔法'], {
        legs="ＰＩパンタロン+3",
        body="ＥＢブリオー+3",
        back="アラウナスケープ",
    })

    -- バ耐性系
    sets.midcast.BarStatus = set_combine(sets.midcast['強化魔法'], {
        neck="スローダネックレス",
    })
    
    -- ナ系
    sets.midcast.StatusRemoval = {
        main="ヤグルシュ",
        legs="ＥＢパンタロン+3",
    }

    sets.midcast['カーズナ'] = {
        main="ヤグルシュ",
        hands={ name="ファナチクグローブ", augments={'MP+50','Healing magic skill +10','"Conserve MP"+7','"Fast Cast"+7',}},
        legs="ＥＢパンタロン+3",
        feet="ＧＥガロッシュ+1",
        necl="デビリスメダル",
        left_ring="メネロスリング",
        back="アラウナスケープ",
    }
    sets.midcast['イレース']={
        main="ヤグルシュ",
        neck="クレリクトルク+1",
    }
    -- アディ系
    sets.midcast.BoostStat = {}
end
