function init_weaponns()
    --デフォルト武器を設定
    send_command('gs c set MainWeapons AnkusaAxe')
    if player.sub_job == '忍' or player.sub_job == 'NIN' or player.sub_job == '踊' or player.sub_job == 'DNC' then
		send_command('gs c set SubWeapons KrakenClub')
	else
		send_command('gs c set SubWeapons AdapaShield')
	end
end


function init_gear_sets()
    --ロックスタイル番号
    lockstyleset = 61

    --武器
    gear.Dolichenus             = {name="ドリケナス"}
    gear.AnkusaAxe              = {name="アンクサアクス"}
    gear.AdapaShield            = {name="アダパシールド"}
    gear.Tauret                 = {name="トーレット"}
    gear.Malevolence            = {name="マレヴォレンス"}
    gear.CrepuscularKnife       = {name="クレパスクラナイフ"}
    gear.KrakenClub             = {name="クラーケンクラブ"}
    gear.Naegling               = {name="ネイグリング"}
    gear.OnionSword             = {name="真オニオンソード"}

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

    --待機装備（ペット呼び出し時）
    sets.idle.Pet = {
        ammo="ストンチタスラム+1",
        head={ name="ニャメヘルム", augments={'Path: B',}},
        body="ＴＯジャック+3",
        hands="グレティガントレ",
        legs="ＮＫキホーテ+3",
        feet="グレティブーツ",
        neck="無の喉輪",
        waist="イーサベルト",
        left_ear="エンメルカルピアス",
        right_ear={ name="ヌグーミピアス+1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+13','Mag. Acc.+13','Pet: "Dbl. Atk."+6',}},
        left_ring="メランリング",
        right_ring="シュネデックリング",
        back={ name="アルティオマント", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Eva.+20 /Mag. Eva.+20','Pet: "Regen"+10','Pet: Damage taken -5%',}},
    }

    --走り回る用
    sets.Kiting={right_ring="シュネデックリング",}

    --抜刀装備
    sets.engaged = {
        ammo={ name="コイストボダー", augments={'Path: A',}},
        head="マリグナスシャポー",
        body="マリグナスタバード",
        hands="マリグナスグローブ",
        legs="マリグナスタイツ",
        feet="マリグナスブーツ",
        neck="無の喉輪",
        waist="サリサフロイベルト",
        left_ear="シェリダピアス",
        right_ear="ディグニタリピアス",
        left_ring="シーリチリング+1",
        right_ring="シーリチリング+1",
        back={ name="アルティオマント", augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10','Phys. dmg. taken-10%',}},
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
    
    --二刀流11（サポ忍）
    sets.engaged.dual11= {waist="霊亀腰帯",left_ear="エアバニピアス",}
    
    --二刀流21（サポ踊）
    sets.engaged.dual21= set_combine(sets.engaged.dual11,{back={ name="アルティオマント", augments={'DEX+20','Accuracy+20 Attack+20','"Dual Wield"+10','Pet: Phys. dmg. taken-10%',}},})

    --即時発動系
    sets.precast.JA['K.インスティンクト']   = {head="ＡＫヘルム+4"}
    sets.precast.JA['よびだす']             = {hands="ＡＫグローブ+3"}
    sets.precast.JA['しょうしゅう']         = sets.precast.JA['よびだす']
    sets.precast.JA['使い魔']               = {legs="ＡＫトラウザ+3"} 
    sets.precast.JA['いたわる']             = {ammo="ペットシータ",body="ＴＯジャック+3",legs="ＴＯトラウザ+3",feet="ＴＯゲートル+4"} 
    sets.precast.JA['あやつる']             = {head="ＴＯヘルム+2",body="ＡＫジャック+3",hands="ＡＫグローブ+3",legs="ＡＫトラウザ+3",feet="ＡＫゲートル+3"} 

    --FC
    sets.precast.FC = {
        ammo="サピエンスオーブ",
        body="サクロブレスト",
        hands={ name="レイライングローブ", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
        neck="オルンミラトルク",
        waist="コーネリアの黒帯",
        left_ear="エテオレートピアス",
        right_ear="エンチャンピアス+1",
        left_ring="メダダリング",
        right_ring="ラハブリング",
    }

    sets.precast.Monster = {
        legs="グレティブリーチズ"
    }

    --スナップ
    sets.precast.RA = {
        range="ラミアベーン",
        feet = "メガナダジャンボ+2"
    }

    --WSダメージ
    sets.precast.WS.Damage = {
        ammo={ name="コイストボダー", augments={'Path: A',}},
        head={ name="ニャメヘルム", augments={'Path: B',}},
        body={ name="ニャメメイル", augments={'Path: B',}},
        hands={ name="ニャメガントレ", augments={'Path: B',}},
        legs={ name="ニャメフランチャ", augments={'Path: B',}},
        feet={ name="ニャメソルレット", augments={'Path: B',}},
        --neck="ウォーダチャーム+1",
        neck="共和プラチナ章",
        waist={ name="セールフィベルト+1", augments={'Path: A',}},
        left_ear={ name="胡蝶のイヤリング", augments={'Accuracy+4','TP Bonus +250',}},
        right_ear={ name="ヌグーミピアス+1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+13','Mag. Acc.+13','Pet: "Dbl. Atk."+6',}},
       -- left_ring="エパミノダスリング",
        left_ring="スローダリング",
        right_ring="王将の指輪",
        back={ name="アルティオマント", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
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
        right_ring="メダダリング",
        back={ name="アルティオマント", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
    }

    --ペット技：物理
    sets.midcast.Pet.PhysicalDamage = {
        ammo={ name="ヘスペリデ", augments={'Path: A',}},
        head={ name="バロラスマスク", augments={'Pet: Attack+30 Pet: Rng.Atk.+30','Pet: "Store TP"+3','Pet: Accuracy+9 Pet: Rng. Acc.+9',}},
        body={ name="バロラスメイル", augments={'Pet: Attack+29 Pet: Rng.Atk.+29','Pet: Accuracy+14 Pet: Rng. Acc.+14',}},
        hands="ＮＫマノプラス+3",
        legs="ＴＯトラウザ+3",
        feet="ＴＯゲートル+4",
        neck="シュルマヌカラー",
        waist="インカーネトサッシュ",
        left_ear="スローダピアス",
        right_ear={ name="ヌグーミピアス+1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+13','Mag. Acc.+13','Pet: "Dbl. Atk."+6',}},
        left_ring="月明の指輪",
        right_ring="パルーグリング",
        back={ name="パストラルマント", augments={'STR+1 DEX+1','Accuracy+2','Pet: Accuracy+20 Pet: Rng. Acc.+20',}},
    }

    --ペット技：魔攻
    sets.midcast.Pet.MagicDamage = {
        ammo="ストンチタスラム+1",
        head="ＮＫカバセ+2",
        body="ウドゥグジャケット",
        hands="ＮＫマノプラス+3",
        legs="ＮＫキホーテ+3",
        feet="グレティブーツ",
        neck="アダドアミュレット",
        waist="インカーネトサッシュ",
        left_ear="エンメルカルピアス",
        right_ear={ name="ヌグーミピアス+1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+13','Mag. Acc.+13','Pet: "Dbl. Atk."+6',}},
        left_ring="月明の指輪",
        right_ring="パルーグリング",
        back={ name="アルティオマント", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Eva.+20 /Mag. Eva.+20','Pet: "Regen"+10','Pet: Damage taken -5%',}},
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

    init_weapon_skill()

    --ペット技：弱体
    sets.midcast.Pet.Enfeebling = sets.midcast.Pet.MagicDamage
    --ペット技：強化
    sets.midcast.Pet.Enhancing = sets.midcast.Pet.MagicDamage
    
    sets.midcast.Pet['フットキック'] = sets.midcast.Pet.PhysicalDamage
    sets.midcast.Pet['土煙'] = sets.midcast.Pet.MagicDamage
    sets.midcast.Pet['爪旋風脚'] = sets.midcast.Pet.PhysicalDamage
    sets.midcast.Pet['ワイルドカロット'] = sets.midcast.Pet.Enhancing
    sets.midcast.Pet['頭突き'] = sets.midcast.Pet.PhysicalDamage
    sets.midcast.Pet['レイジ'] = sets.midcast.Pet.Enhancing
    sets.midcast.Pet['シープチャージ'] = sets.midcast.Pet.PhysicalDamage
    sets.midcast.Pet['シープソング'] = sets.midcast.Pet.Enfeebling
    sets.midcast.Pet['咆哮'] = sets.midcast.Pet.Enfeebling
    sets.midcast.Pet['レイザーファング'] = sets.midcast.Pet.PhysicalDamage
    sets.midcast.Pet['クローサイクロン'] = sets.midcast.Pet.PhysicalDamage
    sets.midcast.Pet['クロススラッシュ'] = sets.midcast.Pet.PhysicalDamage
    sets.midcast.Pet['プレダトリグレア'] = sets.midcast.Pet.Enfeebling
    sets.midcast.Pet['カオティックアイ'] = sets.midcast.Pet.Enfeebling
    sets.midcast.Pet['ブラスター'] = sets.midcast.Pet.Enfeebling
    sets.midcast.Pet['チャージドホイスカー'] = sets.midcast.Pet.MagicDamage
    sets.midcast.Pet['怒髪'] = sets.midcast.Pet.Enhancing
    sets.midcast.Pet['スイープガウジ'] = sets.midcast.Pet.PhysicalDamage
    sets.midcast.Pet['ゼラススノート'] = sets.midcast.Pet.Enfeebling
    sets.midcast.Pet['テイルブロー'] = sets.midcast.Pet.PhysicalDamage
    sets.midcast.Pet['ファイアボール'] = sets.midcast.Pet.MagicDamage
    sets.midcast.Pet['ブロックヘッド'] = sets.midcast.Pet.PhysicalDamage
    sets.midcast.Pet['ブレインクラッシュ'] = sets.midcast.Pet.PhysicalDamage
    sets.midcast.Pet['超低周波'] = sets.midcast.Pet.Enfeebling
    sets.midcast.Pet['体液分泌'] = sets.midcast.Pet.Enhancing
    sets.midcast.Pet['ガイストウォール'] = sets.midcast.Pet.Enfeebling
    sets.midcast.Pet['ナビングノイズ'] = sets.midcast.Pet.Enfeebling
    sets.midcast.Pet['ニンブルスナップ'] = sets.midcast.Pet.PhysicalDamage
    sets.midcast.Pet['サイクロテール'] = sets.midcast.Pet.PhysicalDamage
    sets.midcast.Pet['トクシックスピット'] = sets.midcast.Pet.Enfeebling
    sets.midcast.Pet['サイズテール'] = sets.midcast.Pet.PhysicalDamage
    sets.midcast.Pet['リッパーファング'] = sets.midcast.Pet.PhysicalDamage
    sets.midcast.Pet['噛みつきラッシュ'] = sets.midcast.Pet.PhysicalDamage
    sets.midcast.Pet['トータスストンプ'] = sets.midcast.Pet.PhysicalDamage
    sets.midcast.Pet['甲羅強化'] = sets.midcast.Pet.Enhancing
    sets.midcast.Pet['アクアブレス'] = sets.midcast.Pet.MagicDamage
    sets.midcast.Pet['カースドスフィア'] = sets.midcast.Pet.MagicDamage
    sets.midcast.Pet['毒液'] = sets.midcast.Pet.MagicDamage
    sets.midcast.Pet['サマーソルト'] = sets.midcast.Pet.PhysicalDamage
    sets.midcast.Pet['パワーアタック'] = sets.midcast.Pet.PhysicalDamage
    sets.midcast.Pet['高周波フィールド'] = sets.midcast.Pet.Enfeebling
    sets.midcast.Pet['ライノアタック'] = sets.midcast.Pet.PhysicalDamage
    sets.midcast.Pet['ライノガード'] = sets.midcast.Pet.Enhancing
    sets.midcast.Pet['スポイル'] = sets.midcast.Pet.Enfeebling
    sets.midcast.Pet['ライノレッカー'] = sets.midcast.Pet.Enfeebling
    sets.midcast.Pet['サンドブラスト'] = sets.midcast.Pet.Enfeebling
    sets.midcast.Pet['サンドピット'] = sets.midcast.Pet.Enfeebling
    sets.midcast.Pet['ベノムスプレー'] = sets.midcast.Pet.Enfeebling
    sets.midcast.Pet['M.バイト'] = sets.midcast.Pet.PhysicalDamage
    sets.midcast.Pet['ダブルクロー'] = sets.midcast.Pet.PhysicalDamage
    sets.midcast.Pet['グラップル'] = sets.midcast.Pet.PhysicalDamage
    sets.midcast.Pet['スピニングトップ'] = sets.midcast.Pet.PhysicalDamage
    sets.midcast.Pet['F.ホールド'] = sets.midcast.Pet.Enfeebling
    sets.midcast.Pet['サドンランジ'] = sets.midcast.Pet.Enfeebling
    sets.midcast.Pet['スパイラルスピン'] = sets.midcast.Pet.PhysicalDamage
    sets.midcast.Pet['ノイサムパウダー'] = sets.midcast.Pet.Enfeebling
    sets.midcast.Pet['センシラブレード'] = sets.midcast.Pet.PhysicalDamage
    sets.midcast.Pet['テグミナバフェット'] = sets.midcast.Pet.PhysicalDamage
    sets.midcast.Pet['シックルスラッシュ'] = sets.midcast.Pet.PhysicalDamage
    sets.midcast.Pet['アシッドスプレー'] = sets.midcast.Pet.MagicDamage
    sets.midcast.Pet['スパイダーウェブ'] = sets.midcast.Pet.Enfeebling
    sets.midcast.Pet['I.サッカー'] = sets.midcast.Pet.Enfeebling
    sets.midcast.Pet['グルームスプレー'] = sets.midcast.Pet.MagicDamage
    sets.midcast.Pet['ディスエンバウエル'] = sets.midcast.Pet.PhysicalDamage
    sets.midcast.Pet['E.サルヴォ'] = sets.midcast.Pet.PhysicalDamage
    sets.midcast.Pet['ヘッドバット'] = sets.midcast.Pet.PhysicalDamage
    sets.midcast.Pet['夢想花'] = sets.midcast.Pet.Enfeebling
    sets.midcast.Pet['種まき'] = sets.midcast.Pet.PhysicalDamage
    sets.midcast.Pet['リーフダガー'] = sets.midcast.Pet.PhysicalDamage
    sets.midcast.Pet['スクリーム'] = sets.midcast.Pet.Enfeebling
    sets.midcast.Pet['フロッグキック'] = sets.midcast.Pet.PhysicalDamage
    sets.midcast.Pet['スポア'] = sets.midcast.Pet.Enfeebling
    sets.midcast.Pet['マヨイタケ'] = sets.midcast.Pet.MagicDamage
    sets.midcast.Pet['シビレタケ'] = sets.midcast.Pet.MagicDamage
    sets.midcast.Pet['オドリタケ'] = sets.midcast.Pet.MagicDamage
    sets.midcast.Pet['サイレスガス'] = sets.midcast.Pet.MagicDamage
    sets.midcast.Pet['ダークスポア'] = sets.midcast.Pet.MagicDamage
    sets.midcast.Pet['ニードルショット'] = sets.midcast.Pet.PhysicalDamage
    sets.midcast.Pet['針？本'] = sets.midcast.Pet.PhysicalDamage
    sets.midcast.Pet['サペリフィック'] = sets.midcast.Pet.Enfeebling
    sets.midcast.Pet['グロオーサケス'] = sets.midcast.Pet.Enfeebling
    sets.midcast.Pet['パルジィパレン'] = sets.midcast.Pet.Enfeebling
    sets.midcast.Pet['ティックルテンドリル'] = sets.midcast.Pet.PhysicalDamage
    sets.midcast.Pet['スティンクボム'] = sets.midcast.Pet.MagicDamage
    sets.midcast.Pet['ネクターデルージュ'] = sets.midcast.Pet.MagicDamage
    sets.midcast.Pet['ネペンシックプランジ'] = sets.midcast.Pet.MagicDamage
    sets.midcast.Pet['ウィングスラップ'] = sets.midcast.Pet.PhysicalDamage
    sets.midcast.Pet['ビークランジ'] = sets.midcast.Pet.PhysicalDamage
    sets.midcast.Pet['バックヒール'] = sets.midcast.Pet.PhysicalDamage
    sets.midcast.Pet['ジェタチュラ'] = sets.midcast.Pet.Enfeebling
    sets.midcast.Pet['チョークブレス'] = sets.midcast.Pet.PhysicalDamage
    sets.midcast.Pet['ファンタッド'] = sets.midcast.Pet.Enhancing
    sets.midcast.Pet['フーフボレー'] = sets.midcast.Pet.PhysicalDamage
    sets.midcast.Pet['ニヒリティソング'] = sets.midcast.Pet.Enfeebling
    sets.midcast.Pet['モルトプルメイジ'] = sets.midcast.Pet.MagicDamage
    sets.midcast.Pet['スワープフレンジー'] = sets.midcast.Pet.PhysicalDamage
    sets.midcast.Pet['ペンタペック'] = sets.midcast.Pet.PhysicalDamage
    sets.midcast.Pet['ペッキングフラリー'] = sets.midcast.Pet.PhysicalDamage
    sets.midcast.Pet['バブルシャワー'] = sets.midcast.Pet.MagicDamage
    sets.midcast.Pet['バブルカーテン'] = sets.midcast.Pet.Enhancing
    sets.midcast.Pet['ビッグシザー'] = sets.midcast.Pet.PhysicalDamage
    sets.midcast.Pet['シザーガード'] = sets.midcast.Pet.Enhancing
    sets.midcast.Pet['メタルボディ'] = sets.midcast.Pet.Enhancing
    sets.midcast.Pet['ベノムシャワー'] = sets.midcast.Pet.MagicDamage
    sets.midcast.Pet['メガシザース'] = sets.midcast.Pet.PhysicalDamage
    sets.midcast.Pet['威嚇'] = sets.midcast.Pet.Enfeebling
    sets.midcast.Pet['リコイルダイブ'] = sets.midcast.Pet.PhysicalDamage
    sets.midcast.Pet['ウォーターウォール'] = sets.midcast.Pet.Enhancing
    sets.midcast.Pet['吸着'] = sets.midcast.Pet.PhysicalDamage
    sets.midcast.Pet['ドレインキッス'] = sets.midcast.Pet.PhysicalDamage
    sets.midcast.Pet['アシッドミスト'] = sets.midcast.Pet.MagicDamage
    sets.midcast.Pet['TP吸収キッス'] = set_combine(sets.midcast.Pet.Enfeebling,{main="クンバカルナ"})
    sets.midcast.Pet['ピュルラントウーズ'] = sets.midcast.Pet.MagicDamage
    sets.midcast.Pet['コローシブウーズ'] = sets.midcast.Pet.MagicDamage
    sets.midcast.Pet['ファウルウォーター'] = sets.midcast.Pet.MagicDamage
    sets.midcast.Pet['ペステレントプルーム'] = sets.midcast.Pet.MagicDamage
    sets.midcast.Pet['フルイドスルー'] = sets.midcast.Pet.PhysicalDamage
    sets.midcast.Pet['フルイドスプレッド'] = sets.midcast.Pet.PhysicalDamage
    sets.midcast.Pet['消化'] = sets.midcast.Pet.PhysicalDamage
end