function Client_PresentMenuUI(rootParent, setMaxSize, setScrollable, game)
	root = rootParent;
	if (game.Us ~= nil and Mod.Settings.JustSpectator) then
		vert = UI.CreateVerticalLayoutGroup(rootParent);
		UI.CreateLabel(vert).SetText("Just spectators can view the data");
		return;
	end
	if(Mod.PublicGameData.Daten == nil)then
		vert = UI.CreateVerticalLayoutGroup(rootParent);
		UI.CreateLabel(vert).SetText("During distribution no data is available");
		return;
	end
	setMaxSize(400,400);
	returnvalue = Mod.PublicGameData.Daten;
			AddLine("Neutral");
			AddLine("Owned Territories : " .. returnvalue[WL.PlayerID.Neutral].Numberofterritories);
			AddLine("Owned Armies : " .. returnvalue[WL.PlayerID.Neutral].NumberofArmies);
			AddLine("");
			for _,pid in pairs(game.Game.Players)do
				if(game.Game.PlayingPlayers[pid.ID] ~= nil)then
					AddLine(pid.DisplayName(nil, false));
					ShowData(returnvalue[pid.ID]);
				else
					AddLine(pid.DisplayName(nil, false));
					AddLine("Eliminated");
					AddLine("");
				end
			end
end
function ShowData(data)
	AddLine("Owned Territories : " .. data.Numberofterritories);
	AddLine("Owned Bonuses : " .. data.Numberofbonuses);
	AddLine("Owned Armies : " .. data.NumberofArmies);
	AddLine("Income : " .. data.Income);
	AddLine("");
end
function AddLine(content)
	local horz = UI.CreateHorizontalLayoutGroup(root);
	UI.CreateLabel(horz).SetText(content);
end
