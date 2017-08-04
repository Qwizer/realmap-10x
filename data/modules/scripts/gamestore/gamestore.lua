-- Parser
dofile('data/modules/scripts/gamestore/init.lua')
-- Config
GameStore.Categories = {
--{	name = "Premium Time",
		--state = GameStore.States.STATE_NEW,
		--rookgaard = true,
		--icons = {"Category_PremiumTime.png"},
		--offers = {
			--{name = "15 Days of Premium Account", day = 15, type = GameStore.OfferTypes.PREMIUM_10, price = 6, icons = {"Product_PremiumTime30.png"}},
			--{name = "30 Days of Premium Account", day = 30, type = GameStore.OfferTypes.PREMIUM_10, price = 10, icons = {"Product_PremiumTime90.png"}},
			--{name = "60 Days of Premium + 05 Days Bonus", state = GameStore.States.STATE_NEW, day = 65, type = GameStore.OfferTypes.PREMIUM_10, price = 20, icons = {"Product_PremiumTime180.png"}},
			--{name = "90 Days of Premium + 15 Days Bonus", state = GameStore.States.STATE_NEW, day = 105, type = GameStore.OfferTypes.PREMIUM_10, price = 30, icons = {"Product_PremiumTime360.png"}},
			
		--}
	--},
	{	name = "Promoções",
			state = GameStore.States.STATE_NEW,
			rookgaard = true,
			icons = {"sale_promo.png"},
			offers = {
				--{name = "Character Name Change", basePrice = 15, state = GameStore.States.STATE_SALE, validUntil = 28, type = GameStore.OfferTypes.OFFER_TYPE_NAMECHANGE, price = 5, icons = {"Product_CharacterNameChange.png"}},
				{name = "Character Sex Change", basePrice = 15, state = GameStore.States.STATE_SALE, validUntil = 28, type = GameStore.OfferTypes.OFFER_TYPE_SEXCHANGE, price = 5, icons = {"Product_CharacterSexChange.png"}},
				-- Promotion example
			    -- {name = "First Promotion", thingId = 1--[[ed/ms/rp/ek]], type = GameStore.OfferTypes.OFFER_TYPE_PROMOTION, price = 125, icons = {"Product_FirstPromotion.png"}}
			}
		},
		{	name = "Mounts",
		state = GameStore.States.STATE_NONE,
		rookgaard = true,
		icons = {"Category_Mounts.png"},
		offers = {
			-- Mount Example : thingId = mountId
			{name = "Ivory Fang", state = GameStore.States.STATE_NEW, thingId = 101, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 50, icons = {"Product_Mount_IvoryFang.png"}, description = "This mount looks so hot! Speed +20"},
			{name = "Shadow Claw", state = GameStore.States.STATE_NEW, thingId = 102, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 50, icons = {"Shadow_Claw.png"}, description = "This mount looks so hot! Speed +20"},
			{name = "Snow Pelt", state = GameStore.States.STATE_NEW, thingId = 103, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 50, icons = {"Snow_Pelt.png"}, description = "This mount looks so hot! Speed +20"},
			{name = "Armoured War Horse", thingId = 23, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 20, icons = {"Mounts_ArmouredWarHorse.png"}, description = "This mount looks so hot! Speed +20"},
			{name = "Azudocus", thingId = 45, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 20, icons = {"Mounts_Azudocus.png"}, description = "This mount looks so hot! Speed +20"},
			{name = "Carpacosaurus", thingId = 46, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 20, icons = {"Mounts_Carpacosaurus.png"}, description = "This mount looks so hot! Speed +20"},
			{name = "Platesaurian", thingId = 37, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 20, icons = {"Mounts_Platesaurian.png"}, description = "This mount looks so hot! Speed +20"},
			{name = "Crimson Ray", thingId = 33, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 20, icons = {"Mounts_CrimsonRay.png"}, description = "This mount looks so hot! Speed +20"},
			{name = "Shadow Draptor", thingId = 24, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 20, icons = {"Mounts_ShadowDraptor.png"}, description = "This mount looks so hot! Speed +20"},
			{name = "Steelbeak", thingId = 34, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 20, icons = {"Mounts_Steelbeak.png"}, description = "This mount looks so hot! Speed +20"},
			{name = "Batcat", thingId = 78, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 20, icons = {"Product_Mount_Batcat.png"}, description = "This mount looks so hot! Speed +20"},
			{name = "Black Stag", thingId = 74, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 20, icons = {"Mounts_BlackStag.png"}, description = "This mount looks so hot! Speed +20"},
			{name = "Blackpelt", thingId = 59, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 20, icons = {"Product_Mount_Blackpelt.png"}, description = "This mount looks so hot! Speed +20"},
			{name = "Cinderhoof", thingId = 91, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 20, icons = {"Product_Mount_Cinderhoof.png"}, description = "This mount looks so hot! Speed +20"},
			{name = "Coralripper", thingId = 80, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 20, icons = {"Product_Mount_Coralripper.png"}, description = "This mount looks so hot! Speed +20"},
			{name = "Death Crawler", thingId = 47, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 20, icons = {"Product_Mount_DeathCrawler.png"}, description = "This mount looks so hot! Speed +20"},
			{name = "Desert King", thingId = 41, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 20, icons = {"Product_Mount_DesertKing.png"}, description = "This mount looks so hot! Speed +20"},
			{name = "Doombringer", thingId = 54, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 20, icons = {"Product_Mount_Doombringer.png"}, description = "This mount looks so hot! Speed +20"},
			{name = "Emerald Waccoon", thingId = 71, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 20, icons = {"Product_Mount_EmeraldWaccoon.png"}, description = "This mount looks so hot! Speed +20"},
			{name = "Emperor Deer", thingId = 75, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 20, icons = {"Product_Mount_EmperorDeer.png"}, description = "This mount looks so hot! Speed +20"},
			{name = "Flamesteed", thingId = 48, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 20, icons = {"Product_Mount_Flamesteed.png"}, description = "This mount looks so hot! Speed +20"},
			{name = "Flitterkatzen", thingId = 76, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 20, icons = {"Product_Mount_Flitterkatzen.png"}, description = "This mount looks so hot! Speed +20"},
			{name = "Floating Kashmir", thingId = 68, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 20, icons = {"Product_Mount_FloatingKashmir.png"}, description = "This mount looks so hot! Speed +20"},
			{name = "Flying Divan", thingId = 66, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 20, icons = {"Product_Mount_FlyingDivan.png"}, description = "This mount looks so hot! Speed +20"},
			{name = "Frostflare", thingId = 90, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 20, icons = {"Product_Mount_Frostflare.png"}, description = "This mount looks so hot! Speed +20"},
			{name = "Glacier Vagabond", thingId = 65, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 20, icons = {"Product_Mount_GlacierVagabond.png"}, description = "This mount looks so hot! Speed +20"},
			{name = "Golden Dragonfly", thingId = 60, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 20, icons = {"Product_Mount_GoldenDragonfly.png"}, description = "This mount looks so hot! Speed +20"},
			{name = "Gorongra", thingId = 82, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 20, icons = {"Product_Mount_Gorongra.png"}, description = "This mount looks so hot! Speed +20"},
			{name = "Hailstorm Fury", thingId = 56, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 20, icons = {"Product_Mount_HailstormFury.png"}, description = "This mount looks so hot! Speed +20"},
			{name = "Highland Yak", thingId = 64, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 20, icons = {"Product_Mount_HighlandYak.png"}, description = "This mount looks so hot! Speed +20"},
			{name = "Jade Lion", thingId = 49, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 20, icons = {"Product_Mount_JadeLion.png"}, description = "This mount looks so hot! Speed +20"},
			{name = "Jade Pincer", thingId = 50, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 20, icons = {"Product_Mount_JadePincer.png"}, description = "This mount looks so hot! Speed +20"},
			{name = "Magic Carpet", thingId = 67, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 20, icons = {"Product_Mount_MagicCarpet.png"}, description = "This mount looks so hot! Speed +20"},
			{name = "Nethersteed", thingId = 51, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 20, icons = {"Product_Mount_Nethersteed.png"}, description = "This mount looks so hot! Speed +20"},
			{name = "Night Waccoon", thingId = 70, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 20, icons = {"Product_Mount_NightmareWaccoon.png"}, description = "This mount looks so hot! Speed +20"},
			{name = "Nightdweller", thingId = 89, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 20, icons = {"Product_Mount_Nightdweller.png"}, description = "This mount looks so hot! Speed +20"},
			{name = "Nightstinger", thingId = 86, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 20, icons = {"Product_Mount_Nightstinger.png"}, description = "This mount looks so hot! Speed +20"},
			{name = "Noctungra", thingId = 83, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 20, icons = {"Product_Mount_Noctungra.png"}, description = "This mount looks so hot! Speed +20"},
			{name = "Plumfish", thingId = 81, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 20, icons = {"Product_Mount_Plumfish.png"}, description = "This mount looks so hot! Speed +20"},
			{name = "Poisonbane", thingId = 58, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 20, icons = {"Product_Mount_Poisonbane.png"}, description = "This mount looks so hot! Speed +20"},
			{name = "Razorcreep", thingId = 87, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 20, icons = {"Product_Mount_Razorcreep.png"}, description = "This mount looks so hot! Speed +20"},
			{name = "Ringtail Waccoon", thingId = 69, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 20, icons = {"Product_Mount_RingtailWaccoon.png"}, description = "This mount looks so hot! Speed +20"},
			{name = "Sea Devil", thingId = 79, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 20, icons = {"Product_Mount_SeaDevil.png"}, description = "This mount looks so hot! Speed +20"},
			{name = "Shadow Hart", thingId = 73, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 20, icons = {"Product_Mount_ShadowHart.png"}, description = "This mount looks so hot! Speed +20"},
			{name = "Siegebreaker", thingId = 57, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 20, icons = {"Product_Mount_Siegebreaker.png"}, description = "This mount looks so hot! Speed +20"},
			{name = "Silverneck", thingId = 83, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 20,icons = {"Product_Mount_Silverneck.png"}, description = "This mount looks so hot! Speed +20"},
			{name = "Slagsnare", thingId = 85, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 20, icons = {"Product_Mount_Slagsnare.png"}, description = "This mount looks so hot! Speed +20"},
			{name = "Steel Bee", thingId = 61, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 20, icons = {"Product_Mount_SteelBee.png"}, description = "This mount looks so hot! Speed +20"},
			{name = "Tempest", thingId = 52, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 20, icons = {"Product_Mount_Tempest.png"}, description = "This mount looks so hot! Speed +20"},
			{name = "Tombstinger", thingId = 36, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 20, icons = {"Product_Mount_Tombstinger.png"}, description = "This mount looks so hot! Speed +20"},
			{name = "Tundra Rambler", thingId = 63, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 20, icons = {"Product_Mount_TundraRambler.png"}, description = "This mount looks so hot! Speed +20"},
			{name = "Venompaw", thingId = 77, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 20, icons = {"Product_Mount_Venompaw.png"}, description = "This mount looks so hot! Speed +20"},
			{name = "Winter King", thingId = 53, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 20, icons = {"Product_Mount_WinterKing.png"}, description = "This mount looks so hot! Speed +20"},
			{name = "Woodland Prince", thingId = 55, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 20, icons = {"Product_Mount_WoodlandPrince.png"}, description = "This mount looks so hot! Speed +20"},
			{name = "Bloodcurl", thingId = 93, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 20, icons = {"Bloodcurl.png"}, description = "This mount looks so hot! Speed +20"},
			{name = "Leafscuttler", thingId = 94, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 20, icons = {"Leafscuttler.png"}, description = "This mount looks so hot! Speed +20"},
			{name = "Mouldpincer", thingId = 92, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 20, icons = {"Mouldpincer.png"}, description = "This mount looks so hot! Speed +20"},
			{name = "Reed Lurker", thingId = 98, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 20, icons = {"Reed_Lurker.png"}, description = "This mount looks so hot! Speed +20"},
			{name = "Mould Shell", thingId = 97, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 20, icons = {"Mould_Shell.png"}, description = "This mount looks so hot! Speed +20"},
			{name = "Swamp Snapper", thingId = 96, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 20, icons = {"Mount_SwampSnapper.png"}, description = "This mount looks so hot! Speed +20"},
			}
	},
{	name = "Outfits",
		state = GameStore.States.STATE_NONE,
		rookgaard = true,
		icons = {"Category_Outfits.png"},
		offers = {
        	{name = "Retro Warrior Addon", state = GameStore.States.STATE_NEW, thingId = {male=962,female=963}, addon = 3, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON, price = 50, icons = {"Outfit_Retro_Warrior_Male.png", "Outfit_Retro_Warrior_Female.png"}},
			{name = "Retro Summoner Addon", state = GameStore.States.STATE_NEW, thingId = {male=964,female=965}, addon = 3, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON, price = 50, icons = {"Outfit_Retro_Summoner_Male.png", "Outfit_Retro_Summoner_Female.png"}},
			{name = "Retro Nobleman Addon", state = GameStore.States.STATE_NEW, thingId = {male=966,female=997}, addon = 3, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON, price = 50, icons = {"Outfit_Retro_Nobleman_Male.png", "Outfit_Retro_Nobleman_Female.png"}},
			{name = "Retro Mage Addon", state = GameStore.States.STATE_NEW, thingId = {male=968,female=969}, addon = 3, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON, price = 50, icons = {"Outfit_Retro_Mage_Male.png", "Outfit_Retro_Mage_Female.png"}},
			{name = "Retro Knight Addon", state = GameStore.States.STATE_NEW, thingId = {male=970,female=971}, addon = 3, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON, price = 50, icons = {"Outfit_Retro_Knight_Male.png", "Outfit_Retro_Knight_Female.png"}},
			{name = "Retro Hunter Addon", state = GameStore.States.STATE_NEW, thingId = {male=972,female=973}, addon = 3, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON, price = 50, icons = {"Outfit_Retro_Hunter_Male.png", "Outfit_Retro_Hunter_Female.png"}},
			{name = "Retro Citizen Addon", state = GameStore.States.STATE_NEW, thingId = {male=974,female=975}, addon = 3, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON, price = 50, icons = {"Outfit_Retro_Citizen_Male.png", "Outfit_Retro_Citizen_Female.png"}},
			{name = "Entrepreneur Addon", thingId = {male=472,female=471}, addon = 3, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON, price = 20, icons = {"Outfits_Entrepreneur1.png", "Outfits_Entrepreneur2.png"}},
			{name = "Champion Addon", thingId = {male=633,female=632}, addon = 3, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON, price = 20, icons = {"Outfits_Champion1.png", "Outfits_Champion2.png"}},
			{name = "Conjurer Addon", thingId = {male=634,female=635}, addon = 3, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON, price = 20, icons = {"Outfits_Conjurer1.png", "Outfits_Conjurer2.png"}},
			{name = "Beastmaster Addon", thingId = {male=637,female=636}, addon = 3, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON, price = 20, icons = {"Outfits_Beastmaster1.png", "Outfits_Beastmaster2.png"}},
			{name = "Chaos Acolyte Addon", thingId = {male=665,female=664}, addon = 3, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON, price = 20, icons = {"Outfits_Chaos_Acolyte_1.png", "Outfits_Chaos_Acolyte_2.png"}},
			{name = "Death Herald Addon", thingId = {male=667,female=666}, addon = 3, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON, price = 20, icons = {"Outfits_Death_Herald_1.png", "Outfits_Death_Herald_2.png"}},
			{name = "Ranger Addon", thingId = {male=684,female=683}, addon = 3, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON, price = 20, icons = {"Outfits_Ranger1.png", "Outfits_Ranger2.png"}},
			{name = "Ceremonial Garb Addon", thingId = {male=695,female=694}, addon = 3, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON, price = 20, icons = {"Outfits_Ceremonial_Garb_1.png", "Outfits_Ceremonial_Garb_2.png"}},
			{name = "Puppeteer Addon", thingId = {male=697,female=696}, addon = 3, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON, price = 20, icons = {"Outfits_Product_Outfit_Puppeteer_Male_Addon1.png", "Outfits_Product_Outfit_Puppeteer_Male_Addon2.png"}},
			{name = "Spirit Caller Addon", thingId = {male=699,female=698}, addon = 3, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON, price = 20, icons = {"Outfits_Product_Outfit_SpiritCaller_Male_Addon1.png", "Outfits_Product_Outfit_SpiritCaller_Male_Addon2.png"}},
			{name = "Evoker Addon", thingId = {male=725,female=724}, addon = 3, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON, price = 20, icons = {"Outfits_Evoker1.png", "Outfits_Evoker2.png"}},
			{name = "Seaweaver Addon", thingId = {male=733,female=732}, addon = 3, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON, price = 20, icons = {"Outfits_Seaweaver1.png", "Outfits_Seaweaver2.png"}},
			{name = "Sea Dog Addon", thingId = {male=750,female=749}, addon = 3, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON, price = 20, icons = {"Product_Outfit_SeaDog_Male_Addon1.png", "Product_Outfit_SeaDog_Male_Addon2.png"}},
			{name = "Royal Pumpkin Addon", thingId = {male=760,female=759}, addon = 3, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON, price = 20, icons = {"Outfits_Royal_Pumpkin_Male_1.png", "Outfits_Royal_Pumpkin_Male_2.png"}},
			{name = "Winter Warden Addon", thingId = {male=853,female=852}, addon = 3, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON, price = 20, icons = {"Product_Outfit_WinterWarden_Male_Addon1.png", "Product_Outfit_WinterWarden_Male_Addon2.png"}},
			{name = "Philosopher Addon", thingId = {male=874,female=873}, addon = 3, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON, price = 20, icons = {"Outfit_Philosopher_Male_Addon_3.png", "Outfit_Philosopher_Female_Addon_3.png"}},
			{name = "Arena Champion Addon", thingId = {male=884,female=885}, addon = 3, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON, price = 20, icons = {"Outfit_Arena_Champion_Male_Addon_3.png", "Outfit_Arena_Champion_Female_Addon_3.png"}},
			{name = "Pharaoh Addon", thingId = {male=955,female=956}, addon = 3, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON, price = 20, icons = {"Outfit_Pharaoh_Male_Addon_3.png", "Outfit_Pharaoh_Female_Addon_3.png"}},
			{name = "Trophy Hunter Addon", thingId = {male=957,female=958}, addon = 3, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON, price = 20, icons = {"Outfit_Trophy_Hunter_Male_Addon_3.png", "Outfit_Trophy_Hunter_Female_Addon_3.png"}},			
		}
	},	
{	name = "Items Especiais",
	state = GameStore.States.STATE_NEW,
	rookgaard = true,
	icons = {"CustomItems.png"},
	offers = {
		{name = "Relembra Boots", state = GameStore.States.STATE_NEW, thingId = 27871, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_ITEM, price = 25, icons = {"relembra_boots.png"}, description = "15 HP/s | 30 MP/s | Speed +50"},
		{name = "Skull Remover", state = GameStore.States.STATE_NEW, thingId = 11144, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_ITEM, price = 10, icons = {"CustomItems_RemoverSkull.png"}, description = "Use to remove red and black skull."},
		{name = "Refill Stamina", state = GameStore.States.STATE_NEW, thingId = 12544, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_ITEM, price = 10, icons = {"CustomItems_RefillStamina.png"}, description = "It will refill all stamina."},
		{name = "Gold Pounch", state = GameStore.States.STATE_NEW, thingId = 26377, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_ITEM, price = 15, icons = {"Product_MagicCoinPurse.png"}, description="This item can't be moved from Store Inbox.\nYou can only put inside money.\nWarning: this item drop when you die red or black skull!"},
		{name = "Blood Herb", thingId = 2798, count = 10, type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE, price = 7, icons = {"BloodHerb.png"}, description = "Become rich!"}
	    }
    },
--{	name = "Helmets",
--		state = GameStore.States.STATE_NONE,
--		rookgaard = true,
--		icons = {"Helmet_DemonHelmet.png"},
--		offers = {
--		{name = "Depth Galea", thingId = 15651, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_ITEM, price = 4, icons = {"Helmet_Depthgalea.png"}, description = "You see a depth galea (Arm:8, protection drown +100%)."},
--		{name = "Elite Draken Helmet", thingId = 12645, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_ITEM, price = 5, icons = {"Helmet_Elitedrakenhelmet.png"}, description = "You see a elite draken helmet (Arm:9, distance fighting +1, protection death +3%)."},
--		{name = "Gill Gugel", thingId = 18398, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_ITEM, price = 4, icons = {"Helmet_Gill_Gugel.png"}, description = "You see a gill gugel (Arm:5, magic level +2, protection earth +6%, fire -6%)."},
--		--{name = "Golden Helmet", thingId = 2471, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_ITEM, price = 12, icons = {"Helmet_Golden_Helmet.png"}, description = "You see a golden helmet (Arm:12)."},
--		{name = "Prismatic Helmet", thingId = 18403, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_ITEM, price = 5, icons = {"Helmet_PrismaticHelmet.png"}, description = "You see a prismatic helmet (Arm:9, shielding +1, protection physical +5%)."},
--		{name = "Werewolf Helmet", thingId = 24718, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_ITEM, price = 6, icons = {"Helmet_WerewolfHelmet.png"}, description = "You see a werewolf helmet (Arm:9, speed +15)."},
--		{name = "Yalahari mask", thingId = 9778, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_ITEM, price = 4, icons = {"Helmet_YalahariMask.png"}, description = "You see a yalahari mask (Arm:5, magic level +2)."}		
--		}
--	},
--{	name = "Armors",
--		state = GameStore.States.STATE_NONE,
--		rookgaard = true,
--		icons = {"Armor_DemonArmor.png"},
--		offers = {
--		{name = "Demon Armor", thingId = 2494, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_ITEM, price = 4, icons = {"Armor_DemonArmor.png"}, description = "You see a demon armor (Arm:16)."},
--		{name = "Earthborn titan armor", thingId = 8882, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_ITEM, price = 8, icons = {"Armor_EarthbornTitanArmor.png"}, description = "You see an earthborn titan armor (Arm:15, axe fighting +2, protection earth +5%, fire -5%)."},
--		{name = "Windborn colossus armor", thingId = 8883, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_ITEM, price = 8, icons = {"Armor_Windborncolossusarmor.png"}, description = "You see a windborn colossus armor (Arm:15, club fighting +2, protection energy +5%, earth -5%)."},
--		{name = "Fireborn giant armor", thingId = 8881, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_ITEM, price = 8, icons = {"Armor_Fireborngiantarmor.png"}, description = "You see a fireborn giant armor (Arm:15, sword fighting +2, protection fire +5%, ice -5%)."},
--		{name = "Master archer's armor", thingId = 8888, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_ITEM, price = 6, icons = {"Armor_MasterArchersArmor.png"}, description = "You see a master archer's armor (Arm:15, distance fighting +3)."},
--		{name = "Royal draken mail", thingId = 12642, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_ITEM, price = 6, icons = {"Armor_RoyalDrakenMail.png"}, description = "You see a royal draken mail (Arm:16, shielding +3, protection physical +5%)."},
--		{name = "Gill coat", thingId = 18399, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_ITEM, price = 6, icons = {"Armor_Gill_Coat2.png"}, description = "You see a gill coat (Arm:12, magic level +1, protection earth +10%, fire -10%)."},
--		{name = "Royal scale robe", thingId = 12643, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_ITEM, price = 6, icons = {"Armor_Royalscalerobe.png"}, description = "You see a royal scale robe (Arm:12, magic level +2, protection fire +5%)."},
--		{name = "Prismatic Armor", thingId = 18404, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_ITEM, price = 6, icons = {"Armor_PrismaticArmor.png"}, description = "You see a prismatic armor (Arm:15, protection physical +5%, speed +15)."},
--		{name = "Depth Lorica", thingId = 15407, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_ITEM, price = 10, icons = {"Armor_DepthLorica.png"}, description = "You see a depth lorica (Arm:16, distance fighting +3, protection death +5%)."},
--		{name = "Furious frock", thingId = 21725, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_ITEM, price = 10, icons = {"Armor_FuriousFrock.png"}, description = "You see a furious frock (Arm:12, magic level +2, protection fire +5%)."},
--		{name = "Ornate chestplate", thingId = 15406, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_ITEM, price = 10, icons = {"Armor_Ornatechestplate.png"}, description = "You see an ornate chestplate (Arm:16, shielding +3, protection physical +8%)."}		
--		}
--	},
--{	name = "Legs",
--		state = GameStore.States.STATE_NONE,
--		rookgaard = true,
--		icons = {"Legs_DemonLegs.png"},
--		offers = {
--		{name = "Demon Legs", thingId = 2495, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_ITEM, price = 5, icons = {"Legs_DemonLegs.png"}, description = "You see demon legs (Arm:9). It weighs 70.00 oz."},
--		{name = "Grasshopper legs", thingId = 15490, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_ITEM, price = 5, icons = {"Grasshopper_Legs.png"}, description = "You see a grasshopper legs (Arm:7, speed +10). It can only be wielded properly by players of level 75 or higher. It weighs 32.00 oz."},
--		{name = "Depth Ocrea", thingId = 15409, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_ITEM, price = 6, icons = {"Legs_DepthOcrea.png"}, description = "You see a depth ocrea (Arm:8, protection manadrain +15%). It can only be wielded properly by sorcerers and druids. It weighs 48.00 oz."},
--		{name = "Prismatic Legs", thingId = 18405, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_ITEM, price = 6, icons = {"Legs_PrismaticLegs.png"}, description = "You see prismatic legs (Arm:8, distance fighting +2, protection physical +3%). It can only be wielded properly by paladins of level 150 or higher. It weighs 10.00 oz."},
--		{name = "Gill Legs", thingId = 18400, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_ITEM, price = 7, icons = {"Gill_Legs.png"}, description = "You see a gill legs (Arm:7, magic level +1, protection earth +8%, fire -8%). It can only be wielded properly by sorcerers and druids of level 150 or higher. It weighs 28.00 oz."},
--		{name = "Ornate legs", thingId = 15412, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_ITEM, price = 7, icons = {"Legs_Ornatelegs.png"}, description = "You see an ornate legs (Arm:8, protection physical +5%). It can only be wielded properly by knights of level 185 or higher. It weighs 77.00 oz."},
--		{name = "Dwarven legs", thingId = 2504, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_ITEM, price = 7, icons = {"Legs_Dwarvenlegs.png"}, description = "You see dwarven legs (Arm:7, protection physical +3%). It weighs 49.00 oz."},
--		{name = "Icy Culottes", thingId = 21700, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_ITEM, price = 10, icons = {"Legs_IcyCulottes.png"}, description = "You see a icy culottes (Arm:8, protection ice +8%). It can only be wielded properly by sorcerers and druids. It weighs 15.00 oz."}
--        }
--	},
--{	name = "Boots",
--		state = GameStore.States.STATE_NONE,
--		rookgaard = true,
--		icons = {"Boots_MasterBoots.png"},
--		offers = {
--		--{name = "Golden Boots", thingId = 2646, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_ITEM, price = 8, icons = {"Boots_GoldenBoots.png"}, description = "You see golden boots (Arm:4). It weighs 31.00 oz."},
--		{name = "Relembra Boots", thingId = 27871, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_ITEM, price = 25, icons = {"relembra_boots.png"}, description = "15 HP/s | 30 MP/s | Speed +20"}
--       }
--	},
--{	name = "Shields",
--		state = GameStore.States.STATE_NONE,
--		rookgaard = true,
--		icons = {"Shield_DemonShield.png"},
--		offers = {
--		{name = "Depth scutum", thingId = 15411, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_ITEM, price = 5, icons = {"Depth_Scutum.png"}, description = "Def: 25, magic level +2. It can only be wielded properly by sorcerers and druids of level 120 or higher. It weighs 30.00 oz. Imbuement Slots: 1."},
--		{name = "Shield of corruption", thingId = 12644, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_ITEM, price = 7, icons = {"Shield_ShieldofCorruption.png"}, description = "You see a shield of corruption (Def:36, sword fighting +3). It can only be wielded properly by knights of level 80 or higher. It weighs 49.00 oz.."},
--		{name = "Ornate shield", thingId = 15413, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_ITEM, price = 7, icons = {"Ornate_Shield.png"}, description = "You see an ornate shield (Def:36, protection physical +5%). It can only be wielded properly by knights of level 130 or higher. It weighs 71.00 oz."},
--		{name = "Prismatic shield", thingId = 18410, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_ITEM, price = 7, icons = {"Shield_PrismaticShield.png"}, description = "You see a prismatic shield (Def:37, shielding +2, protection physical +4%). It can only be wielded properly by knights of level 150 or higher. It weighs 72.00 oz."},
--		{name = "Spellbook of vigilance", thingId = 18401, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_ITEM, price = 7, icons = {"Spellbook_of_Vigilance.png"}, description = "You see a spellbook of vigilance (Def:20, magic level +3, protection earth +3%, fire -3%). It can only be wielded properly by sorcerers and druids of level 130 or higher. It weighs 27.00 oz."},
--		{name = "Great shield", thingId = 2522, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_ITEM, price = 13, icons = {"Great_Shield.png"}, description = "You see a great shield (Def:38). It weighs 84.00 oz."},
--		{name = "Blessed shield", thingId = 2523, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_ITEM, price = 13, icons = {"Shield_Blessed_Shield.png"}, description = "You see a blessed shield (Def:40). It weighs 68.00 oz."}
--       }
--	},	
--{	name = "House Equipments",
--		state = GameStore.States.STATE_NEW,
--		rookgaard = true,
--		icons = {"Category_House.png"},
--		offers = {
--	    --Item Example : thingId = itemId
--			{name = "Magnificent Cabinet", thingId = 26075, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_HOUSE, price = 3, icons = {"MagnificantCabinet.png"}, description = "Become rich! Decoration Kit It weighs 0.00 oz. Unwrap it in your own house to create a Decoration!"},
--			{name = "Magnificent Chair", thingId = 26062, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_HOUSE, price = 2, icons = {"Product_HouseEquipment_BaroqueFurniture_Chair.png"}, description = "Become rich! Decoration Kit It weighs 0.00 oz. Unwrap it in your own house to create a Decoration!"},
--			{name = "Magnificent Trunk", thingId = 26086, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_HOUSE, price = 2, icons = {"Product_HouseEquipment_BaroqueFurniture_Chest.png"}, description = "Become rich! Decoration Kit It weighs 0.00 oz. Unwrap it in your own house to create a Decoration!"},
--			{name = "Magnificent Table", thingId = 26074, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_HOUSE, price = 3, icons = {"Product_HouseEquipment_BaroqueFurniture_Table.png"}, description = "Become rich! Decoration Kit It weighs 0.00 oz. Unwrap it in your own house to create a Decoration!"},
--			{name = "Ferocious Cabinet", thingId = 26078, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_HOUSE, price = 5, icons = {"Product_HouseEquipment_TortureChamberFurniture_Cabinet.png"}, description = "Become rich! Decoration Kit It weighs 0.00 oz. Unwrap it in your own house to create a Decoration!"},
--			{name = "Ferocious Chair", thingId = 26066, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_HOUSE, price = 7, icons = {"Product_HouseEquipment_TortureChamberFurniture_Chair.png"}, description = "Become rich! Decoration Kit It weighs 0.00 oz. Unwrap it in your own house to create a Decoration!"},
--			{name = "Ferocious Trunk", thingId = 26082, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_HOUSE, price = 4, icons = {"Product_HouseEquipment_TortureChamberFurniture_Chest.png"}, description = "Become rich! Decoration Kit It weighs 0.00 oz. Unwrap it in your own house to create a Decoration!"},
--			{name = "Ferocious Table", thingId = 26070, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_HOUSE, price = 2, icons = {"Product_HouseEquipment_TortureChamberFurniture_Table.png"}, description = "Become rich! Decoration Kit It weighs 0.00 oz. Unwrap it in your own house to create a Decoration!"},
--			{name = "Rustic Cabinet", thingId = 26357, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_HOUSE, price = 5, icons = {"Product_HouseEquipment_RusticFurniture_Cabinet.png"}, description = "Become rich! Decoration Kit It weighs 0.00 oz. Unwrap it in your own house to create a Decoration!"},
--			{name = "Rustic Chair", thingId = 26352, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_HOUSE, price = 2, icons = {"Product_HouseEquipment_RusticFurniture_Chair.png"}, description = "Become rich! Decoration Kit It weighs 0.00 oz. Unwrap it in your own house to create a Decoration!"},
--			{name = "Rustic Trunk", thingId = 26362, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_HOUSE, price = 4, icons = {"Product_HouseEquipment_RusticFurniture_Chest.png"}, description = "Become rich! Decoration Kit It weighs 0.00 oz. Unwrap it in your own house to create a Decoration!"},
--			{name = "Rustic Table", thingId = 26355, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_HOUSE, price = 2, icons = {"Product_HouseEquipment_RusticFurniture_Table.png"}, description = "Become rich! Decoration Kit It weighs 0.00 oz. Unwrap it in your own house to create a Decoration!"},
--			{name = "Yalaharian Carpet", thingId = 26109, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_HOUSE, price = 1, icons = {"Product_HouseEquipment_Carpet1.png"}, description = "Become rich! Decoration Kit It weighs 0.00 oz. Unwrap it in your own house to create a Decoration!"},
--			{name = "White Fur Carpet", thingId = 26110, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_HOUSE, price = 1, icons = {"Product_HouseEquipment_Carpet2.png"}, description = "Become rich! Decoration Kit It weighs 0.00 oz. Unwrap it in your own house to create a Decoration!"},
--			{name = "Bamboo Mat", thingId = 26111, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_HOUSE, price = 1, icons = {"Product_HouseEquipment_Carpet3.png"}, description = "Become rich! Decoration Kit It weighs 0.00 oz. Unwrap it in your own house to create a Decoration!"},
--			{name = "Crimson Carpet", thingId = 26371, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_HOUSE, price = 1, icons = {"Product_HouseEquipment_Carpet_04.png"}, description = "Become rich! Decoration Kit It weighs 0.00 oz. Unwrap it in your own house to create a Decoration!"},
--			{name = "Azure Carpet", thingId = 26372, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_HOUSE, price = 1, icons = {"Product_HouseEquipment_Carpet_05.png"}, description = "Become rich! Decoration Kit It weighs 0.00 oz. Unwrap it in your own house to create a Decoration!"},
--			{name = "Emerald Carpet", thingId = 26373, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_HOUSE, price = 1, icons = {"Product_HouseEquipment_Carpet_06.png"}, description = "Become rich! Decoration Kit It weighs 0.00 oz. Unwrap it in your own house to create a Decoration!"},
--			{name = "Light Parquet", thingId = 26374, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_HOUSE, price = 1, icons = {"Product_HouseEquipment_Carpet_07.png"}, description = "Become rich! Decoration Kit It weighs 0.00 oz. Unwrap it in your own house to create a Decoration!"},
--			{name = "Dark Parquet", thingId = 26375, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_HOUSE, price = 1, icons = {"Product_HouseEquipment_Carpet_08.png"}, description = "Become rich! Decoration Kit It weighs 0.00 oz. Unwrap it in your own house to create a Decoration!"},
--			{name = "Marble Parquet", thingId = 26376, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_HOUSE, price = 1, icons = {"Product_HouseEquipment_Carpet_09.png"}, description = "Become rich! Decoration Kit It weighs 0.00 oz. Unwrap it in your own house to create a Decoration!"},
--			{name = "Fish Tank", thingId = 26347, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_HOUSE, price = 3, icons = {"Product_HouseEquipment_Housepet_FishTank.png"}, description = "Become rich! Decoration Kit It weighs 0.00 oz. Unwrap it in your own house to create a Decoration!"},
--			{name = "Dog House", thingId = 26353, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_HOUSE, price = 3, icons = {"Product_HouseEquipment_Housepet_DogHouse.png"}, description = "Become rich! Decoration Kit It weighs 0.00 oz. Unwrap it in your own house to create a Decoration!"},
--			{name = "Baby Dragon", thingId = 26099, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_HOUSE, price = 5, icons = {"Product_HouseEquipment_Housepet_BabyDragon.png"}, description = "Become rich! Decoration Kit It weighs 0.00 oz. Unwrap it in your own house to create a Decoration!"},
--			{name = "Cat in a Basket", thingId = 26108, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_HOUSE, price = 3, icons = {"Product_HouseEquipment_Housepet_Cat.png"}, description = "Become rich! Decoration Kit It weighs 0.00 oz. Unwrap it in your own house to create a Decoration!"},
--			{name = "Hamster in a Wheel", thingId = 26101, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_HOUSE, price = 2, icons = {"Product_HouseEquipment_Housepet_Hamster.png"}, description = "Become rich! Decoration Kit It weighs 0.00 oz. Unwrap it in your own house to create a Decoration!"},
--	    	{name = "Protectress Lamp", thingId = 26097, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_HOUSE, price = 4, icons = {"Product_HouseEquipment_Lamp_Goddess.png"}, description = "Become rich! Decoration Kit It weighs 0.00 oz. Unwrap it in your own house to create a Decoration!"},
--			{name = "Predator Lamp", thingId = 26093, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_HOUSE, price = 3, icons = {"Product_HouseEquipment_Lamp_Leopard.png"}, description = "Become rich! Decoration Kit It weighs 0.00 oz. Unwrap it in your own house to create a Decoration!"},
--			{name = "Ornate Mailbox", thingId = 26058, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_HOUSE, price = 10, icons = {"Product_HouseEquipment_Mailbox_Golden.png"}, description = "Become rich! Decoration Kit It weighs 0.00 oz. Unwrap it in your own house to create a Decoration!"},
--			{name = "Royal Mailbox", thingId = 26056, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_HOUSE, price = 3, icons = {"Product_HouseEquipment_Mailbox_Standard.png"}, description = "Become rich! Decoration Kit It weighs 0.00 oz. Unwrap it in your own house to create a Decoration!"},
--			{name = "Lordly Tapestry", thingId = 26104, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_HOUSE, price = 2, icons = {"Product_HouseEquipment_Tapestry_01.png"}, description = "Become rich! Decoration Kit It weighs 0.00 oz. Unwrap it in your own house to create a Decoration!"},
--			{name = "Menacing Tapestry", thingId = 26105, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_HOUSE, price = 2, icons = {"Product_HouseEquipment_Tapestry_02.png"}, description = "Become rich! Decoration Kit It weighs 0.00 oz. Unwrap it in your own house to create a Decoration!"},
--		    {name = "AllSeeing Tapestry", thingId = 26106, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_HOUSE, price = 3, icons = {"Product_HouseEquipment_Tapestry_03.png"}, description = "Become rich! Decoration Kit It weighs 0.00 oz. Unwrap it in your own house to create a Decoration!"},
--			{name = "Golden Dragon Tapestry", thingId = 26379, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_HOUSE, price = 3, icons = {"Product_HouseEquipment_Tapestry_04.png"}, description = "Become rich! Decoration Kit It weighs 0.00 oz. Unwrap it in your own house to create a Decoration!"},
--			{name = "Sword Tapestry", thingId = 26380, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_HOUSE, price = 5, icons = {"Product_HouseEquipment_Tapestry_05.png"}, description = "Become rich! Decoration Kit It weighs 0.00 oz. Unwrap it in your own house to create a Decoration!"},
--			{name = "Brocade Tapestry", thingId = 26381, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_HOUSE, price = 2, icons = {"Product_HouseEquipment_Tapestry_06.png"}, description = "Become rich! Decoration Kit It weighs 0.00 oz. Unwrap it in your own house to create a Decoration!"},
--		}
--	},
--{	name = "Sorcerer Weapons",
--		state = GameStore.States.STATE_NONE,
--		rookgaard = true,
--		icons = {"Category_Sorc2.png"},
--		offers = {
--			{name = "Wand of Defiance", thingId = 18390, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_ITEM, price = 5, icons = {"Wand_WandofDefiance.png"}, description = "You see a wand of defiance (magic level +1)."},
--			{name = "Wand of Everblazing", thingId = 18409, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_ITEM, price = 5, icons = {"Wand_WandofEverblazing.png"}, description = "You see a wand of everblazing (magic level +1)."},
--		}
--	},
--{	name = "Knight Weapons",
--		state = GameStore.States.STATE_NONE,
--		rookgaard = true,
--		icons = {"Catergory_Knight3.png"},
--		offers = {
--			-- Item Example : thingId = itemId
--			{name = "Shiny Blade", thingId = 18465, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_ITEM, price = 5, icons = {"Sword_ShinyBlade.png"}, description = "You see a shiny blade (Atk:50, Def:35 +3, sword fighting +1)."},
--			{name = "Mycological Mace", thingId = 18452, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_ITEM, price = 6, icons = {"Rod_MycologicalMace.png"}, description = "You see a shiny blade (Atk:50, Def:35 +3, sword fighting +1)."},
--			{name = "Crystalline Axe", thingId = 18451, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_ITEM, price = 6, icons = {"Axe_CrystallineAxe.png"}, description = "You see a crystalline axe (Atk:51, Def:29 +3, axe fighting +1)."},
--		}
--	},
--{	name = "Paladin Weapons",
--		state = GameStore.States.STATE_NONE,
--		rookgaard = true,
--		icons = {"Category_Pally2.png"},
--		offers = {
--			-- Item Example : thingId = itemId
--			{name = "Rift Bow", thingId = 25522, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_ITEM, price = 5, icons = {"rift_bow.png"}, description = "(Range: 6, Atk +4, Hit% +3).\nIt can only be wielded properly by paladins of level 90 or higher.\nIt weighs 84.00 oz."},
--			{name = "Thorn Spitter", thingId = 16111, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_ITEM, price = 6, icons = {"Thorn_Spitter.png"}, description = "(Range: 6, Atk +2, Hit% +5).\nIt can only be wielded properly by paladins of level 85 or higher.\nIt weighs 46.00 oz."}
--		}
--	},
--{	name = "Druid Weapons",
--		state = GameStore.States.STATE_NONE,
--		rookgaard = true,
--		icons = {"Category_Druid2.png"},
--		offers = {
--			-- Item Example : thingId = itemId
--			{name = "Glacial Rod", thingId = 18412, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_ITEM, price = 5, icons = {"Rod_Glacialrod.png"}, description = "Become rich!"},
--			{name = "Muck Rod", thingId = 18411, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_ITEM, price = 5, icons = {"Rod_Muck_Rod.png"}, description = "Become rich!"},
--		}
--	},
{	name = "Extra Services",
		state = GameStore.States.STATE_NEW,
		rookgaard = true,
		icons = {"Category_ExtraServices.png"},
		offers = {
			-- Promoção de 30%. (arredonda ex: 210 => 200)
			-- Change Name 500 coins | Sex Change 125 (original) | XP Boost 125 (original)
			-- NameChange example
			--{name = "Character Name Change", basePrice = 20, state = GameStore.States.STATE_SALE, validUntil = 28, type = GameStore.OfferTypes.OFFER_TYPE_NAMECHANGE, price = 15, icons = {"Product_CharacterNameChange.png"}},
			-- Sexchange example
			{name = "Character Sex Change", basePrice = 10, state = GameStore.States.STATE_SALE, validUntil = 28, type = GameStore.OfferTypes.OFFER_TYPE_SEXCHANGE, price = 7, icons = {"Product_CharacterSexChange.png"}},
			{name = "Prey Bonus Reroll", state = GameStore.States.STATE_NEW, count = 1, type = GameStore.OfferTypes.OFFER_TYPE_PREYBONUS, price = 1, icons = {"Product_UsefulThings_PreyBonusReroll.png"}},
			{name = "5x Prey Bonus Reroll", state = GameStore.States.STATE_NEW, count = 5, type = GameStore.OfferTypes.OFFER_TYPE_PREYBONUS, price = 4, icons = {"Product_UsefulThings_PreyBonusReroll.png"}},
			{name = "Permanent Prey Slot", state = GameStore.States.STATE_NEW, type = GameStore.OfferTypes.OFFER_TYPE_PREYSLOT, price = 20, icons = {"Product_UsefulThings_PermanentPreySlot.png"}},
		    {name = "XP Boost 25% for 10 hours", state = GameStore.States.STATE_NEW, type = GameStore.OfferTypes.OFFER_TYPE_EXPBOOST, price = 12, icons = {"xpboost.png"}, description="25% XP Boost for 10 hours!"},
			--{name = "Temple Teleport", type = GameStore.OfferTypes.OFFER_TYPE_TEMPLE, price = 1, icons = {"Product_Transportation_TempleTeleport.png"}},
			-- Promotion example
			-- {name = "First Promotion", thingId = 1--[[ed/ms/rp/ek]], type = GameStore.OfferTypes.OFFER_TYPE_PROMOTION, price = 1, icons = {"Product_FirstPromotion.png"}}
		}
	},
}

-- For Explanation and information
-- view the readme.md file in github or via markdown viewer.

-- Non-Editable
local runningId = 1
for k, category in ipairs(GameStore.Categories) do
	if category.offers then
		for m, offer in ipairs(category.offers) do
			offer.id = runningId
			runningId = runningId + 1
			
			if not offer.type then
				offer.type = GameStore.OfferTypes.OFFER_TYPE_NONE
			end
		end
	end
end