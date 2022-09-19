﻿#include "TouchControlsOptionsSection.h"
#include "../../PreferencesCache.h"
#include "../HUD.h"
#include "../../LevelHandler.h"

namespace Jazz2::UI::Menu
{
	TouchControlsOptionsSection::TouchControlsOptionsSection()
		:
		_animation(0.0f),
		_isDirty(false),
		_selectedZone(SelectedZone::None),
		_lastPointerId(-1)
	{
	}

	TouchControlsOptionsSection::~TouchControlsOptionsSection()
	{
		if (_isDirty) {
			_isDirty = false;
			PreferencesCache::Save();
		}
	}

	void TouchControlsOptionsSection::OnUpdate(float timeMult)
	{
		if (_animation < 1.0f) {
			_animation = std::min(_animation + timeMult * 0.016f, 1.0f);
		}

		if (_root->ActionHit(PlayerActions::Menu)) {
			_root->PlaySfx("MenuSelect"_s, 0.5f);
			_root->LeaveSection();
			return;
		}
	}

	void TouchControlsOptionsSection::OnDraw(Canvas* canvas)
	{
		Vector2i viewSize = canvas->ViewSize;
		Vector2f center = Vector2f(viewSize.X * 0.5f, viewSize.Y * 0.5f);

		constexpr float topLine = 131.0f;
		float bottomLine = viewSize.Y - 42.0f;
		_root->DrawElement("MenuDim"_s, center.X, topLine - 2.0f, IMenuContainer::BackgroundLayer,
			Alignment::Top, Colorf::Black, Vector2f(680.0f, 200.0f), Vector4f(1.0f, 0.0f, 0.7f, 0.0f));
		_root->DrawElement("MenuLine"_s, 0, center.X, topLine, IMenuContainer::MainLayer, Alignment::Center, Colorf::White, 1.6f);

		int charOffset = 0;
		_root->DrawStringShadow("Touch Controls"_s, charOffset, center.X, topLine - 21.0f, IMenuContainer::FontLayer,
			Alignment::Center, Colorf(0.46f, 0.46f, 0.46f, 0.5f), 0.9f, 0.7f, 1.1f, 1.1f, 0.4f, 0.9f);

		_root->DrawStringShadow("You can adjust position of the white zones by drag and drop."_s, charOffset, center.X, topLine + 40.0f, IMenuContainer::FontLayer,
			Alignment::Top, Colorf(0.62f, 0.44f, 0.34f, 0.5f), 0.9f, 0.4f, 0.6f, 0.6f, 0.6f, 0.9f, 1.2f);

		float leftSize = HUD::DpadSize * LevelHandler::DefaultWidth * 0.45f;
		_root->DrawSolid(HUD::DpadLeft * LevelHandler::DefaultWidth + PreferencesCache::TouchLeftPadding.X, viewSize.Y - HUD::DpadBottom * LevelHandler::DefaultHeight + PreferencesCache::TouchLeftPadding.Y, IMenuContainer::MainLayer + 20, Alignment::BottomLeft, Vector2f(leftSize, leftSize), Colorf(1.0f, 1.0f, 1.0f, 0.8f));

		float rightSizeX = HUD::ButtonSize * LevelHandler::DefaultWidth * 1.6f;
		float rightSizeY = HUD::ButtonSize * LevelHandler::DefaultWidth * 0.8f;
		_root->DrawSolid(viewSize.X - PreferencesCache::TouchRightPadding.X, viewSize.Y - 0.04f * LevelHandler::DefaultHeight + PreferencesCache::TouchRightPadding.Y, IMenuContainer::MainLayer + 20, Alignment::BottomRight, Vector2f(rightSizeX, rightSizeY), Colorf(1.0f, 1.0f, 1.0f, 0.8f));
	}

	void TouchControlsOptionsSection::OnTouchEvent(const nCine::TouchEvent& event, const Vector2i& viewSize)
	{
		switch(event.type) {
			case TouchEventType::Down: {
				int pointerIndex = event.findPointerIndex(event.actionIndex);
				if (pointerIndex != -1) {
					float x = event.pointers[pointerIndex].x;
					float y = event.pointers[pointerIndex].y * (float)viewSize.Y;

					if (y < 80.0f) {
						_root->PlaySfx("MenuSelect"_s, 0.5f);
						_root->LeaveSection();
						return;
					}

					if (y > 120.0f) {
						if (x < 0.4f) {
							_selectedZone = SelectedZone::Left;
						} else if(x > 0.6f) {
							_selectedZone = SelectedZone::Right;
						}
						_lastPos = Vector2f(event.pointers[pointerIndex].x, event.pointers[pointerIndex].y);
						_lastPointerId = event.actionIndex;
					}
				}
				break;
			}
			case TouchEventType::Move: {
				if (event.actionIndex == _lastPointerId) {
					int pointerIndex = event.findPointerIndex(event.actionIndex);
					if (pointerIndex != -1) {
						Vector2f newPos = Vector2f(event.pointers[pointerIndex].x, event.pointers[pointerIndex].y);
						Vector2f diff = (newPos - _lastPos) * Vector2f(viewSize.X, viewSize.Y);
						_lastPos = newPos;

						switch (_selectedZone) {
							case SelectedZone::Left:
								PreferencesCache::TouchLeftPadding.X = std::round(std::clamp(PreferencesCache::TouchLeftPadding.X + diff.X, -130.0f, 200.0f));
								PreferencesCache::TouchLeftPadding.Y = std::round(std::clamp(PreferencesCache::TouchLeftPadding.Y + diff.Y, -100.0f, 140.0f));
								break;
							case SelectedZone::Right:
								PreferencesCache::TouchRightPadding.X = std::round(std::clamp(PreferencesCache::TouchRightPadding.X - diff.X, -180.0f, 170.0f));
								PreferencesCache::TouchRightPadding.Y = std::round(std::clamp(PreferencesCache::TouchRightPadding.Y + diff.Y, -140.0f, 100.0f));
								break;
						}

						_isDirty = true;
					}
				}
				break;
			}
			case TouchEventType::Up: {
				_selectedZone = SelectedZone::None;
				_lastPointerId = -1;
				break;
			}
			case TouchEventType::PointerUp: {
				if (event.actionIndex == _lastPointerId) {
					_selectedZone = SelectedZone::None;
					_lastPointerId = -1;
				}
				break;
			}
		}
	}
}