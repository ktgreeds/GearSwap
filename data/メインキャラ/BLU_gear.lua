function init_weaponns()
    --デフォルト武器を設定
    send_command('gs c set MainWeapons Tizona; wait 0.3; gs c set SubWeapons SakpatasSword')
end


function init_gear_sets()
    --ロックスタイル番号
    lockstyleset = 101
    
    --片手剣
    gear.Tizona                 = {name="ティソーナ"}
    gear.SakpatasSword          = {name="サクパタソード"}
    gear.Naegling               = {name="ネイグリング"}
    
    --片手棍
    gear.Maxentius              = {name="マクセンチアス"}
    gear.Nehushtan              = {name="シャルウル", augments={'Evasion+15','Phys. dmg. taken -4%','AGI+17',}}

    --短剣
    gear.QutrubKnife            = {name="クトゥルブナイフ"}
    gear.EtherealDagger         = {name="幽世の短剣"}
    
    --その他
    gear.Slip  					= {name="カリブルヌス"}
    
    --待機装備（通常）
    sets.idle = {
        ammo="アマークラスター",
        head="無の面",
        body="ニャメメイル",
        hands="ニャメガントレ",
        legs="ＡＳシャルワー+4",
        feet="ＡＳチャルク+4",
        neck={ name="バーシチョーカー+1", augments={'Path: A',}},
        waist="無の腰当",
        left_ear={name="アスプロピアス",priority=16},
        right_ear="エアバニピアス",
        left_ring="メランリング",
        right_ring="シュネデックリング",
        back="無の外装",
    }

    --待機装備（リフレ）
    sets.idle.Refresh = set_combine(sets.idle, {
        ammo="ストンチタスラム+1",
        head={ name="ヘルクリアヘルム", augments={'Weapon skill damage +2%','AGI+6','"Refresh"+2','Accuracy+9 Attack+9',}},
        body="ＨＳミンタン+3",
        hands={ name="ヘルクリアグローブ", augments={'Spell interruption rate down -6%','Attack+5','"Refresh"+2','Accuracy+8 Attack+8',}},
        legs={ name="ヘルクリアトラウザ", augments={'Pet: VIT+10','"Subtle Blow"+10','"Refresh"+2','Accuracy+8 Attack+8',}},
        feet={ name="ヘルクリアブーツ", augments={'"Mag.Atk.Bns."+17','STR+9','"Refresh"+2',}},
        neck="シビルスカーフ",
        waist="プラチナモグベルト",
    })

    --抜刀装備
    sets.engaged = {
        ammo="コイストボダー",
        head="マリグナスシャポー",
        body="マリグナスタバード",
        hands="マリグナスグローブ",
        legs="マリグナスタイツ",
        feet="マリグナスブーツ",
        neck={ name="ミラージストール+2", augments={'Path: A',}},
        waist="霊亀腰帯",
        left_ear="素破の耳",
        right_ear={ name="ハシシンピアス+2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+20','Mag. Acc.+20','"Dbl.Atk."+8','STR+15 INT+15',}},
        left_ring="シーリチリング+1",
        right_ring="シーリチリング+1",
		back="無の外装",
    }

    --モクシャ41
    sets.engaged.SubtleBlow = 
    {
        neck={ name="バーシチョーカー+1", augments={'Path: A',}},--11
        waist="サリサフロイベルト",--5
        left_ear="ディグニタリピアス",--5
        left_ring="シーリチリング+1",--10
        right_ring="シーリチリング+1",--10
    }

    --トレハン
    sets.TreasureHunter = {
        head={ name="ヘルクリアヘルム", augments={'Pet: Mag. Acc.+24','VIT+9','"Treasure Hunter"+2',}},
        hands={ name="ヘルクリアグローブ", augments={'Accuracy+6 Attack+6','Weapon skill damage +1%','"Treasure Hunter"+2',}},
    }

    --バフ監視用
    sets.buff['エフラックス']           = {legs="ＨＳタイト+3"}
    sets.buff['エンチェーンメント']     = {}
    sets.buff['コンバージェンス']       = {}
    sets.buff['ディフュージョン']       = {feet="ＬＬチャルク+3"}
    sets.buff['ブルーチェーン']         = {}
    sets.buff['ブルーバースト']         = {feet="ＨＳバシュマク+3"}
    sets.precast.JA['アジュールロー']   = {hands="ＬＬバズバンド+1"}
    sets.precast.JA['ブルーバースト']   = {hands="ＨＳバズバンド+3"}

    --遠隔攻撃
    sets.precast.RA = {range="ラミアベーン"}

    --FC
    sets.precast.FC = {
        ammo="サピエンスオーブ",
        head={ name="カマインマスク+1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},
        body="ピンガチュニック+1",
        hands={ name="レイライングローブ", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
        legs="ピンガズボン+1",
        feet={ name="ニャメソルレット", augments={'Path: B',}},
        neck="オルンミラトルク",
        waist="コーネリアの黒帯",
        left_ear="アスプロピアス",
        right_ear="エンチャンピアス+1",
        left_ring="キシャールリング",
        right_ring="メダダリング",
        back={ name="フィフォレケープ+1", augments={'Path: A',}},
    }

    --FC（青魔法）
    sets.precast.FC['青魔法']=set_combine(sets.precast.FC,{body="ＨＳミンタン+3"})

    --WSダメージ
    sets.precast.WS.Damage = {
        ammo="コイストボダー",
        head="ＨＳカヴク+3",
        body={ name="ニャメメイル", augments={'Path: B',}},
        hands={ name="ニャメガントレ", augments={'Path: B',}},
        legs={ name="ニャメフランチャ", augments={'Path: B',}},
        feet={ name="ニャメソルレット", augments={'Path: B',}},
        neck={ name="ミラージストール+2", augments={'Path: A',}},
        waist={ name="セールフィベルト+1", augments={'Path: A',}},
        left_ear={ name="胡蝶のイヤリング", augments={'Accuracy+4','TP Bonus +250',}},
        right_ear={ name="ハシシンピアス+2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+20','Mag. Acc.+20','"Dbl.Atk."+8','STR+15 INT+15',}},
        left_ring="スローダリング",
        right_ring="エパミノダスリング",
        back={ name="ロスメルタケープ", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
    }

    --WSクリティカル
    sets.precast.WS.Critical = {
        ammo="コイストボダー",
        head={ name="ブリスタサリット+1", augments={'Path: A',}},
        body="グレティキュイラス",
        hands="グレティガントレ",
        legs="グレティブリーチズ",
        feet="グレティブーツ",
        neck="フォシャゴルゲット",
        waist="フォシャベルト",
        left_ear="オドルピアス",
        right_ear={ name="ハシシンピアス+2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+20','Mag. Acc.+20','"Dbl.Atk."+8','STR+15 INT+15',}},
        left_ring="イラブラットリング",
        right_ring="エポナリング",
        back={ name="ロスメルタケープ", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10',}},
    }

    --WS魔攻
    sets.precast.WS.Magic = {
        ammo="ペムフレドタスラム",
        head={ name="ニャメヘルム", augments={'Path: B',}},
        body={ name="ニャメメイル", augments={'Path: B',}},
        hands={ name="ニャメガントレ", augments={'Path: B',}},
        legs={ name="ニャメフランチャ", augments={'Path: B',}},
        feet={ name="ニャメソルレット", augments={'Path: B',}},
        neck="シビルスカーフ",
        waist="スクリミルコード",
        left_ear="王将の耳飾り",
        right_ear="フリオミシピアス",
        left_ring="エパミノダスリング",
        right_ring="メダダリング",
        back={ name="コンフラワーケープ", augments={'MP+23','Accuracy+3','Blue Magic skill +10',}},
    }

    --WSモクシャ
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

    --個別WS定義
    sets.precast.WS["サンギンブレード"] = { Normal=set_combine(sets.precast.WS.Magic,{head="妖蟲の髪飾り+1",right_ring="アルコンリング",}),
                                            SubtleBlow=set_combine(set_combine(sets.precast.WS.Magic,{head="妖蟲の髪飾り+1",right_ring="アルコンリング",}),sets.precast.WS.SubtleBlow)}
	-- 詠唱中断
	sets.midcast.interruption = {
        main="エレマイトワンド",
        sub="エレマイトワンド",
        ammo="ストンチタスラム+1",
        head="無の面",
        body="アダマンアーマー",
        legs="ＡＳシャルワー+4",
        neck={ name="アンムーヴカラー+1", augments={'Path: A',}},
        waist="プラチナモグベルト",
        left_ring={ name="メランリング", augments={'Path: A',}},
        right_ring="守りの指輪",
        back={ name="フィフォレケープ+1", augments={'Path: A',}},
    }

    --強化魔法
    sets.midcast['強化魔法'] = {
        head={ name="テルキネキャップ", augments={'"Cure" potency +5%','Enh. Mag. eff. dur. +10',}},
        body={ name="テルキネシャジュブ", augments={'"Cure" potency +7%','Enh. Mag. eff. dur. +10',}},
        hands={ name="テルキネグローブ", augments={'"Cure" potency +7%','Enh. Mag. eff. dur. +10',}},
        legs={ name="テルキネブラコーニ", augments={'"Cure" potency +8%','Enh. Mag. eff. dur. +10',}},
        feet={ name="テルキネピガッシュ", augments={'"Cure" potency +8%','Enh. Mag. eff. dur. +10',}},
        neck="インカンタートルク",
        waist="オリンポスサッシュ",
        left_ear="アンドアーピアス",
        left_ring="メランリング",
        right_ring="スティキニリング+1",
        back={ name="フィフォレケープ+1", augments={'Path: A',}},
    }

    --アクアベール
    sets.midcast['アクアベール'] = set_combine(sets.midcast['強化魔法'] ,{
        head="ＡＭコイフ+1",
        legs="シェダルサラウィル",
        waist="エンパチコスロープ",
    })

    --ケアル
    sets.midcast.Cure={
        ammo="ストンチタスラム+1",
        head="ニャメヘルム",
        body="ピンガチュニック+1",
        hands={ name="テルキネグローブ", augments={'"Cure" potency +7%','Enh. Mag. eff. dur. +10',}},
        legs="ピンガズボン+1",
        feet="ニャメソルレット",
        neck={ name="アンムーヴカラー+1", augments={'Path: A',}},
        waist={name="プラチナモグベルト",priority=16},
        left_ear={ name="オノワイヤリング+1", augments={'Path: A',}},
        left_ring={ name="ゼラチナスリング+1", augments={'Path: A',},priority=15},
        back="ソレムニティケープ",
    }

    --青魔法ケアル
    sets.midcast.BlueHealing=sets.midcast.Cure

    --青魔法魔攻
    sets.midcast.BlueMagical = {
        main="ブンジロッド",
        sub="マクセンチアス",
        ammo={ name="ガストリタスラム+1", augments={'Path: A',}},
        head="ＨＳカヴク+3",
        body="ＨＳミンタン+3",
        hands="ＨＳバズバンド+3",
        legs="ＨＳタイト+3",
        feet="ＨＳバシュマク+3",
        neck={ name="ミラージストール+2", augments={'Path: A',}},
        waist="オルペウスサッシュ",
        left_ear="王将の耳飾り",
        right_ear={ name="ハシシンピアス+2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+20','Mag. Acc.+20','"Dbl.Atk."+8','STR+15 INT+15',}},
        left_ring={ name="メタモルリング+1", augments={'Path: A',}},
        right_ring="メダダリング",
        back={ name="コンフラワーケープ", augments={'MP+23','Accuracy+3','Blue Magic skill +10',}},

    }

    --青魔法魔命
    sets.midcast.BlueMagicAcc = {
        main="ブンジロッド",
        sub="マクセンチアス",
        ammo="ペムフレドタスラム",
        head="ＨＳカヴク+3",
        body="ＨＳミンタン+3",
        hands="ＨＳバズバンド+3",
        legs="ＨＳタイト+3",
        feet="ＨＳバシュマク+3",
        neck="無の喉輪",
        waist="無の腰当",
        left_ear="昏黄の耳飾り",
        right_ear={ name="ハシシンピアス+2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+20','Mag. Acc.+20','"Dbl.Atk."+8','STR+15 INT+15',}},
        left_ring={ name="ゼラチナスリング+1", augments={'Path: A',},priority=16},
        right_ring={ name="メタモルリング+1", augments={'Path: A',}},
        back="無の外装",
    }

    --青魔法バフ
    sets.midcast.BlueBuff = {
        head={ name="ＬＬケフィエ+3", augments={'Enhances "Convergence" effect',}},
        body="ＡＳジュバ+3",
        hands="ＨＳバズバンド+3",
        legs="ＨＳタイト+3",
        feet={ name="ＬＬチャルク+3", augments={'Enhances "Diffusion" effect',}},
        neck={ name="ミラージストール+2", augments={'Path: A',}},
        waist={name="プラチナモグベルト",priority=16},
        left_ear={name="エテオレートピアス",priority=15},
        right_ear={ name="ハシシンピアス+2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+20','Mag. Acc.+20','"Dbl.Atk."+8','STR+15 INT+15',}},
        left_ring="メランリング",
        right_ring="スティキニリング+1",
        back={ name="コンフラワーケープ", augments={'MP+23','Accuracy+3','Blue Magic skill +10',}},
    }

    sets.midcast['精霊魔法']              = sets.midcast.BlueMagical
    sets.midcast['夢想花']                = set_combine(sets.midcast.BlueMagicAcc,sets.TreasureHunter)
    sets.midcast['クルエルジョーク']      = set_combine(sets.midcast.BlueMagicAcc,{})
    sets.midcast['サドンランジ']          = set_combine(sets.midcast.BlueMagicAcc,{})
    sets.midcast['マジックハンマー']      = set_combine(sets.midcast.BlueMagical ,sets.midcast.BlueMagicAcc)
    sets.midcast['エントゥーム']          = set_combine(sets.midcast.BlueMagical ,{neck="クアンプネックレス",left_ring="ゼラチナスリング+1"})
    sets.midcast['エンバームアース']      = set_combine(sets.midcast.BlueMagical ,{neck="クアンプネックレス",left_ring="ゼラチナスリング+1"})
    sets.midcast['テネブラルクラッシュ']  = set_combine(sets.midcast.BlueMagical ,{head="妖蟲の髪飾り+1",ring2="アルコンリング"})
    sets.midcast['アンビルライトニング']  = set_combine(sets.midcast.BlueMagical ,{left_ring="イラブラットリング",back={ name="ロスメルタケープ", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10',}}})
    sets.midcast['ファランクス']          = set_combine({
        main="サクパタソード",
        head={ name="ヘルクリアヘルム", augments={'Accuracy+11','STR+4','Phalanx +4','Accuracy+6 Attack+6','Mag. Acc.+16 "Mag.Atk.Bns."+16',}},
        body={ name="ヘルクリアベスト", augments={'STR+10','Pet: STR+9','Phalanx +5','Mag. Acc.+3 "Mag.Atk.Bns."+3',}},
        hands={ name="ヘルクリアグローブ", augments={'Magic Damage +1','Crit. hit damage +3%','Phalanx +4','Accuracy+10 Attack+10','Mag. Acc.+20 "Mag.Atk.Bns."+20',}},
        legs={ name="ヘルクリアトラウザ", augments={'AGI+8','Attack+7','Phalanx +4','Accuracy+1 Attack+1','Mag. Acc.+2 "Mag.Atk.Bns."+2',}},
        feet={ name="ヘルクリアブーツ", augments={'Weapon skill damage +2%','"Fast Cast"+3','Phalanx +5','Accuracy+16 Attack+16',}},})
    sets.midcast.Aquaveil = set_combine(sets.midcast['強化魔法'] ,{head="ＡＭコイフ+1", legs="シェダルサラウィル", waist="エンパチコスロープ"})

end
