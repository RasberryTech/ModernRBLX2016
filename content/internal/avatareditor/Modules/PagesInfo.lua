--

--todo: camera cframes not implemented
local armsCFrame = CFrame.new(13.0793343, 4.29243708, -25.925909, -0.927571893, 0.164386064, -0.335540771, -0, 0.898020923, 0.439952821, 0.373644739, 0.408087879, -0.832978964)

local recentPage = {name = 'Recent',
	iconImage = 'rbxasset://textures/AvatarEditorIcons/PageIcons/Category/ic-all.png',
	iconImageSelected = 'rbxasset://textures/AvatarEditorIcons/PageIcons/Category/ic-all-on.png',
}
local outfitsPage = {name = 'Outfits',			--outfits will include packages in some way
	iconImage = 'rbxasset://textures/AvatarEditorIcons/ic-bundle.png',
	iconImageSelected = 'rbxasset://textures/AvatarEditorIcons/ic-bundle-white.png',
	--special = true,
	infiniteScrolling = true,
}
local hatsPage = {name = 'Hats',
	typeName = 'Hat',
	iconImage = 'rbxasset://textures/AvatarEditorIcons/ic-hat.png',
	iconImageSelected = 'rbxasset://textures/AvatarEditorIcons/ic-hat-white.png',
	infiniteScrolling = true,
}
local hairPage = {name = 'Hair',
	typeName = 'Hair Accessory',
	iconImage = 'rbxasset://textures/AvatarEditorIcons/PageIcons/Clothing/ic-hair.png',
	iconImageSelected = 'rbxasset://textures/AvatarEditorIcons/PageIcons/Clothing/ic-hair-on.png',
	infiniteScrolling = true,
}
local faceAccessoryPage = {name = 'Face Accessories',
	typeName = 'Face Accessory',
	iconImage = 'rbxasset://textures/AvatarEditorIcons/PageIcons/Clothing/ic-face.png',
	iconImageSelected = 'rbxasset://textures/AvatarEditorIcons/PageIcons/Clothing/ic-face-on.png',
	infiniteScrolling = true,
}
local neckAccessoryPage = {name = 'Neck Accessories',
	typeName = 'Neck Accessory',
	iconImage = 'rbxasset://textures/AvatarEditorIcons/PageIcons/Clothing/ic-neck.png',
	iconImageSelected = 'rbxasset://textures/AvatarEditorIcons/PageIcons/Clothing/ic-neck-on.png',
	infiniteScrolling = true,
}
local shoulderAccessoryPage = {name = 'Shoulder Accessories',
	typeName = 'Shoulder Accessory',
	iconImage = 'rbxasset://textures/AvatarEditorIcons/PageIcons/Clothing/ic-shoulder.png',
	iconImageSelected = 'rbxasset://textures/AvatarEditorIcons/PageIcons/Clothing/ic-shoulder-on.png',
	infiniteScrolling = true,
}
local frontAccessoryPage = {name = 'Front Accessories',
	typeName = 'Front Accessory',
	iconImage = 'rbxasset://textures/AvatarEditorIcons/PageIcons/Clothing/ic-front.png',
	iconImageSelected = 'rbxasset://textures/AvatarEditorIcons/PageIcons/Clothing/ic-front-on.png',
	infiniteScrolling = true,
}
local backAccessoryPage = {name = 'Back Accessories',
	typeName = 'Back Accessory',
	iconImage = 'rbxasset://textures/AvatarEditorIcons/PageIcons/Clothing/ic-back.png',
	iconImageSelected = 'rbxasset://textures/AvatarEditorIcons/PageIcons/Clothing/ic-back-on.png',
	infiniteScrolling = true,
}
local waistAccessoryPage = {name = 'Waist Accessories',
	typeName = 'Waist Accessory',
	iconImage = 'rbxasset://textures/AvatarEditorIcons/PageIcons/Clothing/ic-waist.png',
	iconImageSelected = 'rbxasset://textures/AvatarEditorIcons/PageIcons/Clothing/ic-waist-on.png',
	infiniteScrolling = true,
}
local shirtsPage = {name = 'Shirts',
	typeName = 'Shirt',
	iconImage = 'rbxasset://textures/AvatarEditorIcons/ic-tshirt.png',
	iconImageSelected = 'rbxasset://textures/AvatarEditorIcons/ic-tshirt-white.png',
	infiniteScrolling = true,
}
local pantsPage = {name = 'Pants',
	typeName = 'Pants',
	iconImage = 'rbxasset://textures/AvatarEditorIcons/ic-pant.png',
	iconImageSelected = 'rbxasset://textures/AvatarEditorIcons/ic-pant-white.png',
	infiniteScrolling = true,
}
local facesPage = {name = 'Faces',
	typeName = 'Face',
	iconImage = 'rbxasset://textures/AvatarEditorIcons/ic-face.png',
	iconImageSelected = 'rbxasset://textures/AvatarEditorIcons/ic-face-white.png',
	infiniteScrolling = true,
}
local headsPage = {name = 'Heads',
	typeName = 'Head',
	iconImage = 'rbxasset://textures/AvatarEditorIcons/ic-head.png',
	iconImageSelected = 'rbxasset://textures/AvatarEditorIcons/ic-head-white.png',
	infiniteScrolling = true,
}
local torsosPage = {name = 'Torsos',
	typeName = 'Torso',
	iconImage = 'rbxasset://textures/AvatarEditorIcons/ic-torso.png',
	iconImageSelected = 'rbxasset://textures/AvatarEditorIcons/ic-torso-white.png',
	infiniteScrolling = true,
}
local rightArmsPage = {name = 'Right Arms',
	typeName = 'RightArm',
	cframe = armsCFrame,
	iconImage = 'rbxasset://textures/AvatarEditorIcons/ic-rightarm.png',
	iconImageSelected = 'rbxasset://textures/AvatarEditorIcons/ic-rightarm-white.png',
	infiniteScrolling = true,
}
local leftArmsPage = {name = 'Left Arms',
	typeName = 'LeftArm',
	cframe = armsCFrame,
	iconImage = 'rbxasset://textures/AvatarEditorIcons/ic-leftarm.png',
	iconImageSelected = 'rbxasset://textures/AvatarEditorIcons/ic-leftarm-white.png',
	infiniteScrolling = true,
}
local rightLegsPage = {name = 'Right Legs',
	typeName = 'RightLeg',
	iconImage = 'rbxasset://textures/AvatarEditorIcons/ic-rightleg.png',
	iconImageSelected = 'rbxasset://textures/AvatarEditorIcons/ic-rightleg-white.png',
	infiniteScrolling = true,
}
local leftLegsPage = {name = 'Left Legs',
	typeName = 'LeftLeg',
	iconImage = 'rbxasset://textures/AvatarEditorIcons/ic-leftleg.png',
	iconImageSelected = 'rbxasset://textures/AvatarEditorIcons/ic-leftleg-white.png',
	infiniteScrolling = true,
}
local gearPage = {name = 'Gear',
	typeName = 'Gear',
	iconImage = 'rbxasset://textures/AvatarEditorIcons/ic-gear.png',
	iconImageSelected = 'rbxasset://textures/AvatarEditorIcons/ic-gear-white.png',
	infiniteScrolling = true,
}
local skinTonePage = {name = 'Skin Tone',
	iconImage = 'rbxasset://textures/AvatarEditorIcons/ic-color.png',
	iconImageSelected = 'rbxasset://textures/AvatarEditorIcons/ic-color-filled.png',
	special = true,
}
local scalePage = {name = 'Scale',
	iconImage = 'rbxasset://textures/AvatarEditorIcons/ic-scale@2x.png',
	iconImageSelected = 'rbxasset://textures/AvatarEditorIcons/ic-scale-filled.png',
	special = true,
}

