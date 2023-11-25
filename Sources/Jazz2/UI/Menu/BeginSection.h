﻿#pragma once

#include "MenuSection.h"

namespace Jazz2::UI::Menu
{
	class BeginSection : public MenuSection
	{
	public:
		BeginSection();

		void OnShow(IMenuContainer* root) override;
		void OnUpdate(float timeMult) override;
		void OnDraw(Canvas* canvas) override;
		void OnTouchEvent(const nCine::TouchEvent& event, const Vector2i& viewSize) override;

	private:
		enum class Item {
#if !defined(SHAREWARE_DEMO_ONLY)
			Continue,
#endif
			PlayEpisodes,
#if defined(SHAREWARE_DEMO_ONLY) && defined(DEATH_TARGET_EMSCRIPTEN)
			Import,
#else
			PlayCustomLevels,
#endif

#if defined(WITH_MULTIPLAYER)
			// TODO: Multiplayer
			TODO_ConnectTo,
			TODO_CreateServer,
#endif

			Options,
			About,
#if !defined(DEATH_TARGET_EMSCRIPTEN) && !defined(DEATH_TARGET_IOS) && !defined(DEATH_TARGET_SWITCH)
			Quit,
#endif
			Count
		};

		struct ItemData {
			Item Type;
			String Name;
			float Y;

			ItemData(Item type, const StringView& name) : Type(type), Name(name), Y(0.0f) { }
		};

		static constexpr float DisabledItem = -1024.0f;

		SmallVector<ItemData, (int32_t)Item::Count> _items;
		int32_t _selectedIndex;
		float _animation;
#if !defined(DEATH_TARGET_EMSCRIPTEN)
		String _sourcePath;
#endif

		void ExecuteSelected();
	};
}