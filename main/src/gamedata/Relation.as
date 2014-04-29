package gamedata
{
	import consts.ModuleName;
	import consts.PannelName;
	import consts.SceneConst;
	
	import flash.utils.Dictionary;

	/**
	 *关系体系 
	 * @author Administrator
	 * 
	 */	
	public class Relation
	{
		private static var _instance:Relation;
		
		public var moduleRelation:Dictionary;
		public var sceneRelation:Object;
		public function Relation()
		{
		}
		
		public static function getInstance():Relation
		{
			if(_instance == null)
			{
				_instance = new Relation();
			}
			
			return _instance;
		}
		
		//注册
		public function register():void
		{
			this.registerModuleRelation();
			this.registerSceneRelation();
		}
		
		private function registerModuleRelation():void
		{
			this.moduleRelation = new Dictionary();
			
			this.moduleRelation[[PannelName.spUserInfo, PannelName.spGiftMenu, PannelName.spSystemMenu, PannelName.spMenu, PannelName.spLevel, PannelName.ppSystem, PannelName.ppConsumerTips, PannelName.ppConfirmMenuBtnPannel, PannelName.ppCDkeyGiftBagPannel, PannelName.spTextHyperlink, PannelName.spEquipTips]] = ModuleName.UIModule;
			this.moduleRelation[[PannelName.spChatroom, PannelName.ppHornPannel, PannelName.spMarquee, PannelName.spNotice, PannelName.ppGmPannel]] = ModuleName.ChatModule;
			this.moduleRelation[[PannelName.spTask, PannelName.ppTask, PannelName.ppTaskDialog, PannelName.ppTaskOpenTown, PannelName.ppDialogMcPannel]] = ModuleName.TaskModule;
			this.moduleRelation[[PannelName.fsTown]] = ModuleName.TownModule;
			this.moduleRelation[[PannelName.fsWorld]] = ModuleName.WorldModule;
			this.moduleRelation[[PannelName.fsPkMatch]] = ModuleName.PkModule;
			this.moduleRelation[[PannelName.fsFight, PannelName.spFightAssist]] = ModuleName.FightModule;
			this.moduleRelation[[PannelName.ppDemon, PannelName.ppDemonUp, PannelName.ppDemonBuy]] = ModuleName.DemonFinalModule;
			this.moduleRelation[[PannelName.ppGems]] = ModuleName.GemsModule;
			this.moduleRelation[[PannelName.ppRole, PannelName.ppRoleDetail]] = ModuleName.RoleModule;
			this.moduleRelation[[PannelName.ppAstrolabe, PannelName.ppAstrolabeExp, PannelName.ppbuyStone]] = ModuleName.AstrolabeModule;
			this.moduleRelation[[PannelName.ppSmithy]] = ModuleName.SmithyModule;
			this.moduleRelation[[PannelName.ppFoster]] = ModuleName.FosterModule;
			this.moduleRelation[[PannelName.ppRank]] = ModuleName.RankModule;
			this.moduleRelation[[PannelName.ppVip]] = ModuleName.VipModule;
			this.moduleRelation[[PannelName.ppWingPannel, PannelName.ppWingPreviewPannel]] = ModuleName.WingModule;
			this.moduleRelation[[PannelName.ppPowerGuide]] = ModuleName.PowerGuideModule;
			this.moduleRelation[[PannelName.fsCreateUser]] = ModuleName.CreateUserModule;
			this.moduleRelation[[PannelName.ppTeam, PannelName.ppTeamRoom, PannelName.ppTeamHall, PannelName.ppTeamRoomMem]] = ModuleName.TeamModule;
			this.moduleRelation[[PannelName.ppFriend, PannelName.ppAddFriend, PannelName.ppSearchFriend, PannelName.ppRecommendFriend, PannelName.ppSearchFriendList, PannelName.spBlessing, PannelName.ppFriendsBlessing]] = ModuleName.FriendModule;
			this.moduleRelation[[PannelName.ppCopy, PannelName.ppCopyElite, PannelName.ppCopyDevil, PannelName.ppCopyInfo, PannelName.ppAutoCopy, PannelName.ppCopyTest, PannelName.ppCopyLottery_new, PannelName.ppFightSuccess, PannelName.ppFightLose, PannelName.ppFightNormalRewardSuccess]] = ModuleName.CopyModule;
			this.moduleRelation[[PannelName.ppBag]] = ModuleName.BagsModule;
			this.moduleRelation[[PannelName.ppShop]] = ModuleName.ShopModule;
			this.moduleRelation[[PannelName.ppTalismanEquip, PannelName.ppTalismanStren, PannelName.ppTalismanEnchant]] = ModuleName.TalismanModule;
			this.moduleRelation[[PannelName.ppDemonAtals]] = ModuleName.DemonAtlas;
			this.moduleRelation[[PannelName.ppBaguaWorkshopWindow]] = ModuleName.BaguaWorkshopModule;
			this.moduleRelation[[PannelName.ppAchieve, PannelName.spAchieveStageIcon]] = ModuleName.AchieveModule;
			this.moduleRelation[[PannelName.ppDemon, PannelName.ppDemonUp, PannelName.ppDemonBuy]] = ModuleName.DemonFinalModule;
			this.moduleRelation[[PannelName.ppSkill]] = ModuleName.SkillModule;
			this.moduleRelation[[PannelName.ppDailyTask]] = ModuleName.DailyTaskModule;
			this.moduleRelation[[PannelName.ppDragonPalace]] = ModuleName.DragonPalaceModule;
			this.moduleRelation[[PannelName.ppWorldBoss]] = ModuleName.WorldBossModule;
			this.moduleRelation[[PannelName.ppMail]] = ModuleName.MailModule;
			this.moduleRelation[[PannelName.ppGuild, PannelName.ppGuildListPannel, PannelName.ppRankBattleGuild, PannelName.ppRankBattleLastRankGuild]] = ModuleName.GuildModule;
			this.moduleRelation[[PannelName.fsArena, PannelName.ppArenaReward]] = ModuleName.ArenaModule;
			this.moduleRelation[[PannelName.fsXFight]] = ModuleName.XFightModule;
			this.moduleRelation[[PannelName.fsGuildLink]] = ModuleName.guildLinkModule;
			this.moduleRelation[[PannelName.spAntiAddict]] = ModuleName.AntiaddictModule;
			this.moduleRelation[[PannelName.ppFirstRecharge]] = ModuleName.FirstRechargeModule;
			this.moduleRelation[[PannelName.ppVipRecharge]] = ModuleName.VipRechargeModule;
			this.moduleRelation[[PannelName.ppOnlineReward]] = ModuleName.OnlineRewardModule;
			this.moduleRelation[[PannelName.ppOpenServer]] = ModuleName.OpenServerModule;
			this.moduleRelation[[PannelName.ppMammon]] = ModuleName.MammonModule;
			this.moduleRelation[[PannelName.ppMoneyTree]] = ModuleName.MoneyTreeModule;
			this.moduleRelation[[PannelName.ppSign]] = ModuleName.SignModule;
			this.moduleRelation[[PannelName.ppCumRecharge]] = ModuleName.CumRechargeModule;
			this.moduleRelation[[PannelName.ppOpenSign]] = ModuleName.OpenSignModule;
			this.moduleRelation[[PannelName.ppRechargeBack]] = ModuleName.RechargeBackModule;
			this.moduleRelation[[PannelName.ppGuideMotionPannel, PannelName.fsGuideDialogScene, PannelName.ppGuidePannel, PannelName.ppGuideSkillLearned, PannelName.ppGuideFightLeading, PannelName.ppGuideFightComboLeading, PannelName.ppGuideFightLeading_ws, PannelName.ppGuideFightLeading_demon]] = ModuleName.GuideModule;
			this.moduleRelation[[PannelName.ppActive]] = ModuleName.ActiveModule;
			this.moduleRelation[[PannelName.ppLanderPannel]] = ModuleName.LanderModule;
			this.moduleRelation[[PannelName.ppActCumLogInPannel]] = ModuleName.ActCumLogInModule;
			this.moduleRelation[[PannelName.ppFPRewardPanel]] = ModuleName.FP_RewardModule;
		}
		
		//注册场景关系
		private function registerSceneRelation():void
		{
			this.sceneRelation = new Object();
			this.sceneRelation[SceneConst.createScene] = [];
			this.sceneRelation[SceneConst.townScene] = [PannelName.spUserInfo, PannelName.spGiftMenu, PannelName.spSystemMenu, PannelName.spMenu, PannelName.spLevel, PannelName.spChatroom, PannelName.spTask, PannelName.spBlessing, PannelName.spAntiAddict, PannelName.spAchieveStageIcon, PannelName.spMarquee, PannelName.spNotice, PannelName.spTextHyperlink, PannelName.spEquipTips];
			this.sceneRelation[SceneConst.worldScene] = [PannelName.spMarquee];
			this.sceneRelation[SceneConst.fightScene] = [PannelName.spFightAssist, PannelName.spChatroom, PannelName.spMarquee];
			this.sceneRelation[SceneConst.gemsScene] = [PannelName.spChatroom, PannelName.spMarquee];
			this.sceneRelation[SceneConst.arenaScene] = [PannelName.spMarquee];
			this.sceneRelation[SceneConst.guildLinkScene] = [PannelName.spMarquee];
			this.sceneRelation[SceneConst.guideDialogScene] = [PannelName.spMarquee];
			this.sceneRelation[SceneConst.pkMatchScene] = [PannelName.spChatroom, PannelName.spMarquee];
			this.sceneRelation[SceneConst.xfightScene] = [PannelName.spUserInfo];
		}
		
		/**
		 * 通过PannelName 获取模块名
		 * @param pannelName
		 * @return 
		 * 
		 */		
		public function getModuleNameByPannel(pannelName:String):String
		{
			var pNames:*;
			for (pNames in this.moduleRelation) {
				if ((pNames as Array).indexOf(pannelName) != -1){
					return (this.moduleRelation[pNames]);
				}
			}
			return null;
		}
		
		
	}
}