local allPages = {
	recentPage,
	outfitsPage,
	hatsPage,
	shirtsPage,
	pantsPage,
	facesPage,
	headsPage,
	torsosPage,
	rightArmsPage,
	leftArmsPage,
	rightLegsPage,
	leftLegsPage,
	gearPage,
	skinTonePage,
}

local recentCategory = {name = 'Recent',
	iconImage = 'rbxasset://textures/AvatarEditorIcons/PageIcons/Category/ic-recent.png',
	selectedIconImage = 'rbxasset://textures/AvatarEditorIcons/PageIcons/Category/ic-recent-on.png',
	pages = {recentPage,},
}
local clothingCategory = {name = 'Clothing',
	iconImage = 'rbxasset://textures/AvatarEditorIcons/PageIcons/Category/ic-clothing.png',
	selectedIconImage = 'rbxasset://textures/AvatarEditorIcons/PageIcons/Category/ic-clothing-on.png',
	pages = {hatsPage, shirtsPage, pantsPage, hairPage, faceAccessoryPage, neckAccessoryPage, shoulderAccessoryPage, frontAccessoryPage, backAccessoryPage, waistAccessoryPage, gearPage,},
}
local bodyCategory = {name = 'Body',
	iconImage = 'rbxasset://textures/AvatarEditorIcons/PageIcons/Category/ic-body-part.png',
	selectedIconImage = 'rbxasset://textures/AvatarEditorIcons/PageIcons/Category/ic-body-part-on.png',
	pages = {outfitsPage, facesPage, headsPage, torsosPage, rightArmsPage, leftArmsPage, rightLegsPage, leftLegsPage, skinTonePage,},
}
local animationCategory = {name = 'Animation',
	iconImage = 'rbxasset://textures/AvatarEditorIcons/PageIcons/Category/ic-avatar-animation.png',
	selectedIconImage = 'rbxasset://textures/AvatarEditorIcons/PageIcons/Category/ic-avatar-animation-on.png',
	pages = {},
}

local categories = {
	recentCategory,
	clothingCategory,
	bodyCategory,
	--animationCategory,
}

do
	local enabledAvatarScalePage = false
	local success, flagValue = pcall(function()
		return settings():GetFFlag("EnabledAvatarScalePage")
	end)
	if success then
		enabledAvatarScalePage = flagValue
	end
	if enabledAvatarScalePage then
		table.insert(allPages, scalePage)
		table.insert(bodyCategory.pages, scalePage)
	end
end


local enabledAvatarEditorV2 = false
do
	local success, flagValue = pcall(function()
		return settings():GetFFlag("EnabledAvatarEditorV2")
	end)
	if success then
		enabledAvatarEditorV2 = flagValue
	end
end

if enabledAvatarEditorV2 then
	return categories
else
	return allPages
end











