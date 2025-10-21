function init_weaponns()
    --デフォルト武器を設定
    send_command('gs c set MainWeapons Nirvana')
    send_command('gs c set SubWeapons ElanStrap')
end


function init_gear_sets()
    --ロックスタイル番号
    lockstyleset = 91

    gear.Nirvana                = {name="グリダーヴォル"}
    gear.ElanStrap              = {name="エランストラップ+1"}
    gear.Slip                   = { name="プライムスタッフ"}

    --待機装備（通常）
    sets.idle = {
        ammo="ストンチタスラム+1",
        head="ＢＣホーン+2",
        body="ＢＣダブレット+2",
        hands={ name="マーリンダスタナ", augments={'Attack+4','CHR+2','"Refresh"+2',}},
        legs="アシドゥイズボン+1",
        feet={ name="マーリンクラッコー", augments={'CHR+12','Accuracy+5','"Refresh"+2',}},
        neck="シビルスカーフ",
        waist={name="プラチナモグベルト",priority=16},
        left_ear="パルーグピアス",
        right_ear={ name="ベコナーピアス+1", augments={'System: 1 ID: 1676 Val: 0','Pet: Accuracy+15 Pet: Rng. Acc.+15','Pet: Mag. Acc.+15','Damage taken-5%',}},
        left_ring="メランリング",
        right_ring="シュネデックリング",
        back={name="月明の羽衣",priority=15}
    }
    
    --待機装備（ペット呼び出し時）
    sets.idle.Avatar = {
        ammo="ストンチタスラム+1",
        head="ＢＣホーン+2",
        body="ＢＣダブレット+2",
        hands={ name="ニャメガントレ", augments={'Path: B',}},
        legs="アシドゥイズボン+1",
        feet={ name="ニャメソルレット", augments={'Path: B',}},
        neck="シビルスカーフ",
        waist={name="プラチナモグベルト",priority=16},
        left_ear="パルーグピアス",
        right_ear={ name="ベコナーピアス+1", augments={'System: 1 ID: 1676 Val: 0','Pet: Accuracy+15 Pet: Rng. Acc.+15','Pet: Mag. Acc.+15','Damage taken-5%',}},
        left_ring="メランリング",
        right_ring="シュネデックリング",
        back={name="月明の羽衣",priority=15}
    }
    sets.idle.Avatar.Favor = sets.idle.Avatar
    --走り回る用
    sets.Kiting={right_ring="シュネデックリング",}

    --即時発動系
    sets.precast.JA['アストラルフロウ'] = {head="ＧＬホーン+3"}
    sets.precast.JA['神獣の加護']       = {head="ＢＣホーン+2"}
    sets.precast.JA['マナシード']       = {hads="ＢＣブレーサー+2"}
    sets.precast.JA['エレメントサイフォン'] = {}
    
    --FC
    sets.precast.FC = {
        ammo="サピエンスオーブ",
        head={ name="マーリンフード", augments={'"Mag.Atk.Bns."+24','"Fast Cast"+7','Mag. Acc.+1',}},
        body="インヤガジュバ+2",
        hands={ name="マーリンダスタナ", augments={'Accuracy+14','"Fast Cast"+5','MND+9','"Mag.Atk.Bns."+13',}},
        legs={ name="マーリンシャルワ", augments={'"Fast Cast"+6',}},
        feet={ name="マーリンクラッコー", augments={'"Fast Cast"+7','MND+5',}},
        neck="オルンミラトルク",
        waist={name="プラチナモグベルト",priority=16},
        left_ear="マリグナスピアス",
        right_ear="エンチャンピアス+1",
        left_ring={ name="ゼラチナスリング+1", augments={'Path: A',},priority=14},
        right_ring="ラハブリング",
        back={name="月明の羽衣",priority=15}
    }
    
    --履行短縮（バフ・デバフ）
    sets.precast.BloodPactWard = {
        ammo="エピタフサシェ",
        body="ＣＮダブレット+3",
        hands={ name="ＧＬブレーサー+3", augments={'Inc. Sp. "Blood Pact" magic burst dmg.',}},
        feet={ name="ＧＬピガッシュ+3", augments={'Inc. Sp. "Blood Pact" magic crit. dmg.',}},
        back={ name="コンベイケープ", augments={'Summoning magic skill +4','Pet: Enmity+8','Blood Pact Dmg.+2','Blood Pact ab. del. II -2',}},
    }

    --履行短縮（物理履行・魔法履行）
    sets.precast.BloodPactRage = sets.precast.BloodPactWard
    
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
    
    --回復 
    sets.midcast.Cure = {
        ammo="ストンチタスラム+1",
        head={ name="テルキネキャップ", augments={'"Cure" potency +5%','Enh. Mag. eff. dur. +10',}},
        body={ name="テルキネシャジュブ", augments={'"Cure" potency +7%','Enh. Mag. eff. dur. +10',}},
        hands={ name="テルキネグローブ", augments={'"Cure" potency +7%','Enh. Mag. eff. dur. +10',}},
        legs={ name="テルキネブラコーニ", augments={'"Cure" potency +8%','Enh. Mag. eff. dur. +10',}},
        feet={ name="テルキネピガッシュ", augments={'"Cure" potency +8%','Enh. Mag. eff. dur. +10',}},
        neck="オルンミラトルク",
        waist="コーネリアの黒帯",
        left_ear="メンデカントピアス",
        left_ring="メネロスリング",
        right_ring="レベッチェリング",
        back={name="月明の羽衣",priority=15}
    }
    
    --強化魔法
    sets.midcast['強化魔法'] = {
        head={ name="テルキネキャップ", augments={'"Cure" potency +5%','Enh. Mag. eff. dur. +10',}},
        body={ name="テルキネシャジュブ", augments={'"Cure" potency +7%','Enh. Mag. eff. dur. +10',}},
        hands={ name="テルキネグローブ", augments={'"Cure" potency +7%','Enh. Mag. eff. dur. +10',}},
        legs={ name="テルキネブラコーニ", augments={'"Cure" potency +8%','Enh. Mag. eff. dur. +10',}},
        feet={ name="テルキネピガッシュ", augments={'"Cure" potency +8%','Enh. Mag. eff. dur. +10',}},
        waist="エンブラサッシュ",
    }

    --物理履行
    sets.midcast.Pet.AvatarPhysicalPacts = {
        main={ name="グリダーヴォル", augments={'Pet: Accuracy+70','Pet: Attack+70','Pet: "Dbl. Atk."+15',}},
        sub="エランストラップ+1",
        ammo="エピタフサシェ",
        head={ name="ヘリオスバンド", augments={'Pet: Accuracy+30 Pet: Rng. Acc.+30','Pet: "Dbl. Atk."+8','Blood Pact Dmg.+7',}},
        body="ＣＮダブレット+3",
        --       body={ name="ＧＬダブレット+3", augments={'Reduces Sp. "Blood Pact" MP cost',}},
        hands={ name="ヘリオスグローブ", augments={'Pet: Accuracy+30 Pet: Rng. Acc.+30','Pet: "Dbl. Atk."+8','Blood Pact Dmg.+7',}},
        legs={ name="エンタイサーパンツ", augments={'MP+45','Pet: Accuracy+14 Pet: Rng. Acc.+14','Pet: Mag. Acc.+13','Pet: Damage taken -3%',}},
        feet="ブンジサボ",
        neck={ name="召喚士の首輪+2", augments={'Path: A',}},
        waist="インカーネトサッシュ",
        left_ear="ルガルバンダピアス",
        right_ear={ name="ベコナーピアス+1", augments={'System: 1 ID: 1676 Val: 0','Pet: Accuracy+15 Pet: Rng. Acc.+15','Pet: Mag. Acc.+15','Damage taken-5%',}},
        left_ring="パルーグリング",
        right_ring="ヴァラールリング+1",
        back={ name="カンペストレケープ", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20',}},
    }
    
    --魔法履行
    sets.midcast.Pet.AvatarMagicalPacts = {
        main={ name="グリオアヴァール", augments={'Blood Pact Dmg.+5','Pet: INT+15','Pet: Mag. Acc.+14','Pet: "Mag.Atk.Bns."+25',}},
        sub="エランストラップ+1",
        ammo="エピタフサシェ",
        head="パルーグクラウン",
        body="ウドゥグジャケット",
        hands={ name="マーリンダスタナ", augments={'Pet: "Mag.Atk.Bns."+24','Blood Pact Dmg.+10','Pet: Mag. Acc.+9',}},
        legs={ name="エンタイサーパンツ", augments={'MP+45','Pet: Accuracy+14 Pet: Rng. Acc.+14','Pet: Mag. Acc.+13','Pet: Damage taken -3%',}},
        feet="ブンジサボ",
        neck={ name="召喚士の首輪+2", augments={'Path: A',}},
        waist="王将の帯",
        left_ear="ルガルバンダピアス",
        right_ear={ name="ベコナーピアス+1", augments={'System: 1 ID: 1676 Val: 0','Pet: Accuracy+15 Pet: Rng. Acc.+15','Pet: Mag. Acc.+15','Damage taken-5%',}},
        left_ring="パルーグリング",
        right_ring="ヴァラールリング+1",
        back={ name="カンペストレケープ", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Pet: Magic Damage+10',}},
    }

    --フレイムクラッシュ
    sets.midcast.Pet['フレイムクラッシュ']={
        main={ name="グリダーヴォル", augments={'Pet: Accuracy+70','Pet: Attack+70','Pet: "Dbl. Atk."+15',}},
        sub="エランストラップ+1",
        ammo="エピタフサシェ",
        head={ name="ヘリオスバンド", augments={'Pet: Accuracy+30 Pet: Rng. Acc.+30','Pet: "Dbl. Atk."+8','Blood Pact Dmg.+7',}},
        body="ＣＮダブレット+3",
        hands={ name="ヘリオスグローブ", augments={'Pet: Accuracy+30 Pet: Rng. Acc.+30','Pet: "Dbl. Atk."+8','Blood Pact Dmg.+7',}},
        legs={ name="エンタイサーパンツ", augments={'MP+45','Pet: Accuracy+14 Pet: Rng. Acc.+14','Pet: Mag. Acc.+13','Pet: Damage taken -3%',}},
        feet="ブンジサボ",
        neck={ name="召喚士の首輪+2", augments={'Path: A',}},
        waist="王将の帯",
        left_ear="ルガルバンダピアス",
        right_ear={ name="ベコナーピアス+1", augments={'System: 1 ID: 1676 Val: 0','Pet: Accuracy+15 Pet: Rng. Acc.+15','Pet: Mag. Acc.+15','Damage taken-5%',}},
        left_ring="パルーグリング",
        right_ring="ヴァラールリング+1",
        back={ name="カンペストレケープ", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Pet: Magic Damage+10',}},
    }

    --バフ・デバフ履行
    sets.midcast.Pet.AvatarBuffWard = {
        head="ＢＣホーン+2",
        body="バヤミローブ",
        hands={ name="ＧＬブレーサー+3", augments={'Inc. Sp. "Blood Pact" magic burst dmg.',}},
        legs="ＢＣスパッツ+2",
        feet={ name="ニャメソルレット", augments={'Path: B',}},
        neck="インカンタートルク",
        waist="プラチナモグベルト",
        left_ear="パルーグピアス",
        right_ear="ロードルピアス",
        left_ring="メランリング",
        right_ring="スティキニリング+1",
        back={ name="コンベイケープ", augments={'Summoning magic skill +4','Pet: Enmity+8','Blood Pact Dmg.+2','Blood Pact ab. del. II -2',}},
    }

    --デバフ履行
    sets.midcast.Pet.AvatarDeBuffWard = sets.midcast.Pet.AvatarBuffWard
end